<div class="row">
    <div class="col-md-12">
        <div class="white-box printableArea" id="printview">
            <div class="row">
                <div class="col-md-12">
                     <div id="lft" class="pull-left col-md-6">                        
                            <p class="text-muted text-dark"><b>#<?php echo $lists[0]->receipt ?><br>
                                    <i class="fa fa-calendar"></i> <?php echo date('d-M-Y', strtotime($lists[0]->pdate)) ?></b></p>
                            <h5 class="font-bold text-capitalize"><?php echo $lists[0]->name ?></h5>
                            <p class="text-muted">Mobile : <?php echo $lists[0]->mobile; if($lists[0]->gstin!=""){ ?>
                                <br>GSTIN : <?php echo $lists[0]->gstin; } ?><br></p>
                    </div>
                    <div id="lf" class="pull-right text-right col-md-6">
                        <address>
                            <h3><b class="text-danger"><?php echo $lists[0]->shopname ?></b></h3>
                            #<?php echo $lists[0]->pinvoiceid ?>
                            <p class="text-muted m-l-5"><?php echo $lists[0]->shopline1 ?>,<?php echo $lists[0]->shopline2 ?>,
                                <br> <?php echo $lists[0]->shopcity ?>- <?php echo $lists[0]->shoppin ?> <br>GSTIN : <?php echo $lists[0]->gstin ?></p>
                        </address>
                       
                    </div>
                   
                    </div>
                   
                    <div id="lft" class="pull-right text-right col-md-6">
                        <address>
                            
                               
                        </address>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="table-responsive m-t-40" style="clear: both;">
                        <table class="table table-hover">
                            <thead>

                                <tr>
                                    <th class="text-center">#</th>
                                    <th class="text-center">ITEM NAME</th>
                                    <th class="text-center">STOCK</th>
                                    <th class="text-center">IN STOCK</th>
                                    <th  class="text-center">PRICE</th>
                                    <th  class="text-center">DIST %</th>
                                    <th  class="text-center">T-TOTAL</th>
                                    <th  class="text-center">GST %</th>
                                    <th class="text-right">GST-AMT</th>
                                    <th class="text-right">TOTAL-AMT</th>

                                </tr>
                            </thead>

                            <tbody>
                                <?php $i = 0;
                                foreach ($lists as $list) {
                                    $i++; ?>
                                    <tr>
                                        <td class="text-center"><?php echo $i  ?></td>
                                        <td class="text-center"><?php echo $list->prodname ?></td>
                                        <td class="text-center"><?php echo $list->stock ?></td>
                                        <td class="text-center"><?php echo $list->instock . '-' . $list->unit ?></td>
                                        <td class="text-center"><?php echo $list->price ?></td>
                                        <td class="text-center"><?php echo $list->discount ?></td>
                                        <td class="text-center"><?php echo $list->total ?></td>
                                        <td class="text-center"><?php echo $list->gstper ?></td>
                                        <td class="text-right"><?php echo $list->gstamount ?></td>
                                        <td class="text-right"><?php echo $list->total+$list->gstamount ?></td>
                                    </tr>
<?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="pull-right text-right"><hr>
                        <h4><b>Total Rs :</b> <?php echo $lists[0]->amttotal+$lists[0]->taxtotal  ?>&nbsp;&nbsp;&nbsp;</h4>
                    </div>
                    
                    <hr>

                </div>
            <div class="clearfix"></div>
            </div>
           <div class="text-right">
    <button id="print" class="btn btn-default btn-outline" type="button"> <span><i class="fa fa-print"></i> Print</span> </button>
</div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $("#print").click(function() {
            $(".table > thead > tr > th,.table > tbody > tr > td,.table > tfoot > tr > th").css("font-size", "9px").css("line-height", "14px").css("padding", "5px 2px 5px 2px"); 
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
              $("#printview").css("font-size", "14px");
            $(".table > thead > tr > th,.table > tbody > tr > td,.table > tfoot > tr > th").css("font-size", "14px").css("padding", "15px 8px");
            setTimeout(function() {
                location.assign('<?php echo site_url('purchase-report') ?>');
            }, 500);
        });
    });

</script>