<link href="<?php echo base_url() ?>components/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url() ?>css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
<div class="row">       
    <div class="col-sm-12">
        <div id="responsive-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">—</button>
                        <h4 class="modal-title" style="display: inline;"> New Bank Details </h4>

                    </div>
                    <div class="modal-body">
                        <form id="sall">
                            <div class="form-group ">
                                <label class="control-label col-md-4">Opening Date</label>
                                <div class="col-md-8 m-b-10">
                                    <input type="date" name="date" id="date"  class="form-control" placeholder="yyyy-mm-dd"></div>
                            </div>
                            <div class="form-group ">
                                <label class="control-label col-md-4">Bank Name</label>
                                <div class="col-md-8 m-b-10">
                                    <input type="text" name="bankname" id="bankname"   class="form-control" placeholder="Bank Name"></div>
                            </div>
                            <div class="form-group ">
                                <label class="control-label col-md-4">Branch</label>
                                <div class="col-md-8 m-b-10">
                                    <input type="text" name="branch" id="branch"  class="form-control" placeholder="Branch"></div>
                            </div>
                            <div class="form-group ">
                                <label class="control-label col-md-4">A/C No.</label>
                                <div class="col-md-8 m-b-10">
                                    <input type="number" name="acno" id="acno"  class="form-control" placeholder="A/C No."></div>
                            </div>
                            <div class="form-group ">
                                <label class="control-label col-md-4">A/C Name</label>
                                <div class="col-md-8 m-b-10">
                                    <input type="text" name="acname"  id="acname" class="form-control" placeholder="A/C Name"></div>
                            </div>
                            <div class="form-group ">
                                <label class="control-label col-md-4">IFSC code	</label>
                                <div class="col-md-8 m-b-10">
                                    <input type="text" name="ifsccode" id="ifsccode"  class="form-control" placeholder="IFSC code"></div>
                            </div>
                            <div class="form-group ">
                                <label class="control-label col-md-4">Company Name</label>
                                <div class="col-md-8 m-b-10">
                                    <select class="form-control" data-placeholder="Choose a Company" name="companyid" id="companyid">

                                        <option value="">Select Company</option>
                                        <?php foreach ($slists as $list) { ?>
                                            <option value="<?php echo $list->shopid ?>"> <?php echo $list->shopname ?></option>
                                        <?php } ?>
                                    </select></div>
                            </div>
                            <div class="form-group"id="balop">
                                 <div class="col-md-12">
                                            <div class="col-md-8">
                                        <label class="control-label col-md-6">Op. Balacne</label>
                                        <div class="col-md-6">
                                            <input type="number" step=0.01 name="balacne"  id="balacne" class="form-control" placeholder="Amount"></div>
                                    </div>
                                             <div class="col-md-4">
                                        <label class="control-label col-md-6">Bal Type</label>
                                        <div class="col-md-6">
                                             <select class="form-control" data-placeholder="" name="baltype" id="companyid">
                                                <option value="Credit">Credit</option>
                                                <option value="Debit">Debit</option>                                                
                                            </select>
                                        </div>
                                    </div>
                                        </div> </div>

                        </form>
                        <div class="clearfix"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                        <button type="button" id="saves" class="btn btn-danger waves-effect waves-light">Save</button>
                        <button type="button" id="update" class="btn btn-danger waves-effect waves-light">Update</button>
                    </div>
                </div>
            </div>
        </div>    
        <div class="white-box">
            <div class="col-sm-4">
                <h3 class="box-title m-b-0">Bank List</h3> </div>
            <div class="col-md-4 text-center">                       
                <button data-toggle="modal" data-target="#responsive-modal" class="btn btn-info waves-effect waves-light addb">Add Bank</button>
            </div>
            <div class="col-sm-4"></div>
            <div class="col-sm-12">
                <div class="table-responsive">
                    <table id="example23" class="display nowrap" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>A/C Name</th>
                                <th>Name</th>
                                <th>A/C NO</th>
                                <th>Balance</th>  
                                <th>Bal Type</th>               
                                <th class="text-nowrap noExport">Action</th>
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
                                    <td><?php echo $list->acname ?></td>
                                    <td><?php echo $list->bankname ?></td>
                                    <td><?php echo $list->acno ?></td>
                                    <td><?php echo $list->balacne ?></td>
                                    <td><?php echo $list->baltype ?></td>
                                    <td class="text-nowrap"><a data-toggle="modal"  class="edit" data-target="#responsive-modal" data="<?php echo $list->bankid ?>" data-toggle="tooltip" data-original-title="Edit"> <i class="fa fa-pencil text-inverse m-r-10"></i> </a>
                                        <a class="view" data-toggle="modal"  data-target="#responsive-modal" data="<?php echo $list->bankid ?>" data-toggle="tooltip" data-original-title="View"> <i class="fa fa-eye text-inverse m-r-10"></i> </a>
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
<script src="<?php echo base_url() ?>js/bank.min.js"></script>
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