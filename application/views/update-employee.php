<div class="row">
    <div class="col-md-12">
        <div class="panel panel-info">
            <div class="panel-heading"> Update Employee</div>
            <div class="panel-wrapper collapse in" aria-expanded="true">
                <div class="panel-body">
                    <?php echo form_open('updateemployee');?>
                    <div class="form-horizontal">
                        <div class="form-body">
                            <h3 class="box-title">Employee information of Username : <?php echo $lists[0]->userid?></h3>
                            <hr class="m-t-0 m-b-40">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">First Name</label>
                                        <div class="col-md-9">
                                            <input type="text" name="fname" required=""  class="form-control" value="<?php echo $lists[0]->fname?>" placeholder="First Name">
                                            <input type="hidden" name="username"  value="<?php echo $lists[0]->userid?>" >
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                               <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Last Name</label>
                                        <div class="col-md-9">
                                            <input type="text" name="lname" class="form-control" value="<?php echo $lists[0]->lname?>" placeholder="Last Name">
                                        </div>
                                    </div>                                   
                                </div>
                                <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label col-md-3">Gender</label>
                                            <div class="col-md-9">
                                                <select name="gender" id="gender" class="form-control">
                                                    <option value="M">Male</option>
                                                    <option value="F">Female</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label col-md-3">DOB</label>
                                            <div class="col-md-9">
                                                <input type="date" required=""  name="dob" value="<?php echo date("Y-m-d",  strtotime($lists[0]->dob))?>" class="form-control" placeholder="dd/mm/yyyy">
                                            </div>
                                        </div>
                                    </div>
                                   <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label col-md-3">Shop Name</label>
                                            <div class="col-md-9">
                                                <select class="form-control" data-placeholder="Choose a Category" name="shopid" id="shopid">

                                                    <option value="">Select</option>
                                                    <?php foreach ($slists as $list) { ?>
                                                        <option value="<?php echo $list->shopid ?>"> <?php echo $list->shopname ?></option>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                     <!--/span-->
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label col-md-3">Mobile No</label>
                                            <div class="col-md-9">
                                                <input type="text" name="mobile" value="<?php echo $lists[0]->mobile?>" data-mask="9999 999 999"  class="form-control" placeholder="Mobile No">
                                            </div>
                                        </div>
                                    </div>
                                     <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label col-md-3">DOJ</label>
                                            <div class="col-md-9">
                                                <input type="date" required=""  name="joindate" class="form-control" value="<?php echo $lists[0]->joindate ?>">
                                            </div>
                                        </div>
                                    </div>
                                    <!--/span-->
                                     <!--/span-->
                                  <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label col-md-3">Email</label>
                                            <div class="col-md-9">
                                                <input type="email" required="" name="email" value="<?php echo $lists[0]->emails?>" class="form-control" placeholder="Email">
                                            </div>
                                        </div>
                                    </div>
                                      <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label col-md-3">Salary</label>
                                            <div class="col-md-9">
                                                <input type="number" required="" name="salary" value="<?php echo $lists[0]->salary?>" class="form-control" placeholder="Salary">
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
                                                <input type="text" required=""  name="address1" value="<?php echo $lists[0]->line1?>" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                  <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label col-md-3">City</label>
                                            <div class="col-md-9">
                                                <input type="text" required=""  name="city" value="<?php echo $lists[0]->city?>" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                               
                                    
                                   
                                     <!--/span-->
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label col-md-3">Country</label>
                                            <div class="col-md-9">
                                                <select id="country" name="country" class="form-control"></select>
                                            </div>
                                        </div>
                                    </div>
                                      <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label col-md-3">Address 2</label>
                                            <div class="col-md-9">
                                                <input name="address2" type="text" value="<?php echo $lists[0]->line2?>" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                               
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label col-md-3">Post Code</label>
                                            <div class="col-md-9">
                                                <input type="text" data-mask="999999" name="pincode" value="<?php echo $lists[0]->pin?>" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <!--/span-->
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label col-md-3">State</label>
                                            <div class="col-md-9">
                                                <select  id="state" name="state"  class="form-control"></select>
                                            </div>
                                        </div>
                                    </div>
                                    <!--/span-->
                                </div>
                                <!--/row-->
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="text-right">
                                                <button type="reset" class="btn btn-inverse waves-effect waves-light cancel">Cancel</button>
                                                <button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Update</button>                   
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                    </div>
                         <?php echo form_close() ?>
                </div>
            </div>
        </div>
    </div>
</div> 
        <script src="<?php echo base_url() ?>js/mask.js"></script>
    <script src="<?php echo base_url() ?>js/country.js"></script>
<script lang="javascript">
    populateCountries("country", "state");
    document.getElementById("country").value = "India";
    populateStates("country", "state");
    document.getElementById("state").value = "<?php echo $lists[0]->state?>";
    document.getElementById("shopid").value = "<?php echo $lists[0]->shopid?>";
    document.getElementById("gender").value = "<?php echo $lists[0]->gender?>";
</script>
