<script src="<?php echo base_url() ?>components/jquery/dist/jquery.min.js"></script>
<div id="printview">
    <?php $code = $this->session->userdata("dataa");
    $cut= $this->session->userdata("userstock");
    for($i=1;$i<=$lists[1];$i++){
    ?>
        <div  style="margin-top:10px;display: inline-block;border: 0px solid #000;">
            <div class="text-center text-capitalize bold" style="font-size: 14px;text-transform: capitalize;"><?php echo $slists[0]->shopname?></div>
            <div class="text-center text-capitalize bold" style="font-size: 14px;text-transform: capitalize;"><?php echo $lists[0][0]->prodname ?></div>
            <div class="text-center min bold">Net : <?php echo $lists[0][0]->instock . ' ' . $lists[0][0]->unit ?></div>
            <div class="bold" style="text-align: center;">MRP Rs  : <?php echo $lists[0][0]->price ?></div>        
            <div class="text-center min" style="font-weight: bolder;font-size: 14px"><small>(Incl of All taxes)</small></div>
            <img class="img"   src="<?php echo base_url() . 'images/barcode/' . $lists[0][0]->id . '.jpg'; ?>">
            </div>
    <?php } ?>
</div>


<style>
    body {
    display: block;
    margin:0px 8px;
}
    .text-center{font-family: Tahoma, Verdana, Segoe, sans-serif;text-align: center;margin-left: 5px;}
    .bold{font-weight: bold;font-size: 14px;font-family: Tahoma, Verdana, Segoe, sans-serif;}   
    .min{font-size:12px;color: #000!important;line-height: 10px;font-family: Tahoma, Verdana, Segoe, sans-serif;}
    .img{margin-left: -05px;margin-top: 3px; width: 200px;height: 40px;}
    @page{
        margin:0mm 0mm 0mm 0mm;
    }
    @media print {
        .footer {page-break-after: always;}
    }
</style>  
<script>
    $(document).ready(function () {
        //$(window).click(function () {
            window.print();
            setTimeout(function () {
             location.assign('<?php echo site_url('list-product') ?>');
            }, 500);
        //});

    });

</script>