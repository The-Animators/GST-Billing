<div class="row">
    <div class="col-md-12">
        <div class="panel panel-info">
            <div class="panel-heading"> New Shop</div>
            <div class="panel-wrapper collapse in" aria-expanded="true">
                <div class="panel-body">
                    <?php echo form_open_multipart('newshop') ?>
                    <div class="form-horizontal">
                        <div class="form-body">
                            <h3 class="box-title">Shop Info</h3>
                            <hr class="m-t-0 m-b-40">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Shop Name</label>
                                        <div class="col-md-9">
                                            <input type="text" name="name"  required=""  class="form-control" placeholder="Shop Name">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Phone</label>
                                        <div class="col-md-9">
                                            <input  id="phone" name="phone" data-mask="99 999 999 999" class="form-control" placeholder="Contact No.">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">PAN No.</label>
                                        <div class="col-md-9">
                                            <input  id="pan" name="pan"  class="form-control" placeholder="PAN No.">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">GSTIN</label>
                                        <div class="col-md-9">
                                            <input  id="pan" name="gstin"  class="form-control" placeholder="GSTIN"  >
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Email</label>
                                        <div class="col-md-9">
                                            <input  id="pan" name="email" type="email" class="form-control" placeholder="Email"  >
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Capital</label>
                                        <div class="col-md-9">
                                            <input  id="capital" name="capital" type="number" class="form-control" placeholder="Capital"  >
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <h3 class="box-title">Address</h3>
                            <hr class="m-t-0 m-b-40">
                            <!--/row-->
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Address 1</label>
                                        <div class="col-md-9">
                                            <input type="text" required=""  name="address1" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">City</label>
                                        <div class="col-md-9">
                                            <input type="text" required=""  name="city" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Address 2</label>
                                        <div class="col-md-9">
                                            <input name="address2" type="text" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Country</label>
                                        <div class="col-md-9">
                                            <select id="country" required=""  name="country" class="form-control"></select>
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                            </div>
                            <!--/row-->
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Pin Code</label>
                                        <div class="col-md-9">
                                            <input type="text" required="" data-mask="999999"  name="pincode" class="form-control" placeholder="Pin Code">
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                                <div class="col-md-6">
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
                                            <button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Submit</button>                   
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
</script>
<script src="<?php echo base_url() ?>js/mask.js"></script>