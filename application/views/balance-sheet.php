<div class="row">
    <div class="panel panel-info">
        <div class="panel-body">
                    <div class="form-horizontal">
    <div class="col-md-12">
        <?php echo form_open('balance-sheet'); ?> 
        <div class=" col-md-12">
            <div class="col-md-2">
                <select  id="month" name="month" class="form-control">
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
                <div class="col-md-2">
                        <select  id="tomonth" name="tomonth" class="form-control">
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
                <script>
                        $("#month").val('<?php echo $this->input->post('month'); ?>');
                        $("#tomonth").val('<?php  echo $this->input->post('tomonth');?>');
               </script>
            <div class="col-md-8 text-right">
                <button type="reset" class="btn btn-inverse waves-effect waves-light cancel">Cancel</button>
                <button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Search</button>  
            </div>
        </div>       
        <?php echo form_close(); ?> 
        </div>
        </div>
        </div>
    </div>
    <div class="col-md-12">
        <div class="panel panel-info" id="ta">
            <div class="panel-heading" style="background: #76838f">TRADING ACCOUNT<span style="float: right;cursor: pointer" onclick="printspage('ta')"><i class="fa fa-print no-print"></i></span></div>
            <div class="panel-wrapper collapse in" aria-expanded="true">
                <div class="panel-body">
                    <div class="form-horizontal">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th colspan="2"><h3 class="text-center" >EXPENDITURE </h3>
                                    <div class="text-right" >01-<?php echo date('M-Y',  strtotime($ilists[0]->date))?></div></th>
                                    <th class="text-center" colspan="2"><h3>INCOME</h3>
                                    <div class="text-right" ><?php $edndate= cal_days_in_month(CAL_GREGORIAN,$this->input->post('tomonth'),date('Y',  strtotime($ilists[0]->date))).'-'.date('M-Y',  strtotime(date('Y-'.$this->input->post('tomonth').'-d')));echo $edndate;?></div></th>
                                 </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>OPENING STOCK</td>
                                    <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php  $total=0; if($ilists[0]->copstock>0){ $total+=$ilists[0]->copstock; echo round($ilists[0]->copstock); }else{ echo 0;}?></td>
                                <td>SALES</td>
                                    <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php $ctotal=0; if($ilists[0]->msbal>0){  $ctotal+=$ilists[0]->msbal; echo round($ilists[0]->msbal); }else{ echo 0;}?></td>
                                </tr>
                                 <tr>
                                    <td>PURCHASE</td>
                                    <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php  if($ilists[0]->mpbal>0){ $total+=$ilists[0]->mpbal; echo round($ilists[0]->mpbal); }else{ echo 0;}?></td>
                                <td>CLOSING STOCK</td>
                                    <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php if($ilists[0]->cclstock>0){  $ctotal+=$ilists[0]->cclstock; echo round($ilists[0]->cclstock); }else{ echo 0;}?></td>
                                </tr>
                                 <tr>
                                    <td>GROSS PROFIT TFD TO P&L A/C</td>
                                    <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php   $val=round($ctotal-$total,0);echo $val;?></td>
                                    <td>&nbsp;</td><td class="font-500"> &nbsp;</td>                                
                                </tr>
                                 <tr>
                                     <td class="font-500 text-right" colspan="2"><h4 style="display: inline"> Total :: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4><b><u><i class="fa fa-rupee"></i>  <?php echo $val+$total;?></u></b></td>
                                     <td  class="font-500 text-right" colspan="2"><h4 style="display: inline">   Total :: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4><b><u><i class="fa fa-rupee"></i>  <?php echo $ctotal;?></u></b></td>
                                </tr>
                            </tbody>                            
                        </table>                      
                    </div>
                </div>
            </div>
        </div>
       <div class="panel panel-info" id="pla">
            <div class="panel-heading" style="background: #76838f">PROFIT & LOSS  ACCOUNT <span style="float: right;cursor: pointer" onclick="printspage('pla')"><i class="fa fa-print no-print"></i></span></div>
            <div class="panel-wrapper collapse in" aria-expanded="true">
                <div class="panel-body">
                    <div class="form-horizontal">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th colspan="2"><h3 class="text-center" >EXPENDITURE </h3>
                                    <div class="text-right" >01-<?php echo date('M-Y',  strtotime($ilists[0]->date))?></div></th>
                                    <th class="text-center" colspan="2"><h3>INCOME</h3>
                                    <div class="text-right" ><?php echo $edndate;?></div></th>
                                 </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><?php echo $elists[0]['exptype'];?></td>
                                    <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php  $etotal=$elists[0]['amt']; echo round($elists[0]['amt']);?></td>
                               <td rowspan="<?php echo count($elists)+2; ?>">BY GROSS PROFIT TFD TO P&L A/C</td>
                               <td class="font-500  text-right" rowspan="<?php echo count($elists)+2; ?>"> <i class="fa fa-rupee"></i> <?php  echo $val;?></td>
                                    
                                </tr>
                                <?php for($i=1;$i<count($elists);$i++){?>
                                 <tr>
                                    <td><?php echo $elists[$i]['exptype'];?></td>
                                    <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php  $etotal+=$elists[$i]['amt']; echo round($elists[$i]['amt']);?></td>
                                </tr>
                                <?php  }?>
                                <tr>
                                    <td>EMPLOYEE SALARY</td>
                                    <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php  $etotal+=$lists['salary']; echo round($lists['salary']);?></td>
                                </tr><tr>
                                    <td>DAMAGE PRODUCT</td>
                                    <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php   $etotal+=$lists['sundry']; $prof=$val-$etotal; echo round($lists['sundry']);?></td>
                                </tr>
                                 <tr>
                                    <td>NET <?php if($prof>0){echo 'PROFIT';}else{echo 'LOSS';} ?> TFD TO CAPITAL A/C</td>
                                    <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php if($prof<0){echo -1*$prof;}else{echo $prof;}$etotal+=$prof;?></td>
                                    <td>&nbsp;</td><td class="font-500"> &nbsp;</td>                                
                                </tr>
                                 <tr>
                                     <td class="font-500 text-right" colspan="2"><h4 style="display: inline"> Total :: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4><b><u><i class="fa fa-rupee"></i>  <?php echo $etotal;?></u></b></td>
                                     <td  class="font-500 text-right" colspan="2"><h4 style="display: inline">   Total :: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4><b><u><i class="fa fa-rupee"></i>  <?php echo $val;?></u></b></td>
                                </tr>
                            </tbody>                            
                        </table>                      
                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-info" id="lad">
            <div class="panel-heading" style="background: #76838f">LADGER <span style="float: right;cursor: pointer" onclick="printspage('lad')"><i class="fa fa-print no-print"></i></span></div>
            <div class="panel-wrapper collapse in" aria-expanded="true">
                <div class="panel-body">
                    <div class="form-horizontal">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th colspan="2"><!--h3 class="text-center" >EXPENDITURE </h3-->
                                    <div class="text-right" >01-<?php echo date('M-Y',  strtotime($ilists[0]->date))?></div></th>
                                    <th class="text-center" colspan="2"><!--h3>INCOME</h3-->
                                    <div class="text-right" ><?php  echo $edndate;?></div></th>
                                 </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><?php echo $edndate;$clbal=$ilists[0]->acclbal-$ilists[0]->loanclbal;$opbal=$ilists[0]->acopbal-$ilists[0]->loanopbal; ?> : <?php $prf=$clbal-$opbal; if($prf<0){echo 'TRS-WITHHROWAL A/C';}else{echo 'TRS-DEPOSIT A/C';} ?></td>
                                    <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php $pr = $prf;if($prf<0){$pr=-1*$prf;}  echo $pr;?></td>
                                    <td >01-<?php echo date('M-Y',  strtotime($ilists[0]->date))?> : OPENING BALANCE</td>
                               <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php echo $opbal;?></td>                                    
                                </tr>
                                <tr>
                                    <td><?php echo $edndate; $cashac=$prof-$prf;?> : TRS-<?php  $cash=$cashac; if($cashac<0){echo 'LOANS';$cash=-1*$cashac;}else{echo 'CASH';}?> A/C</td>
                                    <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php echo $cash;?></td>
                                     <td><?php  $dif=$prof+$opbal; echo $edndate ?> : <?php if($prof>0){echo 'PROFIT';}else{echo 'LOSS';} ?></td>
                                    <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php    echo $prof;?></td>                                
                                </tr>                                
                                <tr>
                                  <td><?php echo $edndate ?> : CLOSING BALANCE</td>
                                    <td class="font-500  text-right"> <i class="fa fa-rupee"></i>  <?php   echo $clbal;?></td>
                                    <td>&nbsp;</td><td>&nbsp;</td>
                                </tr>
                                 <tr>
                                     <td class="font-500 text-right" colspan="2"><h4 style="display: inline"> Grand Total :: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4><b><u><i class="fa fa-rupee"></i>  <?php echo $dif;?></u></b></td>
                                     <td  class="font-500 text-right" colspan="2"><h4 style="display: inline">   Grand Total :: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4><b><u><i class="fa fa-rupee"></i>  <?php echo $dif;?></u></b></td>
                                </tr>
                            </tbody>                            
                        </table>                      
                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-info" id="bal">
            <div class="panel-heading" style="background: #76838f">BALANCE SHEET  AT <?php echo $edndate?><span style="float: right;cursor: pointer" onclick="printspage('bal')"><i class="fa fa-print no-print"></i></span></div>
            <div class="panel-wrapper collapse in" aria-expanded="true">
                <div class="panel-body">
                    <div class="form-horizontal">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th colspan="2"><h3 class="text-center" >LIABILITIES </h3>
                            <div class="text-right" ><?php echo $edndate?></div></th>
                                    <th class="text-center" colspan="2"><h3>ASSETS</h3>
                        <div class="text-right" ><?php  echo $edndate;?></div></th>
                                 </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>CAPITAL</td>
                                    <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php $liamt=$slists[0]->capital;echo $slists[0]->capital;?></td>
                                    <td >FIXED ASSETS</td>
                                    <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php $aliamt=$lists['fixpay'];echo $lists['fixpay'];?></td>
                                </tr>
                               <tr>
                                    <td>UNSECURED LOANS</td>
                                    <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php  $liamt+=$lists['credit']+$lists['acdrbalacne'];echo $lists['credit']+$lists['acdrbalacne'];?></td>
                                     <td>DAMAGE DEBIT FOR GOODS</td>
                                     <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php  $aliamt+=round($lists['dramountall']);echo round($lists['dramountall']);?></td>
                                </tr>
                                <tr>
                                     <td>DAMAGE CREDITORS FOR GOODS</td>
                                     <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php  $liamt+=$lists['sundryall']+$lists['cramountall'];echo $lists['sundryall']+$lists['cramountall'];?></td>
                                     <td>STOCK IN TRADE</td>
                                     <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php  $aliamt+=round($lists['stock']);echo round($lists['stock']);?></td>
                                </tr>
                                 <tr>
                                     <td>EXPENSE PAYABLE</td>
                                     <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php $liamt+=$lists['exppay'];echo $lists['exppay'];?></td>
                                     <td>BANK BALANCE</td>
                                     <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php  $aliamt+=round($lists['accrbalacne']);echo round($lists['accrbalacne']);?></td>                              
                                </tr>
                                <tr>
                                    <td>&nbsp;</td><td>&nbsp;</td><td>CASH ON HAND</td>
                                     <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php  $aliamt+=round($lists['cash']);echo round($lists['cash']);?></td>                              
                                </tr>
                                <tr>
                                    <td>&nbsp;</td><td>&nbsp;</td><td>DEPOSITS & ADVANCE</td>
                                     <td class="font-500  text-right"> <i class="fa fa-rupee"></i> <?php  $aliamt+=round($lists['advance']);echo round($lists['advance']);?></td>                              
                                </tr>
                                 <tr>
                                     <td class="font-500 text-right" colspan="2"><h4 style="display: inline"> Grand Total :: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4><b><u><i class="fa fa-rupee"></i>  <?php echo $liamt;?></u></b></td>
                                     <td  class="font-500 text-right" colspan="2"><h4 style="display: inline">   Grand Total :: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4><b><u><i class="fa fa-rupee"></i>  <?php echo $aliamt;?></u></b></td>
                                
                                </tr>
                            </tbody>                            
                        </table>                      
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> 
<script>
function printspage(myid){
    $(".table > thead > tr > th,.table > tbody > tr > td,.table > tfoot > tr > th").css("font-size", "11px").css("line-height", "14px").css("padding", "5px 2px 5px 2px"); 
        $("#"+myid).print({
                globalStyles: true,
                mediaPrint: false,
                stylesheet: null,
                noPrintSelector: ".no-print",
                iframe: true,
                append: null,
                prepend: null,
                manuallyCopyFormValues: true,
                deferred: $.Deferred(),
            });
$(".table > thead > tr > th,.table > tbody > tr > td,.table > tfoot > tr > th").css("font-size", "14px").css("padding", "15px 8px");
}
</script>
