<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Ulasan_Sementara;
use App\Models\Aplikasi;

class Ulasan extends Model
{
    use HasFactory;
    protected $table = "Ulasan";
    protected $primaryKey = "id";
    public $timestamps = false;

    public function aplikasi()
    {
        return $this->belongsTo('App\Models\Aplikasi', 'aplikasi_id');
    }

    public function createDiagram()
    {
        $all = Ulasan::all()->count();
        $n = Ulasan::where('fasilitas', 0)
                ->where('pelayanan', 0)
                ->where('kuliner', 0)
                ->where('wahana', 0)
                ->get()->count();
        $positif = Ulasan::all()->where('kategori_sentimen', '=', '1')->count();
        $negatif = Ulasan::all()->where('kategori_sentimen', '=', '0')->count();
        $p = Ulasan::all()->where('pelayanan', '=', '1')->count();
        $f = Ulasan::all()->where('fasilitas', '=', '1')->count();
        $k = Ulasan::all()->where('kuliner', '=', '1')->count();
        $w = Ulasan::all()->where('wahana', '=', '1')->count();


        $all = $positif +  $negatif;

        $posper = ($positif/$all) * 100;
        $negper = ($negatif/$all) * 100;
             
        $count['pos'] = $positif;
        $count['neg'] = $negatif;

        $count['pp'] = round($posper,1);
        $count['np'] = round($negper,1);

        $count['p'] = $p;
        $count['w'] = $w;
        $count['k'] = $k;
        $count['f'] = $f;
        $count['n'] = $n;

        $count['all'] = $all;


        return $count;
    }


    public function moveDB($data)
    {
        set_time_limit(6000);    

        foreach ($data as $key)
        {            
            $checks = Ulasan::where('kategori_sentimen', $key->komentar)->count();
            $us = new Ulasan();
            $us->komentar = $key->komentar;
            $us->tanggal = $key->tanggal;
            $us->kategori_sentimen = $key->kategori_sentimen;
            $us->pelayanan = $key->pelayanan;
            $us->fasilitas = $key->fasilitas;
            $us->wahana = $key->wahana;
            $us->kuliner = $key->kuliner;            
            $us->aplikasi_id = $key->aplikasi_id;

            if ($checks === 0)
            {
                $us->save();
            }            
        }
    }

    public static function edit($id, $kategori, $f, $p, $w, $k)
    {
        set_time_limit(6000);    
        
        $data = Ulasan::find($id);

        $data->kategori_sentimen = $kategori;
        $data->fasilitas = $f;
        $data->pelayanan = $p;
        $data->wahana = $w;
        $data->kuliner = $k;

        $data->save();
    }
}
