<link href="<?php echo base_url() ?>components/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url() ?>css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
<div class="row">       
    <div class="col-sm-12">
        <div class="white-box">
            <div id="responsive-modal1" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">—</button>
                            <h4 class="modal-title" style="display: inline;"> Advance Payment </h4>

                        </div>
                        <div class="modal-body">
                            <form id="sall">
                                <div class="form-group ">
                                    <label class="control-label col-md-4">Add Advance</label>
                                    <div class="col-md-8 m-b-10">
                                        <input type="number" name="advance" id="advance"  class="form-control" placeholder="Add Advance"></div>
                                </div>


                            </form>
                            <div class="clearfix"></div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                            <button type="button" id="save"  class="btn btn-info waves-effect waves-light">Add Advance</button>
                        </div>
                    </div>
                </div>
            </div>  
            <h3 class="box-title m-b-0">Client List</h3>            
            <div class="table-responsive">
                <table id="calculates" class="display nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th class="nosort">#</th>                           
                            <th>Name</th>
                             <th>GSTIN</th> 
                            <th>Mobile</th>                                                                                
                            <th>Advance</th> 
                            <th>Type</th>   
                            <th class="text-nowrap noExport">Action</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>&nbsp;</th>
                            <th>&nbsp;</th> 
                            <th>&nbsp;</th>
                           
                            <th>Total</th>                            
                            <th id="scupon"></th>
                             <th>&nbsp;</th>
                            <th class="text-nowrap noExport"></th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <?php $i = 0;
                        foreach ($lists as $list) {
                            $i++; ?>
                            <tr>
                                <td><?php echo $i ?></td>                                
                                <td><?php echo $list->name ?></td>
                                <td><?php echo $list->gstin ?></td>
                                <td><?php echo $list->mobile ?></td>
                                <td><?php echo $list->advance ?></td>
                                <td><?php echo $list->ctype ?></td>
                                <td class="text-nowrap"><a href="<?php echo site_url('update-client/' . urlencode(base64_encode($list->customerid))) ?>" data-toggle="tooltip" data-original-title="Edit"> <i class="fa fa-pencil text-inverse m-r-10"></i> </a>
                                    <a href="" data="<?php echo $list->customerid ?>" class="adv"  data-toggle="modal" data-target="#responsive-modal1"> <i class="fa  fa-inr text-inverse m-r-10"></i> </a>
                                    <a href="<?php echo site_url('invoice-payment/' . urlencode(base64_encode($list->customerid))) ?>"  data-toggle="tooltip" data-original-title="Invoice Payment"> <i class="fa  fa-pied-piper text-inverse m-r-10"></i> </a></td>

                            </tr>
<?php } ?>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
$(document).ready(function() {
    var custid='';
        var gurl = $("#siteurl").attr("content");
        $(".adv").click(function() {
            custid= $(this).attr('data');
              });

         $("#save").click(function() {
            if ($("#advance").val() == '') {
                swal('Please Fill Advance')
                return;
            }           
            var url = gurl + 'advance-payment';
            $.ajax({
                url: url,
                type: 'POST',
                ContentType: 'application/json',
                data: {'custid': custid, 'advance': $("#advance").val()},
                success: function(result) {
                    setTimeout(function() {
                        location.reload();
                    }, 800);
                },
                fail: function(result) {
                    swal(result);
                }
            });
        });
    });</script>
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