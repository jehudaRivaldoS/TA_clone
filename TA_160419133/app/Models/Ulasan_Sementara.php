<?php

namespace App\Models;

require_once 'C:/Users/Rivaldo/Desktop/TUGAS AKHIR/TA_160419133/vendor/simplehtmldom/simplehtmldom/simple_html_dom.php';

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use GuzzleHttp\Client;
use DB;
use App\Models\Aplikasi;

class Ulasan_Sementara extends Model
{
    use HasFactory;

    protected $table = "ulasan_sementara";
    protected $primaryKey = "id";
    public $timestamps = false;

    public function aplikasi()
    {
        return $this->belongsTo('App\Models\Aplikasi', 'aplikasi_id');
    }
   
    public function crawlGMaps($start, $end)
    {
        set_time_limit(6000);    

        $bantu = $end;
        $halaman = 1;
        $next_page_token = "";
        $preview_all = [];
        while ($start <= $bantu) {
            if($halaman == 1){
    
                $html = file_get_html("https://www.google.com/async/reviewSort?vet=12ahUKEwj026_P39r9AhWuELcAHZRmD1gQxyx6BAgBED0..i&ved=2ahUKEwj026_P39r9AhWuELcAHZRmD1gQjit6BQgBEJsD&client=opera&yv=3&cs=1&async=feature_id:0x2dd7e1d38155dc7b%3A0x3d438a692e8cd2fb,review_source:All%20reviews,sort_by:newestFirst,is_owner:false,filter_text:,associated_topic:,next_page_token:,_pms:s,_fmt:pc");
                $halaman++;
            }
            else{
                $html = file_get_html("https://www.google.com/async/reviewSort?vet=12ahUKEwj026_P39r9AhWuELcAHZRmD1gQxyx6BAgBED0..i&ved=2ahUKEwj026_P39r9AhWuELcAHZRmD1gQjit6BQgBEJsD&client=opera&yv=3&cs=1&async=feature_id:0x2dd7e1d38155dc7b%3A0x3d438a692e8cd2fb,review_source:All%20reviews,sort_by:newestFirst,is_owner:false,filter_text:,associated_topic:,next_page_token:".$next_page_token.",_pms:s,_fmt:pc");
                $halaman++;
            }
            // GET TOKEN 
            foreach($html->find('div[class="gws-localreviews__general-reviews-block"]') as $news){
                $get_attr = $news->attr;
                $next_page_token = $get_attr['data-next-page-token'];
            }
            if($next_page_token==""){
                break;
            }
    
            foreach($html->find('div[class="WMbnJf vY6njf gws-localreviews__google-review"]') as $news){
                foreach ($news->find('div[class="jxjCjc"]') as  $value) {
                    # code...
                    $tanggal = $value->find('span[class="dehysf lTi8oc"]',0)->innertext ;
                    $tanggal_split = explode(" ",$tanggal);
                    $tanggal_convert = "";
                    if($tanggal_split[1] == "hari"){
                    
                        $a = $tanggal_split[0];
    
                        $tanggal_convert = date('Y-m-d',(strtotime ( '-'.$a.' day' , strtotime ( date("Y-m-d") ) ) ));
                    }
                    elseif($tanggal_split[1] == "jam"){
                        $tanggal_convert =  date("Y-m-d");
                    }
                    elseif($tanggal_split[1] == "menit"){
                        $tanggal_convert =  date("Y-m-d");
                    }
                    elseif($tanggal_split[1] == "detik"){
                        $tanggal_convert =  date("Y-m-d");
                    }
                    elseif($tanggal_split[1] == "minggu"){
                        // week
                        $a = $tanggal_split[0];
                        $tanggal_convert = date('Y-m-d',(strtotime ( '-'.$a.' week' , strtotime ( date("Y-m-d") ) ) ));
    
                    }
                    elseif($tanggal_split[1] == "bulan"){
                        // months
                        $a = $tanggal_split[0];
                        $tanggal_convert = date('Y-m-d',(strtotime ( '-'.$a.' months' , strtotime ( date("Y-m-d") ) ) ));
                    }
                    elseif($tanggal_split[1] == "tahun"){
                        // year
                        $a = $tanggal_split[0];
                        $tanggal_convert = date('Y-m-d',(strtotime ( '-'.$a.' year' , strtotime ( date("Y-m-d") ) ) ));
                    }
                    elseif($tanggal_split[0] == "seminggu"){
                        $tanggal_convert = date('Y-m-d',(strtotime ( '-1 week' , strtotime ( date("Y-m-d") ) ) ));
    
                    }
                    elseif($tanggal_split[0] == "sebulan"){
                        $tanggal_convert = date('Y-m-d',(strtotime ( '-1 months' , strtotime ( date("Y-m-d") ) ) ));
    
                    }
                    elseif($tanggal_split[0] == "setahun"){
                        $tanggal_convert = date('Y-m-d',(strtotime ( '-1 year' , strtotime ( date("Y-m-d") ) ) ));
    
                    }
                    elseif($tanggal_split[0] == "sehari"){
                        $tanggal_convert = date('Y-m-d',(strtotime ( '-1 day' , strtotime ( date("Y-m-d") ) ) ));
    
                    }
                    elseif($tanggal_split[0] == "semenit"){
                        $tanggal_convert = date('Y-m-d',(strtotime ( '-1 minute' , strtotime ( date("Y-m-d") ) ) ));
    
                    }
                    elseif($tanggal_split[0] == "sedetik"){
                        $tanggal_convert = date('Y-m-d',(strtotime ( '-1 second' , strtotime ( date("Y-m-d") ) ) ));
    
                    }
                    $komentator  = $value->find('div[class="TSUbDb"]',0);
                    $ulasan_ = $value->find('div[class="Jtu6Td"]',0) ;
                    if(count($value->find('div[data-sq-below-review]')) > 0){                    
                        $value->find('div[class="k8MTF"]',0)->outertext='';
                    }
                    foreach ($value->find('div[class="Jtu6Td"]') as $ulasan_dalam) {
                        if(count($ulasan_dalam->find('span[tabindex="-1"]') ) > 0){
                            
                            foreach ($ulasan_dalam->find('span[tabindex="-1"]') as $ulasan_dalam_dalam) {
                                $count_k8 = 1;
                                $count_ulasan = 0;
                               
                                $ulasan_fix = "";
                                if($ulasan_dalam_dalam->find('span[class="review-full-text"]')){
                                    $ulasan_fix = $ulasan_dalam_dalam->find('span[class="review-full-text"]',0)->innertext;
                                    $count_ulasan ++;
                                }
                                else{
                                    $count_ulasan ++;
    
                                    $ulasan_fix = $ulasan_dalam_dalam->innertext;
                                }
                                $komentator_fix = $komentator->find('a',0)->innertext;
                                if($ulasan_fix != ""){
                                    array_push($preview_all,[
                                        'komentator' => $komentator_fix,
                                        'ulasan' => $ulasan_fix,
                                        'tanggal' =>$tanggal_convert
                                    ]);
                                    $bantu = $tanggal_convert;
                                }                             
                            }
                        }
                    }
    
                }
        
            }   

        }
        $sen = [];
        foreach($preview_all as $v)
        {
            
            $helper = $v['ulasan'];
            $tgl = $v['tanggal'];
            if(!preg_match("/k8MTF/",$helper))
            {
                if($end >= $tgl && $start <= $tgl){
                    array_push($sen,[                    
                        'ulasan' => $helper,
                        'tanggal' => $tgl
                    ]);
                }                
            }            
        }
        return $sen;
    }

    public function crawlIg($start, $end, $api)
    {
        $ig = [];        
        $url = "http://127.0.0.1:5000/ig";
        $response = $api->request('POST',$url, ["json"=>['start'=>$start, 'end'=>$end]]);

        if($response->getStatusCode() == 200)
        {
            $body = json_decode($response->getBody());

            foreach($body->comments as $key => $value)
            {
                array_push($ig,[                    
                    'ulasan' =>  $value->text,
                    'tanggal' =>  $value->time
                ]);
            }
        }
       
        return $ig;
    }

    public function crawlTw($start, $end, $api)
    {
        $tw = [];        
        $url = "http://127.0.0.1:5000/twitter";

        $response = $api->request('POST',$url, ["json"=>['start'=>$start, 'end'=>$end]]);

        if($response->getStatusCode() == 200)
        {
            $body = json_decode($response->getBody());

            foreach($body->comments as $key => $value)
            {
                array_push($tw,[                    
                    'ulasan' =>  $value->text,
                    'tanggal' =>  $value->time
                ]);
            }
        }
       
        return $tw;
    }

    public function insertDB($data, $type)
    {
        set_time_limit(600);    

        foreach ($data as $key => $value)
        {
            $komentar = addslashes($value['ulasan']);
            $us = new Ulasan_Sementara();
            $us->komentar = $komentar;
            $us->tanggal = $value['tanggal'];
            $us->aplikasi_id = $type;

            $us->save();
        }
    }

    public function deleteDB()
    {
        self::truncate();
    }

    public static function analysis($data)
    {
        set_time_limit(6000);    
        $api = new Client();
        $url = "http://127.0.0.1:5000/classificationsentiment";
        $response = $api->request('POST', $url, ["json"=>['sentimen'=>$data]]);
        $body = json_decode($response->getBody());
        
        $label = $body->label[0];
        $labelf = $body->fasil[0];
        $labelp = $body->pelayanan[0];
        $labelw = $body->wahana[0];
        $labelk = $body->kuliner[0];


        foreach ($data as $i => $x) {  
            $id = $x->id;
            $labels = $label[$i];
            $us = Ulasan_Sementara::find($id);
            $us->kategori_sentimen = $labels[0];
            $us->save();        
        }
        foreach ($data as $i => $x) {  
            $id = $x->id;
            $labels1 = $labelf[$i];
            $us = Ulasan_Sementara::find($id);
            $us->fasilitas = $labels1[0];
            $us->save();            
        }
        foreach ($data as $i => $x) {  
            $id = $x->id;
            $labels2 = $labelp[$i];
            $us = Ulasan_Sementara::find($id);
            $us->pelayanan = $labels2[0];
            $us->save();
        }
        foreach ($data as $i => $x) {  
            $id = $x->id;
            $labels3 = $labelw[$i];
            $us = Ulasan_Sementara::find($id);
            $us->wahana = $labels3[0];
            $us->save();            
        }
        foreach ($data as $i => $x) {  
            $id = $x->id;
            $labels4 = $labelk[$i];
            $us = Ulasan_Sementara::find($id);
            $us->kuliner = $labels4[0];
            $us->save();            
        } 
    }

    public static function check()
    {
        $ulasanSementara = DB::table('ulasan_sementara')
                    ->whereNull('kategori_sentimen')
                   ->get()->count();
        return $ulasanSementara;
    }

    public static function edits($id, $kategori, $f, $p, $w, $k)
    {
        set_time_limit(6000);    
        
        $data = Ulasan_Sementara::find($id);

        $data->kategori_sentimen = $kategori;
        $data->fasilitas = $f;
        $data->pelayanan = $p;
        $data->wahana = $w;
        $data->kuliner = $k;

        $data->save();
    }
}
