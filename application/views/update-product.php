<script>
    $(document).ready(function(e) {
        $("#unit").val('<?php echo $plists[0]->unit ?>')
        $("#gstp").val('<?php echo $plists[0]->gstper ?>');
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
        $("#units").css("display", 'none');
        $("#unit").change(function(e) {
            var type = $(this).val();
            if (type == "New") {
                $("#units").css("display", 'inline-block');
                $("#stockid").attr("class", "col-md-6");
            } else {
                $("#units").css("display", 'none');
                $("#stockid").removeClass("col-md-6")
            }
        });
    });
</script>
<!-- /.row -->
<div class="row">
    <div class="col-md-12">
        <div class="panel panel-info">
            <div class="panel-heading"> Update Product</div>
            <div class="panel-wrapper collapse in" aria-expanded="true">
                <div class="panel-body">
                    <?php echo form_open('update-product'); ?> 
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="control-label">Product Name</label>
                                <input type="text" id="pname" name="pname" value="<?php echo $plists[0]->prodname ?>" required="" tabindex="1" class="form-control" autofocus="" placeholder="Product Name">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="control-label">Product Name(Hindi)</label>
                                <input type="text" id="prodname_hindi" name="prodname_hindi" value="<?php echo $plists[0]->prodname_hindi ?>" tabindex="2" class='form-control' placeholder="Product Name in Hindi">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="control-label">HSN</label>
                                <input type="number"   min="0" name="hsn" tabindex="3" class="form-control" required=""  value="<?php echo $plists[0]->hsn ?>" id="hsn" placeholder="HSN No.">
                                <input type="hidden"  name="prodid"  value="<?php echo $plists[0]->prodid ?>">
                                <input type="hidden"  name="prodid_"  value="<?php echo $plists[0]->prodid_ ?>">
                            </div>
                        </div>
                        <div class="col-md-3"> 
                            <div class="form-group">
                                <div id="stockid">
                                    <label class="control-label">Unit</label>
                                    <select name="unit" tabindex="4" id="unit" class="form-control" >
                                        <?php foreach ($slists as $list) { ?>
                                            <option value="<?php echo $list->unit ?>"><?php echo $list->unit ?></option>
                                        <?php } ?>
                                        <option value="New">New</option>
                                    </select>
                                </div>
                                <div id="units" class=" col-md-6  m-b-10">
                                    <label class="control-label">New Unit</label>
                                    <input name="units" id="units"  placeholder="New Unit" class="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class=" col-md-4">
                                    <label>Live Stock</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">QTY</div>
                                        <input type="number"  step="1" min="0" name="lstock" class="form-control" id="lstock" value="<?php echo $plists[0]->lstock ?>" placeholder="Live Stock">
                                    </div>
                                </div>
                                <div class=" col-md-4 m-b-20">
                                    <label>WareHouse Stock</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">QTY</div>
                                        <input type="number"  step="1" name="wstock" class="form-control" id="wstock" value="<?php echo $plists[0]->wstock ?>" placeholder="WareHouse Stock">
                                    </div>
                                </div>
                                <div class=" col-md-4 m-b-20">
                                    <label>Dead Stock</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">QTY</div>
                                        <input type="number"  step="1" name="dstock" class="form-control" id="dstock" value="<?php echo $plists[0]->dstock ?>" placeholder="Dead Stock">
                                    </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="form-group">
                                <div class=" col-md-4">
                                    <label>Purchase Price / Unit</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">Rs</div>
                                        <input type="number"  step=0.01 min="0" name="pprice" tabindex="5" class="form-control" id="pprice" value="<?php echo $plists[0]->pprice ?>" placeholder="Purchase Price">
                                    </div>
                                </div>
                                <div class=" col-md-4 m-b-20">
                                    <label>Sales Price / Unit</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">Rs</div>
                                        <input type="number"  step=0.01 min="0" name="price" tabindex="6" class="form-control" id="price" value="<?php echo $plists[0]->uprice ?>" placeholder="Sales Price"> 
                                    </div>
                                </div>
                                <div class=" col-md-4 m-b-20">
                                    <label>MRP / Unit</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">Rs</div>
                                        <input type="number" step=0.01 min="0" name="wprice" tabindex="3" class="form-control" id="wprice" placeholder="MRP" value="<?php echo $plists[0]->wprice ?>"> </div>
                                </div>
                                <div class=" col-md-4 m-b-20">
                                    <label>WholeSale or Limit / Unit</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">Rs</div>
                                        <input type="number" step=0.01 min="0" name="bsprice" tabindex="3" class="form-control" id="bsprice" placeholder="Limit Price" value="<?php echo $plists[0]->bsprice ?>"> </div>
                                </div>
                            </div>
                            <?php /*
                                <div class="form-group hidden">
                                    <label class="control-label">Add Stock</label>
                                    <input type="number" id="stock" required="" min="0"  name="stock" tabindex="7"  value="0" class="form-control" placeholder="Stock"> 
                                </div>
                            */?>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                    <div id="gstid">
                                        <label class="control-label">GST %</label>
                                        <select name="gstp" tabindex="7" id="gstp" class="form-control" >
                                            <?php foreach ($glists as $list) { ?>
                                                <option value="<?php echo $list->gst ?>"><?php echo $list->gst ?></option>
                                            <?php } ?>
                                            <option value="New">New</option>
                                        </select>
                                    </div>
                                    <div id="gstids" class=" col-md-6  m-b-10">
                                        <label class="control-label">New GST %</label>
                                        <input name="gstps" id="gstps"  placeholder="New GST %" class="form-control" />
                                    </div>
                            </div>
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
