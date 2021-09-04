<link href="<?php echo base_url() ?>components/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url() ?>css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
<div class="row">       
    <div class="col-sm-12">          
        <div class="white-box">
            <h3 class="box-title m-b-0">Bank List</h3>           
            <div class="col-sm-12">
                <div class=" col-md-12">
                    <?php echo form_open('transaction-report') ?>
                    <div class="col-md-4">
                        <select class="form-control" data-placeholder="Choose a Bank" name="bankid" id="companyid">
                            <option value=""> Select Bank</option>
                            <?php foreach ($blists as $list) { ?>
                                <option value="<?php echo $list->bankid ?>"> <?php echo $list->bankname . ' [ ' . $list->acno . ' ] ' ?></option>
                            <?php } ?>
                        </select>
                    </div>

                    <div class="col-md-2">
                        <input type="date" id="fromdate" required="" value="<?php echo $this->input->post('fromdate') ?>" name="fromdate"  class="form-control" placeholder="dd-mm-yyyy"> 
                    </div>
                    <div class="col-md-2">
                        <input type="date" id="todate" required="" value="<?php echo $this->input->post('todate') ?>" name="todate"  class="form-control" placeholder="dd-mm-yyyy"> 
                    </div>
                    <div class="col-md-4 text-right">
                        <button type="reset" class="btn btn-inverse waves-effect waves-light">Cancel</button>
                        <button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Search</button>  
                    </div>
                    <?php echo form_close() ?>
                </div>
                <?php if ($this->input->post()) { ?>
                    <div class=" col-md-12 m-t-20 ">
                        <div class="table-responsive">
                            <table  class="table table-bordered" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Bank Name</th>
                                        <th>Trns. Details</th>
                                        <th>Trns. Date</th>  
                                        <th>Credit</th>  
                                        <th>Debit</th>               
                                        <th>Balance</th>               
                                    </tr>
                                </thead>

                                <tbody>
                                    <?php
                                    $i = 0;
                                    $ball = 0;
                                    $crd = 0;
                                    $drd = 0;
                                    foreach ($lists as $list) {
                                        $i++;
                                        ?>
                                        <tr>
                                            <td><?php echo $i ?></td>
                                            <td><?php echo $list->bankname . '<br>' . $list->acno ?></td>
                                            <td><?php echo $list->transdetails ?></td>
                                            <td><?php echo $list->date ?></td>
                                            <td><?php
                                                if ($list->amtype == 'Credit') {
                                                    $crd+=$list->amount;
                                                    echo $list->amount;
                                                } else {
                                                    echo 0;
                                                }
                                                ?></td>
                                            <td><?php
                                                if ($list->amtype == 'Debit') {
                                                    $drd+=$list->amount;
                                                    echo $list->amount;
                                                } else {
                                                    echo 0;
                                                }
                                                ?></td>
                                            <td><?php $ball+=$list->balance;
                                                echo $list->balance ?></td>


                                        </tr>
    <?php } ?>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>&nbsp;</th>
                                        <th>&nbsp;</th>
                                        <th>&nbsp;</th>
                                        <th>Total</th>  
                                        <th><?php echo $crd ?></th>  
                                        <th><?php echo $drd ?></th>               
                                        <th></th>               
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
<?php } ?>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#companyid').val('<?php echo $this->input->post('bankid') ?>')
            $("#switch").click(function() {
                $.ajax({
                    url: url + 'switch-company',
                    type: 'POST',
                    ContentType: 'application/json',
                    data: {'compid': $("input[name=company]:checked").val()},
                    success: function(result) {
                        location.reload();
                    },
                    fail: function(result) {
                        swal(result);
                    }
                });
            });
        });</script>
</div>
<script src="<?php echo base_url() ?>js/bank.min.js"></script>
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