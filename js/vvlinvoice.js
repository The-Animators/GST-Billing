var i = 0,
    j = 1;

function infun(val) {
    i = val;
    j = val + 1;
    $('#n0').typeahead('destroy');
    $('.the-basics #n' + i).typeahead({
        hint: true,
        highlight: true,
        minLength: 1
    }, {
        name: 'states',
        source: substringMatcher()
    });
}
var gurl = $("#siteurl").attr("content"),
    states = '',
    custes = '',
    hidestates = [];
$.ajax({
    url: $("#siteurl").attr("content") + 'generateInvoice',
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
$.ajax({
    url: $("#siteurl").attr("content") + 'customerlists',
    type: 'POST',
    ContentType: 'application/json',
    data: {},
    success: function(result) {
        custes = result;
    },
    fail: function(result) {
        alert(result);
    }
});
$(document).on('typeahead:selected', '.typeahead',function(evt, item) {
    getdetails(i);
});

function getdetails(sourceid) {
    var val = $('#n' + sourceid).val();
    $.each(states, function(t, str) {
        if (val == str.prodname) {
            filldata(sourceid, str);
            return false;
        }
    }); /*$.each(states, function (t, str) {if (val == str.prodid) {filldata(sourceid, str);}});*/
}

function filldata(sourceid, matches) {
    
    if (matches.prodname != null) {
        if (j < 251) {
            i++;
            j++;
            $td = productnew(i);
            $("#producttable").find('tbody').append($td);
            $('.the-basics #n' + i).typeahead({
                hint: true,
                highlight: true,
                minLength: 1
            }, {
                name: 'states',
                source: substringMatcher()
            });
        } else {
            swal('No More Product Add');
            $('#n' + sourceid).val('');
            return;
        }
        $('#stock' + sourceid).focus();
        $('#n' + sourceid).typeahead('destroy').val(matches.prodid_).attr('disabled', 'disabled');
        $('#prdid' + sourceid).val(matches.prodid);
        $('#prodid_' + sourceid).val(matches.prodid_);
        $("#bprice" + sourceid).val(matches.bsprice);
        $("#price" + sourceid).val(matches.uprice);
        $("#hsn" + sourceid).val(matches.hsn);
        $("#instock" + sourceid).val(matches.unit);
        $("#qtt" + sourceid).val(1);
        $("#ni" + sourceid).val(matches.prodid);
        $("#ni_" + sourceid).val(matches.prodid_);
        $("#unit" + sourceid).val(matches.unit);
        $("#stock" + sourceid).attr("max", matches.stock);
        $("#gstper" + sourceid).val(matches.gstper);
        $("#prodname" + sourceid).val(matches.prodname);
        /*states = $.grep(states, function(e) {
            return e.prodid != matches.prodid;
        });*/
        hidestates.push(matches);
        calculates(sourceid);
    }
}
var substringMatcher = function() {
    return function findMatches(q, cb) {
        var matches, substringRegex;
        matches = [];
        substrRegex = new RegExp('^' + q, 'i');
        $.each(states, function(t, str) {
            if (substrRegex.test(str.prodname)) {
                matches.push(str.prodname);
            }
        }); $.each(states, function (t, str) {if (substrRegex.test(str.prodid_)) {matches.push(str.prodid_);}});
        cb(matches);
    };
};
$('.the-basics #n0').typeahead({
    hint: true,
    highlight: true,
    minLength: 1
    },{
    name: 'states',
    source: substringMatcher()
});
$(document).ready(function() {
    $(".card").css("display", "none");
    $("#ptype").change(function() {
        var type = $(this).val();
        if (type == "Cash") {
            $(".cash").css("display", "block");
            $(".card").css("display", "none");
        }
        if (type == "Card") {
            $("#amount").val('0');
            $("#ramount").val('0');
            $(".cash").css("display", "none");
        } else {
            $("#cbrcode").val('');
            $("#available").val('0');
        }
        if (type == "Credit" || type == "E-Cash") {
            $("#ramount").val('0');
            $(".card").css("display", "none");
            $(".cash").css("display", "none");
        }
    });
	
	//Eway hide / Show
	$('#ewaynum').attr("readonly", true);
	$('#eway').on('click', function () {
		if ($(this).prop('checked')) {
			$('#ewaynum').attr("readonly", false);
		} else {
			$('#ewaynum').attr("readonly", true);
		}
	});
	//end - eway

    function validation() {
        for (var k = 0; k < i - 1; k++) {
            if ($("#n" + k).val() == '') {
                $("#n" + k).focus();
                return false;
            }
            if ($("#stock" + k).val() == '' || $("#stock" + k).val() == '0') {
                $("#stock" + k).focus();
                return false;
            }
        }
        if ($("input[name=cmane]").val() === '') {
            $("input[name=cmane]").focus();
            return false;
        }
        return true;
    }
    $("#submit").click(function() {
        if (j == 1) {
            swal('Please Add Product in Invoice ');
            return;
        }
        var ramount = $("#ramount").val(),
            url = gurl + 'save-invoice';
        if (parseInt(ramount) < 0) {
            swal('Please paid all Payment');
            return;
        }
        if (validation()) {
            $("#submit").attr('disabled', 'disabled');
            $.ajax({
                url: url,
                type: 'POST',
                data: $("form").serialize(),
                dataType:'json',
                success: function(resultJSON) {
                    if (resultJSON.status) {
                        location.assign(gurl + 'view-invoice');
                    }
                    else
                    {
                        $("#submit").prop('disabled',false);
                        swal(
                          resultJSON.msg,
                          resultJSON.msg2,
                          'warning'
                        )
                        $("#isCredit").val(resultJSON.amount);
                    }
                },
                fail: function(resultJSON) {
                    swal(result);
                }
            });
        }
    });
    $("#udetails").click(function() {
        url = gurl + 'update-invoice';
        if (parseInt(ramount) < 0) {
            swal('Please paid all Payment');
            return;
        }
        if (validation()) {
            $("#udetails").attr('disabled', 'disabled');
            $.ajax({
                url: url,
                type: 'POST',
                data: $("form").serialize(),
                dataType:'json',
                success: function(resultJSON) {
                    if (resultJSON.status) {
                        location.assign(gurl + 'view-invoice/list');
                    }
                    else
                    {
                        $("#udetails").prop('disabled',false);
                        swal(
                          resultJSON.msg,
                          resultJSON.msg2,
                          'warning'
                        )
                        $("#isCredit").val(resultJSON.amount);
                    }
                },
                fail: function(resultJSON) {
                    swal(resultJSON);
                }
            });
        }
    });
});

function productnew(i) {
    var ptr = '<tr><td><div class="the-basics"><input  required=""  id="n' + i + '" min="' + i + '" class="typeahead form-control tt-input prid typhed"><input name="prodid[]"   id="ni' + i + '" type="hidden"><input name="prodid_[]"   id="ni_' + i + '" type="hidden"><input name="prdid[]"   id="prdid' + i + '" type="hidden"></div>';
    ptr += '<td><input name="prodname[]" tabindex="-1" required="" readonly="" id="prodname' + i + '" class="form-control"><input name="iid[]" value="" id="iid' + i + '" type="hidden"><input name="hsn[]"   id="hsn' + i + '" type="hidden"></td>';
    ptr += '<td><input name="bprice[]" value="0" tabindex="-1" readonly="" id="bprice' + i + '" class="form-control"></td>';
    ptr += '<td><input name="stock[]" value="1"  min="1.000" required=""  onchange="limit(this, 7);maxv(this, this.max);calculates(' + i + ');" id="stock' + i + '" class="form-control"><input name="unit[]"   id="unit' + i + '" type="hidden"></td>';
    ptr += '<td><input name="instock[]" tabindex="-1" value="" readonly="" id="instock' + i + '" class="form-control"><input name="qtt[]" value="" type="hidden"  id="qtt' + i + '"></td>';
    ptr += '<td><input name="price[]"  value="0"  onkeyup="limit(this, 8);calculates(' + i + ');" id="price' + i + '" class="form-control"></td>';
    ptr += '<td><input name="total[]" tabindex="-1" value="0" readonly="" onchange="limit(this, 8);" id="total' + i + '" class="form-control"></td>';
    ptr += '<td><input name="discout[]" value="0" onkeyup="limitd(this, 5);calculates(' + i + ');" id="discout' + i + '" class="form-control"></td>';
    ptr += '<td><input name="ttotal[]" tabindex="-1" value="0" readonly="" onchange="limit(this, 8);" id="ttotal' + i + '" class="form-control"></td>';
    ptr += '<td><input name="gstper[]" value="0" tabindex="-1" readonly=""  onchange="limit(this, 2);" id="gstper' + i + '" class="form-control"></td><td><input name="gstamount[]" value="0" tabindex="-1" readonly=""  id="gstamount' + i + '" class="form-control"></td>';
    ptr += '<td class="text-nowrap"><a onclick="del(this)" data-toggle="tooltip" data-original-title="Close"> <i class="fa fa-close text-danger"></i> </a> </td></tr>';
    return ptr;
}

function del(va) {
    if (confirm("Are you sure to Delete ?")) {
        $(va).parent('td').parent('tr').remove();
        /*var val = $(va).parent('td').parent('tr').find('input').val();
        addstates = $.grep(hidestates, function(e) {
            return e.prodid == val;
        });
        hidestates = $.grep(hidestates, function(e) {
            return e.prodid != val;
        });
        states.push(addstates[0]);*/
        calculattotal();
       // j--;
    }
    if (j == 0) {
        location.reload();
    }
    calculattotal(i);
}

function edit() {
    $("#n0").attr('disabled', false);
}

function dell(va) {
    if (confirm("Are you sure to Delete ?")) {
        $(va).parent('td').parent('tr').remove();
        calculattotal();
        j--;
    }
    if (j == 0) {
        location.reload();
    }
    calculattotal(i);
}

function calculattotal(id) {
    var mytotal = 0,
        myttotal = 0,
        tgstper = 0;
    for (var k = 0; k < i; k++) {
        if ($("#total" + k).length != 0) {
            let row_total = parseFloat($("#total" + k).val());
            if(row_total > 0)
            {
                mytotal = parseFloat(mytotal) + row_total;
                myttotal = parseFloat(myttotal) + parseFloat($("#ttotal" + k).val());
                tgstper = parseFloat(tgstper) + ((parseFloat($("#ttotal" + k).val()) * parseFloat($("#gstper" + k).val())) / 100);
               // myttotal =+ tgstper;
            }
        }
    }

    $("#ptotal").val(parseFloat(mytotal).toFixed(0));
    $("#taxa").val(parseFloat(tgstper).toFixed(0));
    $("#gtotal").val(parseFloat(mytotal).toFixed(0));
    $("#gttotal").val(parseFloat(myttotal + tgstper).toFixed(0));
    $("#gsttotal").val(parseFloat(tgstper).toFixed(0));
    $("#tamount").val((parseFloat(myttotal + tgstper)).toFixed(0));
        
}

function calculates(id) {
    var qty = $("#stock" + id).val();
    if (qty == "") {
        qty = 0;
    }
    var total = parseFloat(qty) * (parseFloat($("#price" + id).val()));
    $("#total" + id).val(total.toFixed(2));
    var ttotal = parseFloat(total) - (parseFloat(total) * parseFloat($("#discout" + id).val()) / 100);
    $("#ttotal" + id).val(ttotal.toFixed(2));
    $("#gstamount" + id).val(((parseFloat(ttotal) * parseFloat($("#gstper" + id).val())) / 100));
    
            $("#stock" + id).val(parseFloat(qty).toFixed(3));
    calculattotal();
}

function getcust(input) {
    var vals = input.value,
        valid = "";
    $.each(custes, function(a, b) {
        if (vals == b.name) {
            valid = b
        }
    });
    if (valid != "") {
        $("#custid").val(valid.customerid);
        $("#name").val(valid.name);
        $("#mobile").val(valid.mobile).attr("disabled", "disabled");
        $("#address").val(valid.address);
        $("#gstin").val(valid.gstin).attr("disabled", "disabled");
        $("#ptype").focus()
    } else {
        $("#custid").val("");
        $("#name").val("");
        $("#mobile").val("").attr("disabled", false);
        $("#address").val("");
        $("#gstin").val("").attr("disabled", false)
    };
}

function calcul(input) {
    var tval = input.value;
    if (tval == "") {
        tval = 0;
    }
    var pval = $("#tamount").val();
    if (pval == "") {
        pval = 0;
    }
    $("#ramount").val((parseFloat(tval) - parseFloat(pval)).toFixed(0));
}

function getCoupon() {
    var couponno = $('#couponno').val(),
        url = gurl + 'getcoupon';
    $.ajax({
        url: url,
        type: 'POST',
        ContentType: 'application/json',
        data: {
            'couponno': couponno
        },
        success: function(result) {
            if (result.length > 0) {
                var pval = parseFloat($("#gttotal").val()) + parseFloat($("#gsttotal").val());
                if (result[0].incre_type == "%") {
                    var camt = (parseFloat(pval) * parseFloat(result[0].discount)) / 100;
                    $("#camount").val(camt.toFixed(0));
                    $("#tamount").val((parseFloat(pval) - parseFloat(camt)).toFixed(0));
                } else {
                    $("#camount").val(result[0].discount);
                    $("#tamount").val((parseFloat(pval) - parseFloat(result[0].discount)).toFixed(0));
                }
                var tval = $("#amount").val();
                if (tval == "") {
                    tval = 0;
                }
                var pval = $("#tamount").val();
                $("#ramount").val(0);
            } else {
                swal("Coupon Code", "This coupon code is invalid or has expired.");
                $("#camount").val("0");
                $("#tamount").val(parseFloat($("#gtotal").val()));
            }
        },
        fail: function(result) {
            alert(result);
        }
    });
}

function delCoupon() {
    $("#camount").val("0");
    var tval = parseFloat($("#gttotal").val()) + parseFloat($("#gsttotal").val());
    $("#tamount").val(tval);
    var pval = $("#amount").val();
    $("#ramount").val('0');
}