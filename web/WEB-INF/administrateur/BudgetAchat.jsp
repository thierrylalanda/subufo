<%-- 
    Document   : BudgetAchat
    Created on : 1 mars 2018, 07:57:52
    Author     : lalanda
--%>
<%-- 
    Document   : controlleur
    Created on : 18 avr. 2017, 16:50:59
    Author     : lalanda
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h3 class="page-title">
    Mis à jour budget d'un service
</h3>
<ul class="breadcrumb">
    <li>

        <a href="admin?vue=accueil&action=getAll"><i class="icon-home"></i> Home</a>
        <span class="divider">/</span>
    </li>
    <li>
        <a href="#"><i class="icon-group"></i> Budget</a>

    </li>

    <li class="pull-right search-wrap">
        <form action="search_result.html" class="hidden-phone">
            <div class="input-append search-input-area">
                <input class="" id="appendedInputButton" type="text">
                <button class="btn" type="button"><i class="icon-search"></i> </button>
            </div>
        </form>
    </li>
</ul>

<div class="widget">
    <div class="widget-title">
        <h4><i class="icon-reorder"></i> Espace budgetaire</h4>
        <span class="tools">
            <a href="javascript:;" class="icon-chevron-down"></a>
            <a href="javascript:;" class="icon-remove"></a>
        </span>
    </div>
    <div class="widget-body">
        <div class="bs-docs-example">
            <ul class="nav nav-tabs" id="myTab">


                <li class="active"><a href="#add-budget" data-toggle="tab">Liste des budgets</a> </li>

            </ul>
            <div class="tab-content" id="myTabContent">

                <div id="add-budget" class="tab-pane fade in active">
                    <c:if test="${not empty updatebudget}">
                        <h3 class="text-info">mettre à jour le budget</h3>
                    </c:if>

                    <div class="row-fluid">
                        <div class=" span12 text-center text-info"><h2><span class="icon"> <i class="icon-dollar"></i> Budgets</span></h2></div>
                                    <c:if test="${not empty updatebudget}">
                                        <c:import url="/WEB-INF/administrateur/updateBudgetAchat.jsp"/>
                                    </c:if>
                                    <c:if test="${empty updatebudget}">
                            <form ng-app="recherche" ng-controller="recherche" role="form" name="budgetForm" ng-model="budget" action="personnel?action=addBudgetMagasin&vue=budget achat&rubrique=yes" method="post">
                                <div class="span12" >
                                    <div class="clearfix">
                                        <ul class="nav nav-list faq-list">
                                            <li style="margin-top: 10px" class="">
                                                <div class="row-fluid layout-gt-xs-row layout-xs-column">

                                                    <div class="span1 flex-gt-xs-15 flex-xs " >
                                                        <strong class="">Nature</strong>
                                                        <select name="type_budget" class="span12 " ng-model="budget.type" id="" >
                                                            <option value="">--Aucun</option>
                                                            <c:forEach items="${type_categorie}" var="cats">
                                                                <c:if test="${not empty cats.getStocker()}">
                                                                    <option value="${cats.getIdCategorieProduit()}" class="">${cats.getTypeCategorie()}</option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>

                                                    </div>




                                                    <div class=" span1 flex-gt-xs-15 flex-xs">
                                                        <strong class="">Region</strong>
                                                        <select name="region" ng-change="Search(budget.region)" ng-model="budget.region" class="span12 " id="">
                                                            <option value="" ng-selected="true">--Aucune--</option>
                                                            <c:forEach items="${regions}" var="reg">

                                                                <option value="${reg.getIdRegion()}" class="">${reg.getNomRegion()}</option>

                                                            </c:forEach>
                                                        </select>
                                                    </div>



                                                    <div class="span1 flex-gt-xs-15 flex-xs  ">
                                                        <strong class="">Service</strong>
                                                        <select class="span12" name="service"  id="" ng-change="SearchCentre(budget.service)" ng-model="budget.service"  required>
                                                            <option value="" ng-selected="true">--Aucun--</option>
                                                            <option ng-repeat="ser in service" value="{{ser.id}}">{{ser.nom}}</option>

                                                        </select>
                                                    </div>




                                                    <div class="span1 flex-gt-xs-15 flex-xs">
                                                        <strong class="">CentreCout</strong>

                                                        <select class="span12" name="centre_cout"  id="" ng-model="budget.centre" >
                                                            <option value="" ng-selected="true">--Aucun--</option>
                                                            <option ng-repeat="ser in centre" value="{{ser.id}}">{{ser.nom}}</option>

                                                        </select>
                                                    </div>
                                                    <div class=" span1 flex-gt-xs-15 flex-xs " >
                                                        <strong class="">Montant</strong>
                                                        <input type="number" ng-model="budget.montant" class="span12 " style="" name="montant" required placeholder="Montant"/>

                                                    </div>
                                                    <div class="span1 flex-gt-xs-15 flex-xs " >
                                                        <strong class="" for="">Attribution</strong>
                                                        <input type="text" style=""  style="" ng-model="budget.dateAtt" class="datepicker span12"  name="dateAttribution" required placeholder="date Attribution"/>

                                                    </div>
                                                    <div class=" span1 flex-gt-xs-15 flex-xs">
                                                        <strong class="" for="">expiration</strong>
                                                        <input type="text"  style="" ng-model="budget.dateExp"  class="datepicker span12" name="dateExpiration" required placeholder="date expiration"/>

                                                    </div>

                                                    <div class="span1 flex-gt-xs-15 flex-xs">

                                                        <div class=" ">
                                                            <button  data-ng-disabled="budgetForm.$invalid" style="margin-top: 25px"type="submit" class="btn  btn-success "><i style="color:white" class="icon icon-plus"></i></button>
                                                        </div>

                                                    </div>

                                                </div>

                                            </li>


                                        </ul>
                                    </div>
                                </div>
                            </form>
                        </c:if>

                    </div>
                    <div class="space20"></div>

                    <div class="row-fluid">
                        <table class="table table-bordered table-hover table-striped simple_print"cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>Centre de cout</th>
                                    <th>Nature</th>
                                    <th>Montant alloue</th>
                                    <th>Montant restant</th>
                                    <th>Date Attribution</th>
                                    <th>Date Expiration</th>
                                    <th>Options</th>

                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach  items="${butget}" var="bud">
                                    <c:if test="${not empty bud.getRubriques()}">
                                        <tr class="">
                                            <td >${bud.getMagasin().getLibelle()}</td>
                                            <td>${bud.getTypeBudget()}</td>
                                            <td class="pt"><f:formatNumber value="${bud.getMontant()}"type="CURRENCY" currencySymbol="FCFA"/></td>
                                            <td class="pt"><f:formatNumber value="${bud.getMontantRestant()}"type="CURRENCY" currencySymbol="FCFA"/></td>
                                            <td><f:formatDate value="${bud.getDateDatribution()}" type="Date" dateStyle="MEDIUM"/></td>
                                            <td><f:formatDate value="${bud.getDateExpiration()}" type="Date" dateStyle="MEDIUM"/></td>
                                            <td >
                                                <div class="btn-group">
                                                    <a title="" href="personnel?action=updatebudget&vue=budget achat&id_budget=${bud.getIdBudget()}" class="btn btn-primary" >  <span class="icon"> <i class="icon-edit"></i> </span></a>  
                                                    <a class="btn btn-danger delete-insert" href="#" name="personnel?action=deletebudget&vue=budget achat&id_budget=${bud.getIdBudget()}"data-toggle="modal" data-target="" ><span class="icon"> <i class="icon-trash"></i> </span></a>
                                                </div>
                                            </td>

                                        </tr>
                                    </c:if>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="space20"></div>

            </div>
        </div>
    </div>
</div>


