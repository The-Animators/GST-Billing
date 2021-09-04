<div class="row">
    <div class="col-sm-12">
        <?php $lists = $ilists[0]; ?>
        <div class="white-box"  style="padding: 5px;">           
                <div class="row">
                    <div class="form-body">
<?php echo form_open_multipart('credit-note-invoice') ?>
                        <div class="col-sm-12">
                            <div class="white-box" style="padding: 0px;">
                                <div class="table-responsive">
                                    <table class="table table-striped borderless" id="producttable">
                                        <thead>
                                            <tr>
                                                <th>HSN</th>
                                                <th width="250">NAME</th>
                                                <th>QTY</th>
                                                <th>UNITS</th>                                               
                                                <th>PRICE</th>                                                
                                                <th>TOTAL</th>
                                                <th>DIS %</th>
                                                <th>T-TOTAL</th>
                                                <th>GST %</th>
                                                 <th>GST-AMT</th>
                                                <th class="text-nowrap">Action</th>
                                            </tr>
                                        </thead>
                                   
                                        <tbody>
                                            <?php  for ($i = 0; $i < count($lists); $i++) {?>
                                            <tr>
                                                <td><input name="hsn[]"  readonly="" value="<?php echo $lists[$i]->hsn ?>"  required="" id="n<?php echo $i ?>" min="0" class="form-control"><input name="prodid[]" value="<?php echo $lists[$i]->prodid ?>"  id="prodid<?php echo $i ?>" type="hidden"></td>
                                                <td><input name="prodname[]" tabindex="-1" readonly="" value="<?php echo $lists[$i]->bprodname ?>"  required="" id="prodname0" class="form-control"></td>
                                                <td><input name="stock[]" type="number" value="<?php echo $lists[$i]->istock?>"  required=""  max="<?php echo $lists[$i]->istock ?>"  onkeyup="limit(this, 4);maxv(this, this.max);calculates(<?php echo $i ?>);" id="stock<?php echo $i ?>" class="form-control"></td>
                                                <td><input name="unit[]" value="<?php echo $lists[$i]->unit ?>"  tabindex="-1" id="unit<?php echo $i ?>" readonly="" class="form-control"><input name="instock[]" type="hidden" value="<?php echo $lists[$i]->iinstock ?>" /></td>
                                                <td><input name="price[]" value="<?php echo $lists[$i]->salesrate ?>" readonly="" tabindex="-1"  onchange="limit(this, 8);" id="price<?php echo $i ?>" class="form-control"></td>                                     
                                                <td><input name="total[]" value="<?php echo $lists[$i]->prodtotal ?>" tabindex="-1" readonly="" onchange="limit(this, 8);" id="total<?php echo $i ?>" class="form-control"></td>
                                                <td><input name="discout[]" value="<?php echo $lists[$i]->discount ?>" type="number" step=0.01  onkeyup="limitd(this, 5);calculates(<?php echo $i ?>);"  id="discout<?php echo $i ?>" class="form-control"></td> 
                                                <td><input name="ttotal[]" value="<?php echo $lists[$i]->prodttotal ?>" tabindex="-1" readonly="" onchange="limit(this, 8);" id="ttotal<?php echo $i ?>" class="form-control"></td>                                                
                                                <td><input name="gstper[]" readonly="" value="<?php echo $lists[$i]->bgstper ?>"  onchange="limit(this, 2);" id="gstper<?php echo $i ?>" class="form-control"></td>
                                                <td><input name="gstamount[]" value="<?php echo $lists[$i]->gstamount ?>" readonly=""   id="gstamount<?php echo $i ?>" class="form-control"></td>
                                                <td class="text-nowrap"><a onclick="del(this)" data-toggle="tooltip" data-original-title="Close"> <i class="fa fa-close text-danger"></i> </a></td>
                                            </tr>
                                            <?php }?>
                                        </tbody>
                                        <tfoot>
                                            <tr hidden="">
                                                <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>TOTAL Rs</td>
                                                <td><input name="ptotal" readonly="" tabindex="-1" value="0" id="ptotal" class="form-control"></td>
                                                <td>&nbsp;</td>
                                            </tr>

                                            <tr>
                                                <td>&nbsp;</td> <td>&nbsp;</td><td>&nbsp;</td><td colspan="2">GRAND TOTAL</td>
                                                <td><input name="gtotal" readonly="" tabindex="-1" value="0" id="gtotal" class="form-control"></td><td>&nbsp;</td>
                                                <td><input name="gttotal" readonly="" tabindex="-1" value="0" id="gttotal" class="form-control"><td>&nbsp;</td>
                                                <td><input name="gsttotal" readonly="" tabindex="-1" value="0" id="gsttotal" class="form-control"></td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <?php if(isset($lists[0])): ?>
                        <div class="col-sm-6 col-xs-12">
                            <div class="form-horizontal">
                                <div class="form-group ">
                                    <label class="col-md-3 control-label">Name *</label>
                                    <div class="col-md-8">
                                        <input type="text" readonly=""  name="cname"  value="<?php echo $lists[0]->name ?>"class="form-control" placeholder="Name">
                                        <input type="hidden"  name="customerid" value="<?php echo $lists[0]->customerid ?>" >
                                        <input type="hidden"  name="invoiceid" value="<?php echo $lists[0]->invoiceid ?>"  >
                                        <input type="hidden"  name="invoicedate" value="<?php echo $lists[0]->invoice_date ?>" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Tel / Mo No.</label>
                                    <div class="col-md-8">
                                        <input type="text" id="mobile" readonly=""  value="<?php echo $lists[0]->mobile ?>" name="mobile" class="form-control" placeholder="Tel / Mobile No.">
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label class="col-md-3 control-label">Pay Type.</label>
                                    <div class="col-md-8">
                                        <input id="paytype" name="paytype" readonly="" value="<?php echo $lists[0]->paytype ?>" class="form-control" value="<?php echo $lists[0]->paytype ?>"  >
                                       
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label class="col-md-3 control-label">Date</label>
                                    <div class="col-md-8">
                                        <input type="date" name="today" id="today"  value="<?php echo date('Y-m-d')?>"  class="form-control" placeholder="YYYY-MM-DD">
                                    </div>
                                </div>
                                
                            </div>
                        </div>

                        <div class="col-sm-6 col-xs-12">
                            <div class="form-horizontal">
                               <div class="form-group">
                                    <label class="col-md-3 control-label">GST TYPE</label>
                                    <div class="col-md-8">
                                        <input  name="gsttype" readonly="" id="gsttype" class="form-control" value="<?php echo $lists[0]->gst ?>" />
                                    </div>
                                </div>
                               <div class="form-group">
                                    <label class="col-md-3 control-label">GSTIN.</label>
                                    <div class="col-md-8">
                                        <input type="text" id="gstin" readonly="" name="gstin" value="<?php echo $lists[0]->gstin ?>"  class="form-control" placeholder="GSTIN">
                                    </div>
                                </div>
                                
                                 <div class="form-group">
                                    <label class="col-md-3 control-label">Description</label>
                                    <div class="col-md-8">
                                        <textarea id="paytype" rows="4" name="description" class="form-control"></textarea>
                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php endif; ?>
                    </div>
                    <div class="text-right">
                        <div class="row col-md-12">
                            <button type="submit"  class="btn btn-success waves-effect waves-light m-r-10">Credit Note</button>                     
                        </div>
                    </div>
                </div>
            <?php echo form_close() ?>
        </div>
    </div>
</div>
<style>
    .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th{padding: 4px;}
    .form-horizontal .form-group { margin-bottom: 05px;}
</style>
<script src="<?php echo base_url() ?>js/mask.js"></script>
<script>
var i='<?php echo count($lists)?>';
$(document).ready(function () {calculates(<?php echo $i ?>);});
function del(va) {
    if (confirm("Are you sure to Datele ?")) {
        $(va).parent('td').parent('tr').remove();
        calculattotal();
        j--;
    }
}

function calculattotal(id) {
    var mytotal = 0;
    var myttotal = 0;
    var tgstper = 0;
    for (var k = 0; k <= i; k++) {
        if ($("#total" + k).length != 0) {
            mytotal = parseFloat(mytotal) + parseFloat($("#total" + k).val());
            myttotal = parseFloat(myttotal) + parseFloat($("#ttotal" + k).val());
            tgstper = parseFloat(tgstper) + ((parseFloat($("#ttotal" + k).val()) * parseFloat($("#gstper" + k).val())) / 100)
        }
        if (k == i) {
            /*$("#ptotal").val(Math.ceil(mytotal));
            $("#taxa").val(Math.ceil(parseFloat(tgstper).toFixed(0)));
            $("#gtotal").val(Math.ceil(parseFloat(mytotal)));
            $("#gttotal").val(Math.ceil(parseFloat(myttotal)));
            $("#gsttotal").val(Math.ceil(parseFloat(tgstper)));
            $("#tamount").val(Math.ceil(parseFloat(myttotal)) + Math.ceil( parseFloat(tgstper)));*/
            $("#ptotal").val(parseFloat(mytotal).toFixed(0));
            $("#taxa").val(parseFloat(tgstper).toFixed(0));
            $("#gtotal").val(parseFloat(mytotal).toFixed(0));
            $("#gttotal").val(parseFloat(myttotal).toFixed(0));
            $("#gsttotal").val(parseFloat(tgstper).toFixed(0));
            $("#tamount").val((parseFloat(myttotal)+ parseFloat(tgstper)).toFixed(0));
        }
    }
    
}

function calculates(id) {
    var qty = $("#stock" + id).val();
    if (qty == "") {
        qty = 0;
    }
    var total = parseFloat(qty) * (parseFloat($("#price" + id).val()));
    $("#total" + id).val(total.toFixed(2));
    
    var ttotal=parseFloat(total)- (parseFloat(total)* parseFloat($("#discout" + id).val())/100);
    $("#ttotal" + id).val(ttotal.toFixed(2));  
    
    $("#gstamount" + id).val(((parseFloat(ttotal) * parseFloat($("#gstper" + id).val())) / 100));
    calculattotal();
}</script>
