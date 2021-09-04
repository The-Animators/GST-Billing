<script>
    $(document).ready(function (e) {
         $("#discounttype").val('<?php echo $lists[0]->	incre_type?>');
        
    });
</script>
<!-- /.row -->
<div class="row">
    <div class="col-md-12">
        <div class="panel panel-info">
            <div class="panel-heading"> Update Coupon</div>
            <div class="panel-wrapper collapse in" aria-expanded="true">
                <div class="panel-body">
                    <?php echo form_open('updatecoupon'); ?> 
                    <div class="row">
                        <div class="col-md-6">

                            <div class="form-group">
                                <label>Discount</label>
                                <div class="input-group">
                                    <div class="input-group-addon">Rs</div>
                                    <input type="number" name="discount" required=""  value="<?php echo $lists[0]->discount?>" id="discount" class="form-control"  placeholder="Discount Price">
                                    <input type="hidden" name="id" value="<?php echo $lists[0]->id?>"></div>
                            </div>
                            <div class="form-group">
                                <label>From Date</label>
                                <div class="input-group">
                                    <input type="text" required=""  name="fromdate" value="<?php echo date("d-m-Y",strtotime($lists[0]->from_date))?>" class="form-control datepicker-autoclose" placeholder="dd-mm-yyyy">
                                    <span class="input-group-addon"><i class="icon-calender"></i></span> </div>
                            </div>
                        </div>
                        <!--/span-->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label">Discount Type</label>
                                <select name="discounttype"  id="discounttype" class="form-control">
                                    <option value="%">Percentage</option>
                                    <option value="Fixed">Fixed</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>To Date</label>
                                <div class="input-group">
                                    <input type="text" name="todate" required=""  value="<?php echo date("d-m-Y",strtotime($lists[0]->to_date))?>" class="form-control datepicker-autoclose" placeholder="dd-mm-yyyy">
                                    <span class="input-group-addon"><i class="icon-calender"></i></span> </div>
                            </div>
                        </div>                 
                        <!--/row-->                 
                        <div class="text-right">
                            <button type="reset" class="btn btn-inverse waves-effect waves-light cancel">Cancel</button>
                            <button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Update</button>                   
                        </div>
                        <hr> 
                    </div>
                    <?php echo form_close(); ?> 

                </div>
            </div>
        </div>
    </div>
