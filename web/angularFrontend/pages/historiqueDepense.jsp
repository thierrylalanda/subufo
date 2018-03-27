<%-- 
    Document   : historiqueDepense
    Created on : 15 nov. 2017, 10:32:18
    Author     : Administrateur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="span12 well pages">
    <h3>
        Historiques des demandes
    </h3>
    <table class="table table-bordered table-hover table-striped "cellspacing="0" width="100%" >
        <thead>
            <tr >
                <th>Nature</th>
                <th>libelle</th>
                <th>Quantite</th>
                <th>Prix Unitaire</th>
                <th>Montant ligne</th>
                <th>date</th>
               

            </tr>
        </thead>
        <tbody>


            <tr class="" ng-repeat="bud in demandes | filter:query ">
                <td >{{bud.code}}</td>
                <td >{{bud.description}}</td>
                <td class="pt">{{bud.quantite}}</td>
                <td class="pt">{{bud.montant}}</td>
                <td>{{bud.total}}</td>
                <td>{{bud.date}}</td>
              

            </tr>


        </tbody>
    </table>
</div>