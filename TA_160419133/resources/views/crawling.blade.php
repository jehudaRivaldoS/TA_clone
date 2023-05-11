@extends('layouts.conq')
@section('css')
<link href="C:\Users\Rivaldo\Desktop\TUGAS AKHIR\TA_160419133\public\assets\scripts\datatable.js" rel="stylesheet" />
@endsection
@section('content')

<head>
    <title>Crawling Data</title>
</head>

<style>
    #overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        /* warna hitam transparan */
        z-index: 9999;
        /* pastikan overlay di atas elemen lain */
    }

    .loader {
        border: 16px solid #f3f3f3;
        /* lingkaran loader */
        border-top: 16px solid #3498db;
        /* lingkaran loader */
        border-radius: 50%;
        width: 120px;
        height: 120px;
        animation: spin 2s linear infinite;
        /* animasi putar */
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        /* atur posisi tengah */
        position: fixed;
        z-index: 9999;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }

    @keyframes spin {
        0% {
            transform: rotate(0deg);
        }

        100% {
            transform: rotate(360deg);
        }
    }
</style>

<body>
    <h1 class="mt-4"><strong>CRAWLING DATA</strong></h1>
    <h2 class="mt-4">Sumber : </h2>
    <input type="checkbox" id="aplikasi1" name="aplikasi[]" value="googlem" checked><label for="myCheckbox">&nbsp;
        Google
        Maps
        Review</label><br>
    <input type="checkbox" id="aplikasi2" name="aplikasi[]" value="ig"><label for="myCheckbox"> &nbsp;
        Instagram</label><br>
    <input type="checkbox" id="aplikasi3" name="aplikasi[]" value="twitter"><label for="myCheckbox">&nbsp;
        Twitter</label><br>

    <h3>Masukkan Tanggal : </h3>
    <label for="mulai">Start Date : </label>
    <input type="date" id="mulai" name="mulai" value="">

    <label for="akhir"> &nbsp;&nbsp;&nbsp;End Date : </label>
    <input type="date" id="akhir" name="akhir" value=""><br><br>

    <button type="submit" id="startcrawl" class="loading">START CRAWLING</button>

    <h3><strong>Data Hasil Crawling : </strong></h3><br>
    <div id="loader" style="display:none;">
        <div class="loader"></div>
    </div>

    @if ($data->isEmpty())
    <h4>Belum ada data yang di crawling</h4>

    @else
    <div class="row">
        <div class="col-md-12">
            @if ($check === 0)
            <p>Data ini sudah di analysis tetapi belum di save</p><br>
            <a href="{{ route('save-all-data') }}" class="btn btn-success"
                onclick="return confirm('Apakah Anda yakin ingin menyimpan ulasan ini?')">Save
                All Data</a>
            <a href="{{ route('destroy-all-data') }}" class="btn btn-danger"
                onclick="return confirm('Apakah Anda yakin ingin menghapus semua data crawling?')">Delete
                All Data</a><br><br>
            <table class="table table-striped table-hover table-bordered" id="table_id">
                <thead>
                    <tr>
                        <th>Ulasan</th>
                        <th>Tanggal</th>
                        <th>Sumber</th>
                        <th>Kategori</th>
                        <th>Label</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($data as $d)
                    <tr>
                        <td>{{ $d->komentar }}</td>
                        <td>{{ $d->tanggal }}</td>
                        <td>{{ $d->aplikasi->name }}</td>
                        <td>
                            @if($d->fasilitas == 1)
                            Fasilitas
                            @endif
                            @if($d->wahana == 1)
                            Wahana
                            @endif
                            @if($d->pelayanan == 1)
                            Pelayanan
                            @endif
                            @if($d->kuliner == 1)
                            Kuliner
                            @endif
                            @if($d->kuliner == 0 && $d->wahana == 0 && $d->fasilitas == 0 && $d->pelayanan == 0)
                            Tidak ada kategori
                            @endif
                        </td>
                        <td>
                            @if($d->kategori_sentimen == 1)
                            Positif
                            @else
                            Negatif
                            @endif
                        </td>
                        <td>
                            <a href="#modalEdit" data-toggle="modal" class="btn btn-warning"
                                onclick="editUlasan({{ $d->id }})">Edit</a>
                            <a href="/delete/{{ $d->id }}" class="btn btn-danger"
                                onclick="return confirm('Apakah Anda yakin ingin menghapus data ini : {{ $d->komentar }}')">Delete</a>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            <div class="modal fade" id="modalEdit" tabindex="-1" role="basic" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content" id="modalContent">

                    </div>
                </div>
            </div>
            @else
            <a href="/analysis" id="btnanalysis" class="btn btn-success" style="background: rgb(0, 89, 255)
        ">Start Analysis
                Data</a><br><br>
            <table class="table table-striped table-hover table-bordered" id="table_id">
                <thead>
                    <tr>
                        <th>Ulasan</th>
                        <th>Tanggal</th>
                        <th>Sumber</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($data as $d)
                    <tr>
                        <td>{{ $d->komentar }}</td>
                        <td>{{ $d->tanggal }}</td>
                        <td>{{ $d->aplikasi->name }}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            @endif
        </div>
    </div>
    @endif
</body>
@endsection
@section('js')
<script>
    function editUlasan(id)
    {
        $.ajax({
            type:'POST',
            url:'/modalEdit2',
            data:{'_token':'<?php echo csrf_token() ?>',
                'id':id
                },
            success: function(data){
            $('#modalContent').html(data.msg)
            }
        });
    }
</script>
<script>
    $("#startcrawl").on('click',function (){
        var loader = $("#loader");        
        var overlay = $("<div id='overlay'></div>");
        overlay.appendTo(document.body);
        loader.show();
        var mulai =  $("#mulai").val();
        var akhir =  $("#akhir").val();
        var aplikasi = $('input[name="aplikasi[]"]:checked').serializeArray().map(function(item) {
            return item.value;
        });
        if (mulai == '' || akhir == '') {
            alert('Silakan isi tanggal awal dan akhir.');
            loader.hide();                
            overlay.remove();
            return;
            if (aplikasi.length == 0) {
                alert('Silakan pilih aplikasi yang ingin di-crawl.');
                loader.hide();                
                overlay.remove();
                return;
            }            
        }
        else
        {
            if (aplikasi.length == 0) {
                alert('Silakan pilih aplikasi yang ingin di-crawl.');
                loader.hide();                
                overlay.remove();
                return;
            }
            else 
            {                
                var url_api = 'crawling/'+mulai+'/'+akhir+'/'+aplikasi;
 
                $.ajax({
                    type: 'GET',
                    url: url_api,
                    success: function (data) {
                        $("#startcrawl").removeClass('loading');
                        location.reload();
                        loader.hide();                
                        overlay.remove();
                    }
                });                        
            }
        }        
    });

    $('#btnanalysis').on('click',function (){
        var loader = $("#loader");        
        var overlay = $("<div id='overlay'></div>");
        overlay.appendTo(document.body);
        loader.show();
        $.ajax({            
            success: function (data) {
                $("#btnanalysis").removeClass('btn btn-success');
                location.reload();
                loader.hide();                
                overlay.remove();
            }
    });   
    });
</script>
@endsection

@section('script')
<script>
    $("#table_id").DataTable();
</script>
@endsection