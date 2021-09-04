<div class="row">
    <div class="col-md-12">
        <div class="panel panel-info">
            <div class="panel-heading"> NEW TRANSACTION</div>
            <div class="panel-wrapper collapse in" aria-expanded="true">
                <div class="panel-body">
                    <?php echo form_open('new-transaction') ?>
                    <div class="form-horizontal">
                        <div class="form-body">
                            <h3 class="box-title">Transaction Info</h3>
                            <hr class="m-t-0 m-b-40">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Bank Name</label>
                                        <div class="col-md-9">
                                            <select class="form-control" data-placeholder="Choose a Bank" name="bankid" id="companyid">

                                                <?php foreach ($lists as $list) { ?>
                                                    <option value="<?php echo $list->bankid ?>"> <?php echo $list->bankname . ' [ ' . $list->acno . ' ] ' ?></option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Trns. By</label>
                                        <div class="col-md-9">
                                            <input type="text" name="byname"  class="form-control" placeholder="Transaction By"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Trns. Type</label>
                                        <div class="col-md-9">

                                            <select class="form-control" data-placeholder="" name="transtype" id="companyid">
                                                <option value="Cash">Cash</option>
                                                <option value="Cheque">Cheque</option>
                                                <option value="RTGS">RTGS</option>
                                                <option value="NEFT">NEFT</option>
                                                <option value="DD">DD</option>
                                            </select>
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <label class="control-label col-md-3">Trns. Date</label>
                                        <div class="col-md-9">
                                            <input type="date" name="trnsdate"  class="form-control"></div>
                                    </div>
                                </div>
                                <!--/span-->

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Transaction Details</label>
                                        <div class="col-md-9">
                                            <textarea rows="4" name="transdetails"  class="form-control" placeholder="Transaction Details"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <div class="col-md-6">
                                        <label class="control-label col-md-6">Amount</label>
                                        <div class="col-md-6">
                                            <input type="number" step=0.01 name="amount"   class="form-control" placeholder="Amount"></div>
                                    </div>
                                             <div class="col-md-6">
                                        <label class="control-label col-md-6">Amount Type</label>
                                        <div class="col-md-6">
                                             <select class="form-control" data-placeholder="" name="amtype" id="companyid">
                                                <option value="Credit">Credit</option>
                                                <option value="Debit">Debit</option>                                                
                                            </select>
                                        </div>
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
                                            <button type="reset" class="btn btn-inverse waves-effect waves-light">Cancel</button>
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