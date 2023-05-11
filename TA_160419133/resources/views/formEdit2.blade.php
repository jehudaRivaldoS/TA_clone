<form action="{{ route('crawl.update',$data->id) }}" method="POST">
    @csrf
    @method('put')
    <div class="modal-header">
        <h3><strong>Edit Ulasan</strong></h3>
    </div>
    <div class="modal-body">
        <p>Komentar : {{ $data->komentar }}</p>
        <div>
            <label>Kategori Sentimen : </label>
            <select name="kategori_sentimen" class="form-control">
                <option value="0" {{ $data->kategori_sentimen == 0 ? 'selected' : '' }}>Negatif</option>
                <option value="1" {{ $data->kategori_sentimen == 1 ? 'selected' : '' }}>Positif</option>
            </select>
        </div>
        <div>
            <label>Fasilitas : </label>
            <select name="fasilitas" class="form-control">
                <option value="0" {{ $data->fasilitas == 0 ? 'selected' : '' }}>Tidak</option>
                <option value="1" {{ $data->fasilitas == 1 ? 'selected' : '' }}>Ya</option>
            </select>
        </div>
        <div>
            <label>Pelayanan : </label>
            <select name="pelayanan" class="form-control">
                <option value="0" {{ $data->pelayanan == 0 ? 'selected' : '' }}>Tidak</option>
                <option value="1" {{ $data->pelayanan == 1 ? 'selected' : '' }}>Ya</option>
            </select>
        </div>
        <div>
            <label>Wahana : </label>
            <select name="wahana" class="form-control">
                <option value="0" {{ $data->wahana == 0 ? 'selected' : '' }}>Tidak</option>
                <option value="1" {{ $data->wahana == 1 ? 'selected' : '' }}>Ya</option>
            </select>
        </div>
        <div>
            <label>Kuliner : </label>
            <select name="kuliner" class="form-control">
                <option value="0" {{ $data->kuliner == 0 ? 'selected' : '' }}>Tidak</option>
                <option value="1" {{ $data->kuliner == 1 ? 'selected' : '' }}>Ya</option>
            </select>
        </div>
    </div>
    <div class="modal-footer">
        <button type="submit" class="btn btn-success">Edit</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
    </div>
</form>