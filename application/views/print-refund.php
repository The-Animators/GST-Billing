<div class="row"  id="printview">
    <div class="col-md-12">
        <div class="white-box printableArea" style="padding-bottom: 0px;">
            <?php $lists = $ilists[0]; 
            ?>
            <div class="row">

                <div class="col-md-12">
                    <div class="table-responsive" style="clear: both;">
                        <table class="table table-hover">
                            <thead>

                                <tr><th colspan="11"> <img width="100%" src="<?php echo base_url() ?>images/headerc_<?php echo $this->session->userdata('shopid'); ?>.jpg" />  </th></tr>
                                <?php $cunt = 19; ?>

                                <tr>
                                    <th colspan="7" style="vertical-align: top">
                                        <div><b>Refund No : <?php echo $lists[0]->refund_id ?></b><span style="float: right;width: 250px;text-align: left"><b>Refund Date : <?php echo date('d-M-Y', strtotime($lists[0]->refund_date)) ?></b></span></div> 
                                    </th>
                                </tr>

                                <tr>
                                    <th class="text-center">#</th>
                                    <th>ITEM</th>
                                    <th width="250">NAME</th>
                                    <th>QTY</th>
                                    <th>UNITS</th>                                               
                                    <th>PRICE</th>                                                
                                    <th>TOTAL</th>
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
                                        <td><?php echo $lists[$i]->prodid_ ?></td>
                                        <td><b><?php echo $lists[$i]->prodname ?></b></td>
                                        <td class="text-center"><?php echo $lists[$i]->qty ?></td>
                                        <td class="text-center"><?php echo $lists[$i]->unit ?></td>                                        
                                        <td class="text-center"><?php echo $lists[$i]->rate ?></td>
                                        <?php
                                        $total+=$lists[$i]->total;
                                        ?>
                                        <td class="text-center"><?php echo $lists[$i]->total ?></td>
                                    </tr>
                                <?php } for ($i = count($lists); $i < $cunt; $i++) { ?>
                                    <tr class="tdd">
                                        <td style="height: 30px !important">&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                <?php } ?>
                            </tbody>
                            <tfoot>

                                <tr>
                                    <th colspan="2">Refund Total Value(in Words) </th>
                                    <th colspan="9" class="text-right"><?php echo $ilists[1]; ?></th>
                                </tr>
                                <tr>
                                    <tr>
                                        <th colspan="5">
                                            <?php if (!isset($lists[0]->gstin)) { ?>
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
                                            <th colspan="5"><?php if (!isset($lists[0]->gstin)) { ?>
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
                                location.assign('<?php echo site_url('refund-list') ?>');
                            }, 500);
                        });


                    });

                </script>