<?php
include 'koneksi.php';

$id = $_GET['id'];
$data = mysqli_query($koneksi, "SELECT * FROM satuan WHERE idsatuan='$id'");
$row = mysqli_fetch_assoc($data);

if (isset($_POST['update'])) {
    $nama_satuan = $_POST['nama_satuan'];
    $status = $_POST['status'];

    $query = mysqli_query($koneksi, "UPDATE satuan SET nama_satuan='$nama_satuan', status='$status' WHERE idsatuan='$id'");

    if ($query) {
        echo "<script>alert('Data Berhasil di Perbarui'); window.location='satuan.php'; </script>";
    } else {
        echo "<script>alert('Gagal Memperbarui Data!);</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Edit Satuan - SBKMART</title>
    <style>
        body {font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin: 30px; background-color: #f8f9fa;}
        .container {background: white; padding: 25px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.08); width: 400px;}
        h2 {color: #333; margin-top: 0;}
        .form-group {margin-bottom: 15px;}
        label {display: block; margin-bottom: 5px; font-weight: bold;}
        input, select {width: 100%; padding: 8px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px;}
        .btn {padding: 8px 15px; border: none; border-radius: 4px; cursor: pointer; font-weight: bold; text-decoration: none; display: inline-block;}
        .btn-update {background-color: #ffc107; color: #212529;}
        .btn-batal {background-color: #6c757d; color: white; margin-left: 5px;}
        </style>
</head>
<body>

<div class="container">
    <h2>Edit Data Satuan</h2>
    <form method="POST">
        <div class="form-group">
            <label>ID Satuan:</label>
            <input type="text" value="<?= $row['idsatuan']; ?>" disabled>
        </div>
        <div class="form-group">
            <label>Nama Satuan:</label>
            <input type="text" name="nama_satuan" value="<?= $row['nama_satuan']; ?>" required>
        </div>
        <div class="form-group">
            <label>Status:</label>
            <select name="status" required>
                <option value="1" <?= $row['status'] == 1 ?'selected': ' '; ?>>Aktif(1)</option>
                <option value="0" <?= $row['status'] == 0 ? 'selected': ' '; ?>>Non-Aktif(0)</option>
            </select>
        </div>
        <button type="submit" name="update" class="btn btn-update">Simpan Perubahan</button>
        <a href="satuan.php" class="btn btn-batal">Batal</a>
    </form>
</div>

</body>
</html>