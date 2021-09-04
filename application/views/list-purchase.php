        <link href="<?php echo base_url() ?>components/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo base_url() ?>css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
        <div class="row">       
    <div class="col-sm-12">
        <div class="white-box"> 
            <h3 class="box-title m-b-0 text-uppercase"><?php echo str_replace('-', ' ',$this->uri->segment(1))?></h3>  
          
            <div class="col-sm-12">
            <div class="table-responsive">
               <table id="creditlist" class="display nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Receipt ID</th>
                            <th>Vendor Name</th>                       
                             <th>Date</th>
                              <th>Tax Total</th>
                              <th>GST</th>
                              <th>Inv. Total</th>
                             <th class="text-nowrap noExport">Action</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>&nbsp;</th>
                            <th>&nbsp;</th>                         
                            <th>&nbsp;</th>                         
                             <th>Total</th>
                             <th id='paid'></th>
                             <th id='ttotal'></th>
                             <th id='ctotal'></th>
                             <th class="text-nowrap noExport"></th>
                        </tr>
                    </tfoot>
                    <tbody>
                            <?php foreach ($lists as $list) { ?>
                            <tr>
                                <td><?php echo $list->pinvoiceid ?></td>
                                <td><?php echo $list->receipt ?></td>
                                <td><?php echo $list->name ?></td>                                
                                <td><?php echo date("d-M-Y", strtotime($list->pdate)) ?></td>
                                <td><?php echo $list->amttotal-$list->taxtotal ?></td>
                                <td><?php echo $list->taxtotal ?></td>
                                <td><?php echo $list->amttotal ?></td>
                                <td class="text-nowrap">
                                    <a data-toggle="tooltip" data-original-title="View" href="<?php echo site_url('purchase-invoice/'. urlencode(base64_encode($list->pinvoiceid)).'/'. urlencode(base64_encode($list->pdate))) ?>" > <i class="fa fa-eye text-inverse m-r-10"></i> </a>                            
                                    <a data-toggle="tooltip" data-original-title="Update" href="<?php echo site_url('edit-purchase/'. urlencode(base64_encode($list->pinvoiceid)).'/'. urlencode(base64_encode($list->pdate))) ?>" > <i class="fa fa-edit text-inverse m-r-10"></i> </a> 
                                    <?php if ($this->session->userdata('shopid') == 1) { ?>
                                    <a data-toggle="tooltip" data-original-title="Debit Note" href="<?php echo site_url('debit-note-invoice/'. urlencode(base64_encode($list->pinvoiceid)).'/'. urlencode(base64_encode($list->pdate))) ?>" > <i class="fa fa-file-o text-inverse m-r-10"></i> </a>
                                       <?php  } ?>
                                </td> 
                            </tr>
                        <?php } ?>
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