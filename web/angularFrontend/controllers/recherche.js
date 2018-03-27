/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

(function () {
    var app = angular.module('recherche', ["ngRoute","ngMaterial",'ngAnimate', 'toaster']);

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

    app.controller("recherche", ["$scope", "$http", TableauDeBordController]);

}());
