var i = 0;
var j = 1;
var gurl = $("#siteurl").attr("content");

var states = '';
var hidestates = [];
$.ajax({
    url: $("#siteurl").attr("content") + 'generateInvoice',
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
    $.each(states, function (n, str) {
        if (val == str.prodname) {
            filldata(sourceid, str);
        }
    });
    $.each(states, function (n, str) {
        if (val == str.id) {
            filldata(sourceid, str);
        }
    });
}
function filldata(sourceid, matches) {

    if (matches.prodname != null) {

        if (j < 30) {
            i++;
            j++;
            $td = productnew(i);
            $("#producttable").find('tbody').append($td);
            $('.the-basics #n' + i,document).typeahead({
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
        $("#price" + sourceid).val(matches.uprice);
        $("#hsn" + sourceid).val(matches.hsn);
        $("#ni" + sourceid).val(matches.prodid);
        $("#ni_" + sourceid).val(matches.prodid_);
        $("#bid" + sourceid).val(matches.id);
        $("#unit" + sourceid).val(matches.unit);
        $("#stock" + sourceid).attr("max", matches.bstock);
        $("#prodname" + sourceid).val(matches.prodname);
        /*states = $.grep(states, function (e) {
            return e.id != matches.id;
        });*/
        hidestates.push(matches );       
        calculates(sourceid);
    }
}
var substringMatcher = function () {
    return function findMatches(q, cb) {
        var mth, substringRegex;
        mth = [];
        substrRegex = new RegExp(q, 'i');
        $.each(states, function (n, str) {
            if (substrRegex.test(str.prodname)) {
                mth.push(str.prodname);
            }
        });
        $.each(states, function (n, str) {
            if (substrRegex.test(str.id)) {
                mth.push(str.id);
            }
        });
        cb(mth);
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
$(document).ready(function () {
 $("#submit").click(function () {       
        var url = gurl + 'save-sundry';        
            $.ajax({
                url: url,
                type: 'POST',
                ContentType: 'application/json',
                data: $("form").serialize(),
                success: function (result) {    
                    setTimeout(function () {
                        location.assign(gurl + 'list-sundry');
                   }, 1000);
                },
                fail: function (result) {
                    swal(result);
                }
            });      
    });
});
    function productnew(i) {
        var ptr = '<tr>';
        ptr += '<td><div class="the-basics"><input required="" id="n' + i + '" class="typeahead form-control tt-input prid typhed"></div><input name="pdid[]" type="hidden"  id="ni' + i + '"><input name="prodid_[]" type="hidden"  id="ni_' + i + '"></td>';
        ptr += '<td><input name="prodname[]"  required="" readonly=""  tabindex="-1" id="prodname' + i + '" class="form-control"><input name="hsn[]" type="hidden" id="hsn' + i + '"></td>';
        ptr += '<td><input name="stock[]" value="0" onkeyup="limit(this, 4);maxv(this, this.max);calculates(' + i + ');" id="stock' + i + '" class="form-control"></td><td><input name="unit[]" value=""  tabindex="-1" readonly="" id="unit' + i + '" class="form-control"></td>';
        ptr += '<td><input name="price[]" value="0" readonly=""   tabindex="-1" onchange="limit(this, 8);" id="price' + i + '" class="form-control"></td><input name="bid[]" type="hidden" id="bid' + i + '">';
        ptr += '<td><input name="total[]" value="0" readonly=""  tabindex="-1" onchange="limit(this, 8);" id="total' + i + '" class="form-control"></td>';
        ptr += '<td><input name="description[]"  id="description0" class="form-control"></td>';
        ptr += '<td class="text-nowrap"><a onclick="del(this)" data-toggle="tooltip" data-original-title="Close"> <i class="fa fa-close text-danger"></i> </a> </td>';
        ptr += '</tr>';
        return ptr;
    }
    function calculates(id) {

        var stock = $("#stock" + id).val();
        if (stock == "") {
            qty = 0;
        }
        var price = $("#price" + id).val();
        var total = parseFloat(stock) * parseFloat(price);
        $("#total" + id).val(total.toFixed(0));
    }
    function del(va) {
    if (confirm("Are you sure to Datele ?")) {
        $(va).parent('td').parent('tr').remove();
        //calculattotal();
        j--;
    }

}
function edit(sourceid) {
    $("#n" + sourceid).attr('readonly', false);
}