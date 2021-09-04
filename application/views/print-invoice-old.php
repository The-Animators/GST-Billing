
<style>.table > thead > tr > th,.table > tfoot > tr > th,.table > tbody > tr > th  {
        border: 1px solid #000 !important;
    }
    .table > tbody > tr > td{
        border-left: 1px solid #000 !important;
        border-right: 1px solid #000 !important;
        border-top: 1px solid #fff !important;
        border-bottom: 1px solid #000 !important;
    }
    .tables { margin-bottom: -1px;}
    #posprint{width:100%;border: 0px solid #000;padding: 2px;margin-left: 4px;display: none;font-family: monospace,'Time new roman'}
    .labels{width: 48%;font-weight:300;font-size: 12px;}
    .labelss{width: 44%;font-weight:300;font-size: 12px;}
    .labelsss{width: 55%;font-weight:300;font-size: 12px;}
    address,h3,h5,.text-muted,p { margin: 0px !important; }
    @page{
        margin: 3mm;
        font-size: 14px;

    }

</style>

<script>
    $(document).ready(function () {
        $(".tdd").css('display', 'none');
        $("#print").click(function () {
            $(".table > thead > tr > th,.table > tbody > tr > td,.table > tfoot > tr > th").css("font-size", "11px").css("line-height", "15px").css("padding", "5px 2px 5px 2px");
            $(".tdd").css('display', 'table-row');
            $(".bigg").css('font-size', '20px');
            $(".bgg").css('font-size', '15px');
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
            $(".tdd").css('display', 'none');
            $("#printview").css("font-size", "14px");
            $(".table > thead > tr > th,.table > tbody > tr > td,.table > tfoot > tr > th").css("font-size", "14px").css("padding", "15px 8px");
            setTimeout(function () {
<?php if ($this->uri->segment(2) != 'list') { ?>
                   // window.location.assign(document.referrer);
<?php } else { ?>
                   // window.location.assign($("#siteurl").attr("content") + 'list-invoice');
<?php } ?>
            }, 500);
        });
        $("#printpos").click(function () {
            $(".table > thead > tr > th,.table > tbody > tr > td,.table > tfoot > tr > th").css("font-size", "11px").css("line-height", "15px").css("padding", "5px 2px 5px 2px");
            $("#posprint").css("display", "block");
            $("#posprint").print({
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
            setTimeout(function () {
<?php if ($this->uri->segment(2) != 'list') { ?>
                    window.location.assign(document.referrer);
<?php } else { ?>
                    window.location.assign($("#siteurl").attr("content") + 'list-invoice');
<?php } ?>
            }, 500);
            $("#posprint").css("display", "none");
        });

    });

</script>

<div class="row"  id="printview">
    <div class="col-md-12">
        <div class="white-box printableArea" style="padding:5px 20px 5px 20px;">
            <?php  $lists = $ilists[0]; ?>
            <div class="row">

                <div class="col-md-12">
                    <div class="table-responsive" style="clear: both;">
                        <table class="table tables table-hover">
                            <thead>

                                <tr><th colspan="11"> <img width="100%" src="<?php echo base_url() ?>images/header_<?php echo $this->session->userdata('shopid'); ?>.jpg" /> </th></tr>
                                <?php $cunt = 17;
                                if ( $lists[0]->gstin=='') {
                                    $cunt = 6; ?>
                                    <tr>
                                        <th colspan="11" style="vertical-align: top">
                                            <div>Invoice No : <?php echo $lists[0]->invoiceid ?><span style="float: right;width: 200px;text-align: left"><b>Invoice Date : <?php echo date('d-M-Y', strtotime($lists[0]->invoice_date)) ?></b></span></div> 
                                            <div><h5 class="font-bold text-capitalize" style="display: inline">M/S. <?php echo $lists[0]->name ?></h5><span style="float: right;width: 200px;text-align: left">GST No. Applicable Yes/No : ____________________</span></div> 
                                        </th>
                                    </tr>
                                        <?php } else { ?>
                                    <tr>
                                        <th colspan="5">
                                            <address>
                                                <div><h5 class="font-bold text-capitalize" style="display: inline">M/S. <?php echo $lists[0]->name ?></h5><span style="float: right;width: 250px;text-align: left">GSTIN : <?php echo $lists[0]->gstin; ?></span></div> 
                                                <div>Mobile : <?php echo $lists[0]->mobile; ?> <span style="float: right;width: 250px;text-align: left">State Tin : <?php echo $lists[0]->scode ?></span></div> 
                                                <p>Address : <?php echo $lists[0]->address ?></p>                                
                                            </address>
                                        </th>
                                        <th colspan="6" style="vertical-align: top">
                                            <div style="font-size: 20px"><b>Invoice No : <?php echo $lists[0]->invoiceid ?></b></div>
                                            <br><div style="font-size: 18px"><b>Date : <?php echo date('d-M-Y', strtotime($lists[0]->invoice_date)) ?></b></div> 
                                        </th>

                                        
                                    </tr>
                                <?php } ?>
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
                                        <td class="text-center"><?php echo $lists[$i]->istock ?></td>
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

                                        <td ><?php echo $lists[$i]->bgstper; ?></td>
                                        <td ><?php $gst+= $lists[$i]->gstamount;
                                            echo round($lists[$i]->gstamount,0); ?></td>


                                        <td><?php echo round($lists[$i]->gstamount + $lists[$i]->prodttotal,0); ?></td>
                                    </tr>
<?php } for ($i = count($lists); $i < $cunt; $i++) { ?>
                                    <tr class="tdd">
                                        <td style="height: 30px !important">&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                                        <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>  <td>&nbsp;</td>                                     
                                    </tr>

<?php } ?>
                            </tbody>
                            <tfoot style="border-bottom:#000 solid 2px!important">
                                <tr  style="border-top:#000 solid 2px!important">
                                    <th colspan="2">Invoice Total Value(in figure) </th>
                                    <th colspan="2" class="text-center"><b>Taxable</b> : <i class="fa fa-rupee"></i> <?php echo round($ttotal, 2); ?></th>
                                    <th colspan="2" class="text-center"><?php if ($lists[0]->gst == 'CGSTSGST') {
    echo '<b>CGST</b> : <i class="fa fa-rupee"></i> ' . ($lists[0]->taxamount * $glists[0]->cgst) / 100;
}
?></th>
                                    <th colspan="2" class="text-center"><?php if ($lists[0]->gst == 'CGSTSGST') {
                                            echo '<b>SGST</b> : <i class="fa fa-rupee"></i> ' . ($lists[0]->taxamount * $glists[0]->sgst) / 100;
                                        }
?><?php if ($lists[0]->gst == 'IGST') {
                                            echo '<b>IGST</b> :  <i class="fa fa-rupee"></i> ' . ($lists[0]->taxamount * $glists[0]->igst) / 100;
                                        }
?></th>
                                    <th colspan="3" class="text-right"><b><i class="fa fa-rupee"></i> <?php echo round($ttotal + $gst, 0); ?></b></th>
                                </tr>

                                <tr>
                                    <th colspan="2">Invoice Total Value(in Words) </th>
                                    <th colspan="9" class="text-right"><?php echo $ilists[1]; ?></th>
                                </tr>
                                <tr>
                                    <th colspan="5">
<?php if ( $lists[0]->gstin=='') { ?>
                                            GST IN 27AAAPV6972A1ZL V w.e.f 01-07-2017<br>All GST Rules Applicable as per Govt. Policeies
<?php } else { ?>
                                            <small> <b>BANK DETAILS</b>
                                                <br>Bank: GS Mahanagar Co-operative Bank Ltd, BRANCH - Lalbaug.   
                                                <br><b>Account number : 007011200004332, IFSC Code -MCBL0960007</b>
                                                <br>PAN No. AAAPV6972A</small>
											<b>GST IN 27AAAPV6972A1ZL</b>
                                            <br><b>E-Way Bill Nos. : <?php echo $lists[0]->ebill ?></b>
                                        <?php } ?>
                                    </th>
                                    <th colspan="6" rowspan="2" style="vertical-align: bottom;font-size:18px;font-weight: 700" class="text-center"><h5><b>For <?php echo $lists[0]->shopname ?><br> ( Signature )</b></h5></th>

                                </tr>
                                <tr>
                                    <th colspan="5"><?php if ( $lists[0]->gstin=='') { ?>
                                            <small>1. Goods Once Sold Will Not be Taken Back
                                                <br>2. <b>No Guarantee &nbsp;&nbsp;&nbsp; No Warranty</b> </small>
<?php } else { ?>
                                        <small>"We declare that this invoice shows the actual price of the goods desecribed and that all particulars are true and correct."</small>
                                              <br> <b>Terms & Condition</b>
                                                <small><br>1. If Payment are not made within credit period interest @ 18% p.a. will be charged % collected for the delayed period.
                                                <br>2. No complaint in respect of the material supplied with this invoice will be entitiled unless the same communicated via email within 15 days from the invoice date.</small>
<?php } ?></th>
                                </tr>
                            </tfoot>
                        </table>
                        <!--small><small>Powered By The Animator (www.theanimator.in) 022-24717186</small></small-->
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<div class="text-right">
    <?php if ($last == $lists[0]->invoiceid) { ?>
    <a onclick="if(!confirm('Are you sure to dalete')){return false;}" href="<?php echo site_url('delete-invoice/'. urlencode(base64_encode($lists[0]->invoiceid))) ?>" class="btn btn-danger">Delete Invoice</a>
<?php } if ($this->session->userdata('shopid') == 1) { ?>
        <button id="print" class="btn btn-success" type="button"> <span><i class="fa fa-print"></i> Print</span> </button>
<?php } else { ?>
        <button id="printpos" class="btn btn-success" type="button"> <span><i class="fa fa-print"></i>Print</span> </button>
<?php } ?>
</div>

<div  id="posprint">

    <table width="100%" class="table">
        <thead>
            <tr><th colspan="4"><img width="100%" src="<?php echo base_url() ?>images/header_<?php echo $this->session->userdata('shopid'); ?>.jpg" /></th>
                <th class="text-center text-uppercase"><b>Invoice No<br><?php echo $lists[0]->invoiceid ?></b></th></tr>
            <tr><th colspan="5"><p style="font-size: 18px"> <b>Name <?php echo $lists[0]->name ?><span style="float: right;width: 250px;text-align: left">Date :<?php echo date('d-M-Y', strtotime($lists[0]->invoice_date)) ?></span></b></p></th></tr>

            <tr>
                <th width="8%" class="text-center">S.N.</th>
                <th width="42%">ITEM NAME</th>
                <th width="12%" class="text-center">QTY</th>
                <th width="18%">Rate </th>
                <th width="18%" class="text-right">TOTAL</th>
            </tr>
        </thead>
        <tbody>
<?php
for ($i = 0; $i < count($lists); $i++) {
    ?>
                <tr>

                    <td width="8%" class="text-center"><?php echo $i + 1 ?></td>
                    <td width="42%"><?php echo $lists[$i]->bprodname ?></td>
                    <td width="12%" class="text-center"><?php echo $lists[$i]->istock ?></td>
                    <td  width="18%" ><?php echo $lists[$i]->salesrate ?></td>
                    <td class="text-right"  width="18%"><?php echo $lists[$i]->prodtotal ?></td>

                </tr>
<?php } ?>
        </tbody>
        <tfoot>

            <tr>
                <th colspan="4" class="text-right"><b>TOTAL </b></th>
                <th class="text-right"><b><i class="fa fa-rupee"></i> <?php echo round($lists[0]->total_amount, 0) ?></b></th>
            </tr>
            <tr>
                <th colspan="5"><small>1. Goods Once Sold Will Not be Taken Back
                                                <br>2. <b>No Guarantee &nbsp;&nbsp;&nbsp; No Warranty</b> </small></b></th>
            </tr>
        </tfoot>
    </table>

</div>
</div>