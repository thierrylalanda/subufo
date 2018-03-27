<%-- 
    Document   : depenses
    Created on : 30 janv. 2018, 13:35:42
    Author     : Administrateur
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="widget" ng-app="recherche">
    <div class="widget-title">
        <h4><i class="icon-reorder"></i>Reporting sur les Depenses</h4>
        <span class="tools">
            <a href="javascript:;" class="icon-chevron-down"></a>
            <a href="javascript:;" class="icon-remove"></a>
        </span>
    </div>
    <div class="widget-body">
        <div class="bs-docs-example">
            <div class="row-fluid" ng-controller="recherche">
                <form role="form" name="rechercheForm" ng-model="recherche" method="post" action="validerDepense?action=reporting_recherche&vue=reportingDepense" style="padding:7px ">
                    <div class="row-fluid" >
                        <div class="span12 layout-gt-xs-row layout-xs-row">
                            <div class="control-group form-group span1 flex-gt-xs-10 flex-xs">
                                <label class="control-label ">Critères</label>
                                <select class="span12" name="" style="" id="" ng-model="recherche.critereGlobal" ng-click="recherche.mois = null" required>
                                    <option value="" ng-selected="true">--Critère--</option>
                                    <option value="tous">Societe</option>
                                    <option value="region">Region</option>
                                    <option value="direction">Direction</option>

                                    <option value="service">Service</option>
                                    <option value="personnel">Personnel</option>
                                </select>
                            </div>


                            <div class="control-group form-group span1 flex-gt-xs-10 flex-xs" ng-if="recherche.critereGlobal === 'region'">
                                <label class="control-label ">Region</label>
                                <select class="span12" ng-if="recherche.critereGlobal === 'region'" name="region" style="width: 80px" id=""  ng-model="recherche.region" required>
                                    <option value="" ng-selected="true">--Region--</option>
                                    <c:forEach items="${regions}" var="reg">

                                        <option value="${reg.getIdRegion()}" class="">${reg.getNomRegion()}</option>

                                    </c:forEach>
                                </select>
                            </div>


                            <div class="control-group form-group span1 flex-gt-xs-10 flex-xs" ng-if="recherche.critereGlobal === 'personnel' || recherche.critereGlobal === 'service'">
                                <label class="control-label ">Region</label>
                                <select class="span12" ng-if="recherche.critereGlobal === 'personnel' || recherche.critereGlobal === 'service'" ng-change="Search(recherche.region1)" name="" style="width: 80px" id=""  ng-model="recherche.region1" required>
                                    <option value="" ng-selected="true">--Region--</option>
                                    <c:forEach items="${regions}" var="reg">

                                        <option value="${reg.getIdRegion()}" class="">${reg.getNomRegion()}</option>

                                    </c:forEach>
                                </select>
                            </div>

                            <div class="control-group form-group span1 flex-gt-xs-10 flex-xs" ng-if="recherche.critereGlobal === 'direction'">
                                <label class="control-label ">Direction</label>
                                <select class="span12" ng-if="recherche.critereGlobal === 'direction'" name="direction" style="width: 80px" id="" ng-model="recherche.direction"  required>
                                    <option value="" ng-selected="true">--direction--</option>
                                    <c:forEach items="${directions}" var="dir">

                                        <option value="${dir.getIdDirection()}" class="">${dir.getNomDirection()}</option>

                                    </c:forEach>
                                </select>
                            </div>



                            <div class="control-group form-group span1 flex-gt-xs-10 flex-xs" ng-if="recherche.critereGlobal === 'service'">
                                <label class="control-label ">Service</label>
                                <select class="span12" ng-if="recherche.critereGlobal === 'service'" name="service" style="width: 80px" id="" ng-model="recherche.service"  required>
                                    <option value="" ng-selected="true">--Service--</option>
                                    <option ng-repeat="ser in service" value="{{ser.id}}">{{ser.nom}}</option>

                                </select>
                            </div>

                            <div class="control-group form-group span1 flex-gt-xs-10 flex-xs" ng-if="recherche.critereGlobal === 'personnel'">
                                <label class="control-label ">Service</label>
                                <select class="span12" ng-change="SearchPersonnel(recherche.service1)" ng-if="recherche.critereGlobal === 'personnel'" name="" style="width: 80px" id="" ng-model="recherche.service1"  required>
                                    <option value="" ng-selected="true">--Service--</option>
                                    <option ng-repeat="ser in service" value="{{ser.id}}">{{ser.nom}}</option>

                                </select> 
                            </div>

                            <div class="control-group form-group span1 flex-gt-xs-10 flex-xs" ng-if="recherche.critereGlobal === 'personnel'">
                                <label class="control-label ">Personnel</label>
                                <select class="exampleSelect span12" ng-if="recherche.critereGlobal === 'personnel'" name="personnel" style="width: 80px" id="articlesCateorie" ng-model="recherche.personnel"  required>
                                    <option value="" ng-selected="true">--Personnel--</option>
                                    <option ng-repeat="per in personnels" value="{{per[0]}}">{{per[1]}}</option>

                                </select>
                            </div>



                            <div class="control-group form-group span1 flex-gt-xs-15 flex-xs">
                                <label class="control-label ">Du</label>
                                <input type="text"  name="date1" style="" class="span12 datepicker form-control " ng-model="recherche.debut" required />

                            </div>
                            <div class="control-group form-group span1 flex-gt-xs-15 flex-xs">
                                <label class="control-label ">Au</label>
                                <input type="text"  name="date2" style="" class="span12 datepicker form-control " ng-model="recherche.fin" required/>

                            </div>

                            <div class="control-group form-group span1 flex-gt-xs-10 flex-xs">
                                <label class="control-label ">Nature</label>
                                <div class="controls ">
                                    <select name="nature" class="form-control span12" ng-model="recherche.type" id="" style="width: 80px" required>
                                        <option value="">--Aucun</option>
                                        <option value="tous" class="">Tous</option>
                                        <c:forEach items="${natures}" var="cats">

                                            <option value="${cats.getTypeCategorie()}" class="">${cats.getTypeCategorie()}</option>

                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group form-group span1 flex-gt-xs-10 flex-xs">

                                <button  style="margin-top: 25px" type="submit" ng-disabled="rechercheForm.$invalid" class="btn btn-primary">Rechercher</button>

                            </div>
                        </div>

                    </div>

                </form>
            </div>

            <div id="" class="row-fluid">

                <c:if test="${not empty message}">
                    <div class="alert alert-block alert-info " style="">
                        ${message}
                    </div>

                </c:if>
                <table class="table table-bordered table-hover table-striped simple_print"  cellspacing="0" width="100%">
                    <thead>
                        <tr >
                            <th>Nature</th>

                            <th>Demandeur</th>
                            <th>Montant</th>
                            <th>Statut</th>
                            <th>Date</th>


                        </tr>
                    </thead>
                    <tbody>



                        <c:set var="total" value="${0}"></c:set>
                        <c:if test="${depenses != null}">
                            <c:forEach items="${depenses}" var="depense">
                                <tr class="produit">
                                    <td >${depense.getNatureDepense()} </td>

                                    <td >${depense.getDemandeur().getNomPrenom()} </td>
                                    <td > <f:formatNumber value="${depense.getMontantTtc()}"type="CURRENCY" currencySymbol="FCFA"/></td>
                                    <td ><span class="label <c:if test="${depense.getStatut() == 'valider'}">label-success</c:if> <c:if test="${depense.getStatut() == 'rejeter'}">label-warning</c:if><c:if test="${depense.getStatut() == 'encour...'}">label-info</c:if>">${depense.getStatut()}</span></td>
                                    <td ><f:formatDate value="${depense.getDateDemande()}" type="Date" dateStyle="MEDIUM"/> </td>
                                    <c:set var="total" value="${total + depense.getMontantTtc()}"></c:set>
                                    </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${depenses == null}">
                            <c:forEach items="${map.keySet()}" var="dep">
                                <tr class="produit">
                                    <td >Achat_${dep} </td>

                                    <td >Magasin général </td>
                                    <td > <f:formatNumber value="${map.get(dep)}"type="CURRENCY" currencySymbol="FCFA"/></td>
                                    <td ><span class="label label-success">Valider</span></td>
                                    <td ><f:formatDate value="${d1}" type="Date" dateStyle="MEDIUM"/> - <f:formatDate value="${d2}" type="Date" dateStyle="MEDIUM"/></td>
                                    <c:set var="total" value="${total + map.get(dep)}"></c:set>
                                    </tr>
                            </c:forEach>
                        </c:if>
                    </tbody>
                    <tfoot>
                        <tr  class="text-capitalize text-center text-success text-primary text-info">
                            <td  colspan="5">
                                La Somme Total est de: <f:formatNumber value="${total}" type="CURRENCY" currencySymbol="FCFA"/>
                            </td>

                        </tr>
                    </tfoot>
                </table>

            </div>
        </div>
    </div>
</div>

