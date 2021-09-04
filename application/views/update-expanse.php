<script>
    $(document).ready(function(e) {
        $("#gstids").css("display", 'none');
$("#exptype").val('<?php echo $lists[0]->eptype ?>');
        $("#exptype").change(function(e) {
            var type = $(this).val();
            if (type == "New") {
                $("#gstids").css("display", 'block');
            } else {
                $("#gstids").css("display", 'none');
            }
        });
    });
</script>
<!-- /.row -->
<div class="row">
    <div class="col-md-12">
        <div class="panel panel-info">
            <div class="panel-heading"> Update Expense</div>
            <div class="panel-wrapper collapse in" aria-expanded="true">
                <div class="panel-body">
                    <?php echo form_open('update-expense/'.$this->uri->segment(2));  ?> 
                    <div class="row">
                        <div class="col-md-4">

                            <div class="form-group">
                                <label>Expense</label>
                                <div class="input-group">
                                    <div class="input-group-addon">Rs</div>
                                    <input type="number" name="amount" required="" value="<?php echo $lists[0]->amount?>" id="amount"  class="form-control"  placeholder="Expense Amount"> </div>
                            </div>
                            <div class="form-group">
                                <label>Date</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="icon-calender"></i></span> 
                                    <input type="date" name="date" required="" value="<?php echo $lists[0]->date?>" class="form-control" placeholder="dd-mm-yyyy">
                                    </div>
                            </div>
                        </div>
                         <div class="col-md-4">
                            <div class="form-group" >
                                <label class="control-label">EXP TYPE</label>
                                <select name="exptype" id="exptype" class="form-control" >
                                    <?php foreach ($glists as $list) { ?>
                                        <option value="<?php echo $list->id ?>"><?php echo $list->exptype ?></option>
                                    <?php } ?>
                                    <option value="New">New</option>
                                </select>
                            </div>
                            <div class="form-group" id="gstids" >
                                <div class="m-b-10">
                                    <label class="control-label">NEW EXP TYPE</label>
                                    <input name="exptypes"   id="exptypes"  placeholder="NEW EXP TYPE" class="form-control" />
                                </div>
                            </div>
                        </div>
                        <!--/span-->
                        <div class="col-md-4">
                           
                            <div class="form-group">
                                <label>Description</label>
                                <div class="input-group">
                                     <span class="input-group-addon"><i class="icon-speech"></i></span>
                                    <textarea type="text" rows="5" name="description"  class="form-control" placeholder="Expense Description"><?php echo $lists[0]->description?></textarea>
                                    </div>
                            </div>
                        </div>                 
                        <!--/row-->                 
                        <div class="text-right">
                            <button type="reset" class="btn btn-inverse waves-effect waves-light cancel">Cancel</button>
                            <button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Add</button>                   
                        </div>
                        <hr> 
                    </div>
                    <?php echo form_close(); ?> 

                </div>
            </div>
        </div>
    </div>
