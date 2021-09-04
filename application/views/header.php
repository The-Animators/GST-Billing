<?php
$current_role_id = $this->session->userdata("supercredential");
?>
<!DOCTYPE html>  
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="siteurl" id="siteurl" content="<?php echo site_url() ?>">
        <meta name="baseurl" id="baseurl" content="<?php echo base_url() ?>">
        <meta name="tital" id="tital" content="<?php echo strtoupper(str_replace("-", " ", $this->uri->segment(1))); ?>">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" type="image/png" sizes="16x16" href="<?php echo base_url() ?>images/favicon.png">
        <title>Quick Bill GST Billing</title>
        <!-- Bootstrap Core CSS -->        
        <link href="<?php echo base_url() ?>bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Menu CSS -->
        <link href="<?php echo base_url() ?>components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
        <!-- toast CSS -->
        <link href="<?php echo base_url() ?>components/toast-master/css/jquery.toast.css" rel="stylesheet">
        <!-- animation CSS -->

        <link href="<?php echo base_url() ?>components/switchery/dist/switchery.min.css" rel="stylesheet" />
        <link href="<?php echo base_url() ?>css/animation.css" rel="stylesheet">
        <link href="<?php echo base_url() ?>components/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />

        <!-- Custom CSS -->
        <link href="<?php echo base_url() ?>css/stylesheet.css" rel="stylesheet">
        <link href="<?php echo base_url() ?>components/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
        <!-- color CSS -->
        <link href="<?php echo base_url() ?>css/colors/default.css" id="theme"  rel="stylesheet">
        <script src="<?php echo base_url() ?>components/jquery/dist/jquery.min.js"></script>
        <script src="<?php echo base_url() ?>js/vali.js"></script>

        <script src="<?php echo base_url() ?>js/jQuery.print.js"></script>
        <script src="<?php echo base_url() ?>js/cbpFWTabs.js"></script>
        <script src="<?php echo base_url() ?>components/typeahead.js-master/dist/typeahead.bundle.min.js"></script>
        <script src="<?php echo base_url() ?>bootstrap/dist/js/bootstrap.min.js"></script>

        <!--[if lt IE 9]>
            <script src="<?php echo base_url() ?>js/html5shiv.js"></script>
            <script src="<?php echo base_url() ?>js/respond.min.js"></script>
        <![endif]-->
        <style>
            input[type=number]::-webkit-inner-spin-button, 
            input[type=number]::-webkit-outer-spin-button { 
                -webkit-appearance: none; 
                margin: 0; 
            }
            .navbar-top-links li  a:active{
                background-color:rgb(0,0,0,0.3);
            }
            .modal-body-low-stock{
                max-height: calc(100vh - 200px);
                overflow-y: auto;
            }
            /*::-webkit-scrollbar {
                width: 35px;
                height: 2em
            }
            ::-webkit-scrollbar-button {
                background: #888
            }
            ::-webkit-scrollbar-track-piece {
                background: #eee
            }
            ::-webkit-scrollbar-thumb {
                background: #4F5467;
            }*/
        </style>

    </head>

    <body <?php if (current_url() == site_url('dashboard') || current_url() == site_url('dashboard')) { ?> onload="displayLineChart();" <?php } ?>>
        <!-- Preloader -->
        <div class="preloader">
            <div class="cssload-speeding-wheel"></div>
        </div>
        <div id="wrapper">
            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top m-b-0">
                <div class="navbar-header"> <a class="navbar-toggle hidden-sm hidden-md hidden-lg " href="javascript:void(0)" data-toggle="collapse" data-target=".navbar-collapse"><i class="ti-menu"></i></a>
                    <div class="top-left-part"><a class="logo" href="<?php echo site_url('dashboard') ?>"><b><!--This is dark logo icon--><img src="<?php echo base_url() ?>images/favicon.png" alt="home" class="dark-logo" /><!--This is light logo icon--><img src="<?php echo base_url() ?>images/favicon.png" alt="home" class="light-logo" /></b><span class="hidden-xs"><!--This is dark logo text--><img src="<?php echo base_url() ?>images/logo.png" alt="home" class="dark-logo" /><!--This is light logo text--><img src="<?php echo base_url() ?>images/logo.png" alt="home" class="light-logo" /></span></a></div>
                    <ul class="nav navbar-top-links navbar-left hidden-xs">
                        <li><a href="javascript:void(0)" class="open-close hidden-xs waves-effect waves-light"><i class="icon-arrow-left-circle ti-menu"></i></a></li>
                        <li class="text-center text-uppercase">
                            <h2 class="text-success btn-inverse"><?php echo $this->session->userdata("shopname"); ?> </h2>
                        </li>
                    </ul>
                    <ul class="nav navbar-top-links navbar-right pull-right ">
                        <li><a id="show_notification" href="javascript:void(0)"> <span id="notification_count" class="badge badge-danger" style="position:relative !important; right: 0px !important; top: 0px !important;"></span> <i class="fa fa-bell"></i></a></li>
                        <li > <a class="dropdown-toggle" id="reloadpage" href="#"><i class="fa fa-refresh"></i> <span class="hidden-xs"> Refresh </span></a></li>
                        <li > <a class="dropdown-toggle" id="backHis" href="#"><i class="fa fa-arrow-left"></i> <span class="hidden-xs"> Back </span></a></li>
                        <li class="text-center text-uppercase text-dark"> 
                            <a href="#" class="dropdown-toggle u-dropdown" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><?php echo $this->session->userdata("namesession") ?> </a>
                            <ul class="dropdown-menu animated flipInY">
                                <li><a href="" data-toggle="modal" data-target="#responsive-modal-company" ><i class="icon-home"></i> Switch Company</a></li>
                                <li><a href="<?php echo site_url('change-password') ?>"><i class="icon-lock"></i> Change Password</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="<?php echo site_url('logout') ?>"><i class="fa fa-power-off"></i> Logout</a></li>
                            </ul>
                        </li>


                    </ul>
                </div>
                <!-- /.navbar-header -->
            </nav>
            <!-- Left navbar-header -->
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse slimscrollsidebar">
                    <hr>
                    <ul class="nav" id="side-menu">
                          <?php if ($current_role_id == 1) { ?>
                            <li><a href="<?php echo site_url('dashboard') ?>" ><i class="fa fa-home fa-fw"></i> <span class="hide-menu">Dashboard</span></a></li>
                        <?php } if ($current_role_id == 2 || $current_role_id == 1) { ?>
                            <li> <a href="<?php echo site_url('generate-invoice') ?>"><i class="fa fa-file-text-o fa-fw"></i> <span class="hide-menu"> Sales <span class="fa arrow"></span></span></a>
                                <ul class="nav nav-second-level">
                                    <?php if($current_role_id == 1): ?>
                                        <li> <a href="<?php echo site_url('generate-invoice') ?>">New Sales</a> </li>
                                        <li> <a href="<?php echo site_url('list-invoice') ?>">List Sales</a> </li>
                                        <?php if ($this->session->userdata('shopid') == 1) { ?>
                                            <li><a href="<?php echo site_url('credit-note-list') ?>">Credit Note List</a></li>
                                        <?php  } ?>
                                    <?php endif; 
                                        if($current_role_id == 2):
                                    ?>
                                        <li><a href="<?php echo site_url('generate-bill') ?>">Generate Bill</a></li>
                                    <?php endif; ?>

                                </ul>
                            </li>
                            <?php if($current_role_id == 1): ?>
                            <li> <a href="<?php echo site_url('new-purchase') ?>"><i class="fa fa-file-text fa-fw"></i> <span class="hide-menu"> Purchase <span class="fa arrow"></span></span></a>
                                <ul class="nav nav-second-level">
                                    <li><a href="<?php echo site_url('new-purchase') ?>">New Purchase</a></li>
                                    <li><a href="<?php echo site_url('list-purchase') ?>">List Purchase</a></li>
                                    <?php if ($this->session->userdata('shopid') == 1) { ?>
                                    <li><a href="<?php echo site_url('debit-note-list') ?>">Debit Note List</a></li>
                                     <?php  } ?>
                                </ul>
                            </li>
                            <?php endif; ?>
                            <?php if($current_role_id == 1): ?>
                            <li><a href="<?php echo site_url('new-client') ?>" class="waves-effect"><i data-icon=")" class="fa  fa-users fa-fw"></i> <span class="hide-menu">Client <span class="fa arrow"></span></span></a>
                                <ul class="nav nav-second-level">
                                    <li><a href="<?php echo site_url('new-client') ?>">New</a></li>
                                    <li><a href="<?php echo site_url('list-client') ?>">List</a></li>
                                </ul>
                            </li>
                            <?php endif; ?>
                        <?php } if ($current_role_id == 1) { ?>
                            <li><a href="<?php echo site_url('new-product') ?>" class="waves-effect"><i data-icon=")" class="fa  fa-columns fa-fw"></i> <span class="hide-menu">Product <span class="fa arrow"></span></span></a>
                                <ul class="nav nav-second-level">
                                    <li><a href="<?php echo site_url('new-product') ?>">New Product</a></li>
                                    <li><a href="<?php echo site_url('list-product') ?>">List Product</a></li>                                    
                                </ul>
                            </li>
                        <?php } if ($current_role_id == 1) { ?>

                            <li><a href="<?php echo site_url('list-summary') ?>" class="waves-effect"><i data-icon=")" class="fa fa-list-alt fa-fw"></i> <span class="hide-menu">Report <span class="fa arrow"></span></span></a>
                                <ul class="nav nav-second-level">                                

                                    <li><a href="<?php echo site_url('sales-report') ?>">Sales Report</a></li>
                                    <li><a href="<?php echo site_url('purchase-report') ?>">Purchase Report</a></li>
                                    <li><a href="<?php echo site_url('daily-stock-report') ?>">Daily Stock Report</a></li>                                    
                                    <li><a href="<?php echo site_url('list-shop') ?>">List Shop</a></li>
                                    <li><a href="<?php echo base_url('backup/database-backup.php') ?>"> Backup</a></li>
                                    <!--li><a href="<?php echo site_url('transaction-report') ?>">Transaction Report</a></li>
                                    <li><a href="<?php echo site_url('balance-sheet/') ?>">Balance Sheet</a></li-->

                                </ul>
                            </li>
                            <!--li><a href="<?php echo site_url('list-bank') ?>" class="waves-effect"><i data-icon=")" class="fa fa-bank fa-fw"></i> <span class="hide-menu">Bank <span class="fa arrow"></span></span></a>
                                <ul class="nav nav-second-level">                                

                                    <li><a href="<?php echo site_url('bank') ?>">Bank</a></li>
                                    <li><a href="<?php echo site_url('new-transaction') ?>">New Transaction </a></li>

                                </ul>
                            </li>
                            <li><a href="<?php echo site_url('new-employee') ?>" class="waves-effect"><i data-icon=")" class="fa fa-user fa-fw"></i> <span class="hide-menu">Employee <span class="fa arrow"></span></span></a>
                                <ul class="nav nav-second-level">
                                    <li><a href="<?php echo site_url('new-employee') ?>">New Employee</a></li>
                                    <li><a href="<?php echo site_url('list-employee') ?>">List Employee</a></li>
                                </ul>
                            </li>
                            <li><a href="<?php echo site_url('new-coupon') ?>" class="waves-effect"><i data-icon=")" class="fa fa-th-large fa-fw"></i> <span class="hide-menu">Management <span class="fa arrow"></span></span></a>
                                <ul class="nav nav-second-level">                                
                                    <li><a href="<?php echo site_url('new-coupon') ?>">New Coupon</a></li>
                                    <li><a href="<?php echo site_url('list-coupon') ?>">List Coupon</a></li>
                                    <li><a href="<?php echo site_url('new-shop') ?>">New Shop</a></li>
                                    <li><a href="<?php echo site_url('list-shop') ?>">List Shop</a></li>
                                    <li><a href="<?php echo site_url('gst-setting') ?>">Setting</a></li>
                                    <li><a href="<?php echo base_url('backup/database-backup.php') ?>"> Backup</a></li>
                                </ul>
                            </li-->
                        <?php } ?>
                        <!--li><a href="<?php echo site_url('new-expanse') ?>" class="waves-effect"><i data-icon=")" class="fa  fa-rupee fa-fw"></i> <span class="hide-menu">Expense  <span class="fa arrow"></span></span></a>
                            <ul class="nav nav-second-level">                                
                                <li><a href="<?php echo site_url('new-expense') ?>">New Expense </a></li>
                                <li><a href="<?php echo site_url('list-expense') ?>">List Expense</a></li>
                            </ul>
                        </li>-->
                        <?php if($current_role_id == 1): ?>
                            <li><a href="<?php echo site_url('new-refund') ?>" class="waves-effect"><i data-icon=")" class="fa fa-undo fa-fw"></i> <span class="hide-menu">Refund <span class="fa arrow"></span></span></a>
                            <ul class="nav nav-second-level">                                
                                <li><a href="<?php echo site_url('new-refund') ?>">New Refund</a></li>
                                <li><a href="<?php echo site_url('refund-list') ?>">List Refund</a></li>
                            </ul>
                        </li>
                        <li><a href="<?php echo site_url('new-sundry') ?>" class="waves-effect"><i data-icon=")" class="fa  fa-asterisk fa-fw"></i> <span class="hide-menu">Damage <span class="fa arrow"></span></span></a>
                            <ul class="nav nav-second-level">                                
                                <li><a href="<?php echo site_url('new-sundry') ?>">New Damage</a></li>
                                <li><a href="<?php echo site_url('list-sundry') ?>">List Damage</a></li>
                            </ul>
                        </li> 
                        <?php endif; ?>
                        <!-- <li><a href="<?php echo site_url('gst-excel') ?>" class="waves-effect"><i class="fa fa-list fa-fw"></i> <span class="hide-menu">GST Excel</span></a></li> -->
                    </ul>
                </div>
            </div>
            <!-- Left navbar-header end -->
            <!-- Page Content -->
            <div id="page-wrapper">
                <div class="container-fluid">                  
                    <!-- /.row -->
                    <div id="responsive-modal-company" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">—</button>
                                    <h4 class="modal-title" style="display: inline;"> List Company </h4>
                                </div>
                                <div class="modal-body">
                                    <form id="salcom">
                                    </form>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                    <button type="button" id="switch"  class="btn btn-info waves-effect waves-light">Switch</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- The Modal -->
                    <div class="modal" id="lowStockModal">
                        <div class="modal-dialog">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Low Stock Alert</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div id="low_stock_product_list" class="modal-body modal-body-low-stock">

                                </div>

                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>

                            </div>
                        </div>
                    </div>

                    <script>
        $(document).ready(function() {
            window.oncontextmenu = function() {
                return false;
            }
            var url = $("#siteurl").attr("content");
            $('#notification_count').html("");
            $('#low_stock_product_list').html("");
            $.ajax({
                url: url + 'count-stock',
                type: 'POST',
                ContentType: 'application/json',
                success: function(result) {
                    console.log("success");
                    var data = "";
                    var count_low_stock = result.length == 0 ? "" : result.length;
                    $('#notification_count').html(count_low_stock);
                    data = '<table class="table"> <thead> <tr> <th>ProductId</th> <th>Product Name</th> <th>HSN</th> <th>Stock</th> </tr> </thead>';
                    for(var i=0; i < result.length;i++) {
                        var productData = result[i];
                        data = data + '<tbody> <tr> <td>'+ productData.prodid +'</td> <td>'+ productData.prodname +'</td> <td>'+ productData.hsn +'</td> <td>'+ productData.stock +'</td> </tr></tbody>'
                    }
                    data = data + '</table>'
                    $('#low_stock_product_list').html(data);
                },
                error:function (error) {
                    console.log("error");
                    $('#low_stock_product_list').html("<center><h2>Something went wrong, please refresh your page and try again</h2></center>");
                }
            });

            $('#show_notification').click(function(){
                $('#lowStockModal').modal('show');
            });

            $("#backHis").click(function() {
                event.preventDefault();
                history.back(1);
            })
            $("#reloadpage").click(function() {
                event.preventDefault();
                location.reload();
            })

            $.ajax({
                url: url + 'list-company',
                type: 'POST',
                ContentType: 'application/json',
                data: {},
                success: function(result) {
                    var com = '';
                    $.each(result, function(n, str) {
                        com += '<div class="form-group " style="display: flex;"><div class="col-md-2 m-b-10"><input id="id' + str.shopid + '" type="radio" name="company"  value="' + str.shopid + '" class="form-control"></div><label for="id' + str.shopid + '" class="control-label col-md-10"><h3>' + str.shopname + '</h3></label></div>'
                    });
                    $("#salcom").html(com);
                    $('input[name=company][value=<?php echo $this->session->userdata("shopid") ?>]').prop('checked', 'checked');
                },
                fail: function(result) {
                    swal(result);
                }

            });
            $("#switch").click(function() {
                $.ajax({
                    url: url + 'switch-company',
                    type: 'POST',
                    ContentType: 'application/json',
                    data: {'compid': $("input[name=company]:checked").val()},
                    success: function(result) {
                        location.reload();
                    },
                    fail: function(result) {
                        swal(result);
                    }
                });
            });

        });</script>