<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use GuzzleHttp\Client;
use App\Models\Ulasan_Sementara;
use App\Models\Ulasan;

use DB;

class AnalysisController extends Controller
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
    public function index(Request $request)
    {
        $d = Ulasan_Sementara::all();
        $count = Ulasan_Sementara::all()->count();
        $c = Ulasan_Sementara::check();

        if($count !== 0)
        {
            if($c !== 0)
            {
                Ulasan_Sementara::analysis($d);
                $request->session()->flash('success', 'Berhasil melakukan analisis');
            }     
            else
            {
                $request->session()->forget('success');
            }      
        }   
        else
        {
            $request->session()->forget('success');
        }     
        $data = Ulasan_Sementara::all();   
        
        return view('analysis', compact('data', 'count'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store()
    {
        $data = Ulasan_Sementara::all();

        $u = new Ulasan();
        $u->moveDB($data);

        $s = new Ulasan_Sementara();
        $s->deleteDB();

        return redirect()->back();
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
        
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy()
    {
        $us = new Ulasan_Sementara();
        $us->deleteDB();

        return redirect()->back();
    } 
    public function deleteId($id)
    {
        $data = Ulasan_Sementara::find($id);        
        
        $data->delete();
        return redirect()->back();
    }
    public function editShow(Request $request)
    {
        try {
            $id = $request->get('id');
            $data = Ulasan_Sementara::find($id);
            return response()->json(array(
                'msg' => view('formEdit1', compact('data'))->render()
            ), 200);
        } catch (\Throwable $th) {
            Alert::error('GAGAL', 'Gagal');
            return back();
        }
    }
}