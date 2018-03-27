$(document).ready(function () {


    $("#region-tb").click(function () {
        $(".titre").text(" LA REGION " + $(this).children("option:selected").text());
        var param = {action: "allStatBudgaireRegion", region: $(this).val()};
        statcamanber(param);
    });
    $(".titre").text(" LA REGION " + $("#region").children("option:selected").text());
    var param = {action: "allStatBudgaireRegion", region: $("#region").val()};
    statcamanber(param);
    function getQuantite(res, lab) {

        alert(lab);
        var qte = 0;
        for (var i = 1; i < res.length; i++)
        {

            if (res[i][0] === lab) {
                qte = res[i][1];
            }



        }
        return qte;
    }

    function drawCircle(data, id, div) {

        var datas = new Array();
        var k = 0;



        for (var j = 1; j < data.length; j++)
        {


            if (data[j][1] === 0) {
                datas[k] = [data[j][0] + " : " + data[j][1] + "%", 0];
            } else {
                datas[k] = [data[j][0] + " : " + data[j][1] + "%", data[j][1]];
            }

            k++;
        }



        if (data[1][1] !== 0 || data[1][1] === 0) {

            var label = '<h5 style="text-align: center" class="categorie">' + data[0] + '</h5>';
            // div.append(label);
            var camanber = '<div id="graphcam' + id + '" class="graph' + id + '  chart"></div><br><hr><br>';
            div.append(camanber);
            var clas = ".graph" + id;
            var m = 0;
            // alert(getQuantite(data[i],data[i][0]));
            Highcharts.chart('graphcam' + id, {
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: false,
                        alpha: 55,
                        beta: 0
                    }
                },
                title: {
                    text: 'evolution consommation  bugetaire du service ' + label
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        depth: 35,
                        dataLabels: {
                            enabled: true,
                            format: '{point.name}'
                        }
                    }
                },
                series: [{
                        type: 'pie',
                        name: 'pourcentage',
                        data: datas
                    }]
            });
        }

    }
    function statcamanber(param) {
        var niveau = $(".niveau_personnel").text();
        var service = $(".service_personnel").text();
        var div = $(".stat-camanber .stat");
        div.html("");

        $.ajax({
            url: "tableau_de_Bord_Budgetaire",
            data: param,
            type: 'POST',
            success: function (data) {
                console.log(data);
                if (niveau === "1" || niveau === "3"|| niveau === "2") {

                    for (var i = 0; i < data.length; i++)
                    {
                        if (service === data[i][0]) {

                            drawCircle(data[i], i, div);

                        }

                    }

                } else {
             
                    for (var i = 0; i < data.length; i++)
                    {

                        drawCircle(data[i], i, div);
                    }
                }

            }
        });
    }












});