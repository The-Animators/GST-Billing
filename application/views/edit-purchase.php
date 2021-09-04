<!-- .row -->
<div class="row">
    <div class="col-sm-12">
        <div class="white-box" style="padding:10px 0px;">
             <form>
                 <div class="col-sm-12">
                     <div class="col-sm-3">                        
                         <h3 class="box-title m-b-0">Edit Purchase </h3>
                     </div>
                     <div class="col-sm-2">
                 <select  name="gsttype"  id="gsttype" class="form-control"><option value="CGSTSGST">CGST / SGST</option><option value="IGST">IGST</option></select>
                 </div>
                <div class="col-sm-2">
                    <?php 
                    $pdate = isset($lists[0]->pdate) ? $lists[0]->pdate : date('d-m-Y');
                    ?>
                    <input type="date" name="today" id="today"  value="<?php echo date('Y-m-d',  strtotime($pdate))?>"  class="form-control" placeholder="YYYY-MM-DD">
                 <input type="hidden" name="otoday" id="otoday"  value="<?php echo date('Y-m-d',  strtotime($pdate))?>"  >
                </div>
                <div class="col-sm-2">
                <input class="form-control"   name="receipt" value="<?php echo $lists[0]->receipt?>" id="receipt" placeholder="Purchase Receipt No"  autofocus  >
                <input   name="pinvoiceid" value="<?php echo $lists[0]->pinvoiceid?>" id="pinvoiceid" type="hidden" >
                 </div>
                <div class="col-sm-3">
                <select   name="customerid"  id="customerid" class="form-control select2"   >
                    <option></option>
                    <?php foreach ($clists as $list) { ?>
                    <option value="<?php echo $list->customerid ?>"><?php echo $list->name . " [ " . $list->mobile . " ] " ?></option>
                    <?php } ?>
                </select>
                </div>
                  
                 </div>
                     <div class="col-sm-12">
                <div class="row">
                    <div class="form-body">
                        
                        <div class="col-sm-12">
                            <div class="white-box" style="padding:10px 0px;">
                                <div class="table-responsive">
                                    <table class="table table-striped borderless" id="producttable">
                                        <thead>
                                            <thead><tr><th>PRODUCT</th><th>NAME</th><th>WareHouse STOCK</th><th>Dead STOCK</th><th>Total</th><th>UNIT</th><th>RATE</th><th>MRP</th><th>Taxable</th><th>DIST %</th><th>GST % </th><th>GSTAMT</th><th>TOTAL</th><th class="text-nowrap"></th></tr></thead>
                                            <tfoot><tr><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>Total</th><th><input value="<?php echo $lists[0]->taxtotal?>" id="gttotal" name="gttotal" readonly  tabindex="-1"class="form-control"></th>
                                                    <th><input value="<?php echo $lists[0]->amttotal?>" id="pttotal" name="pttotal"  readonly  tabindex="-1"class="form-control"></th><th>&nbsp;</th></tr></tfoot>
                                            
                                        </thead>
                                        <tbody>
                                             <?php $pdttl=0;  for ($i = 0; $i < count($lists); $i++) {  ?>
                                             <tr>
                                                 <td><div class="the-basics"><input id="n<?php echo $i ?>" value="<?php echo $lists[$i]->prodid_; ?>" disabled=""  autofocus class="typeahead form-control tt-input prid"></div>
                                                    <input type="hidden" name="prodid[]" value="<?php echo $lists[$i]->prodid?>" id="prodid<?php echo $i ?>">
                                                    <input type="hidden" name="prodid_[]" value="<?php echo $lists[$i]->prodid_?>" id="prodid_<?php echo $i ?>">
                                                 </td><td width="200"><input name="prodname[]" value="<?php echo $lists[$i]->pprodname?>"  tabindex="-1" readonly="" required="" id="prodname<?php echo $i ?>" class="form-control"></td>
                                                 <td><input  type="number" value="<?php echo $lists[$i]->wstock?>" name="wstock[]" onkeyup="limit(this, 8);calculates(0);" id="wstock<?php echo $i ?>" class="form-control"></td> 
                                                <td><input name="dstock[]" type="number" value="<?php echo $lists[$i]->dstock?>"  id="dstock<?php echo $i ?>"  class="form-control" onkeyup="calculates(0);"></td> 
                                                <td><input name="totalstock[]" readonly="" type="number" value="<?php echo $lists[$i]->totalstock?>" id="totalstock<?php echo $i ?>"  class="form-control" onkeyup="calculates(0);"></td>
                                                 <!-- <td><input  type="number" value="<?php echo $lists[$i]->stock?>"   name="stock[]" onkeyup="limit(this, 8);calculates(<?php echo $i ?>);" id="stock<?php echo $i ?>" class="form-control"></td> 
                                                 <td><input name="instock[]" type="number" value="<?php echo $lists[$i]->instock?>"  id="instock<?php echo $i ?>"  class="form-control"></td> -->
                                                <td width="90"><select name="unit[]"  id="unit<?php echo $i ?>" class="form-control" ><?php foreach ($slists as $list) { ?><option value="<?php echo $list->unit ?>"><?php echo $list->unit ?></option> <?php } ?></select></td>
                                                <td><input type="number"   name="pprice[]" value="<?php echo $lists[$i]->price?>"  onkeyup="limit(this, 8);calculates(<?php echo $i ?>);" id="pprice<?php echo $i ?>" class="form-control"></td>
                                                <td><input type="number" value="<?php echo $lists[$i]->uprice?>" name="sprice[]" value="0" onkeyup="limit(this, 8);" id="sprice<?php echo $i ?>" class="form-control"></td>
                                                <td><input type="number" name="taxable[]" readonly="true" value="<?php echo $lists[$i]->taxable ?>" onkeyup="limit(this, 8);calculates(0);" id="taxable<?php echo $i ?>" class="form-control"></td>
                                                <td><input name="discout[]" value="<?php echo $lists[$i]->discount?>"  type="number" step=0.01  onkeyup="limitd(this, 5);calculates(<?php echo $i ?>);"  id="discout<?php echo $i ?>" class="form-control"></td> <td><input type="text" tabindex="-1" readonly=""  name="gstper[]" value="<?php echo $lists[$i]->pgstper?>"  id="gstper<?php echo $i ?>" class="form-control"></td>
                                                
                                                <td><input type="text" name="gtotal[]" value="<?php echo $lists[$i]->gstamount?>"  class="form-control" step=0.01 id="gtotal<?php echo $i ?>" tabindex="-1" readonly="" ></td>
                                                <td><input type="text"  tabindex="-1" readonly="" name="ptotal[]" value="<?php echo $lists[$i]->total?>" id="ptotal<?php echo $i ?>" class="form-control"></td> <td class="text-nowrap"><a onclick="del(this)" data-toggle="tooltip" data-original-title="Close"> <i class="fa fa-close text-danger"></i> </a></td>
                                            </tr>
                                             <?php }?>
                                           <tr>
                                                <td><div class="the-basics"><input id="n<?php echo $i ?>"  autofocus class="typeahead form-control tt-input prid"></div>
                                                    <input type="hidden" name="prodid[]"  id="prodid<?php echo $i ?>">
                                                    <input type="hidden" name="prodid_[]"  id="prodid_<?php echo $i ?>">
                                                </td><td width="200"><input name="prodname[]" tabindex="-1" readonly="" required="" id="prodname<?php echo $i ?>" class="form-control"></td>
                                                <td><input  type="number" value="0" name="wstock[]" onkeyup="limit(this, 8);calculates(0);" id="wstock<?php echo $i ?>" class="form-control"></td> 
                                                <td><input name="dstock[]" type="number" value="0"  id="dstock<?php echo $i ?>"  class="form-control" onkeyup="calculates(0);"></td> 
                                                <td><input name="totalstock[]" readonly="" type="number" value="0"  id="totalstock<?php echo $i ?>"  class="form-control" onkeyup="calculates(0);"></td>
                                                <!-- <td><input  type="number" value="0"  name="stock[]" onkeyup="limit(this, 4);calculates(<?php echo $i ?>);" id="stock<?php echo $i ?>" class="form-control"></td> <td><input name="instock[]" type="number"  value="1"  id="instock<?php echo $i ?>"  class="form-control"></td> -->
                                                <td width="90"><select name="unit[]"  id="unit<?php echo $i ?>" class="form-control" ><?php foreach ($slists as $list) { ?><option value="<?php echo $list->unit ?>"><?php echo $list->unit ?></option> <?php } ?></select></td>
                                                <td><input type="number"  name="pprice[]" value="0" onkeyup="limit(this, 8);calculates(<?php echo $i ?>);" id="pprice<?php echo $i ?>" class="form-control"></td>
                                                <td><input type="number"  name="sprice[]" value="0" onkeyup="limit(this, 8);" id="sprice<?php echo $i ?>" class="form-control"></td>
                                                <td><input type="number" name="taxable[]" readonly="true" value="0" onkeyup="limit(this, 8);calculates(0);" id="taxable<?php echo $i ?>" class="form-control"></td>
                                                <td><input name="discout[]" value="0" type="number" step=0.01  onkeyup="limitd(this, 5);calculates(<?php echo $i ?>);"  id="discout<?php echo $i ?>" class="form-control"></td> 
                                                <td><input type="text" tabindex="-1" readonly="" value="0" name="gstper[]"  id="gstper<?php echo $i ?>" class="form-control"></td>
                                                <td><input type="text" name="gtotal[]" class="form-control" step=0.01 id="gtotal<?php echo $i ?>" tabindex="-1" readonly="" ></td>
                                                <td><input type="text"  tabindex="-1" readonly="" name="ptotal[]" id="ptotal<?php echo $i ?>" class="form-control"></td> <td class="text-nowrap"><a onclick="del(this)" data-toggle="tooltip" data-original-title="Close"> <i class="fa fa-close text-danger"></i> </a></td>
                                            </tr>
                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-right">
                        <div class="row">
                            <button type="reset" class="btn btn-inverse waves-effect waves-light cancel">Cancel</button>
                            <button type="button" id="update" class="btn btn-success waves-effect waves-light m-r-10">Submit</button>                     
                        </div>
                    </div>
                </div>
            </form>
        </div>
                 <div class="clearfix"></div>
    </div>
</div>
    <link href="<?php echo base_url() ?>components/typeahead.js-master/dist/typehead-min.css" rel="stylesheet" />
<script>
        $('#gsttype').val('<?php echo $lists[0]->gst ?>');
        $('#customerid').val('<?php echo $lists[0]->customerid ?>');
      <?php  for ($i = 0; $i <count($lists); $i++) {?>
         $('#unit<?php echo $i ?>').val('<?php echo $lists[$i]->unit ?>');
     <?php }?>
        
var i = 0,j = 1;  
var gurl = $("#siteurl").attr("content");
var states = '';
var hidestates = [];
$.ajax({
    url: gurl + 'purchase',
    type: 'POST',
    ContentType: 'application/json',
    data: {},
    success: function (result) {
        states = result;
       
    },
    fail: function (result) {
        alert(result);
    }
});
$(document).on('typeahead:selected', '.typeahead',function(evt, item) {
    getdetails(i);
});
function getdetails(sourceid) {
    var val = $('#n' + sourceid).val();
    $.each(states, function (t, str) {
        if (val == str.prodname) {
            filldata(sourceid, str);
            return false;
        }
    });
}
var substringMatcher = function () {
    return function findMatches(q, cb) {
        var matches, substringRegex;
        matches = [];
        substrRegex = new RegExp(q, 'i');
        $.each(states, function (t, str) {
            if (substrRegex.test(str.prodname)) {
                matches.push(str.prodname);
            }
        });
        $.each(states, function (t, str) {
            if (substrRegex.test(str.prodid_)) {
                matches.push(str.prodid_);
            }
        });
       
        cb(matches);
    };
};
function filldata(sourceid, matches) {

    if (matches.prodname != null) {

        if (j < 30) {
            i++;
            j++;
            $td = productnew(i);
            $("#producttable").find('tbody').append($td);
            $('.the-basics #n' + i + '').typeahead({
                hint: true,
                highlight: true,
                minLength: 1
            }, {
                name: 'states',
                source: substringMatcher()
            });

        } else {
            swal('No More Product Add');
        }
        $('#stock' + sourceid).focus();
        $('#n' + sourceid).typeahead('destroy').val(matches.prodid_).attr('disabled', 'disabled');
        $("#prodname" + sourceid).val(matches.prodname);
        $("#prodid_" + sourceid).val(matches.prodid_);
        $("#prodid" + sourceid).val(matches.prodid);
        
        $("#wstock" + sourceid).val(matches.wstock);
        $("#dstock" + sourceid).val(matches.dstock);
        $("#totalstock" + sourceid).val(matches.totalstock);

        $("#unit" + sourceid).val(matches.unit);
        $("#pprice"+sourceid).val(matches.pprice);
        $("#sprice"+sourceid).val(matches.uprice);
        $("#taxable"+sourceid).val(matches.taxable);
        $("#gstper" + sourceid).val(matches.gstper);  
        calculates(sourceid);
    }
}
function  infun(val){i = val;j = val+1;$('#n0').typeahead('destroy');$('.the-basics #n'+i).typeahead({hint: true,highlight: true,minLength: 1},{name: 'states',source: substringMatcher()});} 
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
        let wstock = parseInt($("#wstock" + d).val());
        if(wstock == '')
        {
            wstock = 0;
        }
        let lstock = parseInt($("#dstock" + d).val());
        if(lstock == '')
        {
            lstock = 0;
        }
        
        var total_stock = wstock + lstock;
        $("#totalstock"+d).val(total_stock);

        var a = parseFloat(total_stock) * (parseFloat($("#pprice" + d).val())); // total amount
        var b = parseFloat(a) - (parseFloat(a) * parseFloat($("#discout" + d).val()) / 100);
        var t = parseFloat(b) * parseFloat($("#gstper" + d).val()) / 100;
        var c = parseFloat(b) + parseFloat(t);

        $("#taxable"+d).val(a);
        $("#gtotal" + d).val(t.toFixed(2));
        $("#ptotal" + d).val(c.toFixed(2));
        calculattotal(d);
    };
$('.the-basics #n0').typeahead({
    hint: true,
    highlight: true,
    minLength: 1
},{
  name: 'states',
  source: substringMatcher()
});
   function del(va) {
    if (confirm("Are you sure to Datele ?")) {
        $(va).parent('td').parent('tr').remove();
        calculattotal();
        j--;
    }
}
    function edit() {
        $("#n0").attr('readonly', false);
    }
    function productnew(i) {
        var ptr = '';
        ptr += '<tr>';
        ptr += '<td width="155"><div class="the-basics"><input list="prdlist" name="prodid[]" id="n' + i + '"  class="typeahead form-control tt-input prid"></div>';
            ptr += '<input type="hidden" name="prodid[]"  id="prodid' + i + '">';
            ptr += '<input type="hidden" name="prodid_[]"  id="prodid_'+i+'">';
        ptr += '</td>';
        ptr += '<td><input name="prodname[]" tabindex="-1"  required="" readonly="" id="prodname' + i + '" class="form-control"></td>';
        ptr += '<td><input  type="number" value="0"  name="wstock[]" onkeyup="limit(this, 8);calculates('+i+');" id="wstock'+i+'" class="form-control"></td>';
        ptr += '<td><input name="dstock[]" type="number"  value="0"  id="dstock'+i+'"  class="form-control" onkeyup="calculates('+i+');"></td>';
        ptr += '<td><input name="totalstock[]" type="number" readonly="" value="0"  id="totalstock'+i+'"  class="form-control" onkeyup="calculates('+i+');"></td>';
        //ptr += '<td><input type="number" value="0"   name="stock[]" required="" onkeyup="limit(this, 8);calculates(' + i + ');" id="stock' + i + '" class="form-control"></td>';
        ptr += '<td><select name="unit[]" type="number"   id="unit' + i + '" class="form-control" >';
            <?php foreach ($slists as $list) { ?>ptr += '<option value="<?php echo $list->unit ?>"><?php echo $list->unit ?></option>';
            <?php } ?>
        ptr += '</select></td>';
        ptr += '<td><input value="0" name="pprice[]" type="number" onkeyup="limit(this, 8);calculates(' + i + ');" id="pprice' + i + '" class="form-control"></td>';
        ptr += '<td><input name="sprice[]" type="number" value="0" onkeyup="limit(this, 8);" id="sprice' + i + '" class="form-control"></td>';
        ptr += '<td><input name="taxable[]" type="number" readonly="true" value="0" onkeyup="limit(this, 8);calculates(' + i + ');" id="taxable' + i + '" class="form-control"></td>';
        ptr += '<td><input name="discout[]" value="0" type="number" step=0.01  onkeyup="limitd(this, 5);calculates(' + i + ');"  id="discout' + i + '" class="form-control"></td>';
        ptr += '<td><input type="text" tabindex="-1" readonly=""  value="0" name="gstper[]"  id="gstper' + i + '" class="form-control"></td>';
        ptr += '<td><input type="text" name="gtotal[]" class="form-control"  id="gtotal' + i + '" step=0.01 tabindex="-1" readonly="" ></td>';
        ptr += '<td><input type="text"  tabindex="-1" readonly="" name="ptotal[]" id="ptotal' + i + '" class="form-control"><td class="text-nowrap"><a onclick="del(this)" data-toggle="tooltip" data-original-title="Close"> <i class="fa fa-close text-danger"></i> </a> </td>';
        ptr += '</tr>';
        return ptr;
    }
    $(document).ready(function () {
        infun(<?php echo count($lists);?>);
        $("#update").click(function () {
             if( $("#receipt").val()==""){swal("Please Fill Receipt No"); return ;}
             if( $("#customerid").val()==""){swal("Please Select Vandor Name"); return ;}
            var url = gurl + 'update-purchase';
            $.ajax({
                url: url,
                type: 'POST',
                ContentType: 'application/json',
                data: $("form").serialize(),
                success: function (result) {
                    console.log(result);
                    setTimeout(function () {
                        window.location.assign($("#siteurl").attr("content")+'list-purchase');
                    }, 500);
                },
                fail: function (result) {
                    alert(result);
                }
            });
        });
          });
</script>

