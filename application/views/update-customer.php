<div class="row">
    <div class="col-md-12">
        <div class="panel panel-info">
            <div class="panel-heading"> Update Client</div>
            <div class="panel-wrapper collapse in" aria-expanded="true">
                <div class="panel-body">
                    <?php echo form_open('updateclient') ?>
                    <div class="form-horizontal">
                        <div class="form-body">
                            <h3 class="box-title">Person Info</h3>
                            <hr class="m-t-0 m-b-40">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Full Name</label>
                                        <div class="col-md-9">
                                            <input type="text" required="" name="name" class="form-control" placeholder="Full Name" value="<?php echo $lists[0]->name ?>">
                                            <input type="hidden" name="customerid" value="<?php echo $lists[0]->customerid ?>">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Mobile</label>
                                        <div class="col-md-9">
                                            <input type="text" name="mobile" data-mask="9999 9999 999"  class="form-control" placeholder="Mobile" value="<?php echo $lists[0]->mobile ?>"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Advance Payment</label>
                                        <div class="col-md-9">
                                            <input type="number" name="advance" value="<?php echo $lists[0]->advance ?>"  class="form-control" placeholder="Advance Payment"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Client Type</label>
                                        <div class="col-md-9">
                                            <select name="ctype" class="form-control">
                                                <option value="Customer">Customer</option>
                                                <option value="Vendor">Vendor</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">GSTIN</label>
                                        <div class="col-md-9">
                                            <input type="text" name="gstin" value="<?php echo $lists[0]->gstin ?>"  class="form-control" placeholder="GSTIN"></div>
                                    </div>

                                </div>
                                <!--/span-->

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Address</label>
                                        <div class="col-md-9">
                                            <textarea rows="4" name="address" class="form-control" placeholder="Address"><?php echo $lists[0]->address ?></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Shipping Address</label>
                                        <div class="col-md-9">
                                            <textarea rows="4" name="address2"  class="form-control" placeholder="Address"><?php echo $lists[0]->address2 ?></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">State Code</label>
                                        <div class="col-md-9">
                                            <select name="scode" class="form-control">
                                                <option value=""></option>
                                                <option>01-Jammu And Kashmir</option>
                                                <option>02-Himachal Pradesh</option>
                                                <option>03-Punjab</option>
                                                <option>04-Chandigarh</option>
                                                <option>05-Uttarakhand</option>
                                                <option>06-Haryana</option>
                                                <option>07-Delhi</option>
                                                <option>08-Rajasthan</option>
                                                <option>09-Uttar Pradesh</option>
                                                <option>10-Bihar</option>
                                                <option>11-Sikkim</option>
                                                <option>12-Arunachal Pradesh</option>
                                                <option>13-Nagaland</option>
                                                <option>14-Manipur</option>
                                                <option>15-Mizoram</option>
                                                <option>16-Tripura</option>
                                                <option>17-Meghalaya</option>
                                                <option>18-Assam</option>
                                                <option>19-West Bengal</option>
                                                <option>20-Jharkhand</option>
                                                <option>21-Odisha</option>
                                                <option>22-Chhattisgarh</option>
                                                <option>23-Madhya Pradesh</option>
                                                <option>24-Gujarat</option>
                                                <option>25-Daman And Diu</option>
                                                <option>26-Dadra And Nagar Haveli</option>
                                                <option>27-Maharashtra</option>
                                                <option>29-Karnataka</option>
                                                <option>30-Goa</option>
                                                <option>31-Lakshdweep</option>
                                                <option>32-Kerala</option>
                                                <option>33-Tamil Nadu</option>
                                                <option>34-Pondicherry</option>
                                                <option>35-Andaman And Nicobar Islands</option>
                                                <option>36-Telengana</option>
                                                <option>37-Andhra Pradesh</option>
                                                <option>98 - Other Territory</option>
                                            </select>
                                        </div>    
                                    </div>
                                </div>
                                <!--/span-->
                                <div class="col-md-6">

                                </div>
                                <!--/span-->
                            </div>

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
                    <script>
                        $("select[name=ctype]").val('<?php echo $lists[0]->ctype ?>');
                        $("select[name=scode]").val('<?php echo $lists[0]->scode ?>');
                    </script>
                    <?php echo form_close() ?>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<?php echo base_url() ?>js/mask.js"></script>