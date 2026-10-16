USE uts_pbd_019;

CREATE TABLE role (
    idrole INT PRIMARY KEY,
    nama_role VARCHAR(100));

CREATE TABLE satuan (
    idsatuan INT PRIMARY KEY,
    nama_satuan VARCHAR(45),
    status TINYINT);

CREATE TABLE vendor (
    idvendor INT PRIMARY KEY,
    nama_vendor VARCHAR(100),
    badan_hukum CHAR(1),
    status CHAR(1));

CREATE TABLE user (
    iduser INT,
    idrole INT,
    username VARCHAR(45),
    password VARCHAR(100),
    CONSTRAINT pk_user PRIMARY KEY(iduser),
    CONSTRAINT fk_role_user FOREIGN KEY(idrole) REFERENCES role(idrole));

CREATE TABLE barang (
    idbarang INT,
    idsatuan INT,
    jenis CHAR(1),
    nama VARCHAR(45),
    harga INT,
    status TINYINT,
    CONSTRAINT pk_barang PRIMARY KEY(idbarang),
    CONSTRAINT fk_satuan_barang FOREIGN KEY(idsatuan) REFERENCES satuan(idsatuan));

CREATE TABLE margin_penjualan (
    idmargin_penjualan INT,
    iduser INT,
    created_at TIMESTAMP,
    persen DOUBLE,
    updated_at TIMESTAMP,
    status TINYINT,
    CONSTRAINT pk_margin_penjualan PRIMARY KEY(idmargin_penjualan),
    CONSTRAINT fk_margin_user FOREIGN KEY(iduser) REFERENCES user(iduser));

CREATE TABLE kartu_stok (
    idkartu_stok BIGINT,
    idbarang INT,
    idtransaksi INT,
    jenis_transaksi CHAR(1),
    masuk INT,
    keluar INT,
    stock INT,
    created_at TIMESTAMP,
    CONSTRAINT pk_kartu_stok PRIMARY KEY(idkartu_stok),
    CONSTRAINT fk_kartustok_barang FOREIGN KEY(idbarang) REFERENCES barang(idbarang));

CREATE TABLE pengadaan (
    idpengadaan BIGINT,
    user_iduser INT,
    vendor_idvendor INT,
    subtotal_nilai INT,
    ppn INT,
    total_nilai INT,
    timestamp TIMESTAMP,
    status CHAR(1),
    CONSTRAINT pk_pengadaan PRIMARY KEY(idpengadaan),
    CONSTRAINT fk_user_pengadaan FOREIGN KEY(user_iduser) REFERENCES user(iduser),
    CONSTRAINT fk_vendor_pengadaan FOREIGN KEY(vendor_idvendor) REFERENCES vendor(idvendor));

CREATE TABLE detail_pengadaan (
    iddetail_pengadaan BIGINT,
    idbarang INT,
    idpengadaan BIGINT,
    harga_satuan INT,
    jumlah INT,
    sub_total INT,
    CONSTRAINT pk_detpengadaan PRIMARY KEY(iddetail_pengadaan),
    CONSTRAINT fk_barang_detpengadaan FOREIGN KEY(idbarang) REFERENCES barang(idbarang),
    CONSTRAINT fk_pengadaan_detpengadaan FOREIGN KEY(idpengadaan) REFERENCES pengadaan(idpengadaan));

CREATE TABLE penerimaan (
    idpenerimaan BIGINT,
    idpengadaan BIGINT,
    iduser INT,
    created_at TIMESTAMP,
    status CHAR(1),
    CONSTRAINT pk_penerimaan PRIMARY KEY(idpenerimaan),
    CONSTRAINT fk_pengadaan_penerimaan FOREIGN KEY(idpengadaan) REFERENCES pengadaan(idpengadaan),
    CONSTRAINT fk_user_penerimaan FOREIGN KEY(iduser) REFERENCES user(iduser));

CREATE TABLE detail_penerimaan (
    iddetail_penerimaan BIGINT,
    idpenerimaan BIGINT,
    barang_idbarang INT,
    jumlah_terima INT,
    harga_satuan_terima INT,
    sub_total_terima INT,
    CONSTRAINT pk_detpenerimaan PRIMARY KEY(iddetail_penerimaan),
    CONSTRAINT fk_penerimaan_detpenerimaan FOREIGN KEY(idpenerimaan) REFERENCES penerimaan(idpenerimaan),
    CONSTRAINT fk_barang_detpenerimaan FOREIGN KEY(barang_idbarang) REFERENCES barang(idbarang));

CREATE TABLE retur (
    idretur BIGINT,
    idpenerimaan BIGINT,
    iduser INT,
    created_at TIMESTAMP,
    CONSTRAINT pk_retur PRIMARY KEY(idretur),
    CONSTRAINT fk_penerimaan_retur FOREIGN KEY(idpenerimaan) REFERENCES penerimaan(idpenerimaan),
    CONSTRAINT fk_user_retur FOREIGN KEY(iduser) REFERENCES user(iduser));

CREATE TABLE detail_retur (
    iddetail_retur INT,
    idretur BIGINT,
    iddetail_penerimaan BIGINT,
    jumlah INT,
    alasan VARCHAR(200),
    CONSTRAINT pk_detretur PRIMARY KEY(iddetail_retur),
    CONSTRAINT fk_retur_detretur FOREIGN KEY(idretur) REFERENCES retur(idretur),
    CONSTRAINT fk_penerimaan_detretur FOREIGN KEY(iddetail_penerimaan) REFERENCES detail_penerimaan(iddetail_penerimaan));

CREATE TABLE penjualan (
    idpenjualan INT,
    iduser INT,
    idmargin_penjualan INT,
    created_at TIMESTAMP,
    subtotal_nilai INT,
    ppn INT,
    total_nilai INT,
    CONSTRAINT pk_penjualan PRIMARY KEY(idpenjualan),
    CONSTRAINT fk_user_penjualan FOREIGN KEY(iduser) REFERENCES user(iduser),
    CONSTRAINT fk_margin_penjualan FOREIGN KEY(idmargin_penjualan) REFERENCES margin_penjualan(idmargin_penjualan));

CREATE TABLE detail_penjualan (
    iddetail_penjualan BIGINT,
    penjualan_idpenjualan INT,
    idbarang INT,
    harga_satuan INT,
    jumlah INT,
    subtotal INT,
    CONSTRAINT pk_detpenjualan PRIMARY KEY(iddetail_penjualan),
    CONSTRAINT fk_penjualan_detpenjualan FOREIGN KEY(penjualan_idpenjualan) REFERENCES penjualan(idpenjualan),
    CONSTRAINT fk_barang_detpenjualan FOREIGN KEY(idbarang) REFERENCES barang(idbarang));

INSERT INTO role (idrole, nama_role)
VALUES (001, 'Admin'),
       (002, 'Kasir'),
       (003, 'Manajer Operasional'),
       (004, 'Staf Gudang & Stok'),
       (005, 'Supervisor Penjualan');

INSERT INTO user (idrole, iduser, username, password)
VALUES (001, 1, 'admin_sbkmart', 'rahasi4dmin'),
       (002, 2, 'kasir_vivian', 'haheho123'),
       (002, 3, 'kasir_lavrian', '1yu22'),
       (003, 4, 'manajer_samsul', 'samsulMaster'),
       (004, 5, 'gudang_habib', 'habibGudang');

INSERT INTO satuan (idsatuan, nama_satuan, status)
VALUES (1, 'Kg', 1), 
       (2, 'Liter', 1),
       (3, 'Pcs', 1),
       (4, 'Karton', 1),
       (5, 'Karung', 1),
       (6, 'Pack', 1),
       (7, 'Botol', 1);

INSERT INTO barang (idbarang, idsatuan, jenis, nama, harga, status)
VALUES (1, 5, 'S', 'Beras Pandan Super 5kg', 68000, 1),
       (2, 2, 'S', 'Minyak Goreng Bimoli 2L', 38000, 1),
       (3, 1, 'S', 'Gulaku 1kg', 17500, 1),
       (4, 3, 'M', 'Indomie Goreng', 3100, 1),
       (5, 7, 'M', 'Kecap Manis Bango 520ml', 24500, 1);

INSERT INTO vendor (idvendor, nama_vendor, badan_hukum, status)
VALUES (1, 'PT Indofood', 'Y', 'A'),
       (2, 'PT Nabati Indonesia', 'Y', 'A'),
       (3, 'CV Berkah Beras Nusantara', 'Y', 'A'),
       (4, 'PT Unilever Indonesia', 'Y', 'A'),
       (5, 'Toko Pemasok Telur Ayam Pak Udin', 'N', 'A'),
       (6, 'PT Garudafood', 'Y', 'A');

INSERT INTO margin_penjualan (idmargin_penjualan, iduser, created_at, persen, updated_at, status)
VALUES (1, 1, NOW(), 8.0, NOW(), 1),
       (2, 1, NOW(), 10.0, NOW(), 1),
       (3, 4, NOW(), 12.5, NOW(), 1),
       (4, 4, NOW(), 15.0, NOW(), 1),
       (5, 1, NOW(), 5.0, NOW(), 0);