        <link href="<?php echo base_url() ?>components/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo base_url() ?>css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
        <div class="row">       
    <div class="col-sm-6 col-sm-offset-3">
        <div class="white-box">

            <h3 class="box-title m-b-0">Barcode List</h3>            
            <div class="table-responsive">
                <table id="example23" class="display nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th class="nosort">#</th>
                            <th>Barcode</th>
                            <th>Stock</th>
                            <th class="text-nowrap noExport">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $i = 0;
                        foreach ($lists as $list) {
                            $i++; ?>
                            <tr>
                                <td><?php echo $i ?></td>
                                <td><?php echo $list->id ?></td>
                                <td><?php echo $list->bstock ?></td>
                                <td class="text-nowrap">
                                    <a href="<?php echo site_url('barcode-update/'. urlencode(base64_encode($list->id))) ?>" data-toggle="tooltip" data-original-title="Edit"> <i class="fa fa-pencil text-inverse m-r-10"></i> </a>
                                    <a href="<?php echo site_url('barcode-product/' . urlencode(base64_encode($list->id))) ?>" data-toggle="tooltip" data-original-title="Print"> <i class="fa fa-print text-inverse"></i> </a></td>

                            </tr>
<?php } ?>

                    </tbody>
                </table>
            </div>
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