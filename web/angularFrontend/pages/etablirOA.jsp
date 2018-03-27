<%-- 
    Document   : etablirOA
    Created on : 22 nov. 2017, 17:14:32
    Author     : Administrateur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    
 
        <div class="row-fluid" ng-if="demande != null && etabli==false">
            <div ng-include="'angularFrontend/form/facture.jsp'" ng-if="demande.type === 'facture'"></div> 
            <div ng-include="'angularFrontend/form/stagiaire.jsp'" ng-if="demande.type === 'stagiaire'"></div> 
            <div ng-include="'angularFrontend/form/personnel.jsp'" ng-if="demande.type === 'personnel'"></div> 
            <div ng-include="'angularFrontend/form/mission.jsp'" ng-if="demande.type === 'mission'"></div> 
        </div>



