
CREATE TABLE pesanan (
    id INT PRIMARY KEY,
    pelanggan_id INT,
    tanggal_pesan DATE,
    total_harga DECIMAL(10, 2),
    status VARCHAR(20)
);


create table pembayaran (id int primary key,pesanan_id int,tanggal_bayar date,jumlah_bayar decimal(10, 2),status_pembayaran varchar(20));
DELIMITER $$

create trigger update_status_pembayaran after insert on pembayaran FOR EACH row
BEGIN
    UPDATE pembayaran
    SET status_pembayaran = 'Lunas'
    WHERE id = NEW.id;
END$$
DELIMITER ;

