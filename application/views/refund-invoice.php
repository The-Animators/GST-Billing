<div class="row">
    <div class="col-sm-12">
        <?php $lists = $ilists[0]; ?>
        <div class="white-box"  style="padding: 5px;">           
                <div class="row">
                    <div class="form-body">
<?php echo form_open_multipart('refund-invoice') ?>
                        <div class="col-sm-12">
                            <div class="white-box" style="padding: 0px;">
                                <div class="table-responsive">
                                    <table class="table table-striped borderless" id="producttable">
                                        <thead>
                                            <tr>
                                                <th>ITEM</th>
                                                <th width="250">NAME</th>
                                                <th>QTY</th>
                                                <th>UNITS</th>                                               
                                                <th>PRICE</th>                                                
                                                <th>TOTAL</th>
                                            </tr>
                                        </thead>
                                   
                                        <tbody>
                                            <?php  for ($i = 0; $i < count($lists); $i++) {?>
                                            <tr>
                                                <td>
                                                    <input readonly="" value="<?php echo $lists[$i]->prodid_ ?>" id="n<?php echo $i ?>" min="0" class="form-control">
                                                    <input name="prodid_[]" value="<?php echo $lists[$i]->prodid_ ?>" id="prodid_<?php echo $i ?>" type="hidden">
                                                </td>
                                                <td>
                                                    <input name="prodname[]" tabindex="-1" readonly="" value="<?php echo $lists[$i]->bprodname ?>"  required="" id="prodname0" class="form-control">
                                                </td>
                                                <td>
                                                    <input name="qty[]" type="number" value="1" required="" max="<?php echo $lists[$i]->lstock; ?>"  onkeyup="limit(this, 4);maxv(this, this.max);calculates(<?php echo $i ?>);" id="qty<?php echo $i ?>" class="form-control">
                                                </td>
                                                <td>
                                                    <input name="unit[]" value="<?php echo $lists[$i]->unit ?>"  tabindex="-1" id="unit<?php echo $i ?>" readonly="" class="form-control">
                                                </td>
                                                <td>
                                                    <input name="rate[]" value="<?php echo $lists[$i]->salesrate ?>" readonly="" tabindex="-1"  onchange="limit(this, 8);" id="rate<?php echo $i ?>" class="form-control">
                                                </td>                                     
                                                <td>
                                                    <input name="total[]" value="<?php echo $lists[$i]->prodtotal ?>" tabindex="-1" readonly="" onchange="limit(this, 8);" id="total<?php echo $i ?>" class="form-control">
                                                </td>
                                            </tr>
                                            <?php }?>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td colspan="3" align="right">GRAND TOTAL</td>
                                                <td><input name="gtotal" readonly="" tabindex="-1" value="0" id="gtotal" class="form-control"></td><td>&nbsp;</td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-right">
                        <div class="row col-md-12">
                            <button type="submit"  class="btn btn-success waves-effect waves-light m-r-10">Refund</button>                     
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
            /*myttotal = parseFloat(myttotal) + parseFloat($("#ttotal" + k).val());
            tgstper = parseFloat(tgstper) + ((parseFloat($("#ttotal" + k).val()) * parseFloat($("#gstper" + k).val())) / 100)*/
        }
            $("#gtotal").val(parseFloat(mytotal).toFixed(0));
        if (k == i) {
            /*$("#ptotal").val(Math.ceil(mytotal));
            $("#taxa").val(Math.ceil(parseFloat(tgstper).toFixed(0)));
            $("#gtotal").val(Math.ceil(parseFloat(mytotal)));
            $("#gttotal").val(Math.ceil(parseFloat(myttotal)));
            $("#gsttotal").val(Math.ceil(parseFloat(tgstper)));
            $("#tamount").val(Math.ceil(parseFloat(myttotal)) + Math.ceil( parseFloat(tgstper)));*/
            /*$("#ptotal").val(parseFloat(mytotal).toFixed(0));
            $("#taxa").val(parseFloat(tgstper).toFixed(0));
            $("#gtotal").val(parseFloat(mytotal).toFixed(0));
            $("#gttotal").val(parseFloat(myttotal).toFixed(0));
            $("#tamount").val((parseFloat(myttotal)+ parseFloat(tgstper)).toFixed(0));*/
        }
    }
    
}

function calculates(id) {
    var qty = $("#qty" + id).val();
    if (qty == "") {
        qty = 0;
    }
    var total = parseFloat(qty) * (parseFloat($("#rate" + id).val()));
    $("#total" + id).val(total.toFixed(2));
    
    /*var ttotal=parseFloat(total)- (parseFloat(total)* parseFloat($("#discout" + id).val())/100);
    $("#ttotal" + id).val(ttotal.toFixed(2));  
    
    $("#gstamount" + id).val(((parseFloat(ttotal) * parseFloat($("#gstper" + id).val())) / 100));*/
    calculattotal();
}</script>
