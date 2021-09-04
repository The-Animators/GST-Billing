<!-- /.row -->
<div class="row">
    <div class="col-md-12">
        <div class="panel panel-info">
            <div class="panel-heading">GST EXCEL</div>
            <div class="panel-wrapper collapse in" aria-expanded="true">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label">SALES EXCEL TYPE</label>
                                <select name="exceltype"  id="exceltype" class="form-control">
                                    <option value="">Select Excel</option>
                                    <optgroup label="Purchase">  
                                    <option value="purchaselistexcel">B 2 B</option>
                                   </optgroup>
                                   <optgroup  label="Sales">
                                    <option value="btobgstexcel">B 2 B</option>
                                    <option value="btocsgstexcel">B 2 CS</option>
                                    <!--option value="btoclgstexcel">B 2 CL</option-->
                                   </optgroup>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label">Date of Month</label>
                                <select name="month" id="month"  class="form-control">
                                    <option value="">Select Month</option>
                                    <option value="01">Jan</option>
                                    <option value="02">Feb</option>
                                    <option value="03">Mar</option>
                                    <option value="04">Apr</option>
                                    <option value="05">May</option>
                                    <option value="06">Jun</option>
                                    <option value="07">Jul</option>
                                    <option value="08">Aug</option>
                                    <option value="09">Sep</option>
                                    <option value="10">Oct</option>
                                    <option value="11">Nov</option>
                                    <option value="12">Dec</option>
                                </select> 
                            </div>
                        </div>
                        <!--/span-->
                        <div class="col-md-4 text-right">
                            <br>
                            <button type="button" id="getexcel" class="btn btn-success waves-effect waves-light m-r-10">GET EXCEL</button>  
                        </div>                 
                        <!--/row-->                 
                        <hr> 
                    </div>                   
                </div>
            </div>
        </div>
    </div>
    <style>table{border:1px solid #000;}</style>
<script>
    $(document).ready(function() {
        
        $('#getexcel').click(function() {
            var type = $("#exceltype").val();
            var url = "<?php echo site_url(); ?>"+type+'/'+$("#month").val();
            if (type != "") {
               // $.post(url,{"type": type,"rdate": date}, function(data){
                //    alert(data);
               // });
               window.open(url);
            }

        });
    });</script>