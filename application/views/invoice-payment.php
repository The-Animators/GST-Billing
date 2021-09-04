<link href="<?php echo base_url() ?>components/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url() ?>css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
<div class="row">  

    <?php echo form_open('invoicepayment/' . $this->uri->segment(2)); ?> 
    <div class="col-md-12">
        <div class="white-box">
            <div>
                <div class="control-group">
                    <div class="col-md-1">
                        <label class="control-label">Pay Type</label>

                        <div class="controls">

                            <select class="form-control" data-placeholder="" name="transtype" id="transtype">
                                <option value="Cash">Cash</option>
                                <option value="Bank Cash">Bank Cash</option>
                                <option value="Cheque">Cheque</option>
                                <option value="RTGS">RTGS</option>
                                <option value="NEFT">NEFT</option>
                                <option value="DD">DD</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-1">
                        <label class="control-label">List Type</label>

                        <div class="controls">

                            <select name="paytype" id="paytype" class="form-control" onchange="fatchdata()" id="paytype">
                                <option value=""> Select </option>
                                <option value="<?php echo urlencode(base64_encode('Unpaid')); ?>"> Unpaid </option>
                                <option value="<?php echo urlencode(base64_encode('Paid')); ?>"> Paid </option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-1">
                        <label class="control-label">Advance</label>

                        <div class="controls">
                            <input type="number"  name="apay" id="apay" readonly="" class="form-control" placeholder="Advance Payment" value="<?php echo $lists[0]->advance; ?>">
                        </div>
                    </div>

                    <div class="col-md-2">
                        <label class="control-label">Amount</label>

                        <div class="controls">
                            <input type="number"  name="cpay" id="cpay" onkeyup="limit(this, 7);
                                    calculates();" onmouseout="limit(this, 7);
                                    calculates();" class="form-control" placeholder="Cash Payment" value="0">
                        </div>
                    </div>

                    <div class="col-md-2">
                        <label class="control-label">Total Payment</label>

                        <div class="controls">
                            <input type="number"  name="tpay" id="tpay" class="form-control" readonly="" placeholder="Total Payment" value="<?php echo $lists[0]->advance; ?>">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <label class="control-label">Bill Payment</label>

                        <div class="controls">
                            <input type="number"  name="bpay" id="bpay" class="form-control" width="100" readonly="" placeholder="Bill Payment" value="0">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <label class="control-label">Date</label>

                        <div class="controls">
                            <input type="date" value="<?php echo date("Y-m-d") ?>"  name="pdate" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-1 text-right">
                        <label class="control-label">&nbsp;</label>
                        <div class="controls">
                            <button style="margin:0px 20px" onclick="return confDelete();" type="submit"  name="btn" value="paid" class="btn btn-info bbt"> Paid </button>
                        </div>
                    </div>
                </div>
            </div>
            <div id="ptp" class="hidden col-md-12 m-t-20">
                <div class="form-group">
                    <div class="col-md-4">
                        <label class="control-label">Bank Name</label>
                        <select class="form-control" data-placeholder="Choose a Bank" name="bankid" id="companyid">
                            <?php foreach ($slists as $list) { ?>
                                <option value="<?php echo $list->bankid ?>"> <?php echo $list->bankname . ' [ ' . $list->acno . ' ] ' ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <label class="control-label">Trns. Date</label>                    
                        <input type="date" name="trnsdate"  class="form-control">
                    </div>
                    <div class="col-md-3">
                        <label class="control-label">Trns. By</label>
                        <input type="text" name="byname"  class="form-control" placeholder="Transaction By">
                    </div>

                    <div class="col-md-3">
                        <label class="control-label">Transaction Details</label>                    
                        <input type="text" name="transdetails" placeholder="Transaction Details" class="form-control">
                    </div>

                    <div class="col-md-2 hidden">
                        <label class="control-label">Amount Type</label>
                        <select class="form-control" data-placeholder="" name="amtype" id="companyid">
                            <option value="Credit">Credit</option>
                            <option value="Debit">Debit</option>                                                
                        </select>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <div class="col-sm-12">
        <div class="white-box">
            <h3 class="box-title m-b-0">Invoice Payment List</h3>  

            <div class="table-responsive">
                <table id="example23" class="display nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <?php if (base64_decode(urldecode($this->uri->segment(3))) != 'Paid') { ?>
                                <th># </th>  
                            <?php } ?>
                            <th>Invoice Id</th>
                            <th>Date</th>
                            <th>Total Rs</th>
                        </tr>
                    </thead>                    
                    <tbody>
                        <?php foreach ($clists as $list) { ?>
                            <tr>
                                <?php if (base64_decode(urldecode($this->uri->segment(3))) != 'Paid') { ?>
                                    <td><input  type="checkbox" name="invoiceid[]"  value="<?= $list->invoiceid; ?>"/>
                                        <input  type="hidden" name="date[]"  value="<?= $list->date; ?>"/></td>
                                <?php } ?>
                                <td><?php echo $list->invoiceid ?></td>
                                <td><?php
                                    if ($this->uri->segment(3) == urlencode(base64_encode('Paid'))) {
                                        echo date("d-M-Y", strtotime($list->invoice_date));
                                    } else {
                                        echo date("d-M-Y", strtotime($list->date));
                                    }
                                    ?></td>
                                <td id="v<?= $list->invoiceid; ?>"><?php
                                    if ($this->uri->segment(3) == urlencode(base64_encode('Paid'))) {
                                        echo $list->total_amount + $list->taxamount;
                                    } else {
                                        echo $list->amount;
                                    }
                                    ?></td>


                            <?php } ?>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
    <?php echo form_close(); ?> 
</div>
<script>
                                $(".bbt").attr("disabled", "disabled");
                                document.getElementById('paytype').value = '<?php
    if (!$this->uri->segment(3)) {
        echo urlencode(base64_encode('Unpaid'));
    } else {
        echo $this->uri->segment(3);
    }
    ?>'
                                function calculates() {
                                    var total = parseFloat($("#apay").val()) + parseFloat($("#cpay").val());
                                    $("#tpay").val(total.toFixed(0));
                                    $("#bpay").val(0);
                                    $("input:checkbox").prop('checked', false).uniform;
                                }

                                $(document).ready(function(e) {
                                    $(".bbt").attr("disabled", "disabled")
                                    $("#allcheck").change(function(e) {
                                        $("input:checkbox").prop('checked', $(this).prop("checked")).uniform;
                                    });

                                    $("input:checkbox").change(function() {
                                        var val = $(this).val();
                                        if ($(this).is(":checked")) {
                                            var ttl = parseFloat($("#bpay").val()) + parseFloat($("#v" + val).text());
                                            if (parseFloat($("#tpay").val()) >= parseFloat(ttl)) {
                                                $("#bpay").val(ttl);
                                                $(".bbt").attr("disabled", false);
                                            } else {
                                                $(this).attr("checked", false);
                                                swal("Please Add Amount in Total Payment")
                                            }
                                        } else {
                                            $("#bpay").val(parseFloat($("#bpay").val()) - parseFloat($("#v" + val).text()));
                                            $(".bbt").attr("disabled", "disabled");
                                        }
                                    });
                                    $("#transtype").change(function() {
                                        var val = $(this).val();
                                        if (val == "Cash") {
                                            $("#ptp").addClass('hidden');
                                        } else {
                                            $("#ptp").removeClass('hidden');
                                        }
                                    });
                                });
                                function  fatchdata() {
                                    var url = '<?php echo site_url() ?>' + 'invoice-payment/<?php echo $this->uri->segment(2); ?>/' + $("#paytype").val();
                                    window.location.assign(url);
                                }
</script>
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