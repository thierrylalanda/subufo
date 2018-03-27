/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    function getMulti(serveur, param, name, form) {
        $.post(
                serveur,
                param,
                function (data) {

                    $(".all_select").html("");
                    form.find(".ff").html("");
                    var k;
                    var select = document.createElement("select");
                    select.setAttribute("class", "input-lg site_service all_select");
                    select.setAttribute("name", name);
                    for (k = 0; k < data.length; k++) {
                        var option = document.createElement("option");
                        option.setAttribute("value", data[k][0]);

                        option.innerHTML = data[k][1];
                        select.appendChild(option);
                    }
                    form.find(".ff").html(select);
                    $(".all_select").attr('multiple', "multiple");
                    //  $(".example").multiselect();
                    //  $(".example").multiselect('rebuild');
                    $('.all_select').multiselect({
                        enableFiltering: true,
                        maxHeight: 200,
                        buttonClass: 'btn-primary btn',
                        buttonWidth: '150px',
                        selectAllText: "Tous",
                        includeSelectAllOption: true,
                        enableCaseInsensitiveFiltering: true,
                        filterPlaceholder: 'Recherhe',
                        //selectAllValue: true,
                        // selectedClass: null,
                        // dropRight: true,
                        //dropUp: true,
                        buttonText: function (options, select) {
                            if (options.length === 0) {
                                return 'Aucune  Selection ...';
                            } else {
                                var labels = [];
                                options.each(function () {
                                    if ($(this).attr('label') !== undefined) {
                                        labels.push($(this).attr('label'));
                                    } else {
                                        labels.push($(this).html());
                                    }
                                });
                                return labels.join(', ') + '';
                            }
                        }

                    });

                },
                "json"
                );
    }

//obtenir tous les sites de la region
    $(".region_").click(function (e) {
        e.preventDefault();
        $(".personnels").html("");
        $(".service").html("");
        var region = $(this).val();
        var formoption = $(this).parents("form:first");
        var param = {action: "getSites", vue: "vue", region: region};
        if ($(this).hasClass("for_end")) {
            getMulti("admin", param, "site", formoption);
        } else {

            getMany("admin", param, ".site_");
        }

    });

    $(".li-table").click(function (e) {
        e.preventDefault();


        $(".compare-service").html("");
        $("form").find(".for_end").find("option:first").trigger("click");
    });

    $(".site_").click(function (e) {

        e.preventDefault();
        $(".personnels").html("");
        var site = $(this).val();
        var param = {action: "getServiceBySite", vue: "vue", site: site};
        var formoption = $(this).parents("form:first");
        if ($(this).hasClass("for_end")) {
            getMulti("admin", param, "service", formoption);
        } else {

            getMany("admin", param, ".service_");
        }

    });

    $(".region_magp_").click(function (e) {
        e.preventDefault();
        var region = $(this).val();
        var formoption = $(this).parents("form:first");
        var param = {action: "getRole", vue: "vue", idAffectation: 3, region: region};
        if ($(this).hasClass("for_end")) {
            getMulti("admin", param, "id_magasinP", formoption);
        } else {

            getMany("admin", param, ".magasinP");
        }

    });
    $(".region_mags_").click(function (e) {
        e.preventDefault();
        var region = $(this).val();
        var param = {action: "getRole", vue: "vue", idAffectation: 2, region: region};
        var formoption = $(this).parents("form:first");
        if ($(this).hasClass("for_end")) {
            getMulti("admin", param, "id_magasin", formoption);
        } else {

            getMany("admin", param, ".magasin");
        }

    });
    //pour obtenir les Directions
    $(".region").click(function (e) {

        e.preventDefault();
        var region = $(this).val();
        var formoption = $(this).parents("form:first");
        var param = {action: "getDirectionByRegion", vue: "vue", region: region};
        getMulti("admin", param, "direction", formoption);
    });
   $(".region_direction_").click(function (e) {

        e.preventDefault();
        var region = $(this).val();

        var formoption = $(this).parents("form:first");
        var param = {action: "getDirectionByRegion", vue: "vue", region: region};
        if ($(this).hasClass("for_end")) {

            getMulti("admin", param, "direction", formoption);
        } else {

            getMany("admin", param, ".direction_service_");
        }

    });
    $(".direction_service_").click(function (e) {

        e.preventDefault();
        var direction = $(this).val();

        var formoption = $(this).parents("form:first");
        var param = {action: "getServices", vue: "vue", direction: direction};
        if ($(this).hasClass("for_end")) {

            getMulti("admin", param, "service", formoption);
        } else {

            getMany("admin", param, ".service_");
        }

    });
    $(".region_direction_cc_").click(function (e) {

        e.preventDefault();
        var region = $(this).val();

        var formoption = $(this).parents("form:first");
        var param = {action: "getDirectionByRegion", vue: "vue", region: region};
        if ($(this).hasClass("for_end")) {

            getMulti("admin", param, "direction", formoption);
        } else {

            getMany("admin", param, ".direction_centre_cout_");
        }

    });
    $(".direction_centre_cout_").click(function (e) {

        e.preventDefault();
        var direction = $(this).val();

        var formoption = $(this).parents("form:first");
        var param = {action: "getCentreCoutByDirection", vue: "vue", direction: direction};
        if ($(this).hasClass("for_end")) {

            getMulti("admin", param, "centre_cout", formoption);
        } else {

            getMany("admin", param, ".centre_cout_");
        }

    });
      $(".service_").click(function (e) {

        e.preventDefault();
        var service = $(this).val();
      
        var param = {action: "getPersonnelsByService", vue: "vue", service: service};
        var formoption = $(this).parents("form:first");
        if ($(this).hasClass("for_end")) {
            getMulti("admin", param, "personnel", formoption);
        } else {

            getMany("admin", param, ".personnel_");
        }

    });
    
    function parseDate(date) {
        var dat = new Array();
        dat = date.split("-");
        return " du " + dat[0] + " au " + dat[1];
    }

    function savedata(data) {
        this.alldata = data;
        drawTable();
        //alert(alldata[0].data);
    }

    $(".search-service").click(function (e) {
        e.preventDefault();

        var form = $(this).parents("form:first");
        // form.attr("action", $(this).attr("name"));
        this.periode = form.find(".reservation").val();


        var vide = false;
        $.each(form.find(".reservation"), function () {
            if ($(this).val() === "") {
                $(this).css({
                    borderColor: 'red',
                    color: 'red'
                });
                vide = true;
            } else {
                $(this).css({
                    borderColor: '',
                    color: ''
                });
            }
        });
        if (!vide) {


            camanberService(form);


        } else {
            alert("error");
        }

    });

    function camanberService(param) {
        var result = [
            ["PrCibelite", ["service info", 24], ["service helpdesk", 45]],
            ["fourniture de bureau", ["service info", 54], ["service helpdesk", 45]]
        ];

        $.ajax({
            url: param.attr("action"),
            data: param.serialize(),
            type: 'POST',
            success: function (data) {
                console.log(data);
                var div = $(".compare-service");
                div.html("");
                //data = result;
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
                                text: 'evolution consommation  des ' + label + ' a la periode ' + parseDate(param.find(".reservation").val())
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
});