<div class="row">
    <div class="col-sm-12">
        <?php $lists = $ilists[0]; ?>
        <div class="white-box"  style="padding: 5px;">           
                <div class="row">
                    <div class="form-body">
                        <form>
                        <div class="col-sm-12">
                            <div class="white-box" style="padding: 0px;">
                                <div class="table-responsive">
                                    <table class="table table-striped borderless" id="producttable">
                                        <thead>
                                            <tr>
                                                <th class="text-center">ITEM</th>
                                                <th width="250" class="text-center">PRODUCT NAME</th>
                                                <th>Base PRICE</th>
                                                <th class="text-center">QTY</th>
                                                <th class="text-center">UNITS</th>                                               
                                                <th class="text-center">PRICE</th>                                                
                                                <th class="text-center">TOTAL</th>
                                                <th class="text-center">DIS %</th>
                                                <th class="text-center">T-TOTAL</th>
                                                <th class="text-center">GST %</th>
                                                 <th class="text-center">GST-AMT</th>
                                                <th class="text-nowrap">Action</th>
                                            </tr>
                                        </thead>
                                   
                                        <tbody>
                                            <?php $pdttl=0;  for ($i = 0; $i <count($lists); $i++) {?>
                                            <tr>
                                                <td>
                                                    <div class="the-basics">
                                                        <input  readonly=""  value="<?php echo $lists[$i]->prodid_ ?>"  onchange=""  id="n<?php echo $i ?>" min="0" class="typeahead form-control tt-input prid">
                                                    </div>
                                                    <input name="iid[]" value="<?php echo $lists[$i]->id ?>" id="iid<?php echo $i ?>" type="hidden">
                                                    <input name="hsn[]"  value="<?php echo $lists[$i]->hsn ?>"  id="hsn<?php echo $i ?>" hidden=""><input name="prodid[]" value="<?php echo $lists[$i]->prodid ?>"  id="prodid<?php echo $i ?>"type="hidden">
                                                    <input name="prodid_[]" value="<?php echo $lists[$i]->prodid_ ?>" id="prodid_<?php echo $i ?>" type="hidden">
                                                    <input name="prdid[]"   id="prdid<?php echo $i ?>" type="hidden"></td>
                                                <td>
                                                    <input name="prodname[]" tabindex="-1" readonly="" value="<?php echo $lists[$i]->bprodname ?>"  required="" id="prodname<?php echo $i ?>" class="form-control">
                                                </td>
                                                <td><input name="bprice[]" value="<?php echo $lists[$i]->bsprice ?>" readonly=""  id="bprice<?php echo $i ?>" class="form-control"></td>       
                                                <td><input name="stock[]" tabindex="-1" type="number" value="<?php echo $lists[$i]->istock?>"  required=""  max="<?php echo ($lists[$i]->rstock+$lists[$i]->istock)?>"  onchange="limit(this, 7);maxv(this, this.max);calculates(<?php echo $i ?>);" id="stock<?php echo $i ?>" class="form-control"><input name="hstock[]" type="hidden" value="<?php echo $lists[$i]->istock?>" ></td>
                                                <td><input name="unit[]" value="<?php echo $lists[$i]->unit ?>"  tabindex="-1" id="unit<?php echo $i ?>" readonly="" class="form-control"><input name="instock[]" type="hidden" value="<?php echo $lists[$i]->iinstock ?>" /></td>
                                                <td><input name="price[]" value="<?php echo $lists[$i]->salesrate ?>"   onkeyup="limit(this, 8);calculates(<?php echo $i ?>);" id="price<?php echo $i ?>" class="form-control"></td>                                     
                                                <td><input name="total[]" value="<?php $pdttl+=$lists[$i]->prodtotal; echo $lists[$i]->prodtotal ?>" tabindex="-1" readonly="" onchange="limit(this, 8);" id="total<?php echo $i ?>" class="form-control"></td>
                                                <td><input name="discout[]" value="<?php echo $lists[$i]->discount ?>" type="number" step=0.01  onkeyup="limitd(this, 5);calculates(<?php echo $i ?>);"  id="discout<?php echo $i ?>" class="form-control"></td> 
                                                <td><input name="ttotal[]" value="<?php echo $lists[$i]->prodttotal ?>" tabindex="-1" readonly="" onchange="limit(this, 8);" id="ttotal<?php echo $i ?>" class="form-control"></td>
                                                <td><input name="gstper[]" readonly="" value="<?php echo $lists[$i]->bgstper ?>"  onchange="limit(this, 2);" id="gstper<?php echo $i ?>" class="form-control"></td>
                                                <td><input name="gstamount[]" value="<?php echo $lists[$i]->gstamount ?>" readonly=""   id="gstamount<?php echo $i ?>" class="form-control"></td>
                                                <td class="text-nowrap"><a onclick="dell(this)" data-toggle="tooltip" data-original-title="Close"> <i class="fa fa-close text-danger"></i> </a></td>
                                            </tr>
                                            <?php }?>
                                            <tr>
                                                <td>
                                                    <div class="the-basics">
                                                        <input id="n<?php echo $i ?>" min="0" class="typeahead form-control tt-input prid">
                                                    </div>
                                                    <input name="iid[]" value="" id="iid<?php echo $i ?>" type="hidden">
                                                    <input name="hsn[]"  id="hsn<?php echo $i ?>" type="hidden">
                                                    <input name="prodid_[]" id="prodid_<?php echo $i ?>" type="hidden">
                                                    <input name="prdid[]"   id="prdid<?php echo $i ?>" type="hidden"><input name="prodid[]"  id="ni<?php echo $i ?>" type="hidden">
                                                </td>
                                                <td><input name="prodname[]" tabindex="-1" readonly="" value=""  required="" id="prodname<?php echo $i ?>" class="form-control"></td>
                                                <td><input name="bprice[]"  tabindex="-1" value="0" readonly="" id="bprice<?php echo $i ?>" class="form-control"></td>       
                                                <td><input name="stock[]" value="1" onchange="limit(this, 7);maxv(this, this.max);calculates(<?php echo $i ?>);" id="stock<?php echo $i ?>" class="form-control" required=""></td>
                                                <td><input name="unit[]" value=""  tabindex="-1" id="unit<?php echo $i ?>" readonly="" class="form-control"><input name="instock[]" type="hidden" value="1" /></td>
                                                <td><input name="price[]" value="0" onkeyup="limit(this, 8);calculates(<?php echo $i ?>);" id="price<?php echo $i ?>" class="form-control"></td>                                     
                                                <td><input name="total[]" value="0" tabindex="-1" readonly="" onchange="limit(this, 8);" id="total<?php echo $i ?>" class="form-control"></td>
                                                <td><input name="discout[]" value="0" type="number" step=0.01  onkeyup="limitd(this, 5);calculates(<?php echo $i ?>);"  id="discout<?php echo $i ?>" class="form-control"></td> 
                                                <td><input name="ttotal[]" value="0" tabindex="-1" readonly="" onchange="limit(this, 8);" id="ttotal<?php echo $i ?>" class="form-control"></td>                                                
                                                <td><input name="gstper[]" readonly="" value="0"  onchange="limit(this, 2);" id="gstper<?php echo $i ?>" class="form-control"></td>
                                                <td><input name="gstamount[]" value="0" readonly=""   id="gstamount<?php echo $i ?>" class="form-control"></td>
                                                <td class="text-nowrap"><a onclick="dell(this)" data-toggle="tooltip" data-original-title="Close"> <i class="fa fa-close text-danger"></i> </a></td>
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr hidden="">
                                                <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>TOTAL Rs</td>
                                                <td><input name="ptotal" readonly="" tabindex="-1" value="0" id="ptotal" class="form-control"></td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td> <td>&nbsp;</td><td>&nbsp;</td><td colspan="2">GRAND TOTAL</td>
                                                <td><input name="gtotal" readonly="" tabindex="-1" value="<?php echo $pdttl ?>" id="gtotal" class="form-control"></td><td>&nbsp;</td>
                                                <td>&nbsp;<input type="hidden" name="gttotal" readonly="" tabindex="-1" value="<?php echo $lists[0]->total_amount ?>" id="gttotal" class="form-control"></td><td>&nbsp;</td>
                                                <td><input name="gsttotal" readonly="" tabindex="-1" value="<?php echo $lists[0]->taxamount ?>" id="gsttotal" class="form-control"></td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xs-12">
                            <div class="form-horizontal">
                                <div class="form-group ">
                                    <label class="col-md-3 control-label">Name *</label>
                                    <div class="col-md-8">
                                        <input type="text"  class='flexdatalist form-control' name="cname" id='flexdatalist' value="<?php echo $lists[0]->name ?>" data-data='<?php echo json_encode($clists); ?>' data-search-in='name' data-min-length='1' placeholder="Name">
                                        <input type="hidden"  name="custid" id="custid" value="<?php echo $lists[0]->customerid ?>" >
                                        <input type="hidden"  name="invoiceid" value="<?php echo $lists[0]->invoiceid ?>"  >
                                        <input type="hidden"  name="invoicedate" value="<?php echo $lists[0]->invoice_date ?>" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Tel / Mo No.</label>
                                    <div class="col-md-8">
                                        <input type="text" id="mobile"   value="<?php echo $lists[0]->mobile ?>" name="mobile" class="form-control" placeholder="Tel / Mobile No.">
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label class="col-md-3 control-label">GSTIN.</label>
                                    <div class="col-md-8">
                                        <input type="text" id="gstin"  name="gstin" value="<?php echo $lists[0]->gstin ?>"  class="form-control" placeholder="GSTIN">
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
                                <div class="form-group cash">
                                    <label class="col-md-3 control-label">Payment Rs</label>
                                    <div class="col-md-8">
                                        <input type="number"  name="amount" id="amount" onkeyup="calcul(this);"  class="form-control" placeholder="Payment Amount" value="<?php echo $lists[0]->total_amount+$lists[0]->taxamount ?>">
                                    </div>
                                </div> 
                            </div>
                        </div>
                        <div class="col-sm-6 col-xs-12">
                            <div class="form-horizontal">
                                <div class="form-group ">
                                    <label class="col-md-3 control-label">GST TYPE</label>
                                    <div class="col-md-8">
                                        <select  name="gsttype"  id="gsttype" class="form-control"><option value="CGSTSGST">CGST / SGST</option><option value="IGST">IGST</option></select>
                                    </div>
                                </div>
                              
                                 
                                <div class="form-group cash">
                                    <label class="col-md-3 control-label">Return</label>
                                    <div class="col-md-8">
                                        <input type="text"  name="ramount" id="ramount" tabindex="-1"  readonly="" class="form-control" placeholder="Rest Amount" value="0">
                                    </div>
                                </div>
                                 <div class="form-group ">
                                    <label class="col-md-3 control-label">Invoice Date</label>
                                    <div class="col-md-8">
                                        <input type="date" name="today" id="today"  value="<?php echo date('Y-m-d', strtotime($lists[0]->invoice_date))?>"  class="form-control" placeholder="YYYY-MM-DD">
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label class="col-md-3 control-label">E-way Bill</label>
									<div class="col-md-1">
                                        <input type="checkbox" id="eway" name="eway" tabindex="-1" class="form-control">
                                    </div>
                                    <div class="col-md-7">
                                        <input type="text"  name="ewaynum" id="ewaynum" class="form-control" value="<?php echo $lists[0]->ebill ?>" placeholder="E-Way Bill Nos." >
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label class="col-md-3 control-label">Payable</label>
                                    <div class="col-md-8">
                                        <input type="text"  name="tamount" id="tamount" readonly="" tabindex="-1" value="<?php echo $lists[0]->total_amount; ?>"  class="form-control" placeholder="Payable Amount" value="">
                                        <input type="hidden" id="tmt" value="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-right">
                        <div class="row col-md-12">
                            <input type="hidden" name="isCredit" id="isCredit" value="0">
                            <button type="button" id="udetails" class="btn btn-success waves-effect waves-light m-r-10">Update</button>                     
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
<link href="<?php echo base_url() ?>css/jquery.flexdatalist.min.css" rel="stylesheet" />
<link href="<?php echo base_url() ?>components/typeahead.js-master/dist/typehead-min.css" rel="stylesheet" />
<link href="<?php echo base_url() ?>css/jquery.flexdatalist.min.css" rel="stylesheet" />
<script src="<?php echo base_url() ?>js/jquery.flexdatalist.js"></script>
<script>
    $('#ptype').val('<?php echo $lists[0]->paytype ?>').change();
    <?php if($lists[0]->paytype!='Cash'){ ?>
        $(".cash").css("display", "none");
     <?php } ?>
         $('#gsttype').val('<?php echo $lists[0]->gst ?>');
         infun(<?php echo count($lists);?>);
</script>