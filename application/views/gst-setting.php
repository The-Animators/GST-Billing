
<div class="row">
    <div class="col-md-12">
        <div class="white-box printableArea">
            <div class="row">
                <?php
                echo form_open('gst-setting/');
                ?>
                <h3 class="box-title m-b-0">GST Setting</h3>
                <div class="col-md-12">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>C GST</label>
                            <div class="input-group">
                                <div class="input-group-addon">%</div>
                                <input type="number"  step=0.01 name="cgst" value="<?php echo $lists[0]->cgst ?>"  class="form-control" placeholder="C GST">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>S GST</label>
                            <div class="input-group">
                                <div class="input-group-addon">%</div>
                                <input type="number"  step=0.01 name="sgst" value="<?php echo $lists[0]->sgst ?>"  class="form-control" placeholder="S GST">
                            </div> </div>
                    </div>


                    <div class="col-md-3">
                        <label>I GST</label>
                        <div class="input-group">
                            <div class="input-group-addon">%</div>
                            <input type="number"  step=0.01 name="igst" value="<?php echo $lists[0]->igst ?>"  class="form-control" placeholder="i GST">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group text-right">
                            <br>
                            <button type="reset" class="btn btn-inverse waves-effect waves-light cancel">Cancel</button>
                            <button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Save</button>                   
                        </div>
                    </div>
                    <?php echo form_close(); ?> 

                </div>
            </div>
        </div>
    </div>
</div>
