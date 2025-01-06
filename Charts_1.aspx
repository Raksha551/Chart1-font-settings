<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Charts_1.aspx.cs" Inherits="Practice_Tasks.Charts_1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bar Race Highchart</title>
    <!-- Include Highcharts Library -->
   

    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/highcharts-more.js"></script>
    <script src="https://code.highcharts.com/modules/solid-gauge.js"></script>
    <script src="https://code.highcharts.com/modules/series-label.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
    <style>
        body {
            margin: 0;
            padding: 0;
            width: 99%;
        }

        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: blue;
            color: white;
            height: 60px;
            width: 101%;
            margin-bottom: 10px;
        }

        .header-left,
        .header-right {
            width: 80px;
            height: 70px;
            display: flex;
        }

        .header-title {
            padding-left: 260px;
            font-size: 30px;
            font-weight: bold;
            text-align: center;
            line-height: 40px;
            flex-grow: 1;
        }

        .header-right-section {
            display: flex;
            align-items: end;
            gap: 10px;
            justify-items: end;
            padding-right: 28px;
        }

        .header-info {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            text-align: right;
            justify-content: end;
            justify-items: flex-end
        }

        #currentDate {
            font-size: 20px;
            font-weight: bold;
        }

        .header-text {
            font-size: 20px;
            padding-right: 42px;
        }

        .header-settings-icon {
            width: 40px;
            height: 40px;
            cursor: pointer;
            padding-left: 16px;
            padding-bottom: 4px;
        }

        .tablecharts tr {
            height: 180px !important;
        }


      #container21, #container22, #container23 {
    flex: 1;
    height: 210px;
    width: 190px;
    gap: 0px;
    padding: 0;
    margin: 0 !important;
    flex-basis: 33%;
}

       .charts-container {
    display: flex;
    height: 180px;
    margin: 0;
    padding: 0;
    width: 810px;
    margin-top: 0px;
}

        .lefttd, .righttd {
            border-left: 2px solid #ddd;
            border-right: 2px solid #ddd;
            border-bottom: 2px solid #ddd;
            border-radius: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            background: linear-gradient(to bottom, rgba(221, 221, 221, 0.5), #fff 10%);
            margin-bottom: 0px;
        }

        .metrics-panel {
            width: 80%;
            margin: 20px auto;
            font-family: Arial, sans-serif;
        }

        .metric {
            margin-bottom: 15px;
        }

        .label {
            font-weight: bold;
        }

        .progress-bar {
            width: 100%;
            background-color: #e6e6e6;
            border-radius: 5px;
            overflow: hidden;
            height: 20px;
            position: relative;
        }

        .progress-fill {
            height: 100%;
            border-radius: 5px;
            background-color: #125999
        }

        span {
            display: inline-block;
            margin-left: 10px;
            font-weight: bold;
        }

        .lefttd {
            display: flex;
            margin-left: 16px;
            margin-right: 20px;
           width:800px;
            margin-top:0px !important;
        }

        .righttd {
            width: 1000px;
            
            margin-top:0px !important;
            padding-top:0px;
             position: relative; 
        }

        .range {
            width: 500px;
            margin-top: 80px;
            margin-right: 10px;
        }

        #container1 {
            width: 50%;
            height: 300px;
            margin-left: 25px;
            margin-right: 0px;
        }

        #container {
            border-left: 2px solid #ddd;
            border-right: 2px solid #ddd;
            border-bottom: 2px solid #ddd;
            border-radius: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }

        .name, .availdata {
            display: inline-flex;
        }

        .availdata {
            padding-left: 270px;
        }

        .perform, .performdata {
            display: inline-flex;
        }

        .performdata {
            padding-left: 270px;
        }

        .quality, .qualitydata {
            display: inline-flex;
        }

        .qualitydata {
            padding-left: 300px;
        }

        .name, .perform, .quality {
        }

        .footer {
            background-color: #486ab7;
            color: white;
            padding: 15px 20px;
            position: fixed;
            bottom: 0;
            width: 100%;
            height: 38px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0px -2px 5px rgba(0, 0, 0, 0.2);
        }

        .footer-left {
            font-size: 14px;
        }

        .footer-center-container {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #004080;
            color: white;
            padding: 8px;
            height: 18px;
            padding-top: 16px;
            padding-bottom: 16px;
            font-size: 18px;
            box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.3);
            width: 80%;
            margin: 10px auto;
            text-align: center;
            overflow: hidden;
            position: relative;
        }


        .footer-right img {
            height: 50px;
            margin-left: 10px;
            margin-right: 35px;
        }

        .scrolling-wrapper {
            width: 100%; /* Make this width as required or use a fixed width */
            overflow: hidden; /* This ensures any overflowing text gets cut off */
            position: relative;
        }

        .scrolling-text {
            white-space: nowrap;
            animation: scroll-text 10s linear infinite;
        }

        @keyframes scroll-text {
            0% {
                transform: translateX(350%);
            }

            100% {
                transform: translateX(-350%); /* Move to the left */
            }
        }

        #HyperLink1 {
            width: 6px;
            height: 6px;
        }

        .rightlabel {
         margin: 0 !important; /* Ensure no margin around the label */
    padding: 0 !important; /* Ensure no padding around the label */
    font-weight: bold;
    position: absolute; /* Allows precise positioning */
    top: 20px; /* Align the label with the top of the container */
    left: 10px; /* Slight left margin for alignment */
    transform: translateY(-50%); 
        }
        #container21{
           
            margin-top:0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header-container">
            <img src=".\Images\AmiTLogo.jpg" class="header-left" alt="Left Icon" />
            <div class="header-title">
                Andon
            </div>
            <div class="header-right-section">
                <div class="header-info">
                    <span id="currentDate"></span>
                    <div class="header-text">SHIFT-B</div>
                </div>
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="./Images/settings.png"
                    OnClick="ImageButton1_Click" class="header-settings-icon" />


            </div>
            <img src=".\Images\AmiTLogo.jpg" class="header-right" alt="Left Icon" />
        </div>
        <table class="tablecharts">
            <tr>
                <td class="lefttd">
                    <div id="container1"></div>
                    <div class="range">
                        <asp:Repeater ID="Repeator" runat="server">
                            <ItemTemplate>
                                <div class="metric">
                                    <label class="name">Availability</label>
                                    <label class="availdata"><%# Eval("AvailabilityData") %></label>
                                    <div class="progress-bar">
                                        <div id="AvailabilityBar" class="progress-fill" style='<%# Eval("AvailabilityValue") %>'></div>
                                    </div>
                                </div>
                                <div class="metric">
                                    <label class="name">Performance</label>
                                    <label class="performdata"><%# Eval("PerformanceData") %></label>
                                    <div class="progress-bar">
                                        <div id="PerformanceBar" class="progress-fill" style='<%# Eval("PerformanceValue") %>'></div>
                                    </div>
                                </div>
                                <div class="metric">
                                    <label class="name">Quality</label>
                                    <label class="qualitydata"><%# Eval("QualityData") %></label>
                                    <div class="progress-bar">
                                        <div id="QualityBar" class="progress-fill" style='<%# Eval("QualityValue") %>'></div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </td>               
                <td class="righttd">
                   <asp:label runat="server" class="rightlabel" >Cell Wise OEE</asp:label>
                    <div class="charts-container">                        
                        <div id="container21"></div>
                        <div id="container22"></div>
                        <div id="container23"></div>
                    </div>
                </td>
            </tr>
        </table>
        <div>
            <div id="container" style="width: 99%; height: 321px; margin-left: 12px; margin-bottom: 10px; margin-top: 15px; border-radius: 20px;"></div>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                $(document).ready(function () {
                    // Fetch font size for data labels
                    $.ajax({
                        type: "POST",
                        url: "Charts_1.aspx/ChangeFrontEndSize", // Replace with your ASPX page name
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            // Extract data from the response
                            let fontSizeData = response.d; // Assuming ChangeFrontEndSize returns a JSON object
                            let dataLabelFontSize = fontSizeData.Datalabels;
                            let leftChartHeadingFontSize = fontSizeData.LeftChartHeading;
                            let rightChartHeadingFontSize = fontSizeData.RightChartHeading;
                            let bottomChartHeadingFontSize = fontSizeData.BottomChartHeading;
                            let rangeNameFontSize = fontSizeData.Rangename;
                            let rangeDataFontSize = fontSizeData.Rangedata;
                            let xAxisFontSize = fontSizeData.xAxis;
                            let yAxisFontSize = fontSizeData.yAxis;
                            let rightHeadersFontSize = fontSizeData.RightHeaders;
                            let leftCenterdataFontSize = fontSizeData.LeftCenterdata;
                            let rightCenterdataFontSize = fontSizeData.RightCenterdata;

                            $('.availdata').css('font-size', rangeDataFontSize + 'px');
                            $('.performdata').css('font-size', rangeDataFontSize + 'px');
                            $('.qualitydata').css('font-size', rangeDataFontSize + 'px');
                            $('.name').css('font-size', rangeNameFontSize + 'px');
                            $('.rightlabel').css('font-size', rightChartHeadingFontSize + 'px');

                            Highcharts.chart('container1', {
                                chart: {
                                    type: 'solidgauge',
                                    custom: {}, // Keep custom object for reuse
                                    events: {
                                        render() {
                                            const chart = this;
                                            let customLabel = chart.options.chart.custom.label;

                                            if (!customLabel) {
                                                customLabel = chart.options.chart.custom.label =
                                                    chart.renderer.label(
                                                        `OEE<br/><strong>${chartData.OEE.toFixed(2)}%</strong>`
                                                    )
                                                        .css({
                                                            color: '#000',
                                                            textAnchor: 'middle',
                                                            fontSize: `${leftCenterdataFontSize}px`
                                                        })
                                                        .add();
                                            }
                                            const x = (chart.plotWidth / 2) + 10,
                                                y = chart.plotHeight /2 + chart.plotTop -
                                                    (customLabel.attr('height') / 2);

                                            customLabel.attr({
                                                x,
                                                y
                                            });
                                        }
                                    }
                                },
                                credits: {
                                    enabled: false
                                },
                                exporting: {
                                    enabled: false
                                },
                                title: {
                                    text: 'VED INDUSTRIES PLANT-2',
                                    style: {
                                        fontSize: `${leftChartHeadingFontSize}px`
                                    }
                                },
                                tooltip: {
                                    enabled: true,
                                    formatter: function () {
                                        return `<strong>OEE:</strong> ${this.y.toFixed(2)}%`;
                                    }
                                },
                                yAxis: {
                                    min: 0,
                                    max: 100,
                                    title: {
                                        text: null
                                    },
                                    lineWidth: 0,
                                    tickPositions: [], // Hide ticks
                                },
                                pane: {
                                    startAngle: 0,
                                    endAngle: 360,
                                    background: [{ // Full-circle gauge
                                        outerRadius: '112%',
                                        innerRadius: '88%',
                                        backgroundColor: '#e6e6e6',
                                        borderWidth: 0
                                    }]
                                },
                                series: [{
                                    name: 'OEE',
                                    data: [{
                                        y: chartData.OEE,
                                        color: 'blue'
                                    }],
                                    dataLabels: {
                                        enabled: false
                                    },
                                    innerRadius: '88%', // Ensure series matches pane's inner radius
                                    radius: '112%',
                                    borderRadius:'10px'// Ensure series matches pane's outer radius
                                }]
                            });

                            //Highcharts.chart('container1', {
                            //    chart: {
                            //        type: 'pie',
                            //        custom: {},
                            //        events: {
                            //            render() {
                            //                const chart = this,
                            //                    series = chart.series[0];
                            //                ; let customLabel = chart.options.chart.custom.label;

                            //                if (!customLabel) {
                            //                    customLabel = chart.options.chart.custom.label =
                            //                        chart.renderer.label(
                            //                            'OEE<br/>' +
                            //                            '<strong>24.21%</strong>'
                            //                        )
                            //                            .css({
                            //                                color: '#000',
                            //                                textAnchor: 'middle'
                            //                            })
                            //                            .add();
                            //                }
                            //                const x = series.center[0] + chart.plotLeft,
                            //                    y = series.center[1] + chart.plotTop -
                            //                        (customLabel.attr('height') / 2);

                            //                customLabel.attr({
                            //                    x,
                            //                    y
                            //                });
                            //                // Set font size based on chart diameter
                            //                customLabel.css({
                            //                    fontSize: `${leftCenterdataFontSize}px`
                            //                });
                            //            }
                            //        }
                            //    },
                            //    credits: {
                            //        enabled: false
                            //    },
                            //    exporting: {
                            //        enabled: false
                            //    },
                            //    accessibility: {
                            //        point: {
                            //            valueSuffix: '%'
                            //        }
                            //    },
                            //    title: {
                            //        text: 'VED INDUSTRIES PLANT-2',
                            //        style: {
                            //            fontSize: leftChartHeadingFontSize + 'px',
                            //        }
                            //    },

                            //    legend: {
                            //        enabled: false
                            //    },
                            //    plotOptions: {
                            //        series: {
                            //            allowPointSelect: true,
                            //            cursor: 'pointer',
                            //            borderRadius: 10,
                            //            dataLabels: [{
                            //                enabled: false,

                            //            }, {
                            //                enabled: false,
                            //                distance: -15,
                            //                format: '{point.percentage:.0f}%',
                            //                style: {
                            //                    fontSize: '0.5em'
                            //                }
                            //            }],
                            //            showInLegend: true
                            //        }
                            //    },
                            //    tooltip: {
                            //        formatter: function () {
                            //            if (this.point.name === 'other') {
                            //                return false; // Suppress tooltip for grey section
                            //            }
                            //            return `<strong>OEE:</strong> ${this.y.toFixed(2)}%`;
                            //        },
                            //    },
                            //    series: [{
                            //        name: 'OEE',
                            //        colorByPoint: true,
                            //        innerSize: '85%',
                            //        data: [{
                            //            name: 'OEE',
                            //            y: chartData.OEE,
                            //            color: 'blue'
                            //        }, {
                            //            name: 'other',
                            //            y: chartData.OeeRemaining,
                            //            color: '#e6e6e6' // Grey for the remaining part
                            //        }]
                            //    }]
                            //});


                            Highcharts.chart('container21', {
                                chart: {
                                    type: 'solidgauge',
                                    spacingTop: 0,    // Remove extra space above the chart
                                           marginTop: 20,
                                    custom: {}, // Keep custom object for reuse
                                    events: {
                                        render() {
                                            const chart = this;
                                            let customLabel = chart.options.chart.custom.label;

                                            if (!customLabel) {
                                                customLabel = chart.options.chart.custom.label =
                                                    chart.renderer.label(
                                                        `<strong>${chartData.CNC}%</strong>`
                                                    )
                                                        .css({
                                                            color: '#000',
                                                            textAnchor: 'middle',
                                                            fontSize: `${rightCenterdataFontSize}px`
                                                        })
                                                        .add();
                                            }

                                            const x = (chart.plotWidth / 2) + 10,
                                                y = chart.plotHeight / 2 + chart.plotTop -
                                                    (customLabel.attr('height') / 2);

                                            customLabel.attr({
                                                x,
                                                y
                                            });
                                        }
                                    }
                                },
                                credits: {
                                    enabled: false
                                },
                                exporting: {
                                    enabled: false
                                },
                                title: {
                                    text: 'CNC',
                                    style: {
                                        fontSize: `${rightHeadersFontSize}px`,
                                        fontWeight: 'bold',
                                        color: 'black',
                                    }
                                },
                                tooltip: {
                                    enabled: true,
                                    formatter: function () {
                                        return `<strong>CNC:</strong> ${this.y.toFixed(2)}%`;

                                    }
                                },
                                yAxis: {
                                    min: 0,
                                    max: 100,
                                    title: {
                                        text: null
                                    },
                                    lineWidth: 0,
                                    tickPositions: [] // Hide ticks
                                },
                                pane: {
                                    startAngle: 0,
                                    endAngle: 360,
                                    background: [{ // Full-circle gauge
                                        outerRadius: '112%',
                                        innerRadius: '88%',
                                        backgroundColor: '#e6e6e6',
                                        borderWidth: 0
                                    }]
                                },
                                series: [{
                                    name: 'CNC',
                                    data: [{
                                        y: chartData.CNC,
                                        color: 'blue'
                                    }],
                                    dataLabels: {
                                        enabled: false
                                    },
                                    innerRadius: '88%', // Ensure series matches pane's inner radius
                                    radius: '112%',
                                    borderRadius: '10px'// Ensure series matches pane's outer radius
                                }]
                            });

                            Highcharts.chart('container22', {
                                chart: {
                                    type: 'solidgauge',
                                    spacingTop: 0,    // Remove extra space above the chart
                                    marginTop: 20,
                                    custom: {}, // Keep custom object for reuse
                                    events: {
                                        render() {
                                            const chart = this;
                                            let customLabel = chart.options.chart.custom.label;

                                            if (!customLabel) {
                                                customLabel = chart.options.chart.custom.label =
                                                    chart.renderer.label(
                                                        `<strong>${chartData.HMC}%</strong>`
                                                    )
                                                        .css({
                                                            color: '#000',
                                                            textAnchor: 'middle',
                                                            fontSize: `${rightCenterdataFontSize}px`
                                                        })
                                                        .add();
                                            }

                                            const x = (chart.plotWidth / 2) + 10,
                                                y = chart.plotHeight / 2 + chart.plotTop -
                                                    (customLabel.attr('height') / 2);

                                            customLabel.attr({
                                                x,
                                                y
                                            });
                                        }
                                    }
                                },
                                credits: {
                                    enabled: false
                                },
                                exporting: {
                                    enabled: false
                                },
                                title: {
                                    text: 'HMC',
                                    style: {
                                        fontSize: `${rightHeadersFontSize}px`,
                                        fontWeight: 'bold',
                                        color: 'black',
                                    }
                                },
                                tooltip: {
                                    enabled: true,
                                    formatter: function () {
                                        return `<strong>HMC:</strong> ${this.y.toFixed(2)}%`;

                                    }
                                },
                                yAxis: {
                                    min: 0,
                                    max: 100,
                                    title: {
                                        text: null
                                    },
                                    lineWidth: 0,
                                    tickPositions: [] // Hide ticks
                                },
                                pane: {
                                    startAngle: 0,
                                    endAngle: 360,
                                    background: [{ // Full-circle gauge
                                        outerRadius: '112%',
                                        innerRadius: '88%',
                                        backgroundColor: '#e6e6e6',
                                        borderWidth: 0
                                    }]
                                },
                                series: [{
                                    name: 'HMC',
                                    data: [{
                                        y: chartData.HMC,
                                        color: 'blue'
                                    }],
                                    dataLabels: {
                                        enabled: false
                                    },
                                    innerRadius: '88%', // Ensure series matches pane's inner radius
                                    radius: '112%',
                                    borderRadius: '10px'// Ensure series matches pane's outer radius
                                }]
                            });

                            Highcharts.chart('container23', {
                                chart: {
                                    type: 'solidgauge',
                                    spacingTop: 0,    // Remove extra space above the chart
                                    marginTop: 20,
                                    custom: {}, // Keep custom object for reuse
                                    events: {
                                        render() {
                                            const chart = this;
                                            let customLabel = chart.options.chart.custom.label;

                                            if (!customLabel) {
                                                customLabel = chart.options.chart.custom.label =
                                                    chart.renderer.label(
                                                        `<strong>${chartData.VMC}%</strong>`
                                                    )
                                                        .css({
                                                            color: '#000',
                                                            textAnchor: 'middle',
                                                            fontSize: `${rightCenterdataFontSize}px`
                                                        })
                                                        .add();
                                            }

                                            const x = (chart.plotWidth / 2) + 10,
                                                y = chart.plotHeight / 2 + chart.plotTop -
                                                    (customLabel.attr('height') / 2);

                                            customLabel.attr({
                                                x,
                                                y
                                            });
                                        }
                                    }
                                },
                                credits: {
                                    enabled: false
                                },
                                exporting: {
                                    enabled: false
                                },
                                title: {
                                    text: 'VMC',
                                    style: {
                                        fontSize: `${rightHeadersFontSize}px`,
                                        fontWeight: 'bold',
                                        color: 'black',
                                    }
                                },
                                tooltip: {
                                    enabled: true,
                                    formatter: function () {
                                        return `<strong>VMC:</strong> ${this.y.toFixed(2)}%`;

                                    }
                                },
                                yAxis: {
                                    min: 0,
                                    max: 100,
                                    title: {
                                        text: null
                                    },
                                    lineWidth: 0,
                                    tickPositions: [] // Hide ticks
                                },
                                pane: {
                                    startAngle: 0,
                                    endAngle: 360,
                                    background: [{ // Full-circle gauge
                                        outerRadius: '112%',
                                        innerRadius: '88%',
                                        backgroundColor: '#e6e6e6',
                                        borderWidth: 0
                                    }]
                                },
                                series: [{
                                    name: 'VMC',
                                    data: [{
                                        y: chartData.VMC,
                                        color: 'blue'
                                    }],
                                    dataLabels: {
                                        enabled: false
                                    },
                                    innerRadius: '88%', // Ensure series matches pane's inner radius
                                    radius: '112%',
                                    borderRadius: '10px'// Ensure series matches pane's outer radius
                                }]
                            });                          

                            Highcharts.chart('container', {
                                chart: {
                                    type: 'column'
                                },
                                credits: {
                                    enabled: false
                                },
                                exporting: {
                                    enabled: false
                                },
                                title: {
                                    text: 'Machine wise OEE',
                                    align: 'left',
                                    style: {
                                        fontSize: bottomChartHeadingFontSize + 'px'
                                    }

                                },
                                tooltip: {
                                    formatter: function () {

                                        return this.point.category + ': ' + this.y + '%'; // `this.x` is the category (X-axis), `this.y` is the Y value
                                    }
                                },
                                plotOptions: {
                                    column: {
                                        dataLabels: {
                                            enabled: true,  // Enable data labels
                                            format: '{y}%', // Format the data label (show percentage)
                                            style: {
                                                fontWeight: 'bold',  // Optional: Make data labels bold
                                                color: 'black',  // Optional: Set color of the data labels
                                                textOutline: '0px', // Optional: Remove outline from the text
                                                fontSize: dataLabelFontSize + 'px' // Optional: Adjust font size
                                            }
                                        }
                                    }
                                },
                                xAxis: {
                                    categories: chartData2.categories,
                                    title: {
                                        text: 'Countries'
                                    },
                                    labels: {
                                        style: {
                                            fontSize: xAxisFontSize

                                        }
                                    },
                                },
                                yAxis: {
                                    min: 0,
                                    max: 100,
                                    title: {
                                        text: 'OEE in %',
                                    },
                                    labels: {
                                        style: {
                                            fontSize: yAxisFontSize

                                        }
                                    },
                                },

                                series: [
                                    {
                                        name: '',
                                        data: chartData2.series,
                                        colorByPoint: true,
                                        showInLegend: false
                                    }
                                ]
                            });
                        }
                    });
                });
            });
            document.addEventListener('DOMContentLoaded', function () {
                const currentDate = new Date();
                const formattedDate = currentDate.toLocaleDateString('en-IN', {
                    day: '2-digit',
                    month: 'short',
                    year: 'numeric',
                    hour: '2-digit',
                    minute: '2-digit',

                    hour12: false,
                });
                document.getElementById('currentDate').textContent = formattedDate;
            });
        </script>
        <div class="footer">
            <div class="footer-left">Powered by TPM-Trak &copy;</div>

            <div class="footer-center-container">
                <label class="scrolling-text">Welcome To TPM-Trak</label>
            </div>
            <div class="footer-right">
                <img src="./Images/AmiTLogo.jpg" alt="Footer Logo" width="100" height="100" />
            </div>
        </div>
    </form>
</body>
</html>





<%-- Highcharts.chart('barRaceChart', {
     chart: {
         type: 'column',
         animation: true, // Enable animation for the bar race
     },
     title: {
         text: 'Bar Chart'
     },
     xAxis: {
         categories: ['Category 1', 'Category 2', 'Category 3', 'Category 4'],
         title: {
             text: 'Categories'
         }
     },
     yAxis: {
         min: 0,
         title: {
             text: 'Value',
             align: 'high'
         },
         labels: {
             overflow: 'justify'
         }
     },
     tooltip: {
         valueSuffix: ' units'
     },
     plotOptions: {
         column: {
             dataLabels: {
                 enabled: true
             }
         }
     },
     legend: {
         enabled: false
     },
     credits: {
         enabled: false
     },
     series: [
         {
             name: 'Values',
             data: [
                 { y: 107, color: '#FF5733' }, // Red
                 { y: 31, color: '#33FF57' },  // Green
                 { y: 635, color: '#3357FF' }, // Blue
                 { y: 203, color: '#F0E130' }  // Yellow
             ],
             colorByPoint: true
         },
       
     ]
 });





--%>


<%------------------------------------------- %>


<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard Charts</title>
    <!-- Include Highcharts Library -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/solid-gauge.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <script src="https://code.highcharts.com/highcharts-more.js"></script>
    <script src="https://code.highcharts.com/modules/data.js"></script>
</head>
<body>
    <form id="form2" runat="server">
        <div style="display: flex; justify-content: space-between;">
            <!-- Circular Gauges -->
            <div id="oeeChart" style="width: 20%; height: 300px;"></div>
            <div id="nameChart" style="width: 20%; height: 300px;"></div>
            <div id="performanceChart" style="width: 20%; height: 300px;"></div>
            <div id="qualityChart" style="width: 20%; height: 300px;"></div>
        </div>

        <div id="machineOEEBarChart" style="width: 100%; height: 400px; margin-top: 50px;"></div>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const gaugeOptions = {
                    chart: {
                        type: 'solidgauge',
                    },
                    title: null,
                    pane: {
                        center: ['50%', '50%'],
                        size: '100%',
                        startAngle: -90,
                        endAngle: 90,
                        background: {
                            backgroundColor: '#EEE',
                            innerRadius: '60%',
                            outerRadius: '100%',
                            shape: 'arc',
                        },
                    },
                    exporting: { enabled: false },
                    tooltip: { enabled: false },
                    yAxis: {
                        stops: [[0.1, '#DF5353'], [0.5, '#DDDF0D'], [0.9, '#55BF3B']],
                        lineWidth: 0,
                        tickWidth: 0,
                        minorTickInterval: null,
                        tickAmount: 2,
                        title: { y: -70 },
                        labels: { y: 16 },
                    },
                    plotOptions: {
                        solidgauge: {
                            dataLabels: {
                                y: 5,
                                borderWidth: 0,
                                useHTML: true,
                            },
                        },
                    },
                };

                // OEE Chart
                Highcharts.chart('oeeChart', Highcharts.merge(gaugeOptions, {
                    title: { text: 'OEE%' },
                    yAxis: { min: 0, max: 100, title: { text: 'OEE%' } },
                    series: [{
                        name: 'OEE',
                        data: [24.21],
                        dataLabels: {
                            format: '<div style="text-align:center"><span style="font-size:25px">{y}%</span></div>',
                        },
                    }],
                }));

                // name Chart
                Highcharts.chart('nameChart', Highcharts.merge(gaugeOptions, {
                    title: { text: 'name' },
                    yAxis: { min: 0, max: 100, title: { text: 'name' } },
                    series: [{
                        name: 'name',
                        data: [29.56],
                        dataLabels: {
                            format: '<div style="text-align:center"><span style="font-size:25px">{y}%</span></div>',
                        },
                    }],
                }));

                // Performance Chart
                Highcharts.chart('performanceChart', Highcharts.merge(gaugeOptions, {
                    title: { text: 'Performance' },
                    yAxis: { min: 0, max: 100, title: { text: 'Performance' } },
                    series: [{
                        name: 'Performance',
                        data: [81.95],
                        dataLabels: {
                            format: '<div style="text-align:center"><span style="font-size:25px">{y}%</span></div>',
                        },
                    }],
                }));

                // Quality Chart
                Highcharts.chart('qualityChart', Highcharts.merge(gaugeOptions, {
                    title: { text: 'Quality' },
                    yAxis: { min: 0, max: 100, title: { text: 'Quality' } },
                    series: [{
                        name: 'Quality',
                        data: [99.95],
                        dataLabels: {
                            format: '<div style="text-align:center"><span style="font-size:25px">{y}%</span></div>',
                        },
                    }],
                }));

                // Machine-Wise OEE Bar Chart
                Highcharts.chart('machineOEEBarChart', {
                    chart: {
                        type: 'column',
                    },
                    title: {
                        text: 'Machine Wise OEE',
                    },
                    xAxis: {
                        categories: [
                            'CNC 01', 'HMC 01', 'HMC 02', 'HMC 03 MAZAK', 'HMC 04',
                            'HMC 05', 'HMC 06', 'HMC 07', 'VMC 01 APC', 'VMC 02 U-Cam',
                            'VMC 03 U-Cam', 'VMC 04 APC', 'VMC 05 Indexer', 'VMC 06 APC',
                            'VMC 07 U-Cam', 'VMC 08 APC', 'VMC 09 Basic', 'VMC 10 APC',
                            'VMC 11 Indexer', 'VMC 12 APC',
                        ],
                        crosshair: true,
                    },
                    yAxis: {
                        min: 0,
                        title: { text: 'OEE%' },
                    },
                    plotOptions: {
                        column: {
                            pointPadding: 0.2,
                            borderWidth: 0,
                        },
                    },
                    series: [{
                        name: 'OEE%',
                        data: [10.48, 7.99, 28.13, 25, 30, 20, 15, 35, 50, 60, 20, 45, 55, 70, 40, 30, 80, 25, 55, 65],
                    }],
                }); // Your Highcharts code here
            });
            // Common configuration for circular gauges
          
        </script>
    </form>
</body>
</html>--%>








<%--

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        // Make an AJAX call to fetch the font size
        $.ajax({
            type: "POST",
            url: "YourPageName.aspx/GetFontSize",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                // Apply the font size dynamically
                let fontSize = response.d; // .d contains the returned data
                $(".righttdlabel").css("font-size", fontSize + "px");
            },
            error: function (xhr, status, error) {
                console.error("Error fetching font size: " + error);
            }
        });
    });
</script>--%>
