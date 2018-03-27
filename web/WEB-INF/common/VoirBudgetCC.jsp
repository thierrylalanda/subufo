<%-- 
    Document   : VoirBudgetCC
    Created on : 22 mars 2018, 14:39:48
    Author     : lalanda
--%>

<%-- 
    Document   : etablirOA
    Created on : 15 févr. 2018, 11:07:42
    Author     : lalanda
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="voirBudgetCC" class="modal fade hide" style="width: 850px;"tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header" style="background-color: #002752">
                <button type="button" class="close" data-dismiss="modal" style="background-color: red" aria-hidden="true">X</button>


                <h3 class="text-center" style="color: white">Budgets liés au centre de cout : {{BudgetCC[0].centrecout}}</h3>
            </div>
            <div class="modal-body">

                <div class="tab-pane" id="pills-tab5">
                    <div class="row-fluid">

                        <div class="span12">
                            <div class="clearfix">
                                <ul class="nav nav-list faq-list">
                                    <li>
                                        <a class="active" href="#"><i class=" icon-dropbox"></i></a>
                                    </li>

                                    <li>

                                        <table class="table table-bordered table-hover table-striped"  cellspacing="0" width="100%">
                                            <thead>
                                                <tr >
                                                    
                                                    <th>Nature</th>
                                                    <th>Montant</th>
                                                    <th>Montant Restant</th>
                                                    <th>Attribution</th>
                                                    <th>Expiration</th>

                                                </tr>
                                            </thead>
                                            <tbody>





                                                <tr class="produit" ng-repeat="oa in BudgetCC">


                                                   
                                                    <td > {{oa.typeBudget}}</td>
                                                    <td > {{oa.montant | number}}</td>
                                                    <td >{{oa.montantRestant | number}}</td>
                                                    <td >{{oa.dateAtribution | date:'dd/MM/yy'}}</td>
                                                    <td >{{oa.dateExpiration | date:'dd/MM/yy'}}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </li>

                                </ul>
                            </div>
                        </div>


                    </div>
                </div>



            </div>

        </div>
    </div>
</div>