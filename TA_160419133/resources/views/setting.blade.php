@extends('layouts.conq')
@section('content')
@if (session('success'))
<div class="alert alert-success">
    {{ session('success') }}
</div>
@endif

<h1 class="mt-4"><strong>SETTING</strong></h1>
<h3 class="mt-4">Edit Akun</h3><br>
<div class="body">
    <form action="{{ route('user.update', $user->id) }}" method="POST">
        @csrf
        @method('PUT')

        <div class="form-group">
            <label for="name">Nama:</label>
            <input type="text" name="name" value=" {{ old('name', $user->name) }}" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" name="email" value=" {{ old('name', $user->email) }}" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="password">Masukan Password Lama/Baru:</label>
            <input type="password" name="password" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="password">Konsfirmasi Password Lama/Baru:</label>
            <input type="password" name="password_confirm" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-success" onclick="return pass()">Simpan</button>
    </form>
</div>
@endsection
@section('js')
<script>
    function pass() {
        var p = document.getElementsByName("password")[0].value;
        var c = document.getElementsByName("password_confirm")[0].value;

        if(p.length < 8)
        {
            alert("Password minimal memiliki 8 karakter");
        }
        else
        {
            if (p !== c) 
            {
                alert("Konfirmasi password tidak sama");
                return false;
            }
            else
            {
                return true;
            }
        }        
    }
</script>
@endsection