  <link href="<?php echo base_url() ?>components/typeahead.js-master/dist/typehead-min.css" rel="stylesheet">
  <script language="JavaScript">
    $(document).ready(function () {
        var ctx1 = document.getElementById("chart1").getContext("2d");
        var data1 = {
            labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
            datasets: [
                {
                    label: "Purchase",
                    fillColor: "#fcc9ba",
                    strokeColor: "#fcc9ba",
                    pointColor: "#fcc9ba",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "#fcc9ba",
                    data: [<?php echo $lists['puryear'] ?>]
                },
                {
                    label: "Sales",
                    fillColor: "#6bbe93",
                    strokeColor: "#6bbe93",
                    pointColor: "#6bbe93",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "#6bbe93",
                     data: [<?php echo $lists['year'] ?>]
                }, {
                    label: "Damage",
                    fillColor: "#f7ca00",
                    strokeColor: "#f7ca00",
                    pointColor: "#f7ca00",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke:"#f7ca00",
                    data: [<?php echo $lists['damyear'] ?>]
                }
            ]
        };

        var chart1 = new Chart(ctx1).Line(data1, {
            scaleShowGridLines: true,
            scaleGridLineColor: "rgba(0,0,0,.005)",
            scaleGridLineWidth: 0,
            scaleShowHorizontalLines: true,
            scaleShowVerticalLines: true,
            bezierCurve: true,
            bezierCurveTension: 0.4,
            pointDot: true,
            pointDotRadius: 4,
            pointDotStrokeWidth: 1,
            pointHitDetectionRadius: 2,
            datasetStroke: true,
            tooltipCornerRadius: 2,
            datasetStrokeWidth: 2,
            datasetFill: true,
            legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].strokeColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>",
            responsive: true
        });
        var ctx2 = document.getElementById("chart2").getContext("2d");
        var data2 = {
            labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
            datasets: [
                {
                    label: "My First dataset",
                    fillColor: "rgba(252,201,186,0.8)",
                    strokeColor: "rgba(252,201,186,0.8)",
                    highlightFill: "rgba(252,201,186,1)",
                    highlightStroke: "rgba(252,201,186,1)",
                    data: [<?php echo $lists['puryear'] ?>]
                },
                {
                    label: "My Second dataset",
                    fillColor: "#6bbe93",
                    strokeColor: "#6bbe93",
                    highlightFill: "#6bbe93",
                    highlightStroke: "#6bbe93",
                    data: [<?php echo $lists['year'] ?>]
                }
            ]
        };

        var chart2 = new Chart(ctx2).Bar(data2, {
            scaleBeginAtZero: true,
            scaleShowGridLines: true,
            scaleGridLineColor: "rgba(0,0,0,.005)",
            scaleGridLineWidth: 0,
            scaleShowHorizontalLines: true,
            scaleShowVerticalLines: true,
            barShowStroke: true,
            barStrokeWidth: 0,
            tooltipCornerRadius: 2,
            barDatasetSpacing: 3,
            legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].fillColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>",
            responsive: true
        });

        var ctx3 = document.getElementById("chart3").getContext("2d");
        var data3 = [
            {
                value: <?php if ($lists['sales'] > 0) {
    echo $lists['sales'];
} else {
    echo '0';
} ?>,
                color: "#6bbe93",
                highlight: "#6bbe93",
                label: "Sales"
            },
            {
                value: <?php if ($lists['sundry'] > 0) {
    echo $lists['sundry'];
} else {
    echo '0';
} ?>,
                color: "#f7ca00",
                highlight: "#f7ca00",
                label: "Sundry"
            },
            {
                value: <?php if ($lists['purchase'] > 0) {
    echo $lists['purchase'];
} else {
    echo '0';
} ?>,
                color: "#fcc9ba",
                highlight: "#fcc9ba",
                label: "Purchase"
            }
        ];

        var myPieChart = new Chart(ctx3).Pie(data3, {
            segmentShowStroke: true,
            segmentStrokeColor: "#fff",
            segmentStrokeWidth: 0,
            tooltipCornerRadius: 0,
            animationEasing: "easeOutBounce",
            animateRotate: true,
            animateScale: false,
            legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<segments.length; i++){%><li><span style=\"background-color:<%=segments[i].fillColor%>\"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>",
            responsive: true
        });





    });
</script>
<script src="<?php echo base_url() ?>components/raphael/raphael-min.js"></script>
<script src="<?php echo base_url() ?>components/Chart.js/Chart.min.js"></script>
<div class="row">
    <div class="col-sm-6">
        <div class="white-box">
            <h3 class="box-title">Year Of Sales & Purchase</h3>
            <div>
                <canvas id="chart2" height="150"></canvas>
            </div>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="white-box">
            <h3 class="box-title">Month Of Shop</h3>
            <div>
                <canvas id="chart3"  height="150"></canvas>
            </div>
        </div>
    </div>
<div class="row">
    <div class="col-sm-12" >
        <div class="white-box">
            <h3 class="box-title">Year Of Shop</h3>
            <div>
                <canvas id="chart1" height="150"></canvas>
            </div>
        </div>
    </div>
</div>
</div>

