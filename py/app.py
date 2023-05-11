import json
import tensorflow as tf
import numpy as np
import sklearn
import string
import pandas as pd
import re
import time
import requests
import instaloader
import datetime
import string
from nltk.tokenize import word_tokenize
from keras.preprocessing.text import Tokenizer
from sklearn.preprocessing import LabelEncoder
from keras.preprocessing.sequence import pad_sequences
from flask import Flask
from flask import jsonify
from flask import request
from Sastrawi.Stemmer.StemmerFactory import StemmerFactory
from Sastrawi.StopWordRemover.StopWordRemoverFactory import StopWordRemoverFactory

app = Flask(__name__)
app.config['MAX_CONTENT_LENGTH'] = 100 * 1024 * 1024


@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"


@app.route('/hello')
def hello():
    return 'Hello, World'


def Sentiment(parameter):
    tsa = parameter

    # print(tsa)
    sa = tf.keras.models.load_model('s_a.h5')
    dsa = pd.read_csv('data_ap_s_a.csv')

    tokenizer = Tokenizer(num_words=10000, oov_token='<OOV>')
    tokenizer.fit_on_texts(dsa['Ulasan'].astype(str))

    X = tokenizer.texts_to_sequences(tsa)
    X = pad_sequences(X, maxlen=50, padding='post')

    predictions = sa.predict(X)
    rounded_predictions = np.round(predictions).astype(int)

    return rounded_predictions


def Kuliner(parameter):
    tsa = parameter
    k = tf.keras.models.load_model('s_a_kn.h5')
    dsa = pd.read_csv('data_ap_s_a.csv')

    tokenizer = Tokenizer(num_words=10000, oov_token='<OOV>')
    tokenizer.fit_on_texts(dsa['Ulasan'].astype(str))

    X = tokenizer.texts_to_sequences(tsa)
    X = pad_sequences(X, maxlen=50, padding='post')

    predictions = k.predict(X)
    rounded_predictions = np.round(predictions).astype(int)

    return rounded_predictions


def Wahana(parameter):
    tsa = parameter
    w = tf.keras.models.load_model('s_a_wn.h5')
    dsa = pd.read_csv('data_ap_s_a.csv')

    tokenizer = Tokenizer(num_words=10000, oov_token='<OOV>')
    tokenizer.fit_on_texts(dsa['Ulasan'].astype(str))

    X = tokenizer.texts_to_sequences(tsa)
    X = pad_sequences(X, maxlen=50, padding='post')

    predictions = w.predict(X)
    rounded_predictions = np.round(predictions).astype(int)

    return rounded_predictions


def Pelayanan(parameter):
    tsa = parameter
    p = tf.keras.models.load_model('s_a_pn.h5')
    dsa = pd.read_csv('data_ap_s_a.csv')

    tokenizer = Tokenizer(num_words=10000, oov_token='<OOV>')
    tokenizer.fit_on_texts(dsa['Ulasan'].astype(str))

    X = tokenizer.texts_to_sequences(tsa)
    X = pad_sequences(X, maxlen=50, padding='post')

    predictions = p.predict(X)
    rounded_predictions = np.round(predictions).astype(int)

    return rounded_predictions


def Fasilitas(paramater):
    tsa = paramater
    f = tf.keras.models.load_model('s_a_fn.h5')
    dsa = pd.read_csv('data_ap_s_a.csv')

    tokenizer = Tokenizer(num_words=10000, oov_token='<OOV>')
    tokenizer.fit_on_texts(dsa['Ulasan'].astype(str))

    X = tokenizer.texts_to_sequences(tsa)
    X = pad_sequences(X, maxlen=50, padding='post')

    predictions = f.predict(X)
    rounded_predictions = np.round(predictions).astype(int)

    return rounded_predictions


def Preprocessing(parameter):
    sa = []

    slang_dict = pd.read_excel('sw.xlsm')
    slang_map = dict(zip(slang_dict['slang'], slang_dict['formal']))

    factory = StopWordRemoverFactory()
    stop = set(factory.get_stop_words())
    stop.discard('tidak')

    f = StemmerFactory()
    stem = f.create_stemmer()

    param = parameter
    # print(param['sentimen'])
    for sentimen in param['sentimen']:
        tsa = sentimen['komentar']

        # Case Folding
        tsa = tsa.lower()

        # Delete tag <br>
        tsa = tsa.replace("<br>", " ")

        # Delete number and symbol
        tsa = re.sub('[^a-zA-Z]', ' ', tsa)

        # Search and change slangwords
        for key in slang_map:
            tsa = re.sub(rf"\b{key}\b", slang_map[key], tsa)

        # Tokenizing unigram
        tsa_s = word_tokenize(tsa)
        tsa = [token for token in tsa_s if len(token) > 1]

        # Delete Indonesian stopword
        tsa_sementara = [token for token in tsa if token not in stop]
        tsa = ' '.join(tsa_sementara)

        # Stemming Sastrawi
        tsa = stem.stem(tsa)

        sa.append(tsa)

    return sa


@app.route("/ig", methods=['POST'])
def CrawlInstagram():
    param = request.get_json()
    start = param['start'].split('-')
    end = param['end'].split('-')
    print(start)
    print(end)

    L = instaloader.Instaloader()
    L.login("poro.ro0909", "po09po")
    time.sleep(3)

    username = "sumbergempong.id"
    commentCount = 0
    profile = instaloader.Profile.from_username(L.context, username)
    posts = profile.get_posts()
    time.sleep(3)

    start_date = datetime.date(int(start[0]), int(start[1]), int(start[2]))
    end_date = datetime.date(int(end[0]), int(end[1]), int(end[2]))

    com = 0
    commentss = {'comments': []}
    for post in posts:
        comments = post.get_comments()
        com = com + 1
        for comment in comments:
            if start_date <= comment.created_at_utc.date() <= end_date:
                commentss['comments'].append(
                    {'text': comment.text, 'time': str(comment.created_at_utc.date())})
        time.sleep(2)
        if com == 7:
            break
    print(commentss)
    return jsonify(commentss)


@app.route("/classificationsentiment", methods=['POST'])
def classificationall():
    param = request.get_json()
    tsa = Preprocessing(param)
    print(tsa)
    # label
    label = Sentiment(tsa)
    # print(label)

    # fasilitas
    fasil = Fasilitas(tsa)
    # print(fasil)

    # kuliner
    kuliner = Kuliner(tsa)
    # print(kuliner)

    # pelayanan
    pelayanan = Pelayanan(tsa)
    # print(pelayanan)

    # wahana
    wahana = Wahana(tsa)
    # print(wahana)

    alllabel = {'label': [], 'fasil': [],
                'kuliner': [], 'pelayanan': [], 'wahana': []}

    alllabel['label'].append(label.tolist())
    alllabel['fasil'].append(fasil.tolist())
    alllabel['kuliner'].append(kuliner.tolist())
    alllabel['pelayanan'].append(pelayanan.tolist())
    alllabel['wahana'].append(wahana.tolist())

    print(alllabel)

    return jsonify(alllabel)
