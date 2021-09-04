<div class="row">
    <div class="col-md-12">
        <div class="white-box printableArea">
            <div class="row">
                <?php echo form_open('barcode-details/' . $this->uri->segment(2)); ?>
                <div class="col-md-12">
                    <div class="col-md-6">
                        <div class="form-group">

                            <div class="col-md-12">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <div id="me" >
                                            <div class="form-group" >
                                                <label class="control-label">Have Barcode ?</label>
                                                <select name="barcode"  id="barcode" tabindex="4" class="form-control" data-placeholder="Choose a Category">
                                                    <option value="No">No</option>
                                                    <option value="Yes">Yes</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div id="ebarcode" class="col-md-6">
                                            <div class="form-group" >
                                                <label class="control-label">Enter Barcode</label>
                                                <input type="text"  name="pbarcode"  tabindex="5" class="form-control" placeholder="Enter Barcode">
                                            </div>
                                        </div>
                                    </div></div>
                                <div class="col-md-4  m-b-30">
                                    <label>Unit Price</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">Rs</div>
                                        <input type="number"  min="0" name="price" value="<?php echo $lists[0]->uprice ?>" readonly="" class="form-control" id="price" placeholder="Price"> </div>
                                </div>
                                <div class="col-md-4   m-b-30">
                                    <label>Unit</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">U</div>
                                        <input type="text"  name="unit" readonly="" value="<?php echo $lists[0]->unit ?>" class="form-control" id="unit" placeholder="Unit"> </div>
                                </div>
                                <div class="col-md-4   m-b-30">
                                    <label>Rest Stock</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">S</div>
                                        <input type="text"  name="rstock" readonly="" value="<?php echo $lists[0]->rstock ?>" class="form-control" id="rstock" placeholder="Rest Stock"> </div>
                                </div>
                                <div class="col-md-4   m-b-30">
                                    <label class="control-label">Stock</label>
                                    <input type="number" id="stock" value="0" required=""  name="stock" class="form-control" placeholder="Stock"> 
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="col-md-12">
                            <div class="col-md-6 m-b-30">
                                <label>Sales Price</label>
                                <div class="input-group">
                                    <div class="input-group-addon">Rs</div>
                                    <input type="number"  min="0" name="sprice" value="<?php echo $lists[0]->uprice ?>" autofocus="" class="form-control" id="sprice" placeholder="Sales Price"> </div>
                            </div>

                            
                            <div class="col-md-6">
                                <div class="form-group text-right">
                                    <br>
                                    <button type="reset" class="btn btn-inverse waves-effect waves-light cancel">Cancel</button>
                                    <button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Print</button>                   
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-6">
                        <div class="form-group">

                            <div class="col-md-12">

                                <div class="col-md-6  m-b-30">
                                    <label class="control-label">Unit Qty / Stock</label>
                                    <input type="number" step="0.01" min="0" id="qttype" required="" value="1"  name="qttype" class="form-control" placeholder="Unit Qty / Stock"> 
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
                <hr> 
            </div>
        </div>
    </div>
</div>
<style>
    .text-center{font-family: serif;}
    .bold{font-weight: bold}
    .margin{margin-top: -9px;padding: 0px;}
    .margin2{margin-top: -16px;padding: 0px;}
    .min{font-size:8px;font-family: serif;color: #000!important;line-height: 8px;}
    @page{
        margin:10mm 4mm;
        size: A4;
    }

</style>   <script>
    $(document).ready(function() {
      $("#ebarcode").css("display", 'none');
        $("#stocktypes").css("display", 'none');
        $("#stocktype").change(function(e) {
            var type = $(this).val();
            if (type == "New") {
                $("#stocktypes").css("display", 'inline-block');
                $("#stockid").attr("class", "col-md-6");
            } else {
                $("#stocktypes").css("display", 'none');
                $("#stockid").removeClass("col-md-6")
            }
        });
        $("#barcode").change(function(e) {
            var type = $(this).val();
            if (type == "Yes") {
                $("#ebarcode").css("display", 'inline-block');
                $("#me").attr("class", "col-md-6");
            } else {
                $("#ebarcode").css("display", 'none');
                $("#me").removeClass("col-md-6")
            }
        });
        $("#stock").keyup(function() {
            var stock = $(this).val();
            var rstock = $("#rstock").val();
            if (parseFloat(stock) > parseFloat(rstock)) {
                $(this).val(rstock);
            }
             if (parseFloat(0) > parseFloat(rstock)) {
                $(this).val(0);
            }
        });
        /*$("#qttype").keyup(function() {
            var typ = $(this).val();
            var stock = $("#stock").val();
            var tstock = parseFloat(typ) * parseFloat(stock);
            var pstock = $("#rstock").val();
            if (parseFloat(tstock) > parseFloat(pstock)) {
                typ = pstock;
                $(this).val(parseFloat(pstock) / parseFloat(stock));
            }
            var price = $("#price").val();
            $('#sprice').val(parseFloat(typ) * parseFloat(price));

        });
        $("#stock").keyup(function() {
            var stock = $(this).val();
            var typ = $("#qttype").val();
            var tstock = parseFloat(typ) * parseFloat(stock);
            var pstock = $("#rstock").val();
            if (parseFloat(tstock) > parseFloat(pstock)) {
                typ = pstock;
                $(this).val(parseFloat(pstock) / parseFloat(stock));
            }
            var price = $("#price").val();
            $('#sprice').val(parseFloat(typ) * parseFloat(price));

        });*/
        $("#print").click(function() {
            //$("#printview").css("width", "21cm");
            $("#printview").print({
                globalStyles: true,
                mediaPrint: false,
                stylesheet: null,
                noPrintSelector: ".no-print",
                iframe: true,
                append: null,
                prepend: null,
                manuallyCopyFormValues: true,
                deferred: $.Deferred(),
            });
            //$("#printview").css("width", "auto");
            setTimeout(function() {
                // location.assign('<?php echo site_url('home/list-product') ?>');
            }, 1000);
        });

    });

</script>