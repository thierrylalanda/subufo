<%-- 
    Document   : etablirOA
    Created on : 23 nov. 2017, 10:43:18
    Author     : Administrateur
--%>

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <!DOCTYPE html>
        <form role="form" name="oaform" ng-model="oa">
            <div class="row-fluid">

                <div class="control-group form-group span3 ">
                    <label class="control-label">Nature</label>
                    <div class="controls ">
                        <input type="text" class="span12 form-control" ng-model="oa.nature" />
                    </div>
                </div>
                <div class="control-group form-group span3 ">
                    <label class="control-label">Libelle</label>
                    <div class="controls ff">
                        <textarea class="span12 form-control" ng-model="oa.libelle"></textarea>
                    </div>
                </div>
                <div class="control-group form-group span2 ">
                    <label class="control-label">quantite</label>
                    <div class="controls ">
                        <input type="number" class="span12 form-control" ng-model="oa.quantite" />
                    </div>
                </div>

                <div class="control-group form-group span2 ">
                    <label class="control-label">Montant Unitaire</label>
                    <div class="controls ">
                        <input type="number" class="span12 form-control" ng-model="oa.prix" />
                    </div>
                </div>
                <div class=" span2">
                    <div class="controls ">
                        <button style="margin-top: 25px" ng-if="update !== true" type="submit" ng-click="addOA(oa)" data-ng-disabled="oaform.$invalid"
                            class="btn  btn-success ">Enregistrer</button>
                    </div>
                    <div class="controls " ng-if="update === true">
                        <button style="margin-top: 25px" type="submit" ng-click="updateOA(oa)" data-ng-disabled="oa.$invalid" class="btn  btn-primary">mettre a jour</button>
                    </div>
                </div>

            </div>
        </form>

        <table class="table table-bordered table-hover table-striped " cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Nature</th>
                    <th>libelle</th>
                    <th>Quantite</th>
                    <th>Prix Unitaire</th>
                    <th>Montant ligne</th>
                    <th>option</th>


                </tr>
            </thead>
            <tbody>


                <tr class="" ng-repeat="bud in oas">
                    <td>{{bud.nature}}</td>
                    <td>{{bud.libelle}}</td>
                    <td class="pt">{{bud.quantite}}</td>
                    <td class="pt">{{bud.prix}}</td>
                    <td>{{bud.quantite * bud.prix}}</td>

                    <td>
                        <div class="btn-group">
                            <a href="" ng-click="editeOA($index)" class="btn btn-primary">
                                <span class="icon">
                                    <i class="icon-edit"></i>
                                </span>
                            </a>
                            <a class="btn btn-danger" ng-click="deleteOA($index)" href="">
                                <span class="icon">
                                    <i class="icon-trash"></i>
                                </span>
                            </a>
                        </div>
                    </td>

                </tr>


            </tbody>
        </table>
        <br>
        <div class="row-flui">
            <div class="span3">
                <a style="margin-top: 25px" href="#/demande/{{demande.type}}" class="btn  btn-primary ">revenir à la demande</a>
            </div>
            <div class="span8">
                    <form name="oaForm">
                            <div class="row-fluid">
                                <div class=" span2">
                                    <div class="controls ">
                                        <button style="margin-top: 25px" data-ng-disabled="oaForm.$invalid" type="submit" ng-click="faireSuivreOA()" class="btn  btn-primary pull-right">faire suivre à</button>
                
                                    </div>
                
                                </div>
                                <div class="control-group form-group span6 ">
                                    <label class="control-label">Nom du valideur</label>
                                    <div class="controls ">
                                        <input type="text" class="span12 form-control" ng-model="oa.valideur" required/>
                
                                    </div>
                                </div>
                
                
                            </div>
                        </form>
            </div>
        </div>




       