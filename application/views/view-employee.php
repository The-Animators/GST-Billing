<div class="row">
    <div class="col-md-12">
        <div class="panel panel-info">
            <div class="panel-heading"> Profile Of Employee</div>
            <div class="panel-wrapper collapse in" aria-expanded="true">
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <h3 class="box-title">Employee information</h3>
                            <hr class="m-t-0 m-b-40">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">First Name</label>
                                        <div class="col-md-9">
                                            <img src="<?php echo base_url() . 'images/users/' . $lists[0]->userid . '.jpg' ?>" width="150" height="170">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Date of Join</label>
                                        <div class="col-md-9">
                                            <input type="date" name="joindate" class="form-control" readonly="" value="<?php echo $lists[0]->joindate ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">First Name</label>
                                        <div class="col-md-9">
                                            <input type="text" name="fname" readonly=""  class="form-control" value="<?php echo $lists[0]->fname ?>" placeholder="First Name">
                                            <input type="hidden" readonly=""  name="username"  value="<?php echo $lists[0]->userid ?>" >
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Last Name</label>
                                        <div class="col-md-9">
                                            <input type="text" name="lname" readonly=""  class="form-control" value="<?php echo $lists[0]->lname ?>" placeholder="Last Name">
                                        </div>
                                    </div>  
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Gender</label>
                                        <div class="col-md-9">
                                            <input name="gender" readonly=""  id="gender" value="<?php
                                            if ($lists[0]->gender == "F") {
                                                echo "Female";
                                            } else {
                                                echo "Male";
                                            }
                                            ?>" class="form-control"/>

                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">DOB</label>
                                        <div class="col-md-9">
                                            <input type="date" readonly=""  name="dob" value="<?php echo date("Y-m-d", strtotime($lists[0]->dob)) ?>" class="form-control" placeholder="dd/mm/yyyy">
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Mobile No</label>
                                        <div class="col-md-9">
                                            <input type="text" name="mobile" readonly="" value="<?php echo $lists[0]->mobile ?>" data-mask="9999 999 999"  class="form-control" placeholder="Mobile No">
                                        </div>
                                    </div>

                                </div>
                                <!--/span-->
                                <!--/span-->
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Email</label>
                                        <div class="col-md-9">
                                            <input type="email" required="" readonly="" name="email" value="<?php echo $lists[0]->emails ?>" class="form-control" placeholder="Email">
                                        </div>
                                    </div>
                                </div>
                                 <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Salary</label>
                                        <div class="col-md-9">
                                            <input type="email" required="" readonly="" name="email" value="<?php echo $lists[0]->salary ?>" class="form-control" placeholder="Salary">
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->

                            </div>
                            <h3 class="box-title">Address</h3>
                            <hr class="m-t-0 m-b-40">
                            <!--/row-->
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Address 1</label>
                                        <div class="col-md-9">
                                            <input type="text" name="address1" readonly="" value="<?php echo $lists[0]->line1 ?>" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">City</label>
                                        <div class="col-md-9">
                                            <input type="text" name="city" readonly="" value="<?php echo $lists[0]->city ?>" class="form-control">
                                        </div>
                                    </div>
                                </div>
                          
                                <!--/span-->
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Country</label>
                                        <div class="col-md-9">
                                            <input id="country" name="country"readonly="" value="India" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                  <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Address 2</label>
                                        <div class="col-md-9">
                                            <input name="address2" type="text" readonly="" value="<?php echo $lists[0]->line2 ?>" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->

                            <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Post Code</label>
                                        <div class="col-md-9">
                                            <input type="text"  name="pincode" readonly="" value="<?php echo $lists[0]->pin ?>" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">State</label>
                                        <div class="col-md-9">
                                            <input  id="state" name="state" readonly="" value="<?php echo $lists[0]->state ?>"  class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                            </div>
                            <!--/row-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> 
