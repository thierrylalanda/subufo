/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

(function () {

    var app = angular.module('signature', ["ngRoute", "ngMaterial", 'ngAnimate', 'toaster']);

    function signatureController($scope, $http, fileUpload) {

        function inExtension(name) {
            var extensionsPermise = ["png", "jpeg", "jpg"];
            var extensions = name.split(".");
            var ok = false;
            var ext = extensions[extensions.length - 1];

            for (var i = 0; i <= extensionsPermise.length; i++) {

                if (extensionsPermise[i] === ext.toLowerCase()) {

                    ok = true;
                }
            }
            return ok;
        }

        //chargement du fichier
        $scope.uploadFile = function (id_personnel) {
            // e.preventDefault();
            $("#fileForm").attr("action", $("#fileForm").attr("action") + "&id_personnel=" + id_personnel);
            var file = $scope.myFile;

            // console.log('file is ');
            console.dir(file);
            //console.log(file.type);
            var uploadUrl = "ChargerSignature_personnel";
            if (file) {
                // la taille maximale d'un fichier doit etre de 5 Mo ie 5*1000*1000 octets
                if (file.size < 1 * 1000 * 1000) {
                    //le nom du fichier de doit pas etre plus de 15 caracteres 
                    if (file.name.length < 50) {
                        //le type de fichier permis

                        if (inExtension(file.name)) {

                            fileUpload.uploadFileToUrl(file, uploadUrl,id_personnel);
                            //  $("#fileForm").submit();
                        } else {
                            $.gritter.add({
                                title: '',
                                text: "type de fichier incorrecte",
                                sticky: false
                            });
                        }

                    } else {
                        $.gritter.add({
                            title: '',
                            text: "nom du fichier incorrecte",
                            sticky: false
                        });
                    }

                } else {
                    $.gritter.add({
                        title: '',
                        text: "fichier volumineux",
                        sticky: false
                    });
                }

            }
        };


    }

    app.directive('fileModel', ['$parse', function ($parse) {
            return {
                restrict: 'A',
                link: function (scope, element, attrs) {
                    var model = $parse(attrs.fileModel);
                    var modelSetter = model.assign;

                    element.bind('change', function () {
                        scope.$apply(function () {
                            modelSetter(scope, element[0].files[0]);
                        });
                    });
                }
            };
        }]);

    app.service('fileUpload', ['$http', function ($http) {
            this.uploadFileToUrl = function (file, uploadUrl, id_personnel) {
                var fd = new FormData();
                fd.append('file', file);
                fd.append('id_personnel', id_personnel);

                $http.post(uploadUrl, fd, {
                    transformRequest: angular.identity,
                    headers: {'Content-Type': undefined}
                })

                        .success(function (response) {
                            console.log(response);
                            $.gritter.add({
                                title: '',
                                text: "fichier chargé avec success",
                                sticky: false
                            });
                        })

                        .error(function (error) {
                            console.log(error);
                        });
            };
        }]);


    app.controller("signatureController", ["$scope", "$http", 'fileUpload', signatureController]);


}());

