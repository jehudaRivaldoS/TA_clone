@extends('layouts.conq')
@section('content')
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
            <input type="text" name="password" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-success">Simpan</button>
    </form>
</div>
@endsection