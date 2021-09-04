/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function() {
       
        var gurl = $("#siteurl").attr("content");
        $(".addb").click(function() {
            $("#saves").removeClass('hidden');
            $("#update").addClass('hidden');
            $(".modal-footer").removeClass('hidden');
            $(".modal-title").text("New Bank Details");
            $("#date").val('').attr('readonly', false);
            $("#bankname").val('').attr('readonly', false);
            $("#branch").val('').attr('readonly', false);
            $("#acno").val('').attr('readonly', false);
            $("#acname").val('').attr('readonly', false);
            $("#ifsccode").val('').attr('readonly', false);
            $("#balacne").val('').attr('readonly', false);
            $("#companyid").val('').attr('readonly', false);
            $("#balop").removeClass('hidden');
        });
        $(".edit").click(function() {
             var bankid = $(this).attr('data');
            $("#saves").addClass('hidden');
            $("#update").removeClass('hidden');
            $(".modal-footer").removeClass('hidden');
            $(".modal-title").text("Update Bank Details");
            var url = gurl + 'bank-details';
            $.ajax({
                url: url,
                type: 'POST',
                ContentType: 'application/json',
                 data: {"bankid": bankid},
                success: function(result) {
                   $("#date").val(result[0].date).attr('readonly', false);
                    $("#bankname").val(result[0].bankname).attr('readonly', false);
                    $("#branch").val(result[0].branch).attr('readonly', false);
                    $("#acno").val(result[0].acno).attr('readonly', false);
                    $("#acname").val(result[0].acname).attr('readonly', false);
                    $("#ifsccode").val(result[0].ifsccode).attr('readonly', false);
                     $("#balacne").val(result[0].bankid).attr('readonly', false);
                    $("#companyid").val(result[0].companyid).attr('readonly', false);
                    $("#balop").addClass('hidden');
                },
                fail: function(result) {
                    swal(result);
                }
            });
        });
        $(".view").click(function() {
            var bankid = $(this).attr('data');
            $(".modal-footer").addClass('hidden');
            $(".modal-title").text("Bank Details");
            var url = gurl + 'bank-details';           
            $.ajax({
                url: url,
                type: 'POST',
                ContentType: 'application/json',
                data: {"bankid": bankid},
                success: function(result) {
                     console.log(result[0]);
                    $("#date").val(result[0].date).attr('readonly', true);
                    $("#bankname").val(result[0].bankname).attr('readonly', true);
                    $("#branch").val(result[0].branch).attr('readonly', true);
                    $("#acno").val(result[0].acno).attr('readonly', true);
                    $("#acname").val(result[0].acname).attr('readonly', true);
                    $("#ifsccode").val(result[0].ifsccode).attr('readonly', true);
                    $("#companyid").val(result[0].companyid).attr('readonly', true);
                    $("#balacne").val(result[0].balacne).attr('readonly', true);
                    $("#balop").addClass('hidden').attr('readonly', true);
                },
                fail: function(result) {
                    swal(result);
                }
            });
        });
        $("#saves").click(function() {
        
            if ($("#bankname").val() == '') {
                swal('Please Fill Bank Name')
                return;
            }
            if ($("#acno").val() == '') {
                swal('Please Fill A/C No')
                return;
            }
            if ($("#acname").val() == '') {
                swal('Please Fill A/C Name')
                return;
            }
            var url = gurl + 'save-bank';
            $.ajax({
                url: url,
                type: 'POST',
                ContentType: 'application/json',
                data: $("#sall").serialize(),
                success: function(result) {
                    //console.log(result)
                    setTimeout(function() {
                        location.reload();
                    }, 800);
                },
                fail: function(result) {
                    swal(result);
                }
            });
        });
        $("#update").click(function() {
            if ($("#bankname").val() == '') {
                swal('Please Fill Bank Name')
                return;
            }
            if ($("#acno").val() == '') {
                swal('Please Fill A/C No')
                return;
            }
            if ($("#acname").val() == '') {
                swal('Please Fill A/C Name')
                return;
            }
            var url = gurl + 'update-bank';
            $("#sall").serialize()
            $.ajax({
                url: url,
                type: 'POST',
                ContentType: 'application/json',
                data: $("#sall").serialize(),
                success: function(result) {
                    //console.log(result);
                    setTimeout(function() {
                        location.reload();
                    }, 800);
                },
                fail: function(result) {
                    swal(result);
                }
            });
        });

    });

