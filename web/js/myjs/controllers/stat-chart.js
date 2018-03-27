$(document).ready(function () {

    $("#stat-magasins").click(function (e) {
        //recherche de la div contenant la date
        e.preventDefault();
        var div = $(this).parent(".controls").parent(".control-group").parent("div");
        // alert($(this).parents(".row-fluid:first"));
        var date = div.find(".all-date").val();
        $("#liness").show();
        var param = {action: "allStatMS", magasin: $(this).val(), annee: date};
        createChart(" Consommation du magasin  : " + $(this).children("option:selected").text() + " de l'annee " + date, param);
    });

    $("#stat-magasinp").click(function () {
        //recherche de la div contenant la date
        var div = $(this).parent(".controls").parent(".control-group").parent("div");
        // alert($(this).parents(".row-fluid:first"));
        var date = div.find(".all-date").val();
        $("#liness").show();
        var param = {action: "allStatMP", magasin: $(this).val(), annee: date};
        createChart(" Consommation du magasin : " + $(this).children("option:selected").text() + " de l'annee " + date, param);
    });


    $("#stat-societe").click(function () {
        //recherche de la div contenant la date
        var div = $(this).parent(".controls").parent(".control-group").parent("div");
        // alert($(this).parents(".row-fluid:first"));
        var date = div.find(".all-date").val();
        $("#liness").show();
        var param = {action: "consommationSociete", annee: date};
        createChart(" cosommation de La Societe de l'annee " + date, param);
    });
    $("#stat-region").click(function () {
        //recherche de la div contenant la date

        var div = $(this).parent(".controls").parent(".control-group").parent("div");
        var date = div.find(".all-date").val();
        $("#liness").show();
        var param = {action: "allStatConsommationRegion", region: $(this).val(), annee: date};
        createChart(" Consommation de la  Region : " + $(this).children("option:selected").text() + " de l'annee " + date, param);
    });
    $("#stat-service").click(function () {
        //recherche de la div contenant la date
        var div = $(this).parent(".controls").parent(".control-group").parent("div");
        var date = div.find(".all-date").val();
        $("#liness").show();

        var param = {action: "allStatConsommationService", service: $(this).val(), annee: date};
        createChart(" Consommation du Service :" + $(this).children("option:selected").text() + " de l'annee " + date, param);
    });


    $("#stat-site").click(function () {
        //recherche de la div contenant la date
        var div = $(this).parent(".controls").parent(".control-group").parent("div");
        var date = div.find(".all-date").val();
        $("#liness").show();

        var param = {action: "allStatConsommationSite", site: $(this).val(), annee: date};
        createChart(" Consommation du Site :" + $(this).children("option:selected").text() + " de l'annee " + date, param);
    });


    $("#stat-direction").click(function () {
        //recherche de la div contenant la date
        var div = $(this).parent(".controls").parent(".control-group").parent("div");
        var date = div.find(".all-date").val();
        $("#liness").show();
        var param = {action: "allStatConsommationDirection", direction: $(this).val(), annee: date};
        createChart(" Consommation da la Direction :" + $(this).children("option:selected").text() + " de l'annee " + date, param);
    });

    $("#stat-personnel").click(function () {
        //recherche de la div contenant la date

        var div = $(this).parent(".controls").parent(".control-group").parent("div");
        var date = div.find(".all-date").val();
        $("#liness").show();
        var param = {action: "allStatpersonnel", personnel: $(this).val(), annee: date};
        createChart("Consommation du  Personnel " + $(this).children("option:selected").text() + " de l'annee " + date, param);
    });

    setTimeout(function () {
        var div = $("#stat-region").parent(".controls").parent(".control-group").parent("div");

        var date = div.find(".all-date").val();

        if (date === undefined) {
            $("#stat-service").trigger("click");

        } else {

            var param = {action: "allStatConsommationRegion", region: $("#stat-region").val(), annee: date};
            createChart(" consommation de la  Region : " + $("#stat-region").children("option:selected").text() + " de l'annee " + date, param);
        }



    }, 1);

    $(".li-stat").click(function (e) {
        e.preventDefault();
   
        $(".compare-service-users").hide();
        if ($(this).find("a").attr("href") === "#rapport_region") {
            var div = $("#stat-region").parent(".controls").parent(".control-group").parent("div");
            var date = div.find(".all-date").val();
            $("#liness").show();
            var param = {action: "allStatConsommationRegion", region: $(this).val(), date: date};
            $("#stat-region").trigger("click");
            createChart(" Consommation de la  Region : " + $(this).children("option:selected").text() + " de l'annee " + date, param);
        } else if ($(this).find("a").attr("href") === "#rapport_site") {
            // $("#liness").show();
            //drawChart('selectionner un ' + $(this).find("a").text(), 3);
            $(".region_service").trigger("click");

            setTimeout(function () {
                $("#stat-site").trigger("click");
            }, 500);
        } else if ($(this).find("a").attr("href") === "#rapport_service") {
            // $("#liness").show();
            var div = $(this).parent(".controls").parent(".control-group").parent("div");
            var date = div.find(".all-date").val();
            if ($(".niveau_personnel").text() !== "1" && $(".niveau_personnel").text() !== "2" && $(".niveau_personnel").text() !== "3") {
              
                $(".region_direction_stat").trigger("click");
                setTimeout(function () {
                    $(".direction_service_stat").trigger("click");
                }, 500);

                setTimeout(function () {

                    $("#stat-service").trigger("click");
                }, 1000);
            }


            //drawChart('selectionner un ' + $(this).find("a").text(), 3);
            if (div.find("#stat-service").html() !== "" && $(".niveau_personnel").text() !== "4") {
                $(".compare-service-users").hide();

                $("#stat-service").trigger("click");
            }
        } else if ($(this).find("a").attr("href") === "#rapport_direction") {
            // drawChart('selectionner une ' + $(this).find("a").text(), 3);
            $(".region").trigger("click");

            setTimeout(function () {
                $("#stat-direction").trigger("click");
            }, 500);
        } else if ($(this).find("a").attr("href") === "#rapport_personnel") {
            //drawChart('selectionner un ' + $(this).find("a").text(), 3);
            var div = $(this).parent(".controls").parent(".control-group").parent("div");
            var date = div.find(".all-date").val();
            $("#liness").show();
            if ($(".niveau_personnel").text() !== "1" && $(".niveau_personnel").text() !== "2" && $(".niveau_personnel").text() !== "3") {


                $("#region_direction_stat").trigger("click");
                setTimeout(function () {
                    $(".direction_service_stat").trigger("click");
                }, 500);
                setTimeout(function () {
                    $(".service_stat_perso").trigger("click");
                }, 1000);

                setTimeout(function () {
                    $("#stat-personnel").trigger("click");
                }, 1500);
            }
            if (div.find("#stat-personnel").html() !== "" && $(".niveau_personnel").text() !== "4") {
                $("#liness").show();
                $(".compare-service-users").hide();

                $("#stat-personnel").trigger("click");
            }
        } else if ($(this).find("a").attr("href") === "#rapport_magp") {
            $("#liness").show();
            // drawChart('selectionner un ' + $(this).find("a").text(), 3);
            $(".region_magp").trigger("click");

            setTimeout(function () {
                $("#stat-magasinp").trigger("click");
            }, 500);
        } else if ($(this).find("a").attr("href") === "#rapport_mags") {
            $("#liness").show();
            //drawChart('selectionner un ' + $(this).find("a").text(), 3);
            $(".region_mags").trigger("click");

            setTimeout(function () {
                $("#stat-magasins").trigger("click");
            }, 500);
        } else if ($(this).find("a").attr("href") === "#rapport_mon_service") {
            $(".compare-service-users").show();
            $("#liness").hide();

            $(".search-service-user").trigger("click");

        } else {
            $("#liness").show();
            drawChart("cliquer sur le bouton ", 3);
            $("#stat-societe").trigger("click");
        }
    });

    $(".service-user").click(function (e) {
        e.preventDefault();
        $("#stat-personnel").trigger("click");
    });
    $(".search-service-user").click(function (e) {
        e.preventDefault();

        var annee = $(this).parents("form").find(".all-date").val();
        var param = {action: "camabertAllPersonnelServiceByAnnee", service: $(this).parents("form").find("select[name=service]").val(), annee: annee, camabert: "oui"};
        //var param = {action: "allStatConsommationRegion", region: $(this).val(), date: annee};
        camanberServiceUser("parametre", param);
    });



    function camanberServiceUser(serveur, param) {
        $.ajax({
            url: serveur,
            data: param,
            type: 'POST',
            success: function (data) {
                console.log(data);
                var div = $(".compare-service-users");
                div.html("");
                // data = result;
                console.log(data);

                for (var i = 0; i < data.length; i++)
                {
                    var datas = new Array();
                    var k = 0;



                    for (var j = 1; j < data[i].length; j++)
                    {

                        if (data[i][j][1] === 0) {

                            datas[k] = [data[i][j][0] + " : " + data[i][j][1] + "%", 0];
                        } else {
                            datas[k] = [data[i][j][0] + " : " + data[i][j][1] + "%", data[i][j][1]];
                        }

                        k++;
                    }



                    if (data[i][1][1] !== 0 || data[i][1][1] === 0) {

                        var label = '<h5 style="text-align: center" class="categorie">' + data[i][0] + '</h5>';
                        // div.append(label);
                        var camanber = '<div id="graph' + i + '" class="graph' + i + '  chart"></div><br><hr><br>';
                        div.append(camanber);
                        var clas = ".graph" + i;
                        var m = 0;
                        // alert(getQuantite(data[i],data[i][0]));
                        Highcharts.chart('graph' + i, {
                            chart: {
                                type: 'pie',
                                options3d: {
                                    enabled: false,
                                    alpha: 55,
                                    beta: 0
                                }
                            },
                            title: {
                                text: 'evolution consommation  des ' + label + ' au cours de l\'année ' + param.annee
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
            }
        });
    }




    function createChart(titre, param) {
        var title = $(".title-conso");
        title.html(titre);
        drawChart(titre, param);
        $.ajax({
            url: "tableau_de_Bord",
            data: param,
            type: 'POST',
            success: function (data) {
                console.log(data);
                drawChart(titre, data);

            }
        });
    }



    function getseries(data) {

        var result = new Array();
        for (var i = 0; i < data.length; i++) {

            var tab = new Array();
            for (var j = 0; j < data[i].length; j++) {
                tab.push(data[i][j]);
            }

            var ob = {name: data[i][0], data: data[i][1]};
            result.push(ob);
        }
        return result;
    }

    function drawChart(titre, data) {
        Highcharts.chart('liness', {
            chart: {
                type: 'areaspline'
            },
            title: {
                text: titre
            },
            legend: {
                layout: 'horizontal',
                align: 'right',
                verticalAlign: 'top',
                x: -7,
                y: 40,
                floating: true,
                borderWidth: 1,
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
            },
            xAxis: {
                categories: [
                    'Janvier',
                    'Fevrier',
                    'Mars',
                    'Avril',
                    'Mai',
                    'Juin',
                    'Juillet',
                    'Aout',
                    'Septembre',
                    'Octobre',
                    'Novembre',
                    'Decembre'
                ],
                plotBands: [{// visualisation des mois
                        from: 10.5,
                        to: 11.5,
                        color: 'rgba(68, 170, 213, 0.2)'
                    }]
            },
            yAxis: {
                title: {
                    text: 'consommation'
                }
            },
            tooltip: {
                shared: true,
                valueSuffix: ''
            },
            credits: {
                enabled: false
            },
            plotOptions: {
                areaspline: {
                    fillOpacity: 0.9
                }
            },
            series: getseries(data)
        });
    }



});