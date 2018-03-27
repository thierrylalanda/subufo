<%-- 
    Document   : validerOA
    Created on : 23 nov. 2017, 16:26:27
    Author     : Administrateur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <!-- BEGIN TAB PORTLET-->
 
                    <!-- END TAB PORTLET-->
<ul class="nav nav-pills nav-justified">
    <li class="active"><a href="#/valider/{{demande.type}}">OA a valider</a></li>
    <li><a href="#/budgetservice/{{demande.type}}">Budget du service</a></li>


</ul>

<h3>ETABLIR OP</h3>
<table class="table table-bordered table-hover table-striped "cellspacing="0" width="100%" >
    <thead>
        <tr >
            <th>Nature</th>
            <th>libelle</th>
            <th>Quantite</th>
            <th>Prix Unitaire</th>
            <th>Montant ligne</th>



        </tr>
    </thead>
    <tbody>


        <tr class="" ng-repeat="bud in oas">
            <td >{{bud.nature}}</td>
            <td >{{bud.libelle}}</td>
            <td class="pt">{{bud.quantite}}</td>
            <td class="pt">{{bud.prix}}</td>
            <td>{{bud.quantite * bud.prix}}</td>


        </tr>
        <tr class="" >
            <td >CRFGT</td>
            <td >reglement de facture courant electrique</td>
            <td class="pt">1</td>
            <td class="pt">200000</td>
            <td>200000</td>
        </tr>


    </tbody>
</table>
<br>
<div class="row-fluid">
    <div class="span2">
        <button style="margin-top: 25px"type="submit" ng-click="validerOA()"  class="btn  btn-primary ">Valider</button>
    </div>
    <div class="span3">
        <button style="margin-top: 25px"type="submit" ng-click="annuler=false;suivre=true"   class="btn  btn-primary ">faire suivre</button>
    </div>
    <div class="span4" ng-if="suivre === true">
        <form role="form" name="oaform"  ng-model="oa">
            <div class="row-fluid">

                <div class="control-group form-group span6 ">
                    <label class="control-label">Nom du valideur</label>
                    <div class="controls ">
                        <input type="text" class="span12 form-control" ng-model="oa.nature" required/>

                    </div>
                </div>
                <div class=" span2">
                    <div class="controls ">
                        <button style="margin-top: 25px"type="submit" ng-click="suivreOA()" data-ng-disabled="oaform.$invalid" class="btn  btn-success ">Ok</button>
                    </div>
                    
                </div>

            </div>    
        </form>
    </div>
    <div class="span4" ng-if="annuler === true">
        <form role="form" name="oaform"  ng-model="oa">
            <div class="row-fluid">

                <div class="control-group form-group span6 ">
                    <label class="control-label">raison du rejet</label>
                    <div class="controls ">
                        <textarea class="span12 form-control" ng-model="oa.nature" required>raison du rejet</textarea>

                    </div>
                </div>
                <div class=" span2">
                    <div class="controls ">
                        <button style="margin-top: 25px" ng-if="annuler === true"type="submit" ng-click="annulerOA()" data-ng-disabled="oaform.$invalid" class="btn  btn-success ">Ok</button>
                    </div>
                    
                </div>

            </div>    
        </form>
    </div>
    <div class="span3">
        <button style="margin-top: 25px"type="submit" ng-click="annuler=true;suivre=false"  class="btn  btn-danger pull-right">Annuler</button>
    </div>
</div>
