<div class="row"  id="printview">
    <div class="col-md-12">
        <div class="white-box printableArea" style="padding-bottom: 0px;">
<?php $lists = $ilists[0]; ?>
            <div class="row">
               
                <div class="col-md-12">
                    <div class="table-responsive" style="clear: both;">
                        <table class="table table-hover">
                            <thead>
                                  
                                <tr><th colspan="11"> <img width="100%" src="<?php echo base_url() ?>images/headerc_<?php echo $this->session->userdata('shopid'); ?>.jpg" />  </th></tr>
                            <?php $cunt = 19;
                                if ( $lists[0]->gstin=='') {
                                    $cunt = 14; ?>
                                    <tr>
                                        <th colspan="11" style="vertical-align: top">
                                            <div><b>Invoice No : <?php echo $lists[0]->invoiceid ?></b><span style="float: right;width: 250px;text-align: left"><b>Invoice Date : <?php echo date('d-M-Y', strtotime($lists[0]->invoicedate)) ?></b></span></div> 
                                            <div><b>Credit No : <?php echo $lists[0]->creditid ?></b><span style="float: right;width: 250px;text-align: left"><b>Credit Date : <?php echo date('d-M-Y', strtotime($lists[0]->creditdate)) ?></b></span></div>
                                            <div><h5 class="font-bold text-capitalize" style="display: inline">M/S. <?php echo $lists[0]->name ?></h5><span style="float: right;width: 250px;text-align: left">GST No. Applicable Yes/No : ____________________</span></div> 
                                        </th>
                                    </tr>
                                        <?php } else { ?>
                                <tr>
                                <th colspan="5" style="vertical-align: top">
                                    <div><b>Credit No : <?php echo $lists[0]->creditid ?></b><span style="float: right;width: 250px;text-align: left"><b>Credit Date : <?php echo date('d-M-Y', strtotime($lists[0]->creditdate)) ?></b></span></div> 
                                    <div><b>Invoice No : <?php echo $lists[0]->invoiceid ?></b><span style="float: right;width: 250px;text-align: left"><b>Invoice Date : <?php echo date('d-M-Y', strtotime($lists[0]->invoicedate)) ?></b></span></div> 
                                    GSTIN : <?php echo $lists[0]->sgstin; ?>                                        
                                    <br>Tax is Payable on Reverse Charge : Yes / No
                                </th>
                                <th colspan="6">
                                <address>
                                <div><h5 class="font-bold text-capitalize" style="display: inline"><?php echo $lists[0]->name ?></h5><span style="float: right;width: 250px;text-align: left">GSTIN : <?php  echo $lists[0]->gstin;?></span></div> 
                                        <div>Mobile : <?php echo $lists[0]->mobile;?> <span style="float: right;width: 250px;text-align: left">State Tin : <?php echo $lists[0]->scode ?></span></div> 
                                        <p class="text-muted"><?php echo $lists[0]->address2 ?></p>                                
                            </address>Place Of Supply : <?php echo $lists[0]->scode ?>
                                </th></tr>
                                <?php }?>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th style="width: 250px;" class="text-center">PRODUCT NAME</th>
                                    <th class="text-center">HSN/SAC</th>
                                    <th class="text-center">QTY</th>
                                    <th class="text-center">UNIT</th>
                                    <th class="text-center">PRICE</th>
                                    <th  class="text-center">DIST %</th>
                                    <th  class="text-center">TAXABLE TOTAL</th>
                                    <th  class="text-center">GST %</th>
                                    <th  class="text-center">GST AMT</th>
                                    <th  class="text-center">TOTAL </th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $total = 0;
                                $ttotal = 0;
                                $gst = 0;
                                for ($i = 0; $i < count($lists); $i++) {
                                    ?>
                                    <tr>
                                        <td class="text-center"><?php echo $i + 1 ?></td>
                                        <td><b><?php echo $lists[$i]->prodname ?></b></td>
                                        <td><?php echo $lists[$i]->hsn ?></td>
                                        <td class="text-center"><?php echo $lists[$i]->cstock ?></td>
                                        <td class="text-center"><?php echo $lists[$i]->unit ?></td>                                        
                                        <td class="text-center"><?php echo $lists[$i]->salesrate ?></td>
                                        <?php
                                        $total+=$lists[$i]->prodtotal;
                                        ?>
                                        <td class="text-center"><?php echo $lists[$i]->discount ?></td>
                                        <td class="text-center"><?php
                                            $ttotal+=$lists[$i]->prodttotal;
                                            echo round($lists[$i]->prodttotal, 2)
                                            ?></td>

                                        <td ><?php echo $lists[$i]->cgstper; ?></td>
                                        <td ><?php $gst+= $lists[$i]->gstamount;
                                            echo $lists[$i]->gstamount; ?></td>


                                        <td><?php echo $lists[$i]->gstamount + $lists[$i]->prodttotal; ?></td>
                                    </tr>
<?php } for ($i = count($lists); $i < $cunt; $i++) { ?>
                                    <tr class="tdd">
                                        <td style="height: 30px !important">&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                                        <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>  <td>&nbsp;</td>                                     
                                    </tr>

<?php } ?>
                            </tbody>
                            <tfoot>
                                <tr  style="border-top:#000 solid 2px!important">
                                    <th colspan="2">Invoice Total Value(in figure) </th>
                                    <th colspan="3" class="text-center"><?php if ($lists[0]->gst == 'CGSTSGST') {
    echo '<b>CGST</b> : <i class="fa fa-rupee"></i> ' . ($lists[0]->taxamount * $glists[0]->cgst) / 100;
}
?></th>
                                    <th colspan="3" class="text-center"><?php if ($lists[0]->gst == 'CGSTSGST') {
                                            echo '<b>SGST</b> : <i class="fa fa-rupee"></i> ' . ($lists[0]->taxamount * $glists[0]->sgst) / 100;
                                        }
?></th>
                                    <th colspan="2" class="text-center"><?php if ($lists[0]->gst == 'IGST') {
                                            echo '<b>IGST</b> :  <i class="fa fa-rupee"></i> ' . ($lists[0]->taxamount * $glists[0]->igst) / 100;
                                        }
?></th>
                                    <th colspan="2" class="text-right"><b><i class="fa fa-rupee"></i> <?php echo round($ttotal + $gst, 2); ?></b></th>
                                </tr>

                                <tr>
                                    <th colspan="2">Invoice Total Value(in Words) </th>
                                    <th colspan="9" class="text-right"><?php echo $ilists[1]; ?></th>
                                </tr>
                                <tr>
                                <tr>
                                    <th colspan="5">
<?php if ( $lists[0]->gstin=='') { ?>
                                            GST IN 27AAAPV6972A1ZL V w.e.f 01-07-2017<br>All GST Rules Applicable as per Govt. Policeies
<?php } else { ?>
                                            <small> <b>BANK DETAILS</b>
                                                <br>Bank: The Mahanagar Co. Op. Bank Ltd, BRANCH - Lalbaug. 
                                                <br>Account number : 007011200004332, IFSC Code -MCBL0960007
                                                <br>PAN No. AAAPV6972A</small>
                                            <b>GST IN 27AAAPV6972A1ZL</b>
                                        <?php } ?>
                                    </th>
                                    <th colspan="6" rowspan="2" style="vertical-align: bottom;font-size:18px;font-weight: 700" class="text-center"><h5><b>For <?php echo $lists[0]->shopname ?><br> ( Signature )</b></h5></th>

                                </tr>
                                <tr>
                                    <th colspan="5"><?php if ( $lists[0]->gstin=='') { ?>
                                            <small>1. Goods Once Sold Will Not be Taken Back
                                                <br>2. <b>No Guarantee &nbsp;&nbsp;&nbsp; No Warranty</b> </small>
<?php } else { ?>
                                        <small>"We declare that this invoice shows the actule price of the goods desecribed and that all particulars are true and correct."</small>
                                              <br> <b>Terms & Condition</b>
                                                <small><br>1. If Payment are not Made withen credit period interest @ 18% p.a. will be charged % collected for the delayed period.
                                                <br>2. No complaint in respect of the material supplied with this invoice will be entitiled unless the same communicated via email within 15 days from the invoice date.</small>
<?php } ?></th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<div class="text-right">
    <button id="print" class="btn btn-default btn-outline" type="button"> <span><i class="fa fa-print"></i> Print</span> </button>
</div>
<style>.table > thead > tr > th,.table > tbody > tr > td,.table > tfoot > tr > th {
        border: 1px solid #000 !important;
    }
    .bdr{border-left:1px solid #999 !important;padding-left: 5px !important;vertical-align: top;}
    
    @page{
        margin: 2mm 0mm 2mm 0mm;
        font-size: 14px;
    }
</style>
<script>
    $(document).ready(function() {
$(".tdd").css('display','none');
        $("#print").click(function() {
            $(".table > thead > tr > th,.table > tbody > tr > td,.table > tfoot > tr > th").css("font-size", "9px").css("line-height", "14px").css("padding", "5px 2px 5px 2px"); 
            $(".tdd").css('display','table-row');
            $("#printview").css("font-size", "9px");
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
             $(".tdd").css('display','none');
              $("#printview").css("font-size", "14px");
            $(".table > thead > tr > th,.table > tbody > tr > td,.table > tfoot > tr > th").css("font-size", "14px").css("padding", "15px 8px");
            setTimeout(function() {
                location.assign('<?php echo site_url('credit-note-list') ?>');
            }, 500);
        });
       

    });

</script>