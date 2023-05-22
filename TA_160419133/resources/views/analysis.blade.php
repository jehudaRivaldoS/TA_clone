@extends('layouts.conq')
@section('content')

<head>
    <style>
        th {
            text-align: center;
        }

        .dataTables_wrapper .dataTables_length,
        .dataTables_wrapper .dataTables_filter {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .dataTables_wrapper .dataTables_length label,
        .dataTables_wrapper .dataTables_filter label {
            display: flex;
            align-items: center;
            margin-bottom: 0;
            margin-right: 10px;
        }

        .dataTables_wrapper .dataTables_length select,
        .dataTables_wrapper .dataTables_filter input {
            margin-bottom: 0;

        }

        .dataTables_wrapper .dataTables_length select {
            width: auto;
            margin-right: 10px;
        }

        .dataTables_wrapper .dataTables_filter input {
            flex: 1;
        }
    </style>
</head>

<body>
    <div class="col-md-12">
        <h1 class="mt-4"><strong>ANALYSIS DATA</strong></h1>
        <h3>Hasil Analisis data dari data yang telah di crawling</h3><br>

        @if ($count === 0)
        <h4>Belum ada data, silahkan lakukan crawling di menu crawling </h4>
        @else
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
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div style="text-align:right;">
                <a href="{{ route('save-all-data') }}" class="btn btn-success"
                    onclick="return confirm('Apakah Anda yakin ingin menyimpan ulasan ini?')">Save
                    All Data</a>
                <a href="{{ route('destroy-all-data') }}" class="btn btn-danger"
                    onclick="return confirm('Apakah Anda yakin ingin menghapus semua data crawling?')">Delete
                    All Data</a>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalEdit" tabindex="-1" role="basic" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" id="modalContent">

            </div>
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
            url:'/modalEdit1',
            data:{'_token':'<?php echo csrf_token() ?>',
                'id':id
                },
            success: function(data){
            $('#modalContent').html(data.msg)
            }
        });
    }
</script>
@endsection
@section('script')
<script>
    $("#table_id").DataTable();
</script>
@endsection