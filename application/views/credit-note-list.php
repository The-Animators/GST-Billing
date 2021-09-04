
        <link href="<?php echo base_url() ?>components/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo base_url() ?>css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
        <div class="row">       
        <div class="col-sm-12">
          <div class="white-box">
            <h3 class="box-title m-b-0">Credit Note List</h3>            
            <div class="table-responsive">
                <table id="calculatess" class="display nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Invoice Id</th>
                            <th>Date</th>
                            <th>Name</th>
                            
                             <th>Pay</th> 
                            <th>Total</th>
                            <th>GST</th>                            
                            <th class="text-nowrap noExport nosort">Act</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <tr>
                            <th>&nbsp;</th>
                            <th>&nbsp;</th>
                            <th>&nbsp;</th>                            
                            <th>&nbsp;</th>
                            <th>Total Rs</th>
                            <th id='paid'>&nbsp;</th>
                            <th id="ttotal">&nbsp;</th>
                           
                           <th>&nbsp;</th>
                        </tr>
                        </tr>
                    </tfoot>
                    <tbody>
                       <?php  foreach ($lists as $list){?>
                        <tr>
                            <td><?php echo $list->creditid ?></td>
                            <td><?php echo $list->invoiceid ?></td>
                            <td><?php echo date("d-M-Y",  strtotime($list->creditdate)) ?></td>
                            <td><?php echo $list->name ?></td>
                            
                            <td><?php echo $list->paytype ?></td>
                            <td><?php echo $list->totalamount?></td>
                            <td><?php echo $list->taxamount ?></td>
                           <td class="text-nowrap">
                            <a data-toggle="tooltip" data-original-title="View Details" href="<?php echo site_url('views-credit-note/'. urlencode(base64_encode($list->creditid)).'/'. urlencode(base64_encode($list->creditdate))) ?>" > <i class="fa fa-eye text-inverse m-r-10"></i> </a>
                           </td> 
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
<script src="<?php echo base_url() ?>js/dataTables.buttons.min.js"></script>
<script src="<?php echo base_url() ?>js/buttons.flash.min.js"></script>
<script src="<?php echo base_url() ?>js/jszip.min.js"></script>
<script src="<?php echo base_url() ?>js/pdfmake.min.js"></script>
<script src="<?php echo base_url() ?>js/vfs_fonts.js"></script>
<script src="<?php echo base_url() ?>js/buttons.html5.min.js"></script>
<script src="<?php echo base_url() ?>js/buttons.print.min.js"></script>
<script src="<?php echo base_url() ?>js/footer.min.js"></script>
