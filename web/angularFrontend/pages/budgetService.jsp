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
    <li ><a href="#/valider/{{demande.type}}">OA a valider</a></li>
    <li class="active"><a href="#/budgetservice/{{demande.type}}">Budget du service</a></li>
</ul>

<h3>BUDGET DU SERVICE</h3>
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