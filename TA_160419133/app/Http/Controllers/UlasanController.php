<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Ulasan;
use App\Models\Ulasan_Sementara;

class UlasanController extends Controller
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
        $data = Ulasan::all();

        $u = new Ulasan();
        $count = $u->createDiagram();
         
        return view('manage', compact('data', 'count'));
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
    public function edit($id, Request $re)
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
        
        Ulasan::edit($id, $ka, $f, $p, $w, $k);
        
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $data = Ulasan::find($id);        
        
        $data->delete();
        return redirect()->back();
    }

    public function deleteTanggal($start, $end)
    {
        Ulasan::whereBetween('tanggal', [$start, $end])->delete();
        return redirect()->back();
    }
    public function editShow(Request $request)
    {
        try {
            $id = $request->get('id');
            $data = Ulasan::find($id);
            return response()->json(array(
                'msg' => view('formEdit', compact('data'))->render()
            ), 200);
        } catch (\Throwable $th) {
            Alert::error('GAGAL', 'Gagal');
            return back();
        }
    }
}
