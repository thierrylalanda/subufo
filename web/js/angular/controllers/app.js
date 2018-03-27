(function () {
    var app = angular.module('about', ["ngRoute"]);
    function mainController($scope, $http) {
        $scope.formData = {};
        $scope.lalanda = "lalanda thierry";

        $scope.users = [{nom: "thierry", prenom: "lalanda"}, {nom: "mouafo", prenom: "henri"}];
        var param = {action: "getPersonnels", vue: "vue", idAffectation: 3, region: 11};

        $.post(
                "admin",
                param,
                function (data) {

                    console.log(data);
                    $scope.users = data;

                },
                "json"
                );
        $http.post('http://localhost:8080/GIC/admin', param)
                .success(function (data) {
                    $scope.users = data;
                })
                .error(function (data) {
                    alert('Error: ' + data);
                });


        $scope.affiche = function (use) {

            alert(use);
        };
//connecter un joueur
        $scope.connectTodo = function (todo) {
            $http.post('/api/connecttodos/', todo)
                    .success(function (data) {
                        $scope.todos = data;
                        console.log(data);
                    })
                    .error(function (data) {
                        console.log('Error: ' + data);
                    });
        };


    }
    app.controller("mainController", ["$scope", "$http", mainController]);
    app.run(['$location', '$rootScope', function ($location, $rootScope) {
            $rootScope.$on('$routeChangeSuccess', function (event, current, previous) {
                $rootScope.title = current.$$route.title;
            });
        }]);
}());
