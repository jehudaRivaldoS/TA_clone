<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Ulasan_Sementara;
use App\Models\Ulasan;

class Aplikasi extends Model
{
    use HasFactory;
    protected $table = "aplikasi";
    protected $primaryKey = "id";
    public $timestamps = false;

    public function ulasan_sementara()
    {
        return $this->hasMany('App\Models\Ulasan_Sementara', 'aplikasi_id','id');
    }
    public function ulasan()
    {
        return $this->hasMany('App\Models\Ulasan', 'aplikasi_id','id');
    }
}
