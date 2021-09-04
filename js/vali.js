function limit(element, max) {
    var max_chars = max;
    if (element.value.length > max_chars) {
        element.value = element.value.substr(0, max_chars);
    }
}
function limitd(element, max) {
    var max_chars = max;
    if (element.value.length > max_chars) {
        element.value = element.value.substr(0, max_chars);
    }
    if (element.value.length =='') {
        element.value = 0;
    }
    if (parseFloat(element.value) >parseFloat(100)) {
        element.value = 100;
    }
}
function maxv(element, max) {
    /*max=parseInt(max);
    if (element.value > max) {
        swal('Added Quantity More Then Present Quantity');
        element.value = max;
    }*/
     if (element.value.length =='') {
        element.value = 0;
    }
}
function limitm(element, id) {

    var price = $("#pprice" + id).val();
    if (parseFloat(element.value) > parseFloat(price)) {
        element.value = price;
    }
}
function datal() {
    var item = $('<datalist id="prdlist"></datalist>');
    $list = [];
    $(".prid").each(function () {
        var sid = $(this).val();
        $list.push(sid);
    });
    $("#prdlists option").each(function () {
        var did = $(this).text();
        if ($.inArray(did, $list) === -1) {
            item.append("<option id='" + $(this).val() + "'>" + $(this).text() + "</option>");
        }
    });
    $("#prdlist").empty();
    $("#prdlist").replaceWith(item);
}
function conf() {
    swal({
        title: "Are you sure?",
        text: "You will not be able to recover this imaginary file!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Yes, delete it!",
        cancelButtonText: "No, cancel plx!",
        closeOnConfirm: false,
        closeOnCancel: false
    }, function (isConfirm) {
        if (isConfirm) {
            swal("Deleted!", "Your imaginary file has been deleted.", "success");
        } else {
            swal("Cancelled", "Your imaginary file is safe :)", "error");
        }
    });
}
