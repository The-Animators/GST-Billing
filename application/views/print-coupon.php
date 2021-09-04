<div class="row">
    <div class="col-md-12">
        <div class="white-box printableArea">
            <div class="row">
                <h3 class="text-center">&nbsp;&nbsp;<b>Super Shop</b></h3>
                <hr>
                <?php if ($lists == 0) { 
                    echo form_open('barcode-coupon');?>
                
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label">No. Coupon</label>
                                <input type="number" id="barcode" required=""  name="barcode" class="form-control" placeholder="No. Borcode"> 
                            </div>
                        </div>
                        <div class="col-md-6 text-right">
                            <div class="form-group">
                                <br><br>
                                <button type="reset" class="btn btn-inverse waves-effect waves-light cancel">Cancel</button>
                                <button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Print</button>                   
                            </div>
                        </div>
                        <hr> 
                    <?php echo form_close(); } else { ?>
                        <div class="col-md-12"id="printview">
                            <?php $code =$this->session->userdata("barcodesession"); for($i=0;$i<$lists;$i++){ ?>
                            <div class="cpn">
                                <img  style="display: inline;z-index: 111;margin-left: 85px;" src="<?php echo base_url().'images/coupon/'.$code.'.jpg';?>">
                                <img style="float: left;display: inline;margin-top: -55px;width: 100%" src="<?php echo base_url().'images/coupon/coupon.png';?>">
                                
                            </div>
                            <?php } ?>
                        </div>
                        <div class="text-right">
                            <button id="print" class="btn btn-default btn-outline" type="button"> <span><i class="fa fa-print"></i> Print</span> </button>
                        </div>
                    <?php } ?>

                </div>

            </div>
        </div>
    </div>
    <style>
        .cpn{
            background-size: cover;
            display: inline-block;
            width: 6.26cm;
            height: 3.5cm;
            margin: 10px;
        }
    @page{
        margin:5mm 4mm;
        size: A4;
    }
</style>
    <script>
        $(document).ready(function () {
            $("#print").click(function () {
                $("#printview").css("width", "21cm");
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
                $("#printview").css("width", "auto");
                setTimeout(function () {
                    location.assign('<?php echo site_url('new-coupon') ?>');
                }, 1000);
            });

        });

    </script>