
<!-- .row -->
<div class="row">
    <div class="col-sm-12">
        <div class="white-box">           
           <?php echo form_open('advance-payment/'.$this->uri->segment(2));?>
                <div class="row">
                    

                    <div class="col-sm-6 col-xs-12">
                        <div class="form-group">
                            <label class="col-md-3 control-label">Payment Rs</label>
                            <div class="col-md-8">
                                <input type="text"  name="amount" id="amount"   class="form-control" placeholder="Payment Amount" value="0">
                            </div>
                        </div>
                    </div>
                     
                <div class="text-right row"><br>
                    <div class="row">
                        <button type="reset" class="btn btn-inverse waves-effect waves-light cancel">Cancel</button>
                        <button type="submit" id="submit" class="btn btn-success waves-effect waves-light m-r-10">Submit</button>                     
                    </div>
                </div>
                    </div> 
        </div>
         <?php echo form_close() ?>
    </div>
</div>
</div>

