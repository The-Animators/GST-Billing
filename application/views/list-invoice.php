
        <link href="<?php echo base_url() ?>components/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo base_url() ?>css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
        <div class="row">       
        <div class="col-sm-12">
          <div class="white-box">
            <h3 class="box-title m-b-0">Invoice List</h3>            
            <div class="table-responsive">
                <table id="calculatess" class="display nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Date</th>
                            <th>Pay</th> 
                            <th>Coupon</th>                                                       
                            <th>Paid</th>
                            <th>Total</th>
                            <th>GST AMT</th>                            
                            <th class="text-nowrap noExport nosort">Action</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <tr>
                            <th>&nbsp;</th>
                            <th>&nbsp;</th>                            
                            <th>&nbsp;</th>
                            <th>Total Rs</th>
                            <th id='scupon'>&nbsp;</th>
                            <th id='paid'>&nbsp;</th>
                            <th id='ttotal'>&nbsp;</th>
                            <th id="ctotal">&nbsp;</th>
                           
                           <th>&nbsp;</th>
                        </tr>
                        </tr>
                    </tfoot>
                    <tbody>
                       <?php  foreach ($lists as $list){
                            $encoded_invoice_id = urlencode(base64_encode($list->invoiceid));
                            $encoded_invoice_date = urlencode(base64_encode($list->invoice_date));
                            $total_paid_amount = $list->pamount;
                        ?>
                        <tr>
                            <td><?php echo $list->invoiceid ?></td>
								<?php if($list->deleted == 1){ ?>
								<td> -- BILL CANCELLED --</td>
                                <td><?php echo date("d-M-Y", strtotime($list->invoice_date)) ?></td>
								<td> </td>
								<td> </td>
								<td> </td>
								<td> </td>
								<td> </td>
								<td> </td>
								<?php } else{
								?>

                            <td><?php echo $list->name ?></td>
                            <td><?php echo date("d-M-Y",  strtotime($list->invoice_date)) ?></td>
                            <td><?php echo $list->paytype ?></td>
                            <td><?php echo $list->coupen_amount ?></td>
                            <td><?php if( $list->paytype!='Credit'){echo $total_paid_amount;}else {echo '0';} ?></td>
                            <td><?php echo $list->total_amount?></td>
                            <td><?php echo $list->taxamount ?></td>
                           <td class="text-nowrap">
                            <a data-toggle="tooltip" data-original-title="View Details" href="<?php echo site_url('views-invoice/'.$encoded_invoice_id.'/'.$encoded_invoice_date) ?>" > <i class="fa fa-eye text-inverse m-r-10"></i> </a>
                            <a data-toggle="tooltip" data-original-title="Edit Details" href="<?php echo site_url('edit-invoice/'.$encoded_invoice_id.'/'. $encoded_invoice_date) ?>" > <i class="fa fa-edit text-inverse m-r-10"></i> </a>
                            <a data-toggle="tooltip" data-original-title="Delete" href="<?php echo site_url('delete-invoice/'.$encoded_invoice_id) ?>" onclick="if(confirm('Are you sure to delete')){return true;}else{return false;}"> <i class="fa fa-close text-danger m-r-10"></i> </a>
                           <?php if ($this->session->userdata('shopid') == 1) { ?>
                            <a data-toggle="tooltip" data-original-title="Credit Note" href="<?php echo site_url('credit-note-invoice/'.$encoded_invoice_id.'/'. $encoded_invoice_date) ?>" > <i class="fa fa-file-o text-inverse m-r-10"></i> </a>
                            <!-- <a data-toggle="tooltip" data-original-title="Refund" href="<?php echo site_url('refund-invoice/'.$encoded_invoice_id.'/'. $encoded_invoice_date) ?>" > <i class="fa fa-undo text-inverse m-r-10"></i> </a> -->
                           <?php  } ?>
                           </td> 
                            <?php } ?>       
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
