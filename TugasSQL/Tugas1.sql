create database dbpos;
use dbpos;

create table kartu(id int auto_increment primary key,kode varchar(6) unique,nama varchar(30),diskon double,iuran double);
create table pelanggan(id int auto_increment primary key,kode varchar(10) unique,nama varchar(45),jk char(1),tmp_lahir varchar(30),email varchar(45),kartu_id int not null references kartu(id));
create table pesanan(id int not null auto_increment primary key,tanggal date,total double,pelanggan_id int not null references pelanggan(id));
create table pembayaran(id int not null auto_increment primary key,nokuitansi varchar(10) unique,tanggal date,jumlah double,ke int,pesanan_id int not null references pesanan(id));
create table jenis_produk(id int not null auto_increment primary key,nama varchar(45));
create table produk (id_produk int primary key auto_increment,nama_produk varchar(255) not null,harga decimal(10,2) not null,deskripsi text,stok int not null);
create table pesanan_items (id int not null auto_increment primary key,id_produk int not null references produk(id_produk),jumlah int not null,harga decimal(10,2) not null);
create table vendor (id int not null auto_increment primary key auto_increment,nama_vendor varchar(255) not null,alamat varchar(255),email varchar(255),telepon varchar(20));
create table pembelian (id int not null auto_increment primary key auto_increment,id_vendor int not null references vendor(id_vendor),tgl_pembelian date not null,total decimal(10,2) not null);

alter table pelanggan add column alamat varchar(40) AFTER nama;
alter table pelanggan change nama nama_pelanggan varchar(50);


