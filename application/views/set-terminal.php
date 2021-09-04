<!DOCTYPE html>  
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="author" content="billinggst.com">
        <link rel="icon" type="image/png" sizes="16x16" href="<?php echo base_url() ?>images/favicon.png">
        <title>Quick Bill GST Billing</title>
        <!-- Bootstrap Core CSS -->
        <link href="<?php echo base_url() ?>bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- animation CSS -->
        <link href="<?php echo base_url() ?>css/animation.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="<?php echo base_url() ?>css/stylesheet.css"  rel="stylesheet">
        <!-- color CSS -->
        <link href="<?php echo base_url() ?>css/colors/default.css" id="theme"  rel="stylesheet">
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        
    </head>
    <body>
        <!-- Preloader -->
        <div class="preloader">
            <div class="cssload-speeding-wheel"></div>
        </div>
        <section id="wrapper" class="login-register">
            <div class="login-box">
                <div class="white-box">
                    <?php              
                    //get_cookie('terminal_id'); 
                    //print_r($_COOKIE['terminal_id']);  
                    echo form_open('login/set-terminal')
                    ?>
                    <div class="form-horizontal form-material" >
                        <?php if (($this->session->flashdata("msg"))) { ?>
                            <div class="alert alert-info">
                                <?php echo $this->session->flashdata("msg");?>
                            </div>
                        <?php } ?>

                        <h3 class="box-title m-b-20">Terminals</h3>
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <select  id="terminal_id" name="terminal_id" class="form-control" required="">
                                    <option value="">Select Terminal</option>
                                    <?php for($i=1;$i<=4;$i++) { ?>
                                        <option value="<?php echo $i; ?>">Terminal <?php echo $i; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group text-center m-t-20">
                            <div class="col-xs-12">
                                <button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" type="submit">Set</button>
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </section>
        <script src="<?php echo base_url() ?>components/jquery/dist/jquery.min.js"></script>      
        <!-- Bootstrap Core JavaScript -->
        <script src="<?php echo base_url() ?>bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- Menu Plugin JavaScript -->
        <script src="<?php echo base_url() ?>components/sidebar-nav/dist/sidebar-nav.min.js"></script>

        <!--slimscroll JavaScript -->
        <script src="<?php echo base_url() ?>js/jquery.slimscroll.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="<?php echo base_url() ?>js/custom.min.js"></script>
        <!-- Sparkline chart JavaScript -->
        <script src="<?php echo base_url() ?>components/jquery-sparkline/jquery.sparkline.min.js"></script>
        <script src="<?php echo base_url() ?>components/jquery-sparkline/jquery.charts-sparkline.js"></script>
        <!--Style Switcher -->
        <script src="<?php echo base_url() ?>components/styleswitcher/jQuery.style.switcher.js"></script>
    </body>
</html>
