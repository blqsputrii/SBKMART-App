<?php
include 'koneksi.php';

if (isset($_GET['hapus'])) {
    $idsatuan = $_GET['hapus'];
    $queryHapus = mysqli_query($koneksi, "DELETE FROM satuan WHERE idsatuan='$idsatuan'");
    if ($queryHapus) {
        echo "<script>alert('Data Berhasil di Hapus'); window.location='satuan.php';</script>";
    } else {
        echo "<script>alert('Gagal Menghapus Data!');</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Master Satuan - SBKMART</title>
    <style>
        body {font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin: 30px; background-color: #f8f9fa;}
        .container {background: white; padding: 25px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.08);}
        h2 {color: #333; margin-top: 0;}
        table {border-collapse: collapse; width: 100%; margin-top: 15px;}
        th, td {border: 1px solid #dee2e6; padding: 12px; text-align: left;}
        th {background-color: #007bff; color: white;}
        tr:nth-child(even) {background-color: #f2f2f2;}
        .btn {padding: 6px 12px; text-decoration: none; border-radius: 4px; color: white; font-size: 13px; font-weight: bold; display: inline-block; margin-right: 5px;}
        .btn-tambah {background-color: #28a745; margin-bottom: 15px; font-size: 14px;}
        .btn-edit {background-color: #ffc107; color: #212529;}
        .btn-hapus {background-color: #dc3545;}
        .badge {padding: 4px 8px; border-radius: 4px; font-size: 12px; font-weight: bold; color: white;}
        .badge-aktif {background-color: #28a745;}
        .badge-nonaktif {background-color: #6c757d;}
    </style>
</head>
</body>

<div class="container">
     <h2>Data Master Satuan - SBKMART</h2>
     <a href="satuan_tambah.php" class="btn btn-tambah">+ Tambah Satuan</a>

     <table>
        <thead>
            <tr>
              <th width="120">ID Satuan</th>
              <th>Nama Satuan</th>
              <th width="120">Status</th>
              <th width="160">Aksi</th>
            </tr>
        </thead>
     </tbody>
             <?php
             $query = mysqli_query($koneksi, "SELECT * FROM satuan");
             while ($row = mysqli_fetch_assoc($query)) {
                ?>
                <tr>
                  <td><b><?= $row['idsatuan']; ?></b></td>
                  <td><?= $row['nama_satuan']; ?></td>
                  <td>
                    <?php if ($row['status'] == 1): ?>
                        <span class="badge badge-aktif">Aktif</span>
                    <?php else: ?>
                        <span class="badge badge-nonaktif">Non-Aktif</span>
                        <?php endif; ?>
                  </td>
                  <td>
                    <a href="satuan_edit.php?id=<?= $row['idsatuan']; ?>" class="btn btn-edit">Edit</a>
                    <a href="satuan.php?hapus=<?=  $row['idsatuan']; ?>" class="btn btn-hapus" onclick="return confirm('Yakin ingin menghapus data ini?')">Hapus</a>
                  </td>
                </tr>
             <?php } ?>
         </tbody>
     </table>

</body>
</html>