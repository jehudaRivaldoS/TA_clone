<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use GuzzleHttp\Client;
use App\Models\Ulasan_Sementara;

class CrawlingController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {            
        $data = Ulasan_Sementara::all();
        $check = Ulasan_Sementara::check();
        
        return view('crawling', compact('data', 'check'));
    }
    
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($start, $end, $apl)
    {        
        $api = new Client();
        set_time_limit(6000);
        $us = new Ulasan_Sementara();
        $us->deleteDB();

        $aplikasi = explode(',', $apl);

        if(in_array('googlem', $aplikasi))
        {
            $gmaps = 0;
            $gm = $us->crawlGMaps($start, $end);
            $us->insertDB($gm,$gmaps);
        }
        if(in_array('ig', $aplikasi))
        {
            $insta = 1;
            $ig = $us->crawlIg($start, $end, $api);
            $us->insertDB($ig, $insta);
        }
        if(in_array('twitter', $aplikasi))
        {
            $twi = 2;
            $tw = $us->crawlTw($start, $end, $api);
            $us->insertDB($tw,$twi);
        }
        return redirect()->back();
    }    

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit()
    {
        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $re, $id)
    {
        $ka = $re->get('kategori_sentimen');
        $f = $re->get('fasilitas');
        $p = $re->get('pelayanan');
        $w = $re->get('wahana');
        $k = $re->get('kuliner');
        
        Ulasan_Sementara::edits($id, $ka, $f, $p, $w, $k);

        $re->session()->flash('success', 'Berhasil melakukan update data');
        
        return redirect()->back();
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $re)
    {
        $us = new Ulasan_Sementara();
        $us->deleteDB();
        $re->session()->flash('success', 'Berhasil menghapus data');
        
        return redirect()->back();
    }
    public function deleteId(Request $re, $id)
    {
        $data = Ulasan_Sementara::find($id);

        $data->delete();
        $re->session()->flash('success', 'Berhasil menghapus data');
        
        return redirect()->back();
    }
    public function editShow(Request $request)
    {
        try {
            $id = $request->get('id');
            $data = Ulasan_Sementara::find($id);
            return response()->json(array(
                'msg' => view('formEdit2', compact('data'))->render()
            ), 200);
        } catch (\Throwable $th) {
            Alert::error('GAGAL', 'Gagal');
            return back();
        }
    }
}
