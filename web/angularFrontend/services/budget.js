/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
'use strict';
angular.module("subufu.budget", ['ngResource'])
        .factory("budget",
                function ($resource) { // This service connects to our REST API

                    return $resource('http://localhost:8080/GIC/admin', {}, {
                        // Let's make the `query()` method cancellable
                        query: {method: 'get', isArray: true},
                        findPersonnel: {method: 'get', isArray: true, params: {}},
                        findAllBudget: {method: 'get', isArray: true, params: {}},
                        findOneBudget: {method: 'get', isArray: true, params: {}},
                        deleteBudget: {method: 'get', isArray: true, params: {}},
                        addBudget: {method: 'get', isArray: true, params: {}},
                        updateBudget: {method: 'get', isArray: true, params: {}},
                        findRegion: {method: 'get', isArray: true, params: {action: "getRegion", vue: "rien"}},
                        findServiceByRegion: {method: 'get', isArray: true, params: {action: "getServiceByRegionBudget", vue: "rien"}}
                    });
                });
angular.module("subufu.typeBudget", ['ngResource'])
        .factory("typeBudget",
                function ($resource) { // This service connects to our REST API

                    return $resource('http://localhost:8080/GIC/admin', {}, {

                        findAllTypeBudget: {method: 'get', isArray: true, params: {}},
                        findOneTypeBudget: {method: 'get', isArray: true, params: {}},
                        deleteTypeBudget: {method: 'get', isArray: true, params: {}},
                        addTypeBudget: {method: 'get', isArray: true, params: {}},
                        updateTypeBudget: {method: 'get', isArray: true, params: {}}
                    });
                });

angular.module("subufu.centreCout", ['ngResource'])
        .factory("centreCout",
                function ($resource) { // This service connects to our REST API

                    return $resource('http://localhost:8080/GIC/admin', {}, {

                        findAllCentreCout: {method: 'get', isArray: true, params: {}},
                        findOneCentreCout: {method: 'get', isArray: true, params: {}},
                        deleteCentreCout: {method: 'get', isArray: true, params: {}},
                        addCentreCout: {method: 'get', isArray: true, params: {}},
                        updateCentreCout: {method: 'get', isArray: true, params: {}}
                    });
                });
    