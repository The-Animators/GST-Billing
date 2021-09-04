<script>
    $(document).ready(function(e) {
        $("#gstids").css("display", 'none');

        $("#gstp").change(function(e) {
            var type = $(this).val();
            if (type == "New") {
                $("#gstids").css("display", 'inline-block');
                $("#gstid").attr("class", "col-md-6")
            } else {
                $("#gstids").css("display", 'none');
                $("#gstid").removeClass("col-md-6")
            }
        });

        $("#stocktypes").css("display", 'none');
        $("#unit").change(function(e) {
            var type = $(this).val();
            if (type == "New") {
                $("#stocktypes").css("display", 'inline-block');
                $("#stockid").attr("class", "col-md-6");
            } else {
                $("#stocktypes").css("display", 'none');
                $("#stockid").removeClass("col-md-6")
            }
        });
    });
</script>
<!-- /.row -->
<div class="row">
    <div class="col-md-12">
        <div class="panel panel-info">
            <div class="panel-heading"> New Product</div>
            <div class="panel-wrapper collapse in" aria-expanded="true">
                <div class="panel-body">
                    <?php echo form_open('new-product'); ?>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="control-label">Product Name</label>
                                <input type="text" id="pname" name="pname" required="" class='flexdatalist form-control' id='flexdatalist' data-data='<?php echo json_encode($lists); ?>' data-search-in='prodname' data-min-length='1' tabindex="2" class="form-control" placeholder="Product Name">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="control-label">Product Name(Hindi)</label>
                                <input type="text" id="prodname_hindi" name="prodname_hindi" class='form-control' placeholder="Product Name in Hindi">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group ">
                                <label class="control-label">HSN</label>
                                <input type="number"   min="0" name="hsn" tabindex="4" class="form-control" autofocus="" required=""  id="hsn" placeholder="HSN No.">
                            </div>
                        </div>
                            <?php /*
                                <div class="form-group hidden">
                                    <label class="control-label">Stock</label>

                                    <input type="number" id="stock" required="" min="0"  name="stock" value="0" tabindex="7" class="form-control" placeholder="Stock">
                                </div>
                            */ ?>
                        
                        <div class="col-md-3">
                            <div class="form-group">
                                <div>
                                    <div id="stockid">
                                        <label class="control-label">Unit</label>
                                        <select name="unit" tabindex="9" id="unit" class="form-control" >
                                            <?php foreach ($slists as $list) { ?>
                                                <option value="<?php echo $list->unit ?>"><?php echo $list->unit ?></option>
                                            <?php } ?>
                                            <option value="New">New</option>
                                        </select>
                                    </div>
                                    <div id="stocktypes" class=" col-md-6  m-b-10">
                                        <label class="control-label">New Unit</label>
                                        <input name="units"  tabindex="5" id="units"  placeholder="New Unit" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class=" col-md-4">
                                    <label>Live Stock</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">QTY</div>
                                        <input type="number"  step="1" min="0" name="lstock" class="form-control" id="lstock" value="0" placeholder="Live Stock">
                                    </div>
                                </div>
                                <div class=" col-md-4 m-b-20">
                                    <label>WareHouse Stock</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">QTY</div>
                                        <input type="number"  step="1" min="0" name="wstock" class="form-control" id="wstock" value="0" placeholder="WareHouse Stock">
                                    </div>
                                </div>
                                <div class=" col-md-4 m-b-20">
                                    <label>Dead Stock</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">QTY</div>
                                        <input type="number"  step="1" min="0" name="dstock" class="form-control" id="dstock" value="0" placeholder="Dead Stock">
                                    </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="form-group">
                                <div class=" col-md-4">
                                    <label>Purchase Price / Unit</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">Rs</div>
                                        <input type="number"  step=0.01 min="0" name="pprice" tabindex="3" class="form-control" id="pprice" placeholder="Purchase Price"> </div>
                                </div>
                                <div class=" col-md-4   m-b-20">
                                    <label>Sales Price / Unit</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">Rs</div>
                                        <input type="number"  step=0.01 min="0" name="price" tabindex="3" class="form-control" id="price" placeholder="Sales Price"> </div>
                                </div>

                                <div class=" col-md-4   m-b-20">
                                    <label>MRP / Unit</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">Rs</div>
                                        <input type="number"  step=0.01 min="0" name="wprice" tabindex="3" class="form-control" id="wprice" placeholder="MRP"> </div>
                                </div>

                                <div class=" col-md-4   m-b-20">
                                    <label>WholeSale or Limit / Unit</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">Rs</div>
                                        <input type="number"  step=0.01 min="0" name="bsprice" tabindex="3" class="form-control" id="bsprice" placeholder="Limit Price"> </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group" >
                                <div id="gstid">
                                    <label class="control-label">GST %</label>
                                    <select name="gstp" tabindex="9" id="gstp" class="form-control" >
                                        <?php foreach ($glists as $list) { ?>
                                            <option value="<?php echo $list->gst ?>"><?php echo $list->gst ?></option>
                                        <?php } ?>
                                        <option value="New">New</option>
                                    </select>
                                </div>
                                <div id="gstids" class=" col-md-6  m-b-10">
                                    <label class="control-label">New GST %</label>
                                    <input name="gstps"  tabindex="9" id="gstps"  placeholder="New GST %" class="form-control" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/row-->
                    <div class="text-right">
                        <button type="reset" class="btn btn-inverse waves-effect waves-light cancel">Cancel</button>
                        <button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Add</button>
                    </div>
                    <hr>
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</div>
<script src="<?php echo base_url() ?>js/jquery.flexdatalist.js"></script>
<link href="<?php echo base_url() ?>css/jquery.flexdatalist.min.css" rel="stylesheet" />