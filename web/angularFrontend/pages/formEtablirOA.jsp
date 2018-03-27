<%-- 
    Document   : formEtablirOA
    Created on : 23 nov. 2017, 14:42:31
    Author     : Administrateur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

   <div class="row-fluid ">
            <div ng-include="'angularFrontend/form/etablirOA.jsp'" ng-if="etablir.type === 'OA'"></div> 
            <div ng-include="'angularFrontend/form/etablirOP.jsp'" ng-if="etablir.type === 'OP'"></div> 
        </div>
    