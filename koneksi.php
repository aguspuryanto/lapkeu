<?php 

session_start();
// mysqli_connect(host, username, password, dbname, port, socket)
$koneksi = mysqli_connect("localhost", "root", "asdf" ,"sdnj8236_keuangan");

include_once ('helper.php');

// ALTER TABLE `transaksi`
// 	ADD COLUMN `user_id` INT NULL AFTER `transaksi_bank`;

// ALTER TABLE `piutang`
// 	ADD COLUMN `user_id` INT NULL DEFAULT NULL AFTER `piutang_keterangan`;

// ALTER TABLE `hutang`
// 	ADD COLUMN `user_id` INT NULL DEFAULT NULL AFTER `hutang_keterangan`;