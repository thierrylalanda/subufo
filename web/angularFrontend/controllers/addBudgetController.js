/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

(function () {
    var app = angular.module('budget', ["ngRoute", "subufu.budget", "ui.bootstrap", "ngAnimate", "subufu.typeBudget","subufu.centreCout"]);
    app.config(['$routeProvider', function ($routeProvider, $routeParams) {
            $routeProvider
                    .when("/centre", {

                        templateUrl: "angularFrontend/pages/centreCout.jsp",
                        controller: "centreController"
                    }).when("/type", {

                templateUrl: "angularFrontend/pages/typeBudget.jsp",
                controller: "typeController"
            }).when("/", {

                templateUrl: "angularFrontend/pages/budget.jsp",
                controller: "budgetController"
            }).when("/budget", {

                templateUrl: "angularFrontend/pages/budget.jsp",
                controller: "budgetController"

            }).otherwise({
                redirectTo: '/'
            });
        }]);
    function budgetController($scope, $http, budget) {
       
        $scope.budgets = [];
        console.log(budget);
        $scope.budget = {};
        $scope.regions = budget.findRegion();

        $scope.getService = function (idRegion) {

            $scope.services = budget.findServiceByRegion({region: idRegion});
        };

        $scope.addForm = function () {
            $scope.add = true;
            $scope.update = false;
            init();
        };
        //
        $scope.addBudget = function (bud) {

            budget.addBudget(bud, function (response) {
                if (response && response.$resolved) {
                    console.log(response);
                    $scope.budgets.push({
                        type: bud.type,
                        service: bud.service,
                        montant: bud.montant,
                        attribution: bud.attribution,
                        expiration: bud.expiration,
                        montantRestant: bud.montant,
                        region: bud.region
                    });
                    init();
                } else {
                    alert("true");
                }
            });
        };
        //supprimer un budget
        $scope.deleteBudget = function (bud) {
            if (confirm("Voulez supprimer ce budget")) {
                var index = getSelectedBudget(bud);

                $scope.budgets.splice(index, 1);

            }
        };
        //editer un budget
        $scope.editeBudget = function (bud) {
            //  alert(bud.montantRestant);
            $scope.add = true;
            $scope.update = true;
            $scope.budget = bud;
        };
        // mettre a jour le budget
        $scope.updateBudget = function (newBud) {

            var index = getSelectedBudget(newBud);
            $scope.budgets[index].service = newBud.service;
            $scope.budgets[index].type = newBud.type;
            $scope.budgets[index].region = newBud.region;
            $scope.budgets[index].montant = newBud.montant;
            $scope.budgets[index].attribution = newBud.attribution;
            $scope.budgets[index].expiration = newBud.expiration;
            $scope.budgets[index].montantRestant = newBud.montantRestant;
            init();
        };

        function init() {
            $scope.budget = {};
            budget.service = "";
            budget.type = "";
            budget.montant = "";
            budget.montantRestant = "";
            budget.attribution = "";
            budget.expiration = "";

        }
        function getSelectedBudget(bud) {
            for (var i = 0; i < $scope.budgets.length; i++) {
                if ($scope.budgets[i].service === bud.service) {
                    return i;
                } else {
                    return -i;
                }
            }
        }
        function isUnique(type) {
            var index = getSelectedBudget(type);
            if (index > 0)
                return false;
            return true;
        }
    }


    function typeController($scope, $http, typeBudget) {
        $scope.type = {};
        $scope.types = [];
        $scope.position=0;
        $scope.type.libelle = "";
        $scope.addForm = function () {
            $scope.add = true;
            $scope.update = false;
            init();
        };

        $scope.addTypeBudget = function (type) {
            if (isUnique(type)) {
                typeBudget.addTypeBudget(type, function (response) {
                    if (response && response.$resolved) {
                        console.log(response);
                        $scope.types.push({
                            libelle: type.libelleModel
                        });
                        init();
                    } else {
                        alert("true");
                    }
                });
            } else {
                alert("ce type existe deja");
            }

        };

        //supprimer un budget
        $scope.deleteTypeBudget = function (index) {
            if (confirm("Voulez supprimer ce type de budget")) {
               // var index = getSelectedBudget(bud);

                $scope.types.splice(index, 1);

            }
        };
        //editer un budget
        $scope.editeTypeBudget = function (index) {
            //  alert(bud.montantRestant);
            $scope.add = true;
            $scope.update = true;
            $scope.type.libelleModel = $scope.types[index].libelle;
            $scope.position=index;
        };
        // mettre a jour le budget
        $scope.updateTypeBudget = function (index,newType) {

           // var index = getSelectedBudget(newType);
            $scope.types[index].libelle = newType.libelleModel;
            $scope.add = true;
            $scope.update = false;
            init();
        };
        function init() {
            $scope.type = {};
            $scope.type.libelle = "";


        }
        function getSelectedBudget(type) {
            for (var i = 0; i < $scope.types.length; i++) {
                if ($scope.types[i].libelle === type.libelle) {
                    return i;
                } else {
                    return -i;
                }
            }
        }

        function isUnique(type) {
         
         var tp=[];
            for(var i = 0; i < $scope.types.length; i++){
                if ($scope.types[i].libelle === type.libelleModel) {
                    tp.push($scope.types[i]);
                }
            }
            if (tp.length === 0)
                return true;
            else
                return false;
        }
    }
    function centreCoutController($scope, $http,centreCout) {
             $scope.centre = {};
        $scope.centres = [];
        $scope.position=0;
        $scope.centre.libelle = "";
        $scope.addForm = function () {
            $scope.add = true;
            $scope.update = false;
            init();
        };

        $scope.addCentreCout = function (centre) {
            if (isUnique(centre)) {
                centreCout.addCentreCout(centre, function (response) {
                    if (response && response.$resolved) {
                        console.log(response);
                        $scope.centres.push({
                            libelle: centre.libelleModel
                        });
                        init();
                    } else {
                        alert("true");
                    }
                });
            } else {
                alert("ce type existe deja");
            }

        };

        //supprimer un budget
        $scope.deleteCentreCout = function (index) {
            if (confirm("Voulez supprimer ce centre de cout")) {
               // var index = getSelectedBudget(bud);

                $scope.centres.splice(index, 1);

            }
        };
        //editer un budget
        $scope.editeCentreCout = function (index) {
            //  alert(bud.montantRestant);
            $scope.add = true;
            $scope.update = true;
            $scope.centre.libelleModel = $scope.centres[index].libelle;
            $scope.position=index;
        };
        // mettre a jour le budget
        $scope.updateCentreCout = function (index,newCentre) {

           // var index = getSelectedBudget(newType);
            $scope.centres[index].libelle = newCentre.libelleModel;
            $scope.add = true;
            $scope.update = false;
            init();
        };
        function init() {
            $scope.centre = {};
            $scope.centre.libelleModel = "";


        }
        function getSelectedBudget(type) {
            for (var i = 0; i < $scope.types.length; i++) {
                if ($scope.types[i].libelle === type.libelle) {
                    return i;
                } else {
                    return -i;
                }
            }
        }

        function isUnique(centre) {
         
         var tp=[];
            for(var i = 0; i < $scope.centres.length; i++){
                if ($scope.centres[i].libelle === centre.libelleModel) {
                    tp.push($scope.centres[i]);
                }
            }
            if (tp.length === 0)
                return true;
            else
                return false;
        }
    }
    app.controller("budgetController", ["$scope", "$http", "budget", budgetController])
            .controller("typeController", ["$scope", "$http", "typeBudget", typeController])
            .controller("centreController", ["$scope", "$http","centreCout", centreCoutController]);
    app.run(['$location', '$rootScope', function ($location, $rootScope) {
            $rootScope.$on('$routeChangeSuccess', function (event, current, previous) {
                $rootScope.title = current.$$route.title;
            });
        }]);
}());
