<link href="<?php echo base_url() ?>components/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url() ?>css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
<div class="row"> 

    <div class="col-sm-12">
        <div class="white-box">
            <div class=" col-md-12">
                <div class="col-md-4"> <h3 class="box-title m-b-0">List Expense</h3> </div>
                <div class="col-md-4">

                    <select style="width:150px;display: inline;" name="month" id="month"  class="form-control">
                        <option value="">Select Month</option>
                        <option value="01">Jan</option>
                        <option value="02">Feb</option>
                        <option value="03">Mar</option>
                        <option value="04">Apr</option>
                        <option value="05">May</option>
                        <option value="06">Jun</option>
                        <option value="07">Jul</option>
                        <option value="08">Aug</option>
                        <option value="09">Sep</option>
                        <option value="10">Oct</option>
                        <option value="11">Nov</option>
                        <option value="12">Dec</option>
                    </select> 
                    <button type="submit" id="search" class="btn btn-success waves-effect waves-light m-r-10">Search</button>
                </div>

                <div class="col-md-4 text-right">                       
                </div>

            </div>

            <div class=" col-md-12">
                <div class="table-responsive">
                    <table id="calculates" class="display nowrap" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Date</th>

                                <th>Description</th>
                                <th>Amount</th>
                                <th class="text-nowrap noExport">Action</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr><th>&nbsp;</th><th>&nbsp;</th><th>Total</th><th id="stotal">0</th> <th>&nbsp;</th></tr>
                        </tfoot>
                        <tbody>
                            <?php
                            $i = 0;
                            foreach ($lists as $list) {
                                $i++;
                                ?>
                                <tr>
                                    <td><?php echo $i ?></td>
                                    <td><?php echo date("d-M-Y", strtotime($list->date)) ?></td>                            
                                    <td><?php echo $list->description ?></td>
                                    <td><?php echo $list->amount ?></td>
                                    <td class="text-nowrap">
                                        <a href="<?php echo site_url('update-expense/' . urlencode(base64_encode($list->id))) ?>" data-toggle="tooltip" data-original-title="Edit"> <i class="fa fa-pencil text-inverse m-r-10"></i> </a>
                                        <a href="<?php echo site_url('list-expense/' . urlencode(base64_encode($list->id))) ?>" onclick="if (confirm('Are you sure to delete')) {
                                                        return true;
                                                    } else {
                                                        return false;
                                                    }" data-toggle="tooltip" data-original-title="Delete"> <i class="fa fa-close text-danger m-r-10"></i> </a>
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
    <script>
                                            $(document).ready(function() {
                                                $("#month").val('<?php echo $this->uri->segment(2); ?>');
                                                var gurl = $("#siteurl").attr("content");

                                                $("#search").click(function() {
                                                    location.assign(gurl + "list-expense/" + $("#month").val());
                                                });
                                            });
    </script>
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