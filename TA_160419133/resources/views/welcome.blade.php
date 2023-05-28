@extends('layouts.conq')
@section('content')

@if (session('success'))
<div class="alert alert-success">
    {{ session('success') }}
</div>
@endif

<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>

    <h1 class="mt-4"><strong>SUMBER GEMPONG</strong></h1>
    <h3 class="mt-4">Selamat datang di website analisis sentimen tempat wisata Sumber Gempong Trawas</h3>
</head>

<body>
    @if($count['all']===0)
    <div class="mt-4">
        <h3><strong>Belum ada riwayat data</strong></h3>
    </div>
    @else
    <div class="row">
        <div class="col-md-4">
            <div class="tools">
                <canvas id="diagramPie" style="width:100%;max-width:600px"></canvas>
            </div>
        </div>
        <div class="col-md-8">
            <br>
            <br>
            <h3><strong>Sentimen Saat ini</strong></h4>
                <h4>1. Positif : {{ $count['pp'] }}%</h4>
                <h4>2. Negatif : {{ $count['np'] }}%</h4>
        </div>
    </div><br>
    @endif
    <div class="row">
        <div class="col-md-12">
            <h2><strong>Fungsi Sistem Analisis Sentimen<strong></h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <h3>Sistem ini berfungsi untuk mengklasifikasikan ulasan yang diberikan oleh pengunjung Sumber Gempong
                kedalam
                ulasan positif dan negatif dan dikategorikan (pelayanan, fasilitas, kuliner, dan wahana)</h3>
        </div>
    </div><br>
    <div class="row">
        <div class="col-md-12">
            <h2><strong>Cara Kerja Sistem Analisis Sentimen<strong></h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <h4>1. Lakukan crawling data di menu Crawling Data</h4>
            <h4>2. Setelah itu klik tombol start analysis data</h4>
            <h4>3. Kemudian simpan atau pilih mana ulasan yang akan di simpan dalam database (bisa juga tidak disimpan)
            </h4>
            <h4>4. Jika ingin menghapus data yang ada di database pergi ke menu Riwayat Data dan hapus satu persatu atau
                menggunakan tanggal</h4>
        </div>
    </div>
</body>
@endsection

@section('js')
<script>
    var x = ["Positif {{ $count['pp'] }}%", "Negatif {{ $count['np'] }}%",];
    var y = [{{ $count['pos'] }}, {{ $count['neg'] }}];
    var warna = [
    "#1a74e9",    
    "#eb0000"
    ];

    new Chart("diagramPie", {
    type: "pie",
    data: {
        labels: x,
        datasets: [{
        backgroundColor: warna,
        data: y
        }]
    },
    options: {
        title: {
        display: true,            
        }
    }
    });
</script>
@endsection