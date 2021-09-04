<?php 

?> 
<link href="<?php echo base_url() ?>components/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url() ?>css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
<div class="row">       
    <div class="col-sm-12">
        <div class="white-box"> 
            <h3 class="box-title m-b-0 text-uppercase">
                <?php echo str_replace('-', ' ', $this->uri->segment(1)) ?> 
            </h3>  
            
            <div class="col-sm-12">
                <div class="table-responsive">
                    <table id="creditlist" class="display nowrap" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>Product Name</th>
                                <th>Today Opening</th>                       
                                <th>Live Stock</th>
                                <th>Dead Stock</th>
                                <th>Warehouse Stock</th>
                                <th>Total Purchase</th>
                                <th>Total Sell</th>
                            </tr>
                        </thead>
                        
                        <tbody>
                            <?php if(!empty($products)) { foreach ($products as $product) { 
                                $total_sell = $total_purchase = 0;
                                if(isset($product->total_sell))
                                {
                                    $total_sell = $product->total_sell;
                                }
                                if(isset($product->total_purchase))
                                {
                                    $total_purchase = $product->total_purchase;
                                }
                                ?>
                                <tr>
                                    <td><?php echo $product->prodname ?></td>
                                    <td><?php echo $product->today_opening ?></td>
                                    <td><?php echo $product->lstock ?></td>
                                    <td><?php echo $product->dstock ?></td>
                                    <td><?php echo $product->wstock ?></td>
                                    <td><?php echo $total_sell ?></td>
                                    <td><?php echo $total_purchase ?></td>
                                </tr>
                            <?php } } ?>
                        </tbody>
                    </table>
                </div>

            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--Style Switcher -->
<script src="<?php echo base_url() ?>components/styleswitcher/jQuery.style.switcher.js"></script>
<script src="<?php echo base_url() ?>components/datatables/jquery.dataTables.min.js"></script>
<!-- start - This is for export functionality only -->
<script src="<?php echo base_url() ?>js/dataTables.buttons.min.js"></script>
<script src="<?php echo base_url() ?>js/buttons.flash.min.js"></script>
<script src="<?php echo base_url() ?>js/jszip.min.js"></script>
<script src="<?php echo base_url() ?>js/pdfmake.min.js"></script>
<script src="<?php echo base_url() ?>js/vfs_fonts.js"></script>
<script src="<?php echo base_url() ?>js/buttons.html5.min.js"></script>
<script src="<?php echo base_url() ?>js/buttons.print.min.js"></script>
<script src="<?php echo base_url() ?>js/footer.min.js"></script>