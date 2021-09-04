        <link href="<?php echo base_url() ?>components/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo base_url() ?>css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
        <div class="row">       
        <div class="col-sm-12">
          <div class="white-box">
 
            <h3 class="box-title m-b-0">Shop List</h3>            
            <div class="table-responsive">
                <table id="example23" class="display nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Contact</th>
                            <th>Address 1</th>
                            <th>Address 2</th>
                            <th>City</th>
                            <th>State</th>
                            <th>Country</th>
                            <th class="text-nowrap noExport">Action</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                         <?php $i=0; foreach ($lists as $list){$i++;?>
                        <tr>
                             <td><?php echo $i?></td>
                            <td><?php echo $list->shopname?></td>
                            <td><?php echo $list->phone?></td>
                            <td><?php echo $list->shopline1?></td>
                            <td><?php echo $list->shopline2?></td>
                            <td><?php echo $list->shopcity?></td>
                            <td><?php echo $list->shopstate?></td>
                            <td><?php echo $list->shopcountry?></td>
                            <td class="text-nowrap"><a href="<?php echo site_url('update-shop/'. urlencode(base64_encode($list->shopid))) ?>" data-toggle="tooltip" data-original-title="Edit"> <i class="fa fa-pencil text-inverse m-r-10"></i> </a>
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
<!-- start - This is for export functionality only -->
<script src="<?php echo base_url() ?>js/dataTables.buttons.min.js"></script>
<script src="<?php echo base_url() ?>js/buttons.flash.min.js"></script>
<script src="<?php echo base_url() ?>js/jszip.min.js"></script>
<script src="<?php echo base_url() ?>js/pdfmake.min.js"></script>
<script src="<?php echo base_url() ?>js/vfs_fonts.js"></script>
<script src="<?php echo base_url() ?>js/buttons.html5.min.js"></script>
<script src="<?php echo base_url() ?>js/buttons.print.min.js"></script>
<script src="<?php echo base_url() ?>js/footer.min.js"></script>