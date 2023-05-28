@extends('layouts.conq')
@section('content')

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>

@if (session('success'))
<div class="alert alert-success">
    {{ session('success') }}
</div>
@endif

<head>
    <title>Riwayat Data</title>

    <style>
        th {
            text-align: center;
        }
    </style>
</head>

<body>
    <h1 class="mt-4"><strong>RIWAYAT DATA</strong></h1>
    <h3 class="mt-4"><strong>Data yang tersimpan di database : </strong></h3><br>

    @if ($data->isEmpty())
    <h4>Belum ada riwayat data</h4>

    @else
    <div class="row">
        <div class="col-md-4">
            <h3><strong>Jumlah Data Kategori :</strong></h3>
            <h5>1. Pelayanan : {{ $count['p'] }} / {{ $count['all'] }}</h5>
            <h5>2. Fasilitas : {{ $count['f'] }} / {{ $count['all'] }}</h5>
            <h5>3. Kuliner : {{ $count['k'] }} / {{ $count['all'] }}</h5>
            <h5>4. Wahana : {{ $count['w'] }} / {{ $count['all'] }}</h5>
            <h5>5. Tidak Ada Kategori : {{ $count['n'] }} / {{ $count['all'] }}</h5>
        </div>
        <div class="col-md-4">
            <canvas id="diagramPie" class="chart" style="padding: 0px"></canvas>
        </div>
        <div class="col-md-4" style="margin-left: 0px">
            <br>
            <br>
            <br>

            <h3><strong>Sentimen Saat ini</strong></h4>
                <h4>1. Positif : {{ $count['pp'] }}%</h4>
                <h4>2. Negatif : {{ $count['np'] }}%</h4>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
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
                            <a href="/deleteU/{{ $d->id }}" class="btn btn-danger"
                                onclick="return confirm('Apakah Anda yakin ingin menghapus data ini : {{ $d->komentar }}')">Delete</a>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>

        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <h3><strong>Delete Data : </strong></h3><br>
            <label for="mulai">Start Date : </label>
            <input type="date" id="mulai" name="mulai" value="">

            <label for="akhir"> &nbsp;&nbsp;&nbsp;End Date : </label>
            <input type="date" id="akhir" name="akhir" value="">
            <label>&nbsp;&nbsp;</label>

            <button type="submit" id="delete_btn" class="btn btn-danger"
                onclick="return confirm('Apakah Anda yakin ingin menghapus data')">Delete
                Data</button>
        </div>
    </div>
    @endif
    <div class="modal fade" id="modalEdit" tabindex="-1" role="basic" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" id="modalContent">

            </div>
        </div>
    </div>
</body>
@endsection
@section('js')
<script>
    function editUlasan(id)
    {
        $.ajax({
            type:'POST',
            url:'/modalEdit',
            data:{'_token':'<?php echo csrf_token() ?>',
                'id':id
                },
            success: function(data){
            $('#modalContent').html(data.msg)
            }
        });
    }
    $("#delete_btn").on('click',function (){
        var mulai =  $("#mulai").val();
        var akhir =  $("#akhir").val();
        if (mulai == '' || akhir == '') {
            alert('Silakan isi tanggal awal dan akhir.');            
        }
        else{
            if(mulai > akhir)
            {
                alert('Tanggal mulai harus lebih awal dari pada tanggal akhir.');         
            }
            else
            {
                var url_api = 'deleteT/'+mulai+'/'+akhir;
    
                $.ajax({
                    type: 'GET',
                    url: url_api,
                    success: function (data) {                    
                        location.reload();
                    }
                });  
            }            
        }
    });
</script>
<script>
    var x = ["Positif {{ $count['pp'] }}%", "Negatif {{ $count['np'] }}%"];
    var y = [{{ $count['pos'] }}, {{ $count['neg'] }}];
    var warna = ["#1a74e9", "#eb0000"];

    new Chart("diagramPie", {
    type: "pie",
    data: {
        labels: x,
        datasets: [
        {
            backgroundColor: warna,
            data: y,
        },
        ],
    },
    options: {
        title: {
        display: true,
        },
    },
    });
</script>
@endsection
@section('script')
<script>
    $("#table_id").DataTable();     
</script>
@endsection