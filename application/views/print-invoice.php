<div class="row"  id="printview">
    <div class="col-md-12">
        <?php $lists = $ilists[0] ;
        
                            $encoded_invoice_id = urlencode(base64_encode($lists[0]->invoiceid));
                            $encoded_invoice_date = urlencode(base64_encode($lists[0]->invoice_date));
        ?>

        <div class="white-box printableArea" style="padding: 10px; margin-bottom:  0px;">
            <div class="row">               
    			<div class="col-md-12">
                    <div class="table-responsive" style="clear: both;">
                        <table class="table tables table-hover">
                            <thead>

                                <tr><th colspan="11"> <img width="100%" src="<?php echo base_url() ?>images/header_<?php echo $this->session->userdata('shopid'); ?>.jpg" /> </th></tr>
                                <?php $cunt = 15; ?>
                                    
                                    <tr>
                                        <th colspan="5">
                                            <address>
                                                <div><h4 class="font-bold text-capitalize" style="display: inline">M/S. <?php echo $lists[0]->name ?></h4></div> 
                                                <div><?php echo $lists[0]->address ?></div>
                                                <div>Mobile &nbsp;&nbsp;&nbsp;: <?php echo $lists[0]->mobile; ?></div> 
                                                <div>GSTIN &nbsp;&nbsp;&nbsp;: <?php echo $lists[0]->gstin; ?></div>
                                            </address>
                                        </th>
                                        <th colspan="4" style="vertical-align: top">
                                            <div style="font-size: 16px"><p><b>Invoice No &nbsp;&nbsp;: <?php echo $lists[0]->invoiceid ?></b> </p>
                                                <b>Invoice Date : <?php echo date('d-M-Y', strtotime($lists[0]->invoice_date)) ?></b></div> 
                                        </th>

                                        
                                    </tr>
                                <tr>
                                    <th class="text-center">Sr. No</th>
                                    <th style="width: 250px;" class="text-center">PRODUCT NAME</th>
                                    <th class="text-center">HSN</th>
                                    <th class="text-center">UNIT</th>
                                    <th class="text-center">QTY</th>
                                    <th class="text-center">RATE</th>
                                    <th  class="text-center">DIS %</th>
<!--                                    <th  class="text-center">TAXABLE TOTAL</th> -->
                                    <th  class="text-center">GST %</th>
<!--                                    <th  class="text-center">GST AMT</th>  -->
                                    <th  class="text-center">TOTAL </th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $total = 0;
                                $ttotal = 0;
                                $gst = 0;
								
                                $g0 = $gt0 = 0;
                                $g5 = $gt5 = 0;
                                $g12 = $gt12 = 0;
                                $g18 = $gt18 = 0;
                                $g28 = $gt28 = 0;
                                for ($i = 0; $i < count($lists); $i++) {
                                    ?>
                                    <tr>
                                        <td class="text-center"><?php echo $i + 1 ?></td>
                                        <td><b><?php echo $lists[$i]->prodname ?></b></td>
                                        <td><?php echo $lists[$i]->hsn ?></td>
                                        <td class="text-center"><?php echo $lists[$i]->unit ?></td>  
                                        <td class="text-center"><?php echo $lists[$i]->istock ?></td>                                      
                                        <td class="text-center"><?php echo $lists[$i]->salesrate ?></td>
                                        <?php
                                        $total+=$lists[$i]->prodtotal;
                                        ?>
                                        <td class="text-center"><?php echo $lists[$i]->discount ?></td>
<!--                                        <td class="text-center"><?php
                                            $ttotal+=$lists[$i]->prodttotal;
                                            echo round($lists[$i]->prodttotal, 2)
                                            ?></td>   -->

                                        <td class="text-center" ><?php echo $lists[$i]->bgstper; ?></td> <!--
                                        <td ><?php $gst+= $lists[$i]->gstamount;
                                            echo round($lists[$i]->gstamount,0); ?></td>     -->


                                        <td class="text-right"><?php echo round($lists[$i]->gstamount + $lists[$i]->prodttotal,0); ?></td>
										<?php
                                        switch ($lists[$i]->gstper) {
                                            case 0 : $g0 += ($lists[$i]->gstamount); $gt0 += ($lists[$i]->prodttotal);
                                                break;
                                            case 5 : $g5 += ($lists[$i]->gstamount); $gt5 += ($lists[$i]->prodttotal);
                                                break;
                                            case 12 : $g12 += ($lists[$i]->gstamount); $gt12 += ($lists[$i]->prodttotal);
                                                break;
                                            case 18 : $g18 += ($lists[$i]->gstamount); $gt18 += ($lists[$i]->prodttotal);
                                                break;
                                            case 28 : $g28 += ($lists[$i]->gstamount); $gt28 += ($lists[$i]->prodttotal);
                                                break;
                                            default : '';
                                        }
                                        ?>
									</tr>
									
<?php } for ($i = count($lists); $i < $cunt; $i++) { ?>
                                    <tr class="tdd">
                                        <td style="height: 30px !important">&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                                        <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>                                     
                                    </tr>

<?php } ?>
                            </tbody>
                            <tfoot style="border-bottom:#000 solid 2px!important">

                                <tr>
                                    <th colspan="5">
										<b><p>Bank Name&nbsp;:&nbsp;Dena Bank</p>
                                        <p>Branch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;Bhat Bazar, Mumbai - 400009</p>
                                        <p>A/c No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;014613001072</p>
                                        <p>IFSC No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;BKDN0450146</p></b>
                                    </th>
                                    <th colspan="3" rowspan="" style="vertical-align: top;font-size:18px;font-weight: 700" class="text-left">
									<b><p>Taxable Total</p><p>
									<?php if ($lists[0]->gst == 'CGSTSGST') {
                                            echo 'CGST / SGST';
                                        } 
										if ($lists[0]->gst == 'IGST') {
                                            echo 'IGST ';
                                        }?></p>
										<p>NET Amount</p></b> 
									</th>
									<th style="vertical-align: top;font-size:18px;font-weight: 700" class="text-right">
									    <p> <?php echo round($ttotal, 2); ?> </p><p>
									    <?php if ($lists[0]->gst == 'CGSTSGST') {
                                            echo  (($lists[0]->taxamount * $glists[0]->cgst) / 100 + ($lists[0]->taxamount * $glists[0]->sgst) / 100);
                                        } 
										if ($lists[0]->gst == 'IGST') {
                                            echo ($lists[0]->taxamount * $glists[0]->igst) / 100;
                                        }?>
										</p><p> <?php echo round($ttotal + $gst, 0); ?></p>
									</th>

                                </tr>
								<tr>
                                    <th colspan="4">
										<b>Terms & Condition</b><br></br>
                                    1) Goods once sold will not be taken back. </br></br>
                                    2) Cheque bounce charges <i class="fa fa-rupee"></i> 500/- </br></br>
                                    3) All disputes Subject to Mumbai Jurisdiction.</br>
                                        
                                    </th>
                                    <th colspan="5" >
										<table class="" style="padding: 0px;">
                                            <tbody>
                                            <tr><th class="tds3" >GST Rate</th><th class="tds4" colspan="2">0%</th><th class="tds4" colspan="2">5%</th><th class="tds4" colspan="2">12%</th><th class="tds4" colspan="2">18%</th></tr>
                                            <tr><th class="tds3">Taxable</th>
                                                <th class="tds4" style="width: 100px;" colspan="2"><?php echo round($gt0,2) ?></th>
                                                <th class="tds4" style="width: 100px;" colspan="2"><?php echo round($gt5,2) ?></th>
                                                <th class="tds4" style="width: 100px;" colspan="2"><?php echo round($gt12,2) ?></th>
                                                <th class="tds4" style="width: 100px;" colspan="2"><?php echo round($gt18,2) ?></th>
                                            </tr>
											<?php if ($lists[0]->gst == 'CGSTSGST') { ?>
                                            <tr>
                                                <th class="tds3">CGST</th>
												<th class="tds3"> </th></th><th class="tds4"><?php echo round($g0 / 2,2) ?></th>
												<th class="tds3"> 2.5% </th></th><th class="tds4"><?php echo round($g5 / 2,2) ?></th>
                                                <th class="tds3"> 6% </th></th><th class="tds4"><?php echo round($g12 / 2,2) ?></th>
                                                <th class="tds3"> 9% </th></th><th class="tds4"><?php echo round($g18 / 2,2) ?></th>
                                            </tr>
                                            <tr>
                                                <th class="tds3">SGST</th>
												<th class="tds3"> </th></th><th class="tds4"><?php echo round($g0 / 2,2) ?></th>
												<th class="tds3"> 2.5% </th><th class="tds4"><?php echo round($g5 / 2,2) ?></th>
                                                <th class="tds3"> 6% </th><th class="tds4"><?php echo round($g12 / 2,2) ?></th>
                                                <th class="tds3"> 9% </th><th class="tds4"><?php echo round($g18 / 2,2) ?></th>
                                            </tr>
											<?php } else { ?>
                                            <tr>
                                                <th class="tds3">IGST</th>
												<th class="tds3"> </th></th><th class="tds4"><?php echo round($g0 ,2) ?></th>
												<th class="tds3"> 5% </th><th class="tds4"><?php echo round($g5 ,2) ?></th>
                                                <th class="tds3"> 12% </th><th class="tds4"><?php echo round($g12 ,2) ?></th>
                                                <th class="tds3"> 18% </th><th class="tds4"><?php echo round($g18 ,2) ?></th>
                                            </tr>
											<?php } ?>
                                           </tbody>
                                        </table>
									</th>

                                </tr>
								<tr>
                                    <th colspan="5">
										<b>Declaration:</b><br>
										I/We hereby certify that food / foods mentioned in this invoice is/ are warrented to be of the nature and quality which it/these purports to be at the time of delivery.
                                    </th>
                                    <th colspan="4" style="vertical-align: top;font-size:18px;font-weight: 700" class="text-center"><h5><b>For <?php echo $lists[0]->shopname ?> </b></h5> </br> Authorised Signatory</th>

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
                        <a data-toggle="tooltip" data-original-title="Edit Details" href="<?php echo site_url('edit-invoice/'.$encoded_invoice_id.'/'. $encoded_invoice_date) ?>" >
                            <button class="btn btn-default btn-outline" type="button"> <span> <i class="fa fa-edit text-inverse m-r-10"></i> Edit </span> </button>
                        </a>
    <button id="print" class="btn btn-default btn-outline" type="button"> <span><i class="fa fa-print"></i> Print</span> </button>
    <button id="printpos" class="btn btn-default btn-outline" type="button"> <span><i class="fa fa-print"></i>POS Print</span> </button>
</div>

<div  id="posprint">
    <div>

        <!--<p style="text-align:center;"><u>BILL</u></p>-->
        <p class="text-center" style="font-size: 22px; font-weight: 900;font-family: arial;background: #999;color: #000"> <?php echo $lists[0]->shopname ?></p>
        <p class="text-center text-uppercase " style="font-size: 14px;font-family: arial; font-weight: 600;"> <?php echo $lists[0]->shopline1 ?>, <?php echo $lists[0]->shopline2 ?>,
            <?php echo $lists[0]->shopcity ?>- <?php echo $lists[0]->shoppin ?></p>
        
        <p class="text-center" style="font-size: 14px;font-family: arial">GSTIN: <?php echo $lists[0]->sgstin ?></p>

        <label class="labels">Ph: <?php
            $phone = explode('/', $lists[0]->phone);
            echo $phone[0]
            ?></label>
        <label class="labels text-uppercase text-right">Pay: <?php echo $lists[0]->paytype ?></label>
        
        <p><label class="labels">Bill No.: <?php echo $lists[0]->invoiceid ?></label>
            <label class="labels text-right">Date:  <?php echo date('d-m-y', strtotime($lists[0]->invoice_date)) ?></label></p>
        <p>_________________________________________</p>
        <div id="lft" class="col-md-8">
            <h6 class="font-bold text-capitalize" style="font-weight: 700; margin: 0px;">M/S : <?php echo $lists[0]->name ?></h6> 
            <p style="font-weight: 700;" class="text-muted">Mobile: <?php
            echo $lists[0]->mobile; ?></p>
                    <address>
                        <label style="font-weight: 700;">Address</label>
                        <p class="text-muted"><?php echo $lists[0]->address ?></p>

                    </address>
                </div>
    </div>
        <!--<p>*********************************************</p>-->

        <!--<p class="text-center text-uppercase"><b>DESCRIPTION</b></p>-->
        <table class="pstbl" width="100%">
            <thead>

                <tr style="">
                    <!--<th width="5%" class="text-center">S.N.</th>-->
                    <th width="180">ITEM NAME </th>
                    <!--<th width="12%">MRP </th>-->
                    <th width="">QTY </th>
                    <!--<th width="10%">GST %</th>-->
                    <!--<th width="10%">CGST <br> SGST<br> CESS </th>-->
                    <th width="">TOTAL</th>

                </tr>
                <!--<tr><td colspan="6"><p>*********************************************</p></td></tr>-->
            </thead>
            <tbody>
<?php
$tqty = 0;
for ($i = 0; $i < count($lists); $i++) {
    ?>
                    <tr>

                        <!--<td class="text-center">< ?php-->
                        <!--$cess = 0;-->
                        <!--if(isset($lists[$i]->cess) && $lists[$i]->cess > 0){-->
                        <!--    $cess = $lists[$i]->cess;-->
                        <!--}-->
                        <!--$ces= $lists[$i]->prodttotal*$cess/100; -->
                        <!--echo $i + 1 ?>.</td>-->
                        <td class="bdr" ><?php echo $lists[$i]->prodname_hindi ?></td>
                        <!--<td class="bdr" ><?php echo $lists[$i]->prodname . '<br>' . $lists[$i]->hsn ?></td>-->
                        <!--<td class="bdr" class="text-center"><?php echo $lists[$i]->salesrate ?></td>-->
                        <td class="bdr" class="text-center"><?php echo $lists[$i]->istock  ?></td>
                        <!--<td class="bdr" class="text-center">< ?php echo round($lists[$i]->gstper) ?>% + <?php echo round($cess) ?>%</td>-->
                        <!--<td class="bdr" class="text-center">< ?php-->
                        <!--    if ($lists[$i]->gst == 'CGSTSGST') {-->
                        <!--        $gsc = (($lists[$i]->gstamount-$ces) * $glists[0]->cgst) / 100;-->
                        <!--        $cgst += $gsc;-->
                        <!--        echo round($gsc, 2).'<br>';-->
                            
                        <!--    $gsc = (($lists[$i]->gstamount-$ces) * $glists[0]->sgst) / 100;-->
                        <!--    $sgst += $gsc;-->
                        <!--    echo round($gsc, 2).'<br>'.round($ces, 2);-->
                        <!--}-->
                        <!--?></td>-->
                        <td class="bdr"  width=""><?php echo round($lists[$i]->prodttotal) ?></td>

                    </tr>
<?php } ?>
                    <!--<tr><td colspan="3"><p>&nbsp;</p></td></tr>-->
                    <tr><td class="bdr" style="font-size: 14px;" colspan="2"><span >GRAND TOTAL</span></td><th class="bdr" style="font-weight:700;"><?php echo round($lists[0]->total_amount - $lists[0]->taxamount, 0); ?></th></tr>
                    <!--<tr><td colspan="2"><label class="labelss">E&OE</label></td><th colspan="3"><b>GRAND TOTAL</b></th><th class="bdr"><?php echo round($lists[0]->total_amount + $lists[0]->taxamount, 0); ?></th></tr>-->
            </tbody>
        </table>
<p>&nbsp;</p>
        <table class="table3" style="padding: 0px;">
            <tr><th class="tds3">GST Rate</th><th class="tds4" colspan="2">5%</th><th class="tds4" colspan="2">12%</th><th class="tds4" colspan="2">18%</th></tr>
            <tr><th class="tds3">Taxable</th>
                <th class="tds4" colspan="2"><?php echo round($gt5,2) ?></th>
                <th class="tds4" colspan="2"><?php echo round($gt12,2) ?></th>
                <th class="tds4" colspan="2"><?php echo round($gt18,2) ?></th>
            </tr>
            <tr>
                <th class="tds3">CGST</th><th class="tds3"> 2.5% </th></th><th class="tds4"><?php echo round($g5 / 2,2) ?></th>
                <th class="tds3"> 6% </th></th><th class="tds4"><?php echo round($g12 / 2,2) ?></th>
                <th class="tds3"> 9% </th></th><th class="tds4"><?php echo round($g18 / 2,2) ?></th>
            </tr>
            <tr>
                <th class="tds3">SGST</th><th class="tds3"> 2.5% </th><th class="tds4"><?php echo round($g5 / 2,2) ?></th>
                <th class="tds3"> 6% </th><th class="tds4"><?php echo round($g12 / 2,2) ?></th>
                <th class="tds3"> 9% </th><th class="tds4"><?php echo round($g18 / 2,2) ?></th>
            </tr>
           
        </table>
<!--<table class="table3" style="padding: 0px;">-->
<!--            <tr><th class="tds3">GST Rate</th><th class="tds4" colspan="2">5%</th></tr>-->
<!--            <tr><th class="tds3">Taxable</th><th class="tds4" colspan="2"><?php echo round($gt5,2) ?></th></tr>-->
<!--            <tr><th class="tds3">CGST</th><th class="tds3"> 2.5% </th></th><th class="tds4"><?php echo round($g5 / 2,2) ?></th></tr>-->
<!--            <tr><th class="tds3">SGST</th><th class="tds3"> 2.5% </th><th class="tds4"><?php echo round($g5 / 2,2) ?></th></tr>-->
            
<!--            <tr><th class="tds3"></th><th class="tds4" colspan="2">12%</th></tr>-->
<!--            <tr><th class="tds3"></th><th class="tds4" colspan="2"><?php echo round($gt12,2) ?></th></tr>-->
<!--            <tr><th class="tds3"></th><th class="tds3"> 6% </th></th><th class="tds4"><?php echo round($g12 / 2,2) ?></th></tr>-->
<!--            <tr><th class="tds3"></th><th class="tds3"> 6% </th><th class="tds4"><?php echo round($g12 / 2,2) ?></th></tr>-->
            
<!--            <tr><th class="tds3"></th><th class="tds3" colspan="2">18%</th></tr>-->
<!--            <tr><th class="tds3"></th><th class="tds3" colspan="2"><?php echo round($gt18,2) ?></th></tr>-->
<!--            <tr><th class="tds3"></th><th class="tds3"> 9% </th></th><th class="tds4"><?php echo round($g18 / 2,2) ?></th></tr>-->
<!--            <tr><th class="tds3"></th><th class="tds3"> 9% </th><th class="tds4"><?php echo round($g18 / 2,2) ?></th></tr>-->
            
<!--        </table>-->
        <!--<table class="table" style="padding: 0px;">-->
        <!--    <tr><th>GST</th><th>5%</th><th>12%</th><th>18%</th><th>28%</th><th>Total</th></tr>-->
        <!--    <tr><th>CGST</th><th><?php echo round($g5 / 2,2) ?></th><th><?php echo round($g12 / 2,2) ?></th><th><?php echo round($g18 / 2,2) ?></th><th><?php echo round($g28 / 2,2) ?></th><th><?php echo round(($g5+$g12+$g18+$g28)/2) ?></th></tr>-->
        <!--    <tr><th>SGST</th><th><?php echo round($g5 / 2,2) ?></th><th><?php echo round($g12 / 2,2) ?></th><th><?php echo round($g18 / 2,2) ?></th><th><?php echo round($g28 / 2,2) ?></th><th><?php echo round(($g5+$g12+$g18+$g28)/2) ?></th></tr>-->
            <!--<tr><th colspan="5">CESS</th><th><?php echo round($cess) ?></th></tr>-->

        <!--</table>-->
        <p>_________________________________________</p>
        
        <p class="text-left bold">Declaration:</p>
        <p class="text-uppercase" style="font-size: 14px; font-family: monospace">1)GOODS ONCE SOLD WILL NOT BE TAKEN BACK / EXCHANGED.</p>
        <p class="text-uppercase" style="font-size: 14px; font-family: monospace">2)Please check items & cash before leaving counter.</p>
        <p class="text-uppercase" style="font-size: 14px; font-family: monospace">3)All disputes, subject to mumbai jurisdiction.</p>
        <p class="text-uppercase text-center" style="font-size: 14px; font-weight: 700; font-family: monospace">Home Delivery Available & Sunday Closed</p>
    </div>
</div>

<style>.table > thead > tr > th,.table > tbody > tr > td,.table > tfoot > tr > th {
        border: 1px solid #000 !important;
    }
    .pstbl, .pstbl>tr>td{border:1px solid #000 !important;vertical-align: top; font-size: 24px; font-family: Arial, Helvetica, arial;}
    .bdr{border:1px solid #000 !important; padding: 8px !important; font-size: 21px; font-weight:600; font-family: Arial, Helvetica, courier;}
    #posprint{width:8cm;border: 0px solid #000;padding: 2px;margin-left: 4px;display: none;font-family: arial; vertical-align: top;}
    #posprint table th,#posprint table td{vertical-align: top !important }
    .labels{width: 48%;font-weight:600;font-size: 14px;}
    .labelss{width: 44%;font-weight:600;font-size: 14px;}
    .labelsss{width: 55%;font-weight:600;font-size: 14px;}
    #posprint,td,tr{font-weight:600;font-size: 14px;line-height: 22px;}
    #posprint label,#posprint p{margin: 0px;padding: 0px;}
    .hedborder{
        border: 1px solid !important;
    }
    .table3 {margin-left: 20px;padding: 0px;font-size: 10px;border: 1px solid #000 !important; }
    .tds3 {padding: 0px 4px !important ;font-size: 12px;font-weight:500;border: 1px solid #000 !important; text-align: center;}
    .tds4 {padding: 0px 4px !important ;font-size: 12px;font-weight:600;border: 1px solid #000 !important; text-align: center;}
    @page{
       margin: 4mm 4mm 4mm 4mm;
       font-size: 20px;
       font-weight:600;


    }
    @media print {
        #print-footer {
            position: absolute;
            page-break-before: always;
            page-break-after: always;
            bottom: 0;
            right: 0;
        }
        h4{
            font-size: 15px;
        }
        #print-footer::before {
            position: relative;
            bottom: -20px;
            counter-increment: section;
            content: counter(section);
        }

    }
</style>
<script>
    $(document).ready(function () {
        $(".tdd").css('display', 'none');
        $("#print").click(function () {
           
            $(".table > thead > tr > th,.table > tbody > tr > td,.table > tfoot > tr > th").css("line-height", "14px").css("font-size", "15px").css("padding", "5px 2px 5px 2px");
            $(".tdd").css('display', 'table-row');
            $(".font-last").css('font-size','8px !important');
            $("#printview").css("font-size", "18px");
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
            $("#printview").css("font-size", "18px");
            $(".table > thead > tr > th,.table > tbody > tr > td,.table > tfoot > tr > th").css("font-size", "15px").css("padding", "15px 8px");
            setTimeout(function () {
                //window.location.replace(document.referrer);
                //location.assign('<?php echo site_url('list-invoice') ?>');
            }, 500);
        });
        $("#printpos").click(function () {
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
                window.location.replace(document.referrer);
                //location.assign('<?php echo site_url('list-invoice') ?>');
            }, 500);
            $("#posprint").css("display", "none");
        });

    });

</script>