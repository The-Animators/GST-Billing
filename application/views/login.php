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
        <!--[if lt IE 9]>
            <script src="<?php echo base_url() ?>js/html5shiv.js"></script>
            <script src="<?php echo base_url() ?>js/respond.min.js"></script>
        <![endif]-->
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
                    echo form_open('loginService')
                    ?>
                    <div class="form-horizontal form-material" >
                        <?php if ($this->session->userdata("result")) { ?>
                            <div class="alert alert-danger">
                                <?php echo $this->session->userdata("result");?>
                            </div>
                        <?php } ?>

                        <h3 class="box-title m-b-20">Sign In</h3>
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <input class="form-control" name="username" type="text" required="" placeholder="Username">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <input class="form-control" type="password" name="password" required="" placeholder="Password">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                          
                                    <div class="checkbox checkbox-primary pull-left p-t-0">
                                         <?php if (false) { ?>
                                      <input id="checkbox-signup" type="checkbox">
                                      <label for="checkbox-signup"> Remember me </label>
                                         <?php } ?>
                                    </div>
                                 <?php if ($this->session->userdata("result")=="Your License is expired Please Active It") { ?>
                                    <a href="javascript:void(0)" id="to-recover" class="text-dark pull-right"><i class="fa fa-unlock m-r-5"></i> Are you want To Activate ?</a>
                         <?php }else $this->session->unset_userdata("result"); ?>
                                     </div>
                        </div>
                        <div class="form-group text-center m-t-20">
                            <div class="col-xs-12">
                                <button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" type="submit">Log In</button>
                            </div>
                        </div>
                        <?php if (false) { ?>
                            <!--div class="row">
                              <div class="col-xs-12 col-sm-12 col-md-12 m-t-10 text-center">
                                <div class="social"><a href="javascript:void(0)" class="btn  btn-facebook" data-toggle="tooltip"  title="Login with Facebook"> <i aria-hidden="true" class="fa fa-facebook"></i> </a> <a href="javascript:void(0)" class="btn btn-googleplus" data-toggle="tooltip"  title="Login with Google"> <i aria-hidden="true" class="fa fa-google-plus"></i> </a> </div>
                              </div>
                            </div>
                            <div class="form-group m-b-0">
                              <div class="col-sm-12 text-center">
                                <p>Don't have an account? <a href="register.html" class="text-primary m-l-5"><b>Sign Up</b></a></p>
                              </div>
                            </div-->
                        <?php } ?>

                    </div>
                    </form>
                     <?php                  
                    echo form_open('activationservice')
                    ?>
                    <div class="form-horizontal form-material" id="recoverform">
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <h3>Activation Details</h3>
                            </div>
                        </div>
                         <div class="form-group ">
                            <div class="col-xs-12">
                                <input class="form-control" name="username" type="text" required="" placeholder="Username">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <input class="form-control" type="text" name="actkey" required="" placeholder="Activation Key">
                            </div>
                        </div>
                        <div class="form-group text-center m-t-20">
                            <div class="col-xs-12">
                                <button class="btn btn-primary btn-lg btn-block text-uppercase waves-effect waves-light" type="submit">Activate Now</button>
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
