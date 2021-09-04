        <link href="<?php echo base_url() ?>components/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo base_url() ?>css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
<div class="row"> 
    <div class="col-sm-12">
        <div class="white-box">
            
            <div class="form-group">
                <?php echo form_open('list-sundry'); ?> 
                <div class="row">
                    
                    <div class="col-md-2">
                        <h3 class="box-title m-b-20">List Damage</h3>                         
                    </div>
                    <div class="col-md-3"></div>
                    <div class="col-md-2">
                        <input type="date" id="fromdate" required="" value="<?php echo $this->input->post('fromdate') ?>" name="fromdate"  class="form-control" placeholder="dd-mm-yyyy"> 
                    </div>
                    <div class="col-md-2">
                        <input type="date" id="to" required="" value="<?php echo $this->input->post('todate') ?>" name="todate"  class="form-control" placeholder="dd-mm-yyyy"> 
                    </div>
                    
                    <div class="col-md-3 text-right">
                        <button type="reset" class="btn btn-inverse waves-effect waves-light">Cancel</button>
                        <button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Search</button>  
                    </div>

                </div>
                <?php echo form_close(); ?> 
            </div>
            <h3 class="box-title m-b-0">&nbsp;</h3>            
            <div class="table-responsive">
                <table id="calculates" class="display nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>PRD ID</th>
                            <th>PRD NAME</th>
                            <th>QTY</th>
                            <th>UNIT</th>
                            <th>PRICE</th>
                            <th>TOTAL</th>
                            <th>DESCRIPTION</th>
                            <th>DATE</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>&nbsp;</th>
                            <th>&nbsp;</th>
                            <th>&nbsp;</th>
                            <th>&nbsp;</th>
                            <th>&nbsp;</th>
                            <th>Total</th>
                            <th id='ttotal'>&nbsp;</th>
                            <th>&nbsp;</th>
                            <th>&nbsp;</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <?php $i=0; foreach ($lists as $list) { $i++;?>
                            <tr>
                                <td><?php echo $i ?></td>
                                <td><?php echo $list->prodid_ ?></td>
                                <td><?php echo $list->prodname ?></td> 
                                <td><?php echo $list->stock ?></td>
                                 <td><?php echo $list->stocktype ?></td>
                                <td>Rs <?php echo $list->price ?></td>
                                <td>Rs <?php echo $list->total ?></td>
                                <td><?php echo $list->description ?></td>
                                <td><?php echo date("d-M-Y", strtotime($list->sdate)) ?></td>
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