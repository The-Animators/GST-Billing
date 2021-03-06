<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$route['default_controller'] = 'Login';
$route['404_override'] = '';
$route['translate_uri_dashes'] = TRUE;
$route['dashboard'] = 'home/dashboard';
$route['activationservice'] = 'login/activationservice';
$route['updateshop'] = 'admin/updateshop';
$route['update-shop/:any'] = 'admin/update-shop/$1';
$route['newshop'] = 'admin/newshop';
$route['list-company'] = 'admin/list-company';
$route['switch-company'] = 'admin/switch-company';
$route['view-employee/:any'] = 'admin/view-employee/$1';
$route['update-employee/:any'] = 'admin/update-employee/$1';
$route['delete-employee/:any'] = 'admin/delete-employee/$1';
$route['updateproduct'] = 'home/updateproduct';
$route['credit-note-invoice/:any/:any'] = 'home/credit-note-invoice/$1/$2';
$route['credit-note-invoice'] = 'home/credit-note-invoice';
$route['update-product'] = 'home/update-product';
$route['updateemployee'] = 'admin/updateemployee';
$route['view-employee/:any'] = 'admin/view-employee/$1';
$route['newemployee'] = 'admin/newemployee';
$route['save-purchase'] = 'home/save-purchase';
$route['count-stock'] = 'admin/count-stock';
$route['list-expense'] = 'home/list-expanse';
$route['list-expense/:any'] = 'home/list-expanse/$1';
$route['update-expense/:any'] = 'home/update-expanse/$1';
$route['new-expense'] = 'home/new-expanse';
$route['gst-setting'] = 'admin/gst-setting';
$route['save-purchase'] = 'home/save-purchase';
$route['prod-details'] = 'home/prod-details';
$route['purchase'] = 'home/purchase';
$route['customerlists'] = 'home/customerlists';
$route['debit-note-list'] = 'home/debit-note-list';
$route['debit-note-invoice/:any/:any'] = 'home/debit-note-invoice/$1/$2';
$route['debit-note-view/:any/:any'] = 'home/debit-note-view/$1/$2';
$route['debitnoteinvoice'] = 'home/debitnoteinvoice';
$route['purchase-report'] = 'home/purchase-report';
$route['update-product/:any'] = 'home/update-product/$1';
$route['delete-product/:any'] = 'home/delete-product/$1';
$route['printsbarcode/:any'] = 'home/printsbarcode/$1';
$route['barcode-product/:any'] = 'home/barcode-product/$1';
$route['barcode-product'] = 'home/barcode-product';
$route['barcode-details/:any'] = 'home/barcode-details/$1';
$route['update-coupon/:any'] = 'home/update-coupon/$1';
$route['delete-coupon/:any'] = 'home/delete-coupon/$1';
$route['print-coupon/:any'] = 'home/print-coupon/$1';
$route['list-barcode/:any'] = 'home/list-barcode/$1';
$route['barcode-print/:any'] = 'home/barcode-print/$1';
$route['barcode-update/:any'] = 'home/barcode-update/$1';
$route['delete-invoice/:any'] = 'home/delete-invoice/$1';
$route['prod-details'] = 'home/prod-details';
$route['credit-note-list'] = 'home/credit-note-list';
$route['invoice-prod-details'] = 'home/invoice-prod-details';
$route['newcoupon'] = 'home/newcoupon';
$route['list-product'] = 'home/list-product';
$route['new-product'] = 'home/new-product';
$route['newclient'] = 'home/newcustomer';
$route['invoice'] = 'home/invoice';
$route['save-invoice'] = 'home/save-invoice';
$route['edit-invoice/:any/:any'] = 'home/edit-invoice/$1/$2';
$route['update-invoice'] = 'home/update-invoice';
$route['updateinvoice'] = 'home/updateinvoice';
$route['client-details'] = 'home/customer-details';
$route['getcoupon'] = 'home/getcoupon';
$route['customerlists'] = 'home/customerlists';
$route['client-details'] = 'home/customer-details';
$route['purchase-invoice/:any/:any'] = 'home/purchase-invoice/$1/$2';
$route['views-invoice/:any/:any'] = 'home/prints-invoice/$1/$2';
$route['view-credit-note'] = 'home/print-credit-note';
$route['views-credit-note/:any/:any'] = 'home/prints-credit-note/$1/$2';
$route['edit-purchase/:any/:any'] = 'home/edit-purchase/$1/$2';
$route['delete-client/:any'] = 'home/delete-customer/$1';
$route['update-client/:any'] = 'home/update-customer/$1';
$route['new-employee'] = 'admin/new-employee';
$route['balance-sheet'] = 'admin/balance-sheet';
$route['balance-prepare'] = 'admin/balance-prepar';
$route['crop-employee'] = 'admin/crop-employee';
$route['list-employee'] = 'admin/list-employee';
$route['list-employee/:any'] = 'admin/list-employee/$1';
$route['add-salary'] = 'admin/add-salary';
$route['bank'] = 'admin/list-bank';
$route['bank-details'] = 'admin/bank-details';
$route['save-bank'] = 'admin/save-bank';
$route['update-bank'] = 'admin/update-bank';
$route['new-transaction'] = 'admin/new-transaction';
$route['transaction-report'] = 'admin/transaction-report';
$route['addsalary'] = 'admin/addsalary';
$route['notification'] = 'admin/notification';
$route['new-shop'] = 'admin/new-shop';
$route['cropemployee'] = 'admin/cropemployee';
$route['list-shop'] = 'admin/list-shop';
$route['new-sundry'] = 'home/new-sundry';
$route['list-coupon'] = 'home/list-coupon';
$route['barcode-coupon'] = 'home/barcode-coupon';
$route['new-purchase'] = 'home/new-purchase';
$route['list-client'] = 'home/list-customer';
$route['new-client'] = 'home/new-customer';
$route['generate-invoice'] = 'home/generate-invoice';
$route['generateInvoice'] = 'home/generateInvoice';
$route['view-invoice/:any'] = 'home/print-invoice/$i';
$route['view-invoice'] = 'home/print-invoice';
$route['last-product'] = 'home/last-product';
$route['list-invoice'] = 'home/list-invoice';
$route['list-purchase'] = 'home/list-purchase';
$route['sales-report'] = 'home/list-summary';
$route['list-ledger'] = 'home/list-ledger';
$route['list-sales'] = 'home/list-sales';
$route['new-coupon'] = 'home/new-coupon';
$route['list-sundry'] = 'home/list-sundry';
$route['sundry'] = 'home/sundry';
$route['save-sundry'] = 'home/save-sundry';
$route['updatecoupon'] = 'home/updatecoupon';
$route['updateclient'] = 'home/updatecustomer';
$route['newproduct'] = 'home/newproduct';
$route['bill-payment'] = 'home/bill-payment';
$route['advance-payment'] = 'home/advance-payment';
$route['invoice-payment/:any'] = 'home/invoice-payment/$1';
$route['invoice-payment/:any/:any'] = 'home/invoice-payment/$1/$2';
$route['invoicepayment/:any'] = 'home/invoicepayment/$1';
$route['logout'] = 'home/logout';
$route['update-purchase'] = 'home/update-purchase';
$route['loginService'] = 'login/loginService';
$route['change-password'] = 'home/change-password';
$route['new-payment'] = 'home/new-payment';
$route['list-payment'] = 'home/list-payment';
$route['advance-details'] = 'home/advance-details';
$route['card-update/:any'] = 'home/card-update/$1';
$route['gst-excel'] = 'gstExcel/gst-excel';
$route['btobgstexcel/:any'] = 'gstExcel/btobgstexcel/$1';
$route['btoclgstexcel/:any'] = 'gstExcel/btoclgstexcel/$1';
$route['btocsgstexcel/:any'] = 'gstExcel/btocsgstexcel/$1';
$route['purchaselistexcel/:any'] = 'gstExcel/purchaselistexcel/$1';
$route['gst-excel'] = 'gstExcel/gst-excel';

$route['new-refund'] = 'home/new-refund';
$route['save-refund'] = 'home/save-refund';
$route['refund-list'] = 'home/refund-list';

$route['generate-bill'] = 'home/generate-bill';
$route['getinvoice-list'] = 'home/getinvoice-list';
$route['update-bill-invoice'] = 'home/update-bill-invoice';
$route['daily-stock-report'] = 'home/daily-stock-report';

$route['edit-stock'] = 'home/edit-stock';
$route['set-terminal'] = 'login/set-terminal';


