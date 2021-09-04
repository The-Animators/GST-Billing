<div class="row">
    <div class="col-md-12">
        <div class="white-box printableArea" id="printview">
            <div class="row">
                <div class="col-md-12">
                     <div id="lft" class="pull-left col-md-6">  
                          <h3><b class="text-danger"><?php echo $lists[0]->name ?></b></h3>
                            <p class="text-muted text-dark"><b>#<?php echo $lists[0]->receipt ?><br>
                                    <i class="fa fa-calendar"></i> <?php echo date('d-M-Y', strtotime($lists[0]->pdate)) ?></b></p>
                            <p class="text-muted">Mobile : <?php echo $lists[0]->mobile; if($lists[0]->gstin!=""){ ?>
                                <br>GSTIN : <?php echo $lists[0]->gstin; } ?><br></p>
                    </div>
                    <div id="lf" class="pull-right text-right col-md-6">
                        <address>
                            <h3><b class="text-danger"><?php echo $lists[0]->shopname ?></b></h3>
                            <b>#<?php echo $lists[0]->dinvoiceid ?><br>
                            <i class="fa fa-calendar"></i> <?php echo date('d-M-Y', strtotime($lists[0]->pdate)) ?></b>
                            <p class="text-muted m-l-5"><?php echo $lists[0]->shopline1 ?>,<?php echo $lists[0]->shopline2 ?>,
                                <br> <?php echo $lists[0]->shopcity ?>- <?php echo $lists[0]->shoppin ?> <br>GSTIN : <?php echo $lists[0]->sgstin ?></p>
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
                                    <th class="text-center">WareHouse STOCK</th>
                                    <th class="text-center">Dead STOCK</th>
                                    <th  class="text-center">PRICE</th>
                                    <th  class="text-center">DIST %</th>
                                    <th  class="text-center">T-TOTAL</th>
                                    <th  class="text-center">GST %</th>
                                    <th class="text-right">GST-AMT</th>

                                </tr>
                            </thead>

                            <tbody>
                                <?php $i = 0;
                                foreach ($lists as $list) {
                                    $i++; ?>
                                    <tr>
                                        <td class="text-center"><?php echo $i  ?></td>
                                        <td class="text-center"><?php echo $list->dprodname ?></td>
                                        <td class="text-center"><?php echo $list->wstock ?></td>
                                        <td class="text-center"><?php echo $list->dstock ?></td>
                                        <td class="text-center"><?php echo $list->price ?></td>
                                        <td class="text-center"><?php echo $list->discount ?></td>
                                        <td class="text-center"><?php echo $list->total -$list->gstamount?></td>
                                        <td class="text-center"><?php echo $list->dgstper ?></td>
                                        <td class="text-right"><?php echo $list->total ?></td>
                                    </tr>
<?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="pull-right text-right"><hr>
                        <h4><b>Total Rs :</b> <?php echo round($lists[0]->amttotal)  ?>&nbsp;&nbsp;&nbsp;</h4>
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
<style>
 @page{
        margin: 2mm 0mm 2mm 0mm;
        font-size: 14px;
    }
</style>
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
                location.assign('<?php echo site_url('list-purchase') ?>');
            }, 500);
        });
    });

</script>