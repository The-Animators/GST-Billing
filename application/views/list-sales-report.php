<link href="<?php echo base_url() ?>components/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url() ?>css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
<div class="row"> 
    <div class="col-sm-12">
        <div class="white-box">
            <h3 class="box-title m-b-20">
                Sales Report 
                <span class="pull-right label label-info total_label">Total Sales: <b><?php echo $total_sales_amount; ?></b></span></h3> 
            <div class="form-group">
                <?php echo form_open('sales-report'); ?> 
                <div class=" col-md-12">
                    <div class="col-md-2">
                        <select  id="ptype" name="ptype" class="form-control">
                            <option value="">Select</option>
                            <option value="Cash">Cash</option>
                            <option value="E-Cash">E-Cash</option>
                            <option value="Credit">Credit</option>
                            <option value="Credit Paid">Credit Paid</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <select  id="cname" name="cname" class="form-control">
                            <option value="">All Client</option>
                            <?php foreach ($clists as $list) { ?>
                                <option value="<?php echo $list->customerid ?>"><?php echo $list->name . " [ " . $list->mobile . " ] " ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <select  id="terminal_id" name="terminal_id" class="form-control">
                            <option value="">All Terminals</option>
                            <?php for($i=1;$i<=4;$i++) { ?>
                                <option value="<?php echo $i; ?>">Terminal <?php echo $i; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <input type="date" id="fromdate" value="<?php echo $this->input->post('fromdate'); ?>" name="fromdate"  class="form-control" placeholder="dd-mm-yyyy"> 
                        <input type="date" id="to" value="<?php echo $this->input->post('todate'); ?>" name="todate"  class="form-control" placeholder="dd-mm-yyyy"> 
                    </div>
                    
                    <div class="col-md-3 text-right">
                        <button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Search</button>  
                        <button type="reset" class="btn btn-inverse waves-effect waves-light cancel">Cancel</button>
                    </div>

                </div>
                <?php echo form_close(); ?> 
            </div>
            <h3 class="box-title m-b-0">&nbsp;</h3>            
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
                        <?php foreach ($lists as $list) { ?>
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
                                <td><?php echo date("d-M-Y", strtotime($list->invoice_date)) ?></td>
                                <td><?php echo $list->paytype ?></td>
                                <td><?php echo $list->coupen_amount ?></td>
                                <td><?php if ($list->paytype != 'Credit') {
                            echo $list->total_amount - $list->coupen_amount+$list->taxamount;
                        } else {
                            echo '0';
                        } ?></td>
                                <td><?php echo $list->total_amount ?></td>
                                <td><?php echo $list->taxamount ?></td>
                                <td class="text-nowrap">
                                    <a data-toggle="tooltip" data-original-title="View Details" href="<?php echo site_url('views-invoice/' . urlencode(base64_encode($list->invoiceid)) . '/' . urlencode(base64_encode($list->invoice_date))) ?>" > <i class="fa fa-eye text-inverse m-r-10"></i> </a>
                                <a data-toggle="tooltip" data-original-title="Edit Details" href="<?php echo site_url('edit-invoice/'. urlencode(base64_encode($list->invoiceid)).'/'. urlencode(base64_encode($list->invoice_date))) ?>" > <i class="fa fa-edit text-inverse m-r-10"></i> </a>
                                <a data-toggle="tooltip" data-original-title="Delete" href="<?php echo site_url('delete-invoice/'.urlencode(base64_encode($list->invoiceid))) ?>" onclick="if(confirm('Are you sure to delete')){return true;}else{return false;}"> <i class="fa fa-close text-danger m-r-10"></i> </a>
<?php if ($this->session->userdata('shopid') == 1) { ?>
                                    <a data-toggle="tooltip" data-original-title="Credit Note" href="<?php echo site_url('credit-note-invoice/'. urlencode(base64_encode($list->invoiceid)).'/'. urlencode(base64_encode($list->invoice_date))) ?>" > <i class="fa fa-file-o text-inverse m-r-10"></i> </a>
                                   <?php  } ?></td> 
                            <?php } ?>       
                            </tr>
<?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    $('#cname').val('<?php echo $this->input->post('cname') ?>');
    $('#ptype').val('<?php echo $this->input->post('ptype') ?>');
    $('#terminal_id').val('<?php echo $this->input->post('terminal_id') ?>');
</script>
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