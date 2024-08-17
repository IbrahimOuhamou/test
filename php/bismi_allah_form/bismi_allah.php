<?php

// بسم الله الرحمن الرحيم
// la ilaha illa Allah Mohammed Rassoul Allah

// echo 'بسم الله الرحمن الرحيم';
//
// echo '<br/>';
//
// echo $_REQUEST['assoss_array']['bismi_allah'] . '<br/>';
//
// echo '<pre>';
// print_r($_REQUEST);
// echo '</pre>';
//
// echo '<pre>';
// echo json_encode($_REQUEST);
// echo '</pre>';
header('Content-Type: application/json; charset=utf-8');
echo json_encode($_REQUEST);
