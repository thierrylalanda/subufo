/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

(function () {
    var app = angular.module('validerOA', ["ngRoute"]);
    function validerOAController($scope,$routeParams) {
        $scope.mission=false;
    }
    function budgetController($scope,$routeParams) {
      
       
    }
    function listeDemandeController($scope) {
        $scope.demandes = [];
        $scope.demande;
     
        $scope.showDemande = function (demande) {
            $scope.demande = demande;
            $scope.etabli = false;
        };
        $scope.etablirOA = function (demande) {

            $scope.etablir = {type: "OA"};
            $scope.etabli = true;
        };

     
      
    }



    app.controller("listeDemandeController", ["$scope", listeDemandeController])
            .controller("validerOAController", ["$scope",validerOAController])
    .controller("budgetController", ["$scope",budgetController]);
  
}());
