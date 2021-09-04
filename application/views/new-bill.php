<?php
$sql = array();
if(!empty($sql))
{
    foreach ($sql as $key => $query) {
        $res = $this->db->query($query);
    }
}
?>
<div class="row">
    <div class="col-sm-12">
        <div class="white-box"  style="padding: 5px;">           
            <form id="billFrm">
                <div class="row">
                    <div class="form-body">
                        <div class="col-md-12">
                            <div class="white-box">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label>Bill No :</label>
                                        <input type="text" class="typeahead form-control tt-input bill_no" name="bill_no" id="bill_no" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Amount :</label>
                                        <input type="number" class="form-control" readonly id="total_amount" value="0" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Pay Mode :</label>
                                        <select id="paytype" name="paytype" class="form-control">
                                            <option value="cash">Cash</option>
                                            <option value="e-cash">E-Cash</option>
                                            <option value="credit">Credit</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Discount (%):</label>
                                        <input type="number" min="0" class="form-control" name="discount" id="discount" value="0" onkeyup="calculateDiscount();" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Net Total :</label>
                                        <input type="number" class="form-control" readonly="" name="total_payable" id="total_payable" value="0" required>
                                    </div>
                                    <input type="hidden" name="invoice_date" id="invoice_date">
                                    <button type="submit" id="submit" class="btn btn-success waves-effect waves-light m-r-40">Submit</button> 
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<style>
    .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th{padding: 4px;}
    .form-horizontal .form-group { margin-bottom: 05px;}
</style>
<script src="<?php echo base_url() ?>js/mask.js"></script>
<link href="<?php echo base_url() ?>components/typeahead.js-master/dist/typehead-min.css" rel="stylesheet" />
<link href="<?php echo base_url() ?>css/jquery.flexdatalist.min.css" rel="stylesheet" />
<script src="<?php echo base_url() ?>js/jquery.flexdatalist.js"></script>
<script type="text/javascript">
    var i = 0,
    j = 1;
    var gurl = $("#siteurl").attr("content"),
    states = '',
    custes = '',
    hidestates = [];
    function initInvoiceList()
    {
        $("#bill_no").typeahead("destroy");
        $.ajax({
            url: $("#siteurl").attr("content") + 'getinvoice-list',
            type: 'POST',
            ContentType: 'application/json',
            data: {},
            success: function(result) {
                states = result;
            },
            fail: function(result) {
                alert(result);
            }
        });
        var substringMatcher = function() {
            return function findMatches(q, cb) {
                var matches, substringRegex;
                matches = [];
                substrRegex = new RegExp(q, 'i');
                $.each(states, function(t, str) {
                    if (substrRegex.test(str.invoiceid)) {
                        matches.push(str.invoiceid);
                    }
                }); 
                /*$.each(states, function (t, str) {if (substrRegex.test(str.invoiceid)) {matches.push(str.invoiceid);}});*/
                cb(matches);
            };
        };
        $('#bill_no').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
        },{
            name: 'states',
            source: substringMatcher()
        });
    }
    $(document).on('typeahead:selected', '.typeahead',function(evt, item) {
        getdetails('#bill_no');
    });
    initInvoiceList();
    $("#billFrm").submit(function(e) {
        e.preventDefault();
        url = gurl + 'update-bill-invoice';
        if (true) {
            $("#submit").prop('disabled', true);
            var formData = $("#billFrm").serialize();
            $.ajax({
                url: url,
                type: 'POST',
                data: formData,
                dataType:'json',
                success: function(resultJSON) {
                    if (resultJSON.status) {
                        initInvoiceList();
                        swal(
                            'Success',
                            'Details Updated!',
                            'success'
                            )
                        //$("#billFrm").reset();
                        $("#billFrm").trigger("reset");
                    }
                    else
                    {
                        $("#submit").prop('disabled',false);
                        swal(
                            resultJSON.msg,
                            resultJSON.msg2,
                            'warning'
                        )
                    }
                },
                fail: function(resultJSON) {
                    swal(resultJSON);
                }
            });
        }
    });
    function getdetails(sourceid) {
        var val = $(sourceid).val();
        $.each(states, function(t, str) {
            if (val == str.invoiceid) {
                filldata(sourceid, str);
            }
        });
    }
    function filldata(sourceid, matches) {
        if (matches.invoiceid != null) {
            matches.paytype = (matches.paytype).toLowerCase();
            $('#total_amount,#total_payable').val(matches.total_amount);
            $("#discount").val(matches.discount);
            $("#paytype").val(matches.paytype).change();
            $("#invoice_date").val(matches.invoice_date);
            if(matches.paytype == null)
            {
                $("#paytype").val('cash').change();
            }
            hidestates.push(matches);
        }
    }
    function calculateDiscount()
    {
        let discount = parseFloat($("#discount").val());
        let total_amount = parseFloat($("#total_amount").val());
        let total_payable = total_amount;
        if(discount > 0)
        {
            let discount_amt = (total_amount*discount)/100;
            total_payable = total_amount - discount_amt;
        }
        total_payable.toFixed(2);
        $("#total_payable").val(total_payable);
    }
</script>