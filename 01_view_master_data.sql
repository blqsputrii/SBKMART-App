USE uts_pbd_019;

CREATE VIEW v_role
AS SELECT idrole, nama_role
FROM role;

CREATE VIEW v_user
AS SELECT u.iduser, username, password, r.idrole
FROM user u
JOIN role r ON u.idrole = r.idrole;

CREATE VIEW v_satuan
AS SELECT idsatuan, nama_satuan, status
FROM satuan;

CREATE VIEW v_barang
AS SELECT b.idbarang, jenis, nama, harga, status, s.idsatuan
FROM barang b
JOIN satuan s ON b.idsatuan = s.idsatuan;

CREATE VIEW v_vendor
AS SELECT idvendor, nama_vendor, badan_hukum, status
FROM vendor;

CREATE VIEW v_margin_penjualan
AS SELECT m.idmargin_penjualan, created_at, persen, updated_at, status, u.iduser
FROM margin_penjualan m
JOIN user u ON m.iduser = u.iduser;