<link href="<?php echo base_url() ?>components/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url() ?>css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
<div class="row">       
    <div class="col-sm-12">
        <div class="white-box">

            <h3 class="box-title m-b-0">Employee List</h3>            
            <div class="table-responsive">
                <table id="example23" class="display nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Mobile</th>
                            <th>Email</th>
                            <th>Branch</th>

                            <th class="text-nowrap noExport">Act</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $i = 0;
                        foreach ($lists as $list) {
                            $i++;
                            ?>
                            <tr>
                                <td><?php echo $i ?></td>
                                <td><?php echo $list->fname . " " . $list->lname ?></td>
                                <td><?php echo $list->mobile ?></td>
                                <td><?php echo $list->emails ?></td>
                                <td><?php echo $list->shopname ?></td>                            
                                <td class="text-nowrap"><a href="<?php echo site_url('update-employee/' . urlencode(base64_encode($list->userid))) ?>" data-toggle="tooltip" data-original-title="Edit"> <i class="fa fa-pencil text-inverse m-r-10"></i> </a>
                                    <a href="<?php echo site_url('view-employee/' . urlencode(base64_encode($list->userid))) ?>" data-toggle="tooltip" data-original-title="Profile"> <i class="fa icon-eye text-inverse m-r-10"></i> </a>
                                    <a href="<?php echo site_url('delete-employee/' . urlencode(base64_encode($list->userid))) ?>" onclick="if (confirm('Are you sure to delete')) {
                                                    return true;
                                                } else {
                                                    return false;
                                                }" data-toggle="tooltip" data-original-title="Delete"> <i class="fa fa-close text-danger"></i> </a></td>

                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div id="responsive-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">—</button>
                    <h4 class="modal-title" style="display: inline;"> Employee List </h4>

                </div>
                <div class="modal-body">
                    <form id="sall">
                        <div class="form-group ">
                            <label class="control-label col-md-6"></label>
                            <div class="col-md-6 m-b-10 text-right">
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
                            </div>
                        </div>
                            <?php foreach ($lists as $list) { ?>
                                <div class="form-group ">
                                    <label class="control-label col-md-6"><?php echo $list->fname . " " . $list->lname ?></label>
                                    <div class="col-md-6 m-b-10">
                                        <input type="number" name="salary[]"  value="0" class="form-control" placeholder="Salary">
                                    <input type="hidden" name="userid[]"  value="<?php echo $list->userid ?>" >
                                    <input type="hidden" name="esalary[]"  value="<?php echo $list->salary ?>" ></div>
                                </div>
                            <?php } ?>
                    </form>
                    <div class="clearfix"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                    <button type="button" id="adsalary" class="btn btn-danger waves-effect waves-light">Save Salary</button>
                </div>
            </div>
        </div>
    </div>    
    <div class="col-sm-12">
        <div class="white-box">
            <div class=" col-md-12">
                <div class="col-md-6"></div>
                <div class="col-md-4">
                    <input type="date" style="width:200px;display: inline;" id="fromdate" required="" value="<?php echo date('Y-m-d') ?>" name="fromdate"  class="form-control" placeholder="dd-mm-yyyy"> 
                    <button type="submit" id="search" class="btn btn-success waves-effect waves-light m-r-10">Search</button>
                </div>

                <div class="col-md-2 text-right">                       
                    <button data-toggle="modal" data-target="#responsive-modal" class="btn btn-info waves-effect waves-light">Add Salary</button>
                </div>

            </div>
            <div class=" col-md-12">
                <h3 class="box-title m-b-0">Salary List</h3>            
                <div class="table-responsive">
                    <table id="calculates" class="display nowrap" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Branch</th>
                                <th>Actual Salary</th>
                                <th>Month Salary</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tfoot><tr><th>&nbsp;</th><th>&nbsp;</th><th>Total</th><th id="stotal">&nbsp;</th><th id="scupon">&nbsp;</th><th>&nbsp;</th>
                            </tr>
                        </tfoot>
                        <tbody>
                            <?php
                            $i = 0;
                            foreach ($slists as $list) {
                                $i++;
                                ?>
                                <tr>
                                    <td><?php echo $i ?></td>
                                    <td><?php echo $list->fname . " " . $list->lname ?></td>
                                    <td><?php echo $list->shopname ?></td>
                                    <td><?php echo $list->salary ?></td>
                                    <td><?php
                                        if (isset($list->asalary)) {
                                            echo $list->asalary;
                                        } else {
                                            echo 0;
                                        }
                                        ?></td>                            
                                    <td><?php
                                        if (isset($list->date)) {
                                            echo date("d-m-Y", strtotime($list->date));
                                        } else {
                                            echo date("d-m-Y");
                                        }
                                        ?></td>                            
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
</div>
<script>
$(document).ready(function () {
var gurl = $("#siteurl").attr("content");
 $("#adsalary").click(function () {
        if ($("#month").val()=='') {
            swal('Please Select Month of Salary')
            return;
        }
        var url = gurl + 'add-salary';
            $.ajax({
                url: url,
                type: 'POST',
                ContentType: 'application/json',
                data: $("#sall").serialize(),
                success: function (result) {
                    setTimeout(function () {
                        location.reload();
                   }, 800);
                },
                fail: function (result) {
                    swal(result);
                }
            });
    });
    $("#fromdate").val('<?php if ($this->uri->segment(2)) {
            echo $this->uri->segment(2);
        }?>')
    $("#search").click(function () {        
        location.assign(gurl+"list-employee/"+$("#fromdate").val());
    });
});
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