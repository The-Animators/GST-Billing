<!-- .right-sidebar -->
<div class="right-sidebar">
    <div class="slimscrollright">
        <div class="rpanel-title"> Service Panel <span><i class="ti-close right-side-toggle"></i></span> </div>
        <div class="r-panel-body">
            <ul>
                <li><b>Layout Options</b></li>
                <li>
                    <div class="checkbox checkbox-info">
                        <input id="checkbox1" type="checkbox" class="fxhdr">
                        <label for="checkbox1"> Fix Header </label>
                    </div>
                </li>
                <li>
                    <div class="checkbox checkbox-warning">
                        <input id="checkbox2" type="checkbox" class="fxsdr">
                        <label for="checkbox2" > Fix Sidebar </label>
                    </div>
                </li>
                <li>
                    <div class="checkbox checkbox-success">
                        <input id="checkbox4" type="checkbox" class="open-close">
                        <label for="checkbox4" > Toggle Sidebar </label>
                    </div>
                </li>
            </ul>
            <ul id="themecolors" class="m-t-20">
                <li><b>With Light sidebar</b></li>
                <li><a href="javascript:void(0)" theme="default" class="default-theme working">1</a></li>
                <li><a href="javascript:void(0)" theme="green" class="green-theme">2</a></li>
                <li><a href="javascript:void(0)" theme="gray" class="yellow-theme">3</a></li>
                <li><a href="javascript:void(0)" theme="blue" class="blue-theme">4</a></li>
                <li><a href="javascript:void(0)" theme="purple" class="purple-theme">5</a></li>
                <li><a href="javascript:void(0)" theme="megna" class="megna-theme">6</a></li>

            </ul>

        </div>
    </div>
</div>
<!-- /.right-sidebar -->
</div>
</div>
</div>


<!-- Menu Plugin JavaScript -->
<script src="<?php echo base_url() ?>components/sidebar-nav/dist/sidebar-nav.min.js"></script>
<!--slimscroll JavaScript -->
<script src="<?php echo base_url() ?>js/jquery.slimscroll.js"></script>
<!--Wave Effects -->
<script src="<?php echo base_url() ?>components/jquery-sparkline/jquery.sparkline.min.js"></script>
<script src="<?php echo base_url() ?>components/jquery-sparkline/jquery.charts-sparkline.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<?php echo base_url() ?>js/custom.min.js"></script>
<script src="<?php echo base_url() ?>components/sweetalert/sweetalert.min.js"></script>
<!-- Image cropper JavaScript -->
<script src="<?php echo base_url() ?>components/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script>
 jQuery('.mydatepicker, #datepicker').datepicker();
    $(".datepicker-autoclose").datepicker({
    autoclose: true,
            todayHighlight: true,
            maxDate: new Date(),
            Formet:'YYYY-mm-dd'
    });
   </script>


</body>
</html>
