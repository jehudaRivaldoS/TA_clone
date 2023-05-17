<?php

use Illuminate\Support\Facades\Route;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'SentimentController@index')->middleware('auth');

Route::get('/crawling','CrawlingController@index')->middleware('auth');
Route::get('/crawling/{mulai}/{akhir}/{aplikasi}','CrawlingController@create')->middleware('auth');

Route::get('/analysis','AnalysisController@index')->middleware('auth');

Route::get('/manage','UlasanController@index')->middleware('auth');

Route::get('/save-all-data','AnalysisController@store')->name('save-all-data')->middleware('auth');
Route::get('/delete-all-data','AnalysisController@destroy')->name('destroy-all-data')->middleware('auth');
Route::get('/delete/{id}','AnalysisController@deleteId')->middleware('auth');

Route::get('/deleteU/{id}','UlasanController@destroy')->middleware('auth');
Route::get('/deleteT/{start}/{end}','UlasanController@deleteTanggal')->middleware('auth');

Route::resource('ulasan','UlasanController')->middleware('auth');
Route::resource('crawl','CrawlingController')->middleware('auth');
Route::resource('asentimen','AnalysisController')->middleware('auth');
Route::resource('user','UserController')->middleware('auth');

Route::get('set','UserController@edit')->middleware('auth');


Route::post('/modalEdit','UlasanController@editShow')->middleware('auth');
Route::post('/modalEdit1','AnalysisController@editShow')->middleware('auth');
Route::post('/modalEdit2','CrawlingController@editShow')->middleware('auth');

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

