<script src="<?php echo base_url() ?>js/vvlinvoice.js"></script>
<div class="row">
    <div class="col-md-12">
        <div class="panel panel-info">
            <div class="panel-heading"> Bill Payment</div>
            <?php $mybill = $this->session->userdata("mybill"); ?>
            <div class="panel-wrapper collapse in" aria-expanded="true">
                <div class="panel-body">
                    <?php echo form_open('save-invoice'); ?>
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="row">
                                <datalist id="custlist">
                                    <?php foreach ($clists as $list) { ?>
                                        <option id="<?php echo $list->customerid ?>"><?php echo $list->name . " [ " . $list->mobile . " ] " ?></option>
                                    <?php } ?>
                                </datalist>
                                <div class="col-sm-6 col-xs-12">
                                    <div class="form-horizontal">
                                        <div class="form-group ">
                                            <label class="col-md-3 control-label">Customer Name *</label>
                                            <div class="col-md-8">
                                                <input type="text" list="custlist" required=""  name="cmane" onchange="getcust(this);"  class="form-control" placeholder="Customer Name">
                                                <input type="hidden"  name="name" id="name" >
                                                <input type="hidden"  name="custid" id="custid" >
                                            </div>
                                        </div>
                                       
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Mobile No.</label>
                                            <div class="col-md-8">
                                                <input type="text" id="mobile" data-mask="9999 999 999" name="mobile" class="form-control" placeholder="Mobile No.">
                                            </div>
                                        </div>
                                         <div class="form-group">
                                            <label class="col-md-3 control-label">Reference ID</label>
                                            <div class="col-md-8">
                                                <input type="text" id="refid"  name="refid" class="form-control" placeholder="Reference ID">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <div class="form-horizontal">
                                        <div class="form-group ">
                                            <label class="col-md-3 control-label">Address </label>
                                            <div class="col-md-8">
                                                <input id="pdid" hidden="">
                                                <textarea type="text"  name="address" id="address" rows="8" class="form-control" placeholder="Address"></textarea>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <div class="form-horizontal">
                                        <div class="form-group ">
                                            <label class="col-md-3 control-label">Coupon</label>
                                            <div class="col-md-8">
                                                <input type="text" name="couponno" id="couponno"  class="form-control" placeholder="Coupon No">
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Coupon Amount Rs</label>
                                            <div class="col-md-5">
                                                <input type="text" id="camount" readonly=""  name="camount" class="form-control" placeholder="Coupon Amount" value="0">
                                            </div>
                                            <div class="col-md-2">
                                                <button type="button" onclick="getCoupon()" class="btn btn-success waves-effect waves-light m-r-10">Check Coupon</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <ul class="nav nav-pills m-b-30 ">
                                            <li class="active"> <a href="#navpills-1" data-toggle="tab" aria-expanded="true">Payment</a> </li>
                                            <!--li class=""> <a href="#navpills-2" data-toggle="tab" aria-expanded="false">Other Payment</a> </li>
                                            <li class=""> <a href="#navpills-3" data-toggle="tab" aria-expanded="false">Online Payment</a> </li-->
                                        </ul>
                                        <div class="tab-content br-n pn">
                                            <div id="navpills-1" class="tab-pane active">
                                                <div class="row">
                                                    <div class="col-md-4"> <img src="<?php echo base_url() ?>/images/large/img1.jpg" class="img-responsive thumbnail m-r-15"> </div>
                                                    <div class="col-md-8">
                                                        <div class="form-group">
                                                            <label class="col-md-3 control-label">Payment Type.</label>
                                                            <div class="col-md-8">
                                                                <select  id="ptype" name="ptype" class="form-control">
                                                                    <option value="Cash">Cash</option>
                                                                    <option value="E-Cash">E-Cash</option>
                                                                    <option value="Credit">Credit</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group" id="pt1">
                                                            <label class="col-md-3 control-label">Payable Amount Rs</label>
                                                            <div class="col-md-8">
                                                                <input type="text"  name="tamount" id="tamount" readonly=""  class="form-control" placeholder="Payable Amount" value="<?php echo $mybill['gtotal'] ?>">
                                                                <input type="hidden" id="tmt" value="<?php echo $mybill['gtotal'] ?>">
                                                            </div>
                                                        </div>
                                                        <div class="form-group" id="pt2">
                                                            <label class="col-md-3 control-label">Payment Amount Rs</label>
                                                            <div class="col-md-8">
                                                                <input type="text"  name="amount" id="amount" onkeyup="calcul(this);"  class="form-control" placeholder="Payment Amount" value="0">
                                                            </div>
                                                        </div>
                                                        <div class="form-group" id="pt3">
                                                            <label class="col-md-3 control-label">Return Amount Rs</label>
                                                            <div class="col-md-8">
                                                                <input type="text"  name="ramount" id="ramount"   readonly="" class="form-control" placeholder="Rest Amount" value="Rs 0">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="navpills-2" class="tab-pane">
                                                <div class="row">
                                                    <div class="col-md-4"> <img src="<?php echo base_url() ?>/images/large/img2.jpg" class="img-responsive thumbnail mr25"> </div>
                                                    <div class="col-md-8">

                                                        Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica.
                                                        <p><br>
                                                            Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid.</p>

                                                    </div>
                                                </div>
                                            </div>
                                            <div id="navpills-3" class="tab-pane">
                                                <div class="row">
                                                    <div class="col-md-4"> <img src="<?php echo base_url() ?>/images/large/img3.jpg" class="img-responsive thumbnail mr25"> </div>
                                                    <div class="col-md-8"> Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica.
                                                        <p><br>
                                                            Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                            </div>
                            <?php echo form_close(); ?>
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
                </div>
            </div>
        </div>
    </div>
</div>
