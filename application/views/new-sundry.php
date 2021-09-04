<!-- .row -->
<div class="row">
    <div class="col-sm-12">
        <div class="white-box">
            <form>
                <div class="row">
                    <div class="form-body">                       
                        <div class="col-sm-12">
                            <div class=" col-md-12 hidden">
                                <div class="col-md-8"> <h3 class="box-title m-b-0">New Damage / Return</h3> </div>
                                <div class="col-md-4 text-right">

                                    <select style="width:200px;display: inline;" name="month" id="month"  class="form-control">
                                        <option value="Damage">Damage</option>
                                        <option value="Return">Return</option>
                                    </select> 
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table class="table table-striped borderless" id="producttable">
                                        <thead>
                                            <tr>
                                                <th>PRODUCT ID</th>
                                                <th>PRODUCT NAME</th>
                                                <th>QUANTITY</th>
                                                <th>UNIT</th>
                                                <th>PRICE Rs</th>
                                                <th>TOTAL Rs</th>
                                                <th>DESCRIPTION</th>
                                                <th class="text-nowrap">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><div class="the-basics">
                                                    <input list="prdlist" required="" autofocus="" id="n0" class="typeahead form-control tt-input prid">
                                                </div>
                                                <input name="prodid_[]" type="hidden" id="ni_0">
                                                <input name="pdid[]" type="hidden" id="ni0">
                                                <input name="hsn[]" type="hidden" id="hsn0"></td>
                                                <td>
                                                    <input name="prodname[]" tabindex="-1" readonly="" required="" id="prodname0" class="form-control"><input name="bid[]" type="hidden" id="bid0">
                                                </td>
                                                <td>
                                                    <input name="stock[]" value="0" onkeyup="limit(this, 4);maxv(this, this.max);calculates(0);" id="stock0" class="form-control">
                                                </td>
                                                <td>
                                                    <input name="unit[]" value=""  tabindex="-1" id="unit0" readonly="" class="form-control">
                                                </td>
                                                <td><input name="price[]" value="0"  tabindex="-1" readonly="" onchange="limit(this, 8);" id="price0" class="form-control"></td>
                                                <td><input name="total[]" value="0"  tabindex="-1" readonly="" onchange="limit(this, 8);" id="total0" class="form-control"></td>
                                                <td><input name="description[]"  id="description0" class="form-control"></td>
                                                <td class="text-nowrap"><a onclick="del(this)" data-toggle="tooltip" data-original-title="Close"> <i class="fa fa-close text-danger"></i> </a></td>
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
                            <button type="button" id="submit" class="btn btn-success waves-effect waves-light m-r-10">Submit</button>                     
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="<?php echo base_url() ?>js/sundry.js"></script>
<link href="<?php echo base_url() ?>components/typeahead.js-master/dist/typehead-min.css" rel="stylesheet" />

