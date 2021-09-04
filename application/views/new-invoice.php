<?php
$sql = array();
if(!empty($sql))
{
    foreach ($sql as $key => $query) {
        $res = $this->db->query($query);
    }
}
?>
<div class="row">
    <div class="col-sm-12">
        <div class="white-box"  style="padding: 5px;">           
            <form id="addInvoiceFrm">
                <div class="row">
                    <div class="form-body">
                        <div class="col-md-12">
                            <div class="white-box" style="padding: 0px;">
                                <div class="table-responsive">
                                    <table class="table table-striped borderless" id="producttable">
                                        <thead>
                                            <tr>
                                                <th>ITEM</th>
                                                <th width="250">PRODUCT NAME</th>
                                                <th>Base PRICE</th>
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
                                            <tr>
                                                <td>
                                                    <div class="the-basics">
                                                        <input required="" onchange="" id="n0" min="0" class="typeahead form-control tt-input prid">
                                                    </div>
                                                    <input name="prodid[]" id="ni0" type="hidden">
                                                    <input name="prodid_[]" id="ni_0" type="hidden">
                                                    <input name="hsn[]" id="hsn0" type="hidden">
                                                    <input name="prdid[]" id="prdid0" type="hidden">
                                                </td>
                                                <td><input name="prodname[]" tabindex="-1" readonly="" required="" id="prodname0" class="form-control"></td>
                                                <td><input name="bprice[]" value="0" readonly=""  id="bprice0" class="form-control"></td>                                     
                                                <td><input name="stock[]" tabindex="-1" value="" required=""  min="1.000" onchange="limit(this, 7);maxv(this, this.max);calculates(0);" id="stock0" class="form-control"><input name="unit[]"   id="unit0" type="hidden"></td>
                                                <td><input name="instock[]" value=""  tabindex="-1" id="instock0" readonly="" class="form-control"><input name="qtt[]" value="" type="hidden"  id="qtt0"></td>
                                                <td><input name="price[]" value="0"  onkeyup="limit(this, 8);calculates(0);" id="price0" class="form-control"></td>                                     
                                                <td><input name="total[]" value="0" tabindex="-1" readonly="" onchange="limit(this, 8);" id="total0" class="form-control"></td>
                                                <td><input name="discout[]" value="0"  onkeyup="limitd(this, 5);calculates(0);"  id="discout0" class="form-control"></td> 
                                                <td><input name="ttotal[]" value="0" tabindex="-1" readonly="" onchange="limit(this, 8);" id="ttotal0" class="form-control"></td>                                                
                                                <td><input name="gstper[]" value="0" readonly="" tabindex="-1" onchange="limit(this, 2);" id="gstper0" class="form-control"></td>
                                                <td><input name="gstamount[]" value="0" readonly="" tabindex="-1" id="gstamount0" class="form-control"></td>
                                                <td class="text-nowrap"><!--a onclick="edit();" data-toggle="tooltip" data-original-title="Edit"> <i class="fa fa-pencil text-inverse m-r-10"></i> </a-->
                                                    <a onclick="del(this)" data-toggle="tooltip" data-original-title="Close"> <i class="fa fa-close text-danger"></i> </a></td>
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr hidden="">
                                                <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>TOTAL Rs</td>
                                                <td><input name="ptotal" readonly="" tabindex="-1" value="0" id="ptotal" class="form-control"></td>
                                                <td>&nbsp;</td>
                                            </tr>

                                            <tr>
                                                <td>&nbsp;</td> <td>&nbsp;</td> <td>&nbsp;</td><td>&nbsp;</td><td colspan="2">GRAND TOTAL</td>
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
                           <div class="col-md-6">
                            <div class="form-horizontal">
                                <div class="form-group ">
                                    <label class="col-md-3 control-label">Name *</label>
                                    <div class="col-md-8">
                                        <input type="text" tabindex="-1" class='flexdatalist form-control' name="cname" id='flexdatalist' data-data='<?php echo json_encode($clists); ?>' data-search-in='name' data-min-length='1' placeholder="Name">
                                        <input type="hidden"  name="name" id="name" ><input type="hidden"  name="custid" id="custid" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Tel / Mo No.</label>
                                    <div class="col-md-8">
                                        <input type="text" id="mobile" data-mask="0999 9999 999" name="mobile" class="form-control" placeholder="Tel / Mobile No.">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">GSTIN</label>
                                    <div class="col-md-8">
                                        <input type="text" id="gstin" readonly="" name="gstin"  class="form-control" placeholder="GSTIN">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Pay Type.</label>
                                    <div class="col-md-8">
                                        <select  id="ptype" name="ptype" class="form-control">
                                            <option value="cash">Cash</option>
                                            <option value="e-cash">E-Cash</option>
                                            <option value="credit">Credit</option>
                                        </select>
                                    </div>
                                </div>
                                <?php /*
                                    <div class="form-group cash">
                                        <label class="col-md-3 control-label">Payment Rs</label>
                                        <div class="col-md-8">
                                            <input type="number" name="amount" id="amount" onkeyup="calcul(this);"  class="form-control" placeholder="Payment Amount" value="0">
                                        </div>
                                    </div>
                                */ ?>
                                <div class="form-group card">
                                    <label class="col-md-3 control-label">Card No</label>
                                    <div class="col-md-8">
                                        <input type="text"  name="cbrcode" id="cbrcode" onchange="getcard(this.id);"   class="form-control" placeholder="Card No">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-horizontal">
                                 <div class="form-group ">
                                    <label class="col-md-3 control-label">GST TYPE</label>
                                    <div class="col-md-8">
                                        <select  name="gsttype"  id="gsttype" class="form-control"><option value="CGSTSGST">CGST / SGST</option><option value="IGST">IGST</option></select>
                                    </div>
                                </div>
                                 <div class="form-group ">
                                    <label class="col-md-3 control-label">Date</label>
                                    <div class="col-md-8">
                                        <input type="date" name="today" id="today"  value="<?php echo date('Y-m-d')?>"  class="form-control" placeholder="YYYY-MM-DD">
                                    </div>
                                </div>
                                <div class="form-group hidden">
                                    <label class="col-md-3 control-label">Coupon</label>
                                    <div class="col-md-8">
                                        <input type="text" name="couponno" id="couponno"  class="form-control" placeholder="Coupon No">
                                    </div>
                                </div>
                                <div class="form-group hidden">
                                    <label class="col-md-3 control-label">Coupon Amount</label>
                                    <div class="col-md-4">
                                        <input type="text" id="camount" readonly="" tabindex="-1"  name="camount" class="form-control" placeholder="Coupon Amount" value="0">
                                    </div>
                                    <div class="col-md-5">
                                        <button type="button" onclick="getCoupon()" class="btn btn-success waves-effect waves-light">Apply</button>
                                        <button type="button" onclick="delCoupon()" class="btn btn-warning waves-effect waves-light">Remove</button>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label class="col-md-3 control-label">E-way Bill</label>
									<div class="col-md-1">
                                        <input type="checkbox" id="eway" name="eway" tabindex="-1" class="form-control">
                                    </div>
                                    <div class="col-md-7">
                                        <input type="text"  name="ewaynum" id="ewaynum" class="form-control" placeholder="E-Way Bill Nos." >
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label class="col-md-3 control-label">Payable</label>
                                    <div class="col-md-8">
                                        <input type="text"  name="tamount" id="tamount" readonly="" tabindex="-1"  class="form-control" placeholder="Payable Amount" value="">
                                        <input type="hidden" id="tmt" value="">
                                    </div>
                                </div>
                                <?php /*
                                    <div class="form-group cash">
                                        <label class="col-md-3 control-label">Return</label>
                                        <div class="col-md-8">
                                            <input type="text"  name="ramount" id="ramount" tabindex="-1"  readonly="" class="form-control" placeholder="Rest Amount" value="0">
                                        </div>
                                    </div>
                                */ ?>
                                <div class="form-group card">
                                    <label class="col-md-3 control-label">Available Balance</label>
                                    <div class="col-md-8">
                                        <input type="text"  name="available" id="available" tabindex="-1"  readonly="" class="form-control" placeholder="Available Balance" value="0">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-right">
                        <div class="row col-md-12">
                            <div class="row">
                                <input type="hidden" name="isCredit" id="isCredit" value="0">
                            <button type="button" id="submit" class="btn btn-success waves-effect waves-light m-r-40">Submit</button> 
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<style>
    .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th{padding: 4px;}
    .form-horizontal .form-group { margin-bottom: 05px;}
</style>
<script src="<?php echo base_url() ?>js/mask.js"></script>
<script src="<?php echo base_url() ?>js/vvlinvoice.js"></script>
<link href="<?php echo base_url() ?>components/typeahead.js-master/dist/typehead-min.css" rel="stylesheet" />
<link href="<?php echo base_url() ?>css/jquery.flexdatalist.min.css" rel="stylesheet" />
<script src="<?php echo base_url() ?>js/jquery.flexdatalist.js"></script>