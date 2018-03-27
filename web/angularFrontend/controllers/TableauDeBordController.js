/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

(function () {
    var app = angular.module('TableauDeBord', ["ngRoute","ngMaterial",'ngAnimate', 'toaster']);

    function formatNumber(number) {
        var formated = " ";
        var format = number.toString();
        var count = 0;
        for (var i = format.length - 1; i >= 0; i--) {
            if (count % 3 === 0) {
                formated = format[i] + " " + formated;

            } else {
                formated = format[i] + formated;
            }
            count++;
        }
        return formated;
    }
    function drawPieChart(id, datas, title) {
        Highcharts.chart(id, {
            chart: {
                type: 'pie',
                options3d: {
                    enabled: false,
                    alpha: 55,
                    beta: 0
                }
            },
            title: {
                text: title
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

    function drawChart(id, datas, texte) {
        Highcharts.chart(id, {
            chart: {
                type: 'column',
                options3d: {
                    enabled: true,
                    alpha: 1,
                    beta: 15,
                    depth: 70
                }
            },
            title: {
                text: texte
            },
            subtitle: {
                text: 'de la societe'
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
                    text: 'Montant Depensé'
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
            series: datas
        });
    }
    var Mois = ["", "Janvier", "Fevrier", "Mars", "Avril", "Mai", "Juin", "Juillet", "Aout", "Septembre", "Octobre", "Novembre", "Decembre"];
    function getDataBarChart(donnees, $http, id) {
        var texte;

        $http({url: "validerDepense?action=reporting_Statistique&vue=rien", method: 'get', params: donnees}).then(function (response) {

            texte = "Depenses " + donnees.statut + " de l'année " + donnees.annee;
            drawChart(id, response.data, texte);


        }, function (error) {
            alert("erreur de communication avec le serveur");
        });

    }

    function getDataPieChart(form, $http, id) {
        $http({url: form.url, method: 'get', params: form}).then(function (response) {

            var result = new Array();
            var tb = new Array();
            var tb1 = new Array();
            tb.push("consommer : " + formatNumber(response.data[0].consommer));
            tb.push(response.data[0].consommer);
            tb1.push("buget Global : " + formatNumber(response.data[0].budget));
            tb1.push(response.data[0].budget);
            result.push(tb);
            result.push(tb1);
            var title;
            if (form.mois === null || form.mois === undefined) {
                title = "Comparaison globale de l'année " + form.annee;
            } else {
                title = "Comparaison globale du mois de " + Mois[form.mois] + " de l'année " + form.annee;
            }
            drawPieChart(id, result, title);


        }, function (error) {
            alert("erreur de communication avec le serveur");
        });
    }
    function getDataPieChart2(form, $http, id) {
        $http({url: form.url, method: 'get', params: form}).then(function (response) {
            var title;
            if (form.mois === null || form.mois === undefined) {
                title = "Comparaison des depenses de l'année " + form.annee;
            } else {
                title = "Comparaison des depenses du mois de " + Mois[form.mois] + " de l'année " + form.annee;
            }
            drawPieChart(id, response.data, title);


        }, function (error) {
            alert("erreur de communication avec le serveur");
        });
    }

    function getAllByRegion(idRegion, $http) {
        var result;
        $http({url: "validerDepense?action=getAllByRegion&vue=vue", method: 'get', params: {id_region: idRegion}}).then(function (response) {
            var title;

            result = response.data;

        }, function (error) {
            alert("erreur de communication avec le serveur");
        });
        return result;
    }

    function TableauDeBordController($scope, $http) {
        $scope.AllAnnee = new Array();
        $scope.recherche = {annee: 2018, statut: "valider"};
        $scope.result = {};
        $scope.service = new Array();
        $scope.service1 = new Array();
         $scope.personnels = new Array();
        $scope.service2 = new Array();
        $scope.centre = new Array();
        $scope.newyear = new Date().getFullYear();
        $scope.anneeSelect = $scope.newyear;
        for (var i = $scope.newyear; i >= 2017; i--) {
            $scope.AllAnnee.push(i);
        }

//fonction permettant de tracer le grahpe en batton sur une annee
        $scope.changegraphe = function (formrecherche) {

            $scope.anneeSelect = formrecherche.annee;
            getDataBarChart(formrecherche, $http, 'barchar');


        };

        $scope.changegrapheService = function (formrecherche) {

            $scope.anneeSelect = formrecherche.annee;
            getDataBarChart(formrecherche, $http, 'barchar_service');


        };

//fonction permettant de tracer le grahpe par mois ou annee
        $scope.changegrapheMois = function (form) {
            form.url = "validerDepense?action=reporting_general&vue=rien";
            getDataPieChart(form, $http, 'stat-chart');
        };

        $scope.changegrapheMoisService = function (form) {
            form.url = "validerDepense?action=reporting_general&vue=rien";
            getDataPieChart(form, $http, 'stat-chart_service');
        };
        var datas = [
            ["missions", 80],
            ["diverse", 100]
        ];
//fonction permettant d'afficher le deuxieme camanbert
        $scope.changegrapheGlobal = function (form) {
            form.url = "validerDepense?action=reporting_camanbert&vue=rien";
            getDataPieChart2(form, $http, 'stat-chart2');
        };
        $scope.changegrapheGlobalService = function (form) {
            form.url = "validerDepense?action=reporting_camanbert&vue=rien";
            getDataPieChart2(form, $http, 'stat-chart2_service');
        };


        var form = {url: "validerDepense?action=reporting_general&vue=rien", annee: new Date().getFullYear()};
        var form1 = {url: "validerDepense?action=reporting_camanbert&vue=rien", annee: new Date().getFullYear()};
        getDataPieChart2(form1, $http, 'stat-chart2');
        getDataPieChart(form, $http, 'stat-chart');
        getDataBarChart($scope.recherche, $http, 'barchar');

        //statistique d'un service bien defini
        getDataBarChart($scope.recherche, $http, 'barchar_service');
        getDataPieChart2(form1, $http, 'stat-chart2_service');
        getDataPieChart(form, $http, 'stat-chart_service');

        $scope.Search = function (idRegion) {
            $http({url: "validerDepense?action=getAllByRegion&vue=vue", method: 'get', params: {id_region: idRegion}}).then(function (response) {
                $scope.service=response.data;

            }, function (error) {
                console.log("erreur de communication avec le serveur");
            });


        };
        
        $scope.Search1 = function (idRegion) {
            $http({url: "validerDepense?action=getAllByRegion&vue=vue", method: 'get', params: {id_region: idRegion}}).then(function (response) {
                $scope.service1=response.data;

            }, function (error) {
               console.log("erreur de communication avec le serveur");
            });


        };
        
        $scope.Search2 = function (idRegion) {
            $http({url: "validerDepense?action=getAllByRegion&vue=vue", method: 'get', params: {id_region: idRegion}}).then(function (response) {
                $scope.service2=response.data;

            }, function (error) {
               console.log("erreur de communication avec le serveur");
            });


        };
        
        $scope.SearchCentre = function (idService) {
            $http({url: "validerDepense?action=getAllByService&vue=vue", method: 'get', params: {id_service: idService}}).then(function (response) {
                
                $scope.centre=response.data;

            }, function (error) {
                console.log("erreur de communication avec le serveur");
            });


        };
        
        $scope.SearchPersonnel = function (idService) {
            $http({url: "admin?action=getPersonnelsByService&vue=vue", method: 'get', params: {service: idService}}).then(function (response) {
                console.log(response.data);
                $scope.personnels=response.data;

            }, function (error) {
                console.log("erreur de communication avec le serveur");
            });


        };

    }

    app.controller("TableauDeBordController", ["$scope", "$http", TableauDeBordController]);

}());
