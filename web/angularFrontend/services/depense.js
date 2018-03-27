/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
'use strict';
angular.module("subufu.depense", ['ngResource'])
        .factory("depense",
                function ($resource) { // This service connects to our REST API

                    return $resource('http://localhost:8080/GIC/admin', {}, {
                        // Let's make the `query()` method cancellable
                        
                        findAllDepense: {method: 'get', isArray: true, params: {}},
                        findOneDepense: {method: 'get', isArray: true, params: {}},
                        deleteDepense: {method: 'get', isArray: true, params: {}},
                        addDepense: {method: 'get', isArray: true, params: {}},
                        updateDepense: {method: 'get', isArray: true, params: {}},
                        findDepenseEncours: {method: 'get', isArray: true, params: {}},
                        findLastDepense: {method: 'get', isArray: true, params: {action: "getRegion", vue: "rien"}}
                        
                    });
                });

    