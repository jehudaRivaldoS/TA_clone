@extends('layouts.conq')
@section('content')

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>

<h1 class="mt-4"><strong>SUMBER GEMPONG</strong></h1>
<h3 class="mt-4">Selamat datang di website analsis sentimen tempat wisata Sumber Gempong Trawas</h3>
<div style="float: left; width: 30%;">
    <canvas id="diagramPie" style="width:100%;max-width:600px"></canvas>
    <script>
        var x = ["Positif {{ $count['pp'] }}%", "Negatif {{ $count['np'] }}%",];
        var y = [{{ $count['pos'] }}, {{ $count['neg'] }}];
        var warna = [
        "#00eb08",    
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
</div>
<div style="float: left; width: 70%;">
    <br>
    <br>
    <h3><strong>Statistik Komentar Terakhir</strong></h4>
        <h4>1. Positif : {{ $count['pp'] }}%</h4>
        <h4>2. Negatif : {{ $count['np'] }}%</h4>
</div>
@endsection