/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

(function () {
    var app = angular.module('etablirOA', ["ngRoute", "subufu.budget", "ui.bootstrap", "ngAnimate", "subufu.etabliOA", "subufu.depense"]);
    app.config(['$routeProvider', function ($routeProvider, $routeParams) {
        $routeProvider
            .when("/listeDemandeur", {

                templateUrl: "angularFrontend/pages/etablirOA.jsp",
                controller: "listeDemandeController"
            }).when("/demande/:demandeId", {

                templateUrl: "angularFrontend/pages/etablirOA.jsp",
                controller: "etablirOAController"
            }).when("/etablirOA/:demandeId", {

                templateUrl: "angularFrontend/pages/formEtablirOA.jsp",
                controller: "formOAController"
            }).when("/", {

                templateUrl: "angularFrontend/pages/etablirOA.jsp",
                controller: "listeDemandeController"
            }).when("/historiqueDepense", {

                templateUrl: "angularFrontend/pages/historiqueDepense.jsp",
                controller: "historiqueController"

            }).otherwise({
                redirectTo: '/'
            });
    }]);

    function etablirOAController($scope, $http, depense, $location, $routeParams) {
        $scope.demande = {};
        $scope.demande.type = $routeParams.demandeId;
        $scope.etabli = false;
    }
    function formOAController($scope, $http, depense, $location, $routeParams) {
        $scope.etablir = {};
        $scope.demande = {};
        $scope.demande.type = $routeParams.demandeId;
      
        if ($routeParams.demandeId === "facture") {
            $scope.etablir.type = "OA";

        } else {
            $scope.etablir.type = "OP";
        }

        $scope.faireSuivreOA = function () {

            $location.path('/');
        };

        $scope.oas = [];
        $scope.addOA = function (oa) {
            $scope.oas.push(oa);
        };
        $scope.deleteOA = function (index) {
            if (confirm("voulez supprimer cette ligne?")) {
                $scope.oas.splice(index, 1);
            }

        };
        $scope.editeOA = function (index) {
            $scope.oa = $scope.aos[index];
            $scope.update = true;
        };
        $scope.updateOA = function (index, oa) {
            $scope.aos[index] = oa;
            $scope.update = false;
        };

    }
    function listeDemandeController($scope, $http, depense, $location) {
        $scope.demandes = [];
        $scope.demande;
        $scope.demandes.push({
            nom: "lalanda",
            type: "stagiaire"
        },
            {
                nom: "thierry",
                type: "facture"
            },
            {
                nom: "mouafo",
                type: "mission"
            },
            {
                nom: "charly",
                type: "personnel"
            });
        $scope.showDemande = function (demande) {
            $scope.demande = demande;
            $scope.etabli = false;
        };
        $scope.etablirOA = function (demande) {

            $scope.etablir = { type: "OA" };
            $scope.etabli = true;
        };



    }



    app.controller("listeDemandeController", ["$scope", "$http", "depense", '$location', listeDemandeController])
        .controller("etablirOAController", ["$scope", "$http", "depense", '$location', '$routeParams', etablirOAController])
        .controller("formOAController", ["$scope", "$http", "depense", '$location', '$routeParams', formOAController]);
    app.run(['$location', '$rootScope', function ($location, $rootScope) {
        $rootScope.$on('$routeChangeSuccess', function (event, current, previous) {
            $rootScope.title = current.$$route.title;
        });
    }]);
}());
