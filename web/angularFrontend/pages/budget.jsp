<%-- 
    Document   : budget
    Created on : 15 nov. 2017, 10:27:07
    Author     : Administrateur
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="span12 well pages">
    <%-- introduction du menu budget --%>
    <div class="span12" ng-if="add === true">
        <c:import url="/WEB-INF/viewSubufu/form/addBudget.jsp"/>
    </div>

<%-- liste des budgets  --%>

    <div class="span12">
        <button type="button" class="btn btn-success pull-left" ng-click="addForm()">Ajouter</button>

        <form class="pull-right"> 
            <input type="text" ng-model="query" placeholder="recherche"/> 
           
        </form><br><hr>
        <table class="table table-bordered table-hover table-striped "cellspacing="0" width="100%">
            <thead>
                <tr >
                    <th>Service</th>
                    <th>budget pour</th>
                    <th>montant alloue</th>
                    <th>montant restant</th>
                    <th>date Attribution</th>
                    <th>date Expiration</th>
                    <th>Options</th>

                </tr>
            </thead>
            <tbody>


                <tr class="" ng-repeat="bud in budgets | filter:query ">
                    <td >{{bud.service}}</td>
                    <td >{{bud.type}}</td>
                    <td class="pt">{{bud.montant}}</td>
                    <td class="pt">{{bud.montantRestant}}</td>
                    <td>{{bud.attribution}}</td>
                    <td>{{bud.expiration}}</td>
                    <td >
                        <div class="btn-group">
                            <a  href="" ng-click="editeBudget(bud)" class="btn btn-primary" >  <span class="icon"> <i class="icon-edit"></i> </span></a>  
                            <a class="btn btn-danger"  ng-click="deleteBudget(bud)" href="" ><span class="icon"> <i class="icon-trash"></i> </span></a>
                        </div>
                    </td>

                </tr>


            </tbody>
        </table>
       
    </div>
</div>
<toaster-container toaster-options="{'time-out': 3000,'position-class': 'toast-top-right'}"></toaster-container>