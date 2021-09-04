<!-- .row -->
<div class="row">
    <div class="col-sm-12">
        <div class="white-box">
            <form>
                <div class="col-sm-12">
                    <div class="col-sm-3">                        
                        <h2 class="text-uppercase">Debit Note</h2>
                    </div>
                     <div class="col-sm-2">
                 <select  name="gsttype"  id="gsttype" class="form-control"><option value="CGSTSGST">CGST / SGST</option><option value="IGST">IGST</option></select>
                 </div>
                    <div class="col-sm-2">
                        <input type="date" name="today" id="today"  value="<?php echo date('Y-m-d') ?>"  class="form-control" placeholder="YYYY-MM-DD">
                    </div>
                    <div class="col-sm-2">
                        <input class="form-control" readonly="" tabindex="-1"  name="receipt" id="receipt" placeholder="Purchase Receipt No"  value="<?php echo $lists[0]->receipt ?>" >
                        <input type="hidden" name="pinvoiceid"  value="<?php echo $lists[0]->pinvoiceid ?>" >
                        <input type="hidden"  name="customerid"  value="<?php echo $lists[0]->customerid ?>" >
                        <input type="hidden"  name="pdate"  value="<?php echo $lists[0]->pdate ?>" >
                    </div>
                    <div class="col-sm-3">
                        <input class="form-control" readonly="" tabindex="-1" value="<?php echo $lists[0]->name ?>" >
                    </div>

                </div>
                <div class="col-sm-12">
                    <div class="row">
                        <div class="form-body">

                            <div class="col-sm-12">
                                <div class="white-box">
                                    <div class="table-responsive">
                                        <table class="table table-striped borderless" id="producttable">
                                           <thead><tr><th>PRODUCT</th><th>NAME</th><th>WareHouse STOCK</th><th>Dead STOCK</th><th>UNIT</th><th>RATE</th><th>DIST %</th><th>GST % </th><th>MRP</th><th>GSTAMT</th><th>TOTAL</th><th class="text-nowrap">Act</th></tr></thead>
                                            <tfoot><tr><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>Total</th><th><input value="<?php echo $lists[0]->taxtotal?>" id="gttotal" name="gttotal" readonly  tabindex="-1"class="form-control"></th>
                                                    <th><input value="<?php echo $lists[0]->amttotal?>" id="pttotal" name="pttotal"  readonly  tabindex="-1"class="form-control"></th><th>&nbsp;</th></tr></tfoot>
                                            <tbody>
                                                <?php $pdttl=0;  for ($i = 0; $i <count($lists); $i++) {?>
                                             <tr>
                                                 <td><div class="the-basics"><input id="n<?php echo $i ?>" value="<?php echo $lists[$i]->prodid_;?>" disabled=""  autofocus class="typeahead form-control tt-input prid"></div>
                                                    <input type="hidden" name="prodid[]" value="<?php echo $lists[$i]->prodid?>" id="prodid<?php echo $i ?>">
                                                    <input type="hidden" name="prodid_[]" value="<?php echo $lists[$i]->prodid_?>" id="prodid_<?php echo $i ?>">
                                                </td><td width="200"><input name="prodname[]" value="<?php echo $lists[$i]->pprodname?>"  tabindex="-1" readonly="" required="" id="prodname<?php echo $i ?>" class="form-control"></td>
                                                <td><input  type="number" value="<?php //echo $lists[$i]->wstock;?>1" name="wstock[]" onkeyup="limit(this, 8);calculates(0);" id="wstock<?php echo $i ?>" class="form-control"></td> 
                                                <td><input name="dstock[]" type="number" value="<?php //echo $lists[$i]->dstock;?>1"  id="dstock<?php echo $i ?>"  class="form-control" onkeyup="calculates(0);"></td> 
                                                 <!-- <td><input  type="number" value="<?php echo $lists[$i]->stock?>"   name="stock[]" onkeyup="limit(this, 8);calculates(<?php echo $i ?>);" id="stock<?php echo $i ?>" class="form-control"></td> <td><input name="instock[]" type="number" value="<?php echo $lists[$i]->instock?>"  id="instock<?php echo $i ?>"  class="form-control"></td> -->
                                                 <td width="90"><input name="unit[]"  id="unit<?php echo $i ?>" class="form-control" tabindex="-1" readonly="" value="<?php echo $lists[$i]->unit ?>"></td>
                                                <td><input type="number"   name="pprice[]" value="<?php echo $lists[$i]->price?>"  onkeyup="limit(this, 8);calculates(<?php echo $i ?>);" id="pprice<?php echo $i ?>" class="form-control"></td><td><input name="discout[]" value="<?php echo $lists[$i]->discount?>"  type="number" step=0.01  onkeyup="limitd(this, 5);calculates(<?php echo $i ?>);"  id="discout<?php echo $i ?>" class="form-control"></td> <td><input type="text" tabindex="-1" readonly=""  name="gstper[]" value="<?php echo $lists[$i]->pgstper?>"  id="gstper<?php echo $i ?>" class="form-control"></td>
                                                <td><input type="number" value="0" tabindex="-1" readonly="" name="sprice[]" value="0" onkeyup="limit(this, 8);" id="sprice<?php echo $i ?>" class="form-control"></td><td><input type="text" name="gtotal[]" value="<?php echo $lists[$i]->gstamount?>"  class="form-control" step=0.01 id="gtotal<?php echo $i ?>" tabindex="-1" readonly="" ></td>
                                                <td><input type="text"  tabindex="-1" readonly="" name="ptotal[]" value="<?php echo $lists[$i]->total?>" id="ptotal<?php echo $i ?>" class="form-control"></td> <td class="text-nowrap"><a onclick="del(this)" data-toggle="tooltip" data-original-title="Close"> <i class="fa fa-close text-danger"></i> </a></td>
                                            </tr>
                                             <?php }?>
                                            </tbody>

                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-right">
                            <div class="row">
                                <button type="button" id="submit" class="btn btn-success waves-effect waves-light m-r-10">Submit</button>                     
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </form>
        </div>
    </div>
    <script>
        var i=<?php echo $i ?>;
        $('#gsttype').val('<?php echo $lists[0]->gst ?>');
        function del(va) {
            if (confirm("Are you sure to Datele ?")) {
                $(va).parent('td').parent('tr').remove();
            }
        }
        var gurl = $("#siteurl").attr("content");
        $(document).ready(function () {

            $("#submit").click(function () {

                var url = gurl + 'debitnoteinvoice';
                $.ajax({
                    url: url,
                    type: 'POST',
                    ContentType: 'application/json',
                    data: $("form").serialize(),
                    success: function (result) {
                        //console.log(result);
                        setTimeout(function () {
                            location.assign(gurl + 'debit-note-list');
                        }, 500);
                    },
                    fail: function (result) {
                        alert(result);
                    }
                });
            });
        });
       function calculattotal(id) {
        var mygtotal = parseFloat(0), myttotal = parseFloat(0);
        for (var k = 0; k < i; k++) {
            if ($("#ptotal" + k).length != 0) {
                myttotal = parseFloat(myttotal) + parseFloat($("#ptotal" + k).val());
                mygtotal = parseFloat(mygtotal) + parseFloat($("#gtotal" + k).val());
            }
            if (k == i-1) {
                $("#pttotal").val(parseFloat(myttotal).toFixed(2));
                $("#gttotal").val(parseFloat(mygtotal).toFixed(2));
            }
        }

    }
    function calculates(d) {
       
        var a = (parseInt($("#dstock" + d).val()) + parseInt($("#wstock" + d).val())) * (parseFloat($("#pprice" + d).val()));
        
        var b = parseFloat(a) - (parseFloat(a) * parseFloat($("#discout" + d).val()) / 100);
        var t = parseFloat(b) * parseFloat($("#gstper" + d).val()) / 100;
        var c = parseFloat(b) + parseFloat(t);
        $("#gtotal" + d).val(t.toFixed(2));
        $("#ptotal" + d).val(c.toFixed(2));
        calculattotal(d);
    };
    </script>

