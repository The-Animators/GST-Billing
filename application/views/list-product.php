        <link href="<?php echo base_url() ?>components/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo base_url() ?>css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
        <div class="row">       
        <div class="col-sm-12">
          <div class="white-box">
 
            <h3 class="box-title m-b-0">Product List</h3>            
            <div class="table-responsive">
                <table id="example23" class="display nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                          <th>No</th>                               
                          <th>HSN</th>                               
                          <th>Name</th>                                                  
                          <th>Price</th>
                          <th>GST %</th>
                           <th>Stock</th>                                                  
                          <th>MRP</th>                                       
                          <th>Pur</th>
                          <th class="text-nowrap noExport">Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php $srn = 1; foreach ($lists as $list){ $encoded_id = urlencode(base64_encode($list->prodid_));  ?>
                        <tr>
                            <td><?php echo $srn?></td>
                            <td><?php echo $list->hsn?></td>  
                            <td><?php echo $list->prodname?></td>                                                   
                            <td><?php echo $list->uprice.' / '.$list->unit?></td>
                            <td><?php echo $list->gstper?></td>
                            <td><?php echo $list->lstock?></td>                                                   
                            <td><?php echo $list->wprice.' / '.$list->unit?></td>                                 
                            <td><?php echo $list->pprice.' / '.$list->unit?></td>
                            <td class="text-nowrap">
                                <a href="<?php echo site_url('update-product/'.$encoded_id) ?>" data-toggle="tooltip" data-original-title="Edit"> <i class="fa fa-pencil text-inverse m-r-10"></i> </a>
                                <a href="<?php echo site_url('delete-product/'.$encoded_id) ?>" onclick="if(confirm('Are you sure to delete')){return true;}else{return false;}" data-toggle="tooltip" data-original-title="Delete"> <i class="fa fa-close text-danger m-r-10"></i> </a>
                                <a href="javascript:void(0);" data-id="<?php echo $encoded_id; ?>" class="edit_stock"> <i class="fa fa-exchange text-inverse m-r-10"  data-toggle="tooltip" data-original-title="Transfer Stock"></i></a>
                                <!--a href="<?php echo site_url('barcode-details/'.$encoded_id) ?>" data-original-title="Print Barcode" data-toggle="tooltip"> <i class="fa fa-print text-inverse m-r-10"></i> </a>
                                <a href="<?php echo site_url('list-barcode/'.$encoded_id) ?>" data-original-title="List Barcode" data-toggle="tooltip"> <i class="fa fa-barcode text-inverse m-r-10"></i> </a--></td> 
                        </tr> 
                        <?php $srn++;} ?>
                    </tbody>
                </table>
            </div>
          </div>
          <!-- Modal -->
          <div class="modal fade" id="stockModal" role="dialog">
            <div class="modal-dialog">

              <!-- Modal content-->
              <div class="modal-content">
                <div class="modal-header">
                  <h4 class="modal-title">Transfer Stock <button type="button" class="close pull-right" data-dismiss="modal">&times;</button></h4>
                </div>
                <div class="modal-body">
                  <form id="stockForm" class="form-horizontal" method="post">
                    <div class="form-group">
                      <div class="col-md-6">
                        <label class="control-label">Product Name</label>
                        <input type="text" id="prodname" class="form-control" disabled="">
                      </div>
                      <div class="col-md-6">
                        <label class="control-label">Purchase Price</label>
                        <input type="text" id="pprice" class="form-control" disabled="">
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-md-6">
                        <label class="control-label">Unit Price</label>
                        <input type="text" id="uprice" class="form-control" disabled="">
                      </div>
                      <div class="col-md-6">
                        <label class="control-label">Wholesale Price</label>
                        <input type="text" id="bsprice" class="form-control" disabled="">
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-md-6">
                        <label class="control-label">Unit</label>
                        <input type="text" id="unit" class="form-control" disabled="">
                      </div>
                      <div class="col-md-6">
                        <label class="control-label">Live Stock</label>
                        <input type="text" id="lstock" class="form-control" disabled="">
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-md-6">
                        <label class="control-label">Ware House Stock</label>
                        <input type="text" id="wstock" class="form-control" value="0" readonly="">
                      </div>
                      <div class="col-md-6">
                          <label class="control-label">Dead Stock</label>
                          <input type="text" id="dstock" class="form-control" value="0" readonly="">
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-md-6">
                        <label class="control-label">Transfer From</label>
                        <div class="radio-group">
                          <input type="radio" name="add_from" value="wstock" id="add_from_wstock" checked> Ware House Stock
                          <br>
                          <input type="radio" name="add_from" value="dstock" id="add_from_dstock"> Dead Stock
                        </div>
                      </div>
                      <div class="col-md-6">
                        <label class="control-label">Transfer To</label>
                        <div class="radio-group">
                          <input type="radio" name="add_to" value="lstock" id="add_to_lstock" checked> Live Stock
                          <br>
                          <input type="radio" name="add_to" value="dstock" id="add_to_dstock"> Dead Stock
                        </div>
                      </div>
                      <div class="col-md-6">
                          <label class="control-label">Quantity</label>
                          <input type="number" id="qty" name="qty" class="form-control" value="" min="1" required="">
                      </div>
                    </div>
                    <input type="hidden" name="prodid_" id="prodid_">
                    <input type="hidden" name="action" value="update">
                    <input type="submit" id="submitStockForm" class="hide">
                  </form>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-success" onclick="$('#submitStockForm').click();">Proceed To Transfer</button>
                </div>
              </div>
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
<script type="text/javascript">
  var ajax_url = "<?php echo base_url() ?>";
  $(function(){
    $(document).on('click',"a.edit_stock",function(){
      $("#stockForm").trigger('reset');
      var data = {};
      data['id'] = $(this).data('id');
      data['action'] = "get";
      $.ajax({
        url: ajax_url+'edit-stock',
        type: 'post',
        data:data,
        dataType:'json',
        success: function(response){ 
          if(response.status)
          {
            var product = response.product;
            $('#stockModal #prodname').val(product.prodname);
            $('#stockModal #unit').val(product.unit);
            $('#stockModal #prodid_').val(product.prodid_);
            $('#stockModal #wstock').val(product.wstock);
            $('#stockModal #dstock').val(product.dstock);
            $('#stockModal #lstock').val(product.lstock);
            $('#stockModal #pprice').val(product.pprice);
            $('#stockModal #uprice').val(product.uprice);
            $('#stockModal #wprice').val(product.wprice);
            $('#stockModal').modal('show'); 
          }
          else
          {
            alert(response.msg);
          }
        }
      });
    });

    $("#stockForm").submit(function(e){
      e.preventDefault();
      var formData = $(this).serializeArray();
      $.ajax({
        url: ajax_url+'edit-stock',
        type: 'post',
        data:formData,
        dataType:'json',
        success: function(response){ 
          if(response.status)
          {
            $("#stockForm").trigger('reset');
            $('#stockModal').modal('hide'); 
          }
          else
          {
            alert(response.msg);
          }
        }
      });
      
    });
  });
</script>