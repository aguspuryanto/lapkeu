<?php 
include '../koneksi.php';
$tanggal  = $_POST['tanggal'];
$nominal  = $_POST['nominal'];
$keterangan  = $_POST['keterangan'];
$user_id  = $_SESSION['id'];

mysqli_query($koneksi, "insert into hutang values (NULL,'$tanggal','$nominal','$keterangan','$user_id')")or die(mysqli_error($koneksi));
header("location:hutang.php");