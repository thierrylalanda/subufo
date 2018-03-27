(function(){
var app=angular.module('scotchTodo');
app.controller('authCtrl', function ($scope, $rootScope, $http,$location,$routeParams,Auth,$timeout) {
    //initially set those objects to null to avoid undefined error
    $scope.login = {};
    $scope.signup = {};
    $scope.todos = {};
    $scope.face=true;
    $scope.recto=true;
$(".recto-verso").hover(function(){
    TweenLite.to($(this),2,{rotationY:180,ease:Bounce.ease,scale:0});

},function(){
    TweenLite.to($(this),2,{rotationY:-360,ease:Bounce.ease,scale:0});
});

if(Auth.getUser()!==undefined){
    $http.post('/users/usersconnect')
        .success(function(data) {

            console.log(data);
            $scope.users=data;
            return data;
        })
        .error(function(data) {
            console.log('Error: ' + data);
        });
    $scope.me=Auth.getUser();


}
$timeout(function(){
    if(Auth.getUser()!==undefined){
        $http.post('/users/usersconnect')
            .success(function(data) {

                console.log(data);
                $scope.users=data;
                return data;
            })
            .error(function(data) {
                console.log('Error: ' + data);
            });
        $scope.me=Auth.getUser();


    }

},200);

    $scope.demandeJeu = function(id) {
        $http.post('/game/add', $scope.formData)
            .success(function(data) {
                $scope.formData = {}; // clear the form so our user is ready to enter another
                $scope.todos = data;
                console.log(data);
            })
            .error(function(data) {
                console.log('Error: ' + data);
            });
    };
    $scope.message="";
    $scope.createGame = function (idfirst,idlast) {

        $http.get('/game/askgame/'+idfirst+'/'+idlast)
            .success(function(data) {
                alert("ok");
                $scope.message="votre demande de jeux a été envoyée avec success";
            })
            .error(function(data) {
                alert("non ok");
                console.log('Error: ' + data);
                $scope.message="votre demande de jeux a été rejeté";
            });

    };
    $scope.signup = {email:'',password:'',name:'',phone:'',address:''};
    $scope.createUser = function () {

        $http.post('/users/adduser', $scope.signup)
            .success(function(data) {
                console.log('data: ' + data);
                Auth.setUser(data);
                $location.path('/dashboard/'+data.email);
            })
            .error(function(data) {
                console.log('Error: ' + data);
                $scope.message="erreur";
                $location.path('/dashboard');
            });

    };

    $scope.connectUser = function () {

        $http.post('/connect', $scope.login)
            .success(function(data) {
                console.log('data: ' + data);
                Auth.setUser(data);
                $location.path('/dashboard');
            })
            .error(function(data) {
                $scope.message="error";
                console.log('Error: ' + data);
            });

    };
    $scope.logout = function (id) {
        $http.get('/logout/'+id)
            .success(function(data) {
                console.log('data: ' + data);
                $location.path('/login');
            })
            .error(function(data) {
                $scope.message="error";
                console.log('Error: ' + data);
            });

    }
});
}());