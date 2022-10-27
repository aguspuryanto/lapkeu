<?php

function getUser($userid){
    global $koneksi;

    $login = mysqli_query($koneksi, "SELECT * FROM user WHERE user_id='$userid'");
    $cek = mysqli_num_rows($login);
    if($cek > 0){
        // session_start();
        $data = mysqli_fetch_assoc($login);
        return $data['user_nama'];
    }
}