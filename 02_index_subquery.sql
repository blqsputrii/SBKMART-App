USE uts_pbd_019;

CREATE INDEX idx_nama_barang ON barang(nama);
CREATE INDEX idx_nama_vendor ON vendor (nama_vendor);
CREATE INDEX idx_username ON user(username);

SELECT idbarang, nama, harga
FROM harga
WHERE harga > (SELECT AVG(harga) FROM barang);

SELECT idbarang, nama, harga
FROM harga
WHERE idbarang IN (SELECT DISTINCT idbarang FROM detail_pengadaan);