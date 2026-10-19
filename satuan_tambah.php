<?php
include 'koneksi.php';

if (isset($_POST['simpan'])) {
    $idsatuan = $_POST['idsatuan'];
    $nama_satuan = $_POST['nama_satuan'];
    $status = $_POST['status'];

    $query = mysqli_query($koneksi, "INSERT INTO satuan (idsatuan, nama_satuan, status)
    VALUES ('$idsatuan', '$nama_satuan', '$status')");

    if ($query) {
        echo "<script>alert('Data Berhasil di Tambahkan'); window.location='satuan.php';</script>";
    } else {
        echo "<script>alert('Gagal Menambah Data!');</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Tambah Satuan - SBKMART</title>
    <style>
        body {font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin: 30px; background-color: #f8f9fa;}
        .container {background: white; padding: 25px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.08); width: 400px;}
        h2 {color: #333; margin-top: 0;}
        .form-group {margin-bottom: 15px;}
        label {display: block; margin-bottom: 5px; font-weight: bold;}
        input, select {width: 100%; padding: 8px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px;}
        .btn {padding: 8px 15px; border: none; border-radius: 4px; cursor: pointer; font-weight: bold; text-decoration: none; display: inline-block;}
        .btn-update {background-color: #28a745; color: white;}
        .btn-batal {background-color: #6c757d; color: white; margin-left: 5px;}
    </style>
</head>
<body>

<div class="container">
    <h2>Tambah Data Satuan</h2>
    <form method="POST">
        <div class="form-group">
            <label>ID Satuan:</label>
            <input type="text" name="idsatuan" required placeholder="Contoh: 1">
        </div>
        <div class="form-group">
            <label>Nama Satuan:</label>
            <input type="text" name="nama_satuan" required placeholder="Contoh:Pcs / Kg / Dus">
        </div>
        <div class="form-group">
            <label>Status:</label>
            <select name="status" required>
                <option value="1">Aktif (1)</option>
                <option value="0">Non-Aktif(0)</option>
            </select>
        </div>
        <button type="submit" name="simpan" class="btn btn-simpan">Simpan</button>
        <a href="satuan.php" class="btn btn-batal">Batal</a>
    </form>
</div>

</body>
</html>