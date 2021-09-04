<div class="row">
    <div class="box col-md-12">
        <div class="box-inner">
            <div class="box-content">

                <!-- content starts -->



                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="well col-md-6">

                        <div class="alert alert-info text-center">
                            Please Enter Old Then New  Password.
                        </div>

                        <form class="form-horizontal" action="<?php echo site_url('login/changepassword') ?>" method="post">
                            <fieldset>
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock blue"></i></span>
                                    <input type="password" name="lodpassword"  id="lodpassword" class="form-control" placeholder="Old Password">
                                </div>
                                <div class="clearfix"></div><br>

                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon"><i id="chcl" class="glyphicon glyphicon-lock blue"></i></span>
                                    <input type="password" name="npassword" onkeyup="checkform()" id="npassword" class="form-control" placeholder="New Password">
                                </div>
                                <div class="clearfix"></div><br> 
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon"><i id="chclc" class="glyphicon glyphicon-lock blue"></i></span>
                                    <input type="password" name="cpassword" onkeyup="sform()" id="cpassword" class="form-control" placeholder="New Password">
                                </div>
                                <div class="clearfix"></div>
                                <div class="text-right m-t-20">
                                    <button type="reset" class="btn btn-inverse waves-effect waves-light cancel">Cancel</button>
                                    <button type="submit" id="smb" class="btn btn-success waves-effect waves-light m-r-10">Change</button>                   
                                </div>
                                <hr> 

                            </fieldset>
                        </form>
                    </div>
                    <!--/span-->
                </div><!--/row-->
                <!-- content ends -->
            </div>
        </div>
    </div>
</div><!--/row-->
<script>
    $(document).ready(function () {
        $('#smb').attr('disabled', 'disabled');
    })

    function sform() {
        var newpwd = document.getElementById('npassword').value;
        var cnfpwd = document.getElementById('cpassword').value;

        if (newpwd == cnfpwd) {
            $('#cpassword').css('border-color', '#66afe9');
            $('#chclc').addClass('blue');
            $('#smb').removeAttr('disabled');
        } else {
            $('#smb').attr('disabled', 'disabled');
            $('#chclc').removeClass('blue').addClass('red');
            $('#cpassword').css('border-color', '#B94846');

        }

    }
    function checkform() {
        var oppwd = document.getElementById('lodpassword').value;
        var newpwd = document.getElementById('npassword').value;
        if (oppwd != newpwd) {
            $('#npassword').css('border-color', '#66afe9');
            $('#chcl').addClass('blue');
        } else {
            $('#chcl').removeClass('blue').addClass('red');
            $('#npassword').css('border-color', '#B94846');

        }

    }
</script>

