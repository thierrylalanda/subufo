<%-- 
    Document   : updateBudgetAchat
    Created on : 1 mars 2018, 07:58:46
    Author     : lalanda
--%>

<%--
    Document   : updateBudget
    Created on : 17 août 2017, 07:25:54
    Author     : Administrateur
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div ng-app="TableauDeBord" ng-controller="TableauDeBordController">
    <form role="form"   ng-model="budget" name="budgetForm" action="personnel?action=updateBudgetMagasin&vue=budget achat&id_budget=${budget.getIdBudget()}" method="post">
        <div class="row-fluid layout-gt-xs-row layout-xs-column">
            <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">

                <label class="control-label">Nature</label>

                <div class="controls ">
                    <select name="type_budget" class="form-control span12"  id="" ng-show="nouveau !== true">
                        <option value="${budget.getIdCategorie().getIdCategorieProduit()}" class="">${budget.getIdCategorie().getTypeCategorie()}</option>
                        <c:forEach items="${type_categorie}" var="cats">
                            <c:if test="${budget.getIdCategorie().getIdCategorieProduit() != cats.getIdCategorieProduit()}">
                                <option value="${cats.getIdCategorieProduit()}" class="">${cats.getTypeCategorie()}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                <label class="control-label">Region</label>
                <div class="controls ">
                    <select name="region" class="form-control span12" ng-change="Search(budget.regions); newservice = true;newcc = true" id="" ng-model="budget.regions">
                        <c:forEach items="${regions}" var="reg">
                            <c:if test="${budget.getMagasin().getService().getSite().getRegion().getIdRegion() == reg.getIdRegion()}">
                                <option value="${reg.getIdRegion()}" class="region" ng-selected="true">${budget.getMagasin().getService().getSite().getRegion().getNomRegion()}</option>
                            </c:if>
                            <c:if test="${budget.getMagasin().getService().getSite().getRegion().getIdRegion()!=reg.getIdRegion()}">
                                <option value="${reg.getIdRegion()}" class="region">${reg.getNomRegion()}</option>
                            </c:if>


                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                <label class="control-label">Service</label>
                <div class="controls">
                    <select name="service" ng-change="SearchCentre(budget.services); newcc = true" class="form-control span12" id="" ng-model="budget.services">
                        <option ng-show="newservice !== true" value="${budget.getMagasin().getService().getIdService()}" ng-selected="true" class="region">${budget.getMagasin().getService().getNomService()}</option>
                        <option ng-repeat="ser in service" value="{{ser.id}}">{{ser.nom}}</option>
                    </select>
                </div>
            </div>
            <div class="control-group form-group span2 flex-gt-xs-15 flex-xs" style="">
                <label class="control-label">Centre cout</label>
                <div class="controls">
                    <select class="span12" name="centre_cout"  id="">
                        <option ng-show="newcc !== true" value="${budget.getMagasin().getIdCout()}" class="region">${budget.getMagasin().getLibelle()}</option>
                        <option ng-repeat="ser in centre" value="{{ser.id}}">{{ser.nom}}</option>

                    </select>
                </div>
            </div>


            <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                <label class="control-label" ng-model="budget.montant">Montant</label>
                <div class="controls ">
                    <input type="number" class="  form-control span12 " style=""value="${budget.getMontant()}" name="montant" required placeholder="Montant"/>

                </div>
            </div>
            <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                <label class="control-label">Restant</label>
                <div class="controls ">
                    <input type="number" class="  form-control span12" style=""value="${budget.getMontantRestant()}" name="montantRestant" required placeholder="Montant restant"/>

                </div>
            </div>
    
            <div class="control-group form-group span2 float-label-control flex-gt-xs-15 flex-xs">
                <label class="control-label" for="">Attribution</label>
                <div class="controls ">
                    <input type="text"  style=""class="datepicker  form-control span12" name="dateAttribution" required  value="<f:formatDate value="${budget.getDateDatribution()}" type="DATE" dateStyle="SHORT"/>"/>

                </div>
            </div>
            <div class="control-group form-group span2 float-label-control flex-gt-xs-15 flex-xs">
                <label class="control-label" for="">expiration</label>
                <div class="controls ">
                    <input type="text"  style="" class="datepicker input-lg form-control span12" name="dateExpiration" value="<f:formatDate value="${budget.getDateExpiration()}" type="DATE" dateStyle="SHORT"/>"/>
                </div>
            </div>
            <div class="span2 flex-gt-xs-15 flex-xs">
                <div class="controls ">
                    <button  data-ng-disabled="budgetForm.$invalid" style="margin-top: 30px"type="submit" class="btn  btn-success "><i style="color:white" class="icon icon-save"></i></button>

                </div>
            </div>
        </div>
    
    </form>
</div>