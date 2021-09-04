<?php

defined('BASEPATH') OR exit('No direct script access allowed');
$db_user = "root";
$db_pass = "";
$db_name = "db_maruti";
if(IS_LIVE)
{
    $db_user = "billingc_mmmuser";
    $db_pass = "Q61!k9YU!}";
    $db_name = "billingc_maruti";
}

$active_group = 'default';
$query_builder = TRUE;

$db['default'] = array(
    'dsn' => 'mysql:host=localhost;dbname='.$db_name,
    'hostname' => 'localhost',
    'username' => $db_user,
    'password' => $db_pass,
    'database' => $db_name,
    'dbdriver' => 'pdo',
    'dbprefix' => '',
    'pconnect' => FALSE,
    'db_debug' => TRUE,
    'cache_on' => FALSE,
    'cachedir' => '',
    'char_set' => 'utf8',
    'dbcollat' => 'utf8_general_ci',
    'swap_pre' => '',
    'encrypt' => FALSE,
    'compress' => FALSE,
    'stricton' => FALSE,
    'failover' => array(),
    'save_queries' => TRUE
);
