<%-- 
    Document   : listeOA
    Created on : 15 nov. 2017, 10:38:36
    Author     : Administrateur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="clearfix">
    <ul class="nav nav-list faq-list">
        <li>
            <a class="active"><i class=" icon-signin"></i> Demandes à valider </a>
        </li>
        <li >
            <input type="text" style="margin-left: -20px" ng-model="query" placeholder="rechercher un personnel" />
        </li>

        <li ng-repeat="demande in demandes | filter:query">
            <a href="#/valider/{{demande.type}}" ng-click="showDemande(demande)"><i class="icon-user"></i> {{demande.nom}}</a>
        </li>
            
     


    </ul>
</div>