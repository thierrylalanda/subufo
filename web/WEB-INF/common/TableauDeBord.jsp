<%-- 
    Document   : TableauDeBord
    Created on : 5 févr. 2018, 09:22:57
    Author     : lalanda
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="widget" ng-app="TableauDeBord">
    <div class="widget-title">
        <h4><i class="icon-dashboard"></i> Tableau de bord</h4>
        <span class="tools">
            <a class="icon-chevron-down" href="javascript:;"></a>
            <a class="icon-remove" href="javascript:;"></a>
        </span>
    </div>
    <div class="widget-body" ng-controller="TableauDeBordController">
        <div class="tab-pane" id="pills-tab5">
            <div class="row-fluid">
                <div class="span6" >
                    <div class="clearfix">
                        <ul class="nav nav-list faq-list">
                            <li>
                                <a class="active" href="#"><i class=" icon-dashboard"></i> Depenses Generales </a>
                            </li>
                            <li class="active"style="margin-top: 10px">
                                <form role="form" name="recherche_moisForm" ng-model="recherche_mois" style="padding:7px ">
                                    <select class="" name="" style="width: 80px" id="" ng-model="recherche_mois.critereGlobal" ng-click="recherche_mois.mois = null" required>
                                        <option value="" ng-selected="true">--Critère--</option>
                                        <option value="tous">Societe</option>
                                        <option value="region">Region</option>
                                        <option value="direction">Direction</option>
                                        <option value="site">Site</option>
                                        <option value="service">Service</option>

                                    </select>
                                    <select class="" name="" style="width: 80px"  id="" ng-model="recherche_mois.critere" ng-click="recherche_mois.mois = null" required>
                                        <option value="annee">Annee</option>
                                        <option value="mois">mois</option>
                                    </select>

                                    <select class="all-date" style="width: 80px" name="" id="" ng-if="recherche_mois.critere === 'mois' || recherche_mois.critere === 'annee'" ng-model="recherche_mois.annee" required>

                                    </select>


                                    <select class="" style="width: 100px" id=""  name="statut" ng-if="recherche_mois.critere === 'mois'" ng-model="recherche_mois.mois" required>

                                        <option value="1">Janvier</option>
                                        <option value="2">Fevrier</option>
                                        <option value="3">Mars</option>
                                        <option value="4">Avril</option>
                                        <option value="5">Mai</option>
                                        <option value="6">Juin</option>
                                        <option value="7">Juillet</option>
                                        <option value="8">Aout</option>
                                        <option value="9">Septembre</option>
                                        <option value="10">Octobre</option>
                                        <option value="11">Novembre</option>
                                        <option value="12">Decembre</option>

                                    </select>

                                    <select class="" ng-if="recherche_mois.critereGlobal === 'region' || recherche_mois.critereGlobal === 'service'" ng-change="Search(rechercheGlobal.region)" name="" style="width: 80px" id=""  ng-model="rechercheGlobal.region" required>
                                        <option value="" ng-selected="true">--Region--</option>
                                        <c:forEach items="${regions}" var="reg">

                                            <option value="${reg.getIdRegion()}" class="">${reg.getNomRegion()}</option>

                                        </c:forEach>
                                    </select>
                                    <select class="" ng-if="recherche_mois.critereGlobal === 'direction'" name="" style="width: 80px" id="" ng-model="recherche_mois.direction"  required>
                                        <option value="" ng-selected="true">--direction--</option>
                                        <c:forEach items="${directions}" var="dir">

                                            <option value="${dir.getIdDirection()}" class="">${dir.getNomDirection()}</option>

                                        </c:forEach>
                                    </select>
                                    <select class="" ng-if="recherche_mois.critereGlobal === 'site'" name="" style="width: 80px" id="" ng-model="recherche_mois.site"  required>
                                        <option value="" ng-selected="true">--Site--</option>
                                        <c:forEach items="${sites}" var="site">

                                            <option value="${site.getIdSite()}" class="">${site.getNomSite()}</option>

                                        </c:forEach>
                                    </select>
                                    <select class="" ng-if="recherche_mois.critereGlobal === 'service'" name="" style="width: 80px" id="" ng-model="recherche_mois.service"  required>
                                        <option value="" ng-selected="true">--Service--</option>
                                        <option ng-repeat="ser in service" value="{{ser.id}}">{{ser.nom}}</option>

                                    </select>
                                    <button ng-click="changegrapheMois(recherche_mois)" style="margin-top: -10px" ng-disabled="recherche_moisForm.$invalid" class="btn btn-primary">Ok</button>
                                </form>
                            </li>
                            <li>
                                <div class="row-fluid " id="stat-chart">

                                </div>

                            </li>

                        </ul>
                    </div>
                </div>

                <div class="span6">
                    <div class="clearfix">
                        <ul class="nav nav-list faq-list">
                            <li>
                                <a class="active" href="#"><i class=" icon-dropbox"></i> details Depenses</a>
                            </li>
                            <li style="margin-top: 10px">
                                <form role="form" name="rechercheGlobalForm" ng-model="rechercheGlobal" style="padding:7px ">
                                    <select class="" name="" style="width: 80px" id="" ng-model="rechercheGlobal.critereGlobal" ng-click="recherche_mois.mois = null" required>
                                        <option value="" ng-selected="true">--Critère--</option>
                                        <option value="tous">Societe</option>
                                        <option value="region">Region</option>
                                        <option value="direction">Direction</option>
                                        <option value="site">Site</option>
                                        <option value="service">Service</option>

                                    </select>
                                    <select class="" style="width: 80px" name="" id="" ng-model="rechercheGlobal.critere" ng-click="rechercheGlobal.mois = null" required>
                                        <option value="annee">Annee</option>
                                        <option value="mois">mois</option>

                                    </select>

                                    <select class="all-date" style="width: 80px" name="" id="" ng-if="rechercheGlobal.critere === 'mois' || rechercheGlobal.critere === 'annee'" ng-model="rechercheGlobal.annee" required>

                                    </select>

                                    <select class="select " style="width: 100px" id=""  name="" ng-if="rechercheGlobal.critere === 'mois'" ng-model="rechercheGlobal.mois" required>

                                        <option value="1">Janvier</option>
                                        <option value="2">Fevrier</option>
                                        <option value="3">Mars</option>
                                        <option value="4">Avril</option>
                                        <option value="5">Mai</option>
                                        <option value="6">Juin</option>
                                        <option value="7">Juillet</option>
                                        <option value="8">Aout</option>
                                        <option value="9">Septembre</option>
                                        <option value="10">Octobre</option>
                                        <option value="11">Novembre</option>
                                        <option value="12">Decembre</option>

                                    </select>
                                    <select ng-change="Search1(rechercheGlobal.region)" class="" ng-if="rechercheGlobal.critereGlobal === 'region' || rechercheGlobal.critereGlobal === 'service'" name="" style="width: 80px" id="" ng-model="rechercheGlobal.region" required>
                                        <option value="" ng-selected="true">--Region--</option>
                                        <c:forEach items="${regions}" var="reg">

                                            <option value="${reg.getIdRegion()}" class="">${reg.getNomRegion()}</option>

                                        </c:forEach>
                                    </select>
                                    <select class="" ng-if="rechercheGlobal.critereGlobal === 'direction'" name="" style="width: 80px" id="" ng-model="rechercheGlobal.direction"  required>
                                        <option value="" ng-selected="true">--Direction--</option>
                                        <c:forEach items="${directions}" var="dir">

                                            <option value="${dir.getIdDirection()}" class="">${dir.getNomDirection()}</option>

                                        </c:forEach>
                                    </select>
                                    <select class="" ng-if="rechercheGlobal.critereGlobal === 'site'" name="" style="width: 80px" id="" ng-model="rechercheGlobal.site"  required>
                                        <option value="" ng-selected="true">--Site--</option>
                                        <c:forEach items="${sites}" var="site">

                                            <option value="${site.getIdSite()}" class="">${site.getNomSite()}</option>

                                        </c:forEach>
                                    </select>
                                    <select class="" ng-if="rechercheGlobal.critereGlobal === 'service'" name="" style="width: 80px" id="" ng-model="rechercheGlobal.service"  required>
                                        <option value="" ng-selected="true">--Service--</option>
                                        <option ng-repeat="ser in service1" value="{{ser.id}}">{{ser.nom}}</option>
                                    </select>
                                    <button ng-click="changegrapheGlobal(rechercheGlobal)" style="margin-top: -10px" ng-disabled="rechercheGlobalForm.$invalid" class="btn btn-primary">Ok</button>
                                </form>
                            </li>
                            <li class="">
                                <div class="row-fluid " id="stat-chart2">

                                </div>

                            </li>


                        </ul>
                    </div>
                </div>
            </div>

            <div class="row-fluid">


                <div class="span12" >
                    <div class="clearfix">
                        <ul class="nav nav-list faq-list">
                            <li>
                                <a class="active" href="#"><i class=" icon-info"></i> Evolution comparative des depenses</a>
                            </li>
                            <li style="margin-top: 10px">
                                <form role="form" name="rechercheForm" ng-model="recherche" style="padding:7px ">
                                    <select class="" name="" style="width: 80px" id="" ng-model="recherche.critereGlobal" ng-click="recherche_mois.mois = null" required>
                                        <option value="" ng-selected="true">--Critère--</option>
                                        <option value="tous">Societe</option>
                                        <option value="region">Region</option>
                                        <option value="direction">Direction</option>
                                        <option value="site">Site</option>
                                        <option value="service">Service</option>

                                    </select>
                                    <select class="all-date" style="width: 80px" name="" id="" ng-model="recherche.annee">


                                    </select>



                                    <select class="select " id="" style="width: 100px" name="statut" ng-model="recherche.statut" required>
                                        <option value="" ng-selected="true">--statut--</option>
                                        <option value="Achat">Mes achats</option>
                                        <option value="valider">Valider</option>
                                        <option value="encour...">Encours</option>
                                        <option value="rejeter">Rejeter</option>
                                    </select>
                                    <select ng-change="Search2(recherche.region)" class="" ng-if="recherche.critereGlobal === 'region' || recherche.critereGlobal === 'service'" name="" style="width: 80px" id=""  ng-model="recherche.region" required>
                                        <option value="" ng-selected="true">--Region--</option>
                                        <c:forEach items="${regions}" var="reg">

                                            <option value="${reg.getIdRegion()}" class="">${reg.getNomRegion()}</option>

                                        </c:forEach>
                                    </select>
                                    <select class="" ng-if="recherche.critereGlobal === 'direction'" name="" style="width: 80px" id="" ng-model="recherche.direction"  required>
                                        <option value="" ng-selected="true">--Direction--</option>
                                        <c:forEach items="${directions}" var="dir">

                                            <option value="${dir.getIdDirection()}" class="">${dir.getNomDirection()}</option>

                                        </c:forEach>
                                    </select>
                                    <select class="" ng-if="recherche.critereGlobal === 'site'" name="" style="width: 80px" id="" ng-model="recherche.site"  required>
                                        <option value="" ng-selected="true">--Site--</option>
                                        <c:forEach items="${sites}" var="site">

                                            <option value="${site.getIdSite()}" class="">${site.getNomSite()}</option>

                                        </c:forEach>
                                    </select>
                                    <select class="" ng-if="recherche.critereGlobal === 'service'" name="" style="width: 80px" id="" ng-model="recherche.service"  required>
                                        <option value="" ng-selected="true">--Service--</option>
                                        <option ng-repeat="ser in service2" value="{{ser.id}}">{{ser.nom}}</option>
                                    </select>
                                    <button ng-click="changegraphe(recherche)" style="margin-top: -10px" ng-disabled="rechercheForm.$invalid" class="btn btn-primary">Rechercher</button>
                                </form>
                            </li>
                            </li>
                            <li class="">

                                <div id="barchar" class="row-fluid"></div>
                            </li>


                        </ul>
                    </div>
                </div>



            </div>

            <div class="row-fluid">
                <div class="span6" >
                    <div class="clearfix">
                        <ul class="nav nav-list faq-list">
                            <li>
                                <a class="active" href="#"><i class=" icon-dashboard"></i> Depenses Generales du service : </a>
                            </li>
                            <li style="margin-top: 10px">
                                <form role="form" name="recherche_moisServiceForm" ng-model="recherche_moisService" style="padding:7px ">
                                    <strong class="" style="color: white" for="">critere :</strong>

                                    <select class="" name="" style="width: 80px" id="" ng-model="recherche_moisService.critere" ng-click="recherche_moisService.mois = null" required>
                                        <option value="annee">Annee</option>
                                        <option value="mois">mois</option>

                                    </select>

                                    <select class="all-date" style="width: 80px" name="" id="" ng-if="recherche_moisService.critere === 'mois' || recherche_moisService.critere === 'annee'" ng-model="recherche_moisService.annee" required>

                                    </select>
                                    <strong class="" style="color: black" ng-show="recherche_moisService.statut === 'mois'" >Statut </strong>

                                    <select class=" " style="width: 100px" id=""  name="statut" ng-if="recherche_moisService.critere === 'mois'" ng-model="recherche_moisService.mois" required>

                                        <option value="1">Janvier</option>
                                        <option value="2">Fevrier</option>
                                        <option value="3">Mars</option>
                                        <option value="4">Avril</option>
                                        <option value="5">Mai</option>
                                        <option value="6">Juin</option>
                                        <option value="7">Juillet</option>
                                        <option value="8">Aout</option>
                                        <option value="9">Septembre</option>
                                        <option value="10">Octobre</option>
                                        <option value="11">Novembre</option>
                                        <option value="12">Decembre</option>

                                    </select>
                                    <button ng-click="changegrapheMoisService(recherche_moisService)" style="margin-top: -10px" ng-disabled="recherche_moisServiceForm.$invalid" class="btn btn-primary">Ok</button>
                                </form>
                            </li>
                            <li>
                                <div class="row-fluid " id="stat-chart_service">

                                </div>

                            </li>

                        </ul>
                    </div>
                </div>

                <div class="span6">
                    <div class="clearfix">
                        <ul class="nav nav-list faq-list">
                            <li>
                                <a class="active" href="#"><i class=" icon-dropbox"></i> details Depenses du service: </a>
                            </li>
                            <li style="margin-top: 10px">
                                <form role="form" name="rechercheGlobalServiceForm" ng-model="rechercheGlobalService" style="padding:7px ">
                                    <strong class="" style="color: white" for="">critere :</strong>

                                    <select class="" style="width: 80px" name="" id="" ng-model="rechercheGlobalService.critere" ng-click="rechercheGlobal.mois = null" required>
                                        <option value="annee">Annee</option>
                                        <option value="mois">mois</option>

                                    </select>

                                    <select class="all-date" style="width: 80px" name="" id="" ng-if="rechercheGlobalService.critere === 'mois' || rechercheGlobalService.critere === 'annee'" ng-model="rechercheGlobalService.annee" required>

                                    </select>
                                    <strong class="" style="color: black" ng-show="rechercheGlobalService.statut === 'mois'" >Statut </strong>

                                    <select class="select " style="width: 100px" id=""  name="" ng-if="rechercheGlobalService.critere === 'mois'" ng-model="rechercheGlobalService.mois" required>

                                        <option value="1">Janvier</option>
                                        <option value="2">Fevrier</option>
                                        <option value="3">Mars</option>
                                        <option value="4">Avril</option>
                                        <option value="5">Mai</option>
                                        <option value="6">Juin</option>
                                        <option value="7">Juillet</option>
                                        <option value="8">Aout</option>
                                        <option value="9">Septembre</option>
                                        <option value="10">Octobre</option>
                                        <option value="11">Novembre</option>
                                        <option value="12">Decembre</option>

                                    </select>
                                    <button ng-click="changegrapheGlobalService(rechercheGlobalService)" style="margin-top: -10px" ng-disabled="rechercheGlobalForm.$invalid" class="btn btn-primary">Ok</button>
                                </form>
                            </li>
                            <li class="">
                                <div class="row-fluid " id="stat-chart2_service">

                                </div>

                            </li>


                        </ul>
                    </div>
                </div>
            </div>

            <div class="row-fluid">


                <div class="span12" >
                    <div class="clearfix">
                        <ul class="nav nav-list faq-list">
                            <li>
                                <a class="active" href="#"><i class=" icon-info"></i> Evolution comparative des depenses du service :</a>
                            </li>
                            <li style="margin-top: 10px">
                                <form role="form" name="rechercheServiceForm" ng-model="rechercheService" style="padding:7px ">
                                    <strong class="" style="color: white" for="">Annee</strong>

                                    <select class="all-date" style="width: 80px" name="" id="" ng-model="rechercheService.annee">


                                    </select>


                                    <strong class="" style="color: black" >Statut </strong>
                                    <select class="select " id="" style="width: 100px" name="statut" ng-model="rechercheService.statut" required>
                                        <option value="Achat">Mes achats</option>
                                        <option value="valider">Valider</option>
                                        <option value="encour...">Encours</option>
                                        <option value="rejeter">Rejeter</option>


                                    </select>
                                    <button ng-click="changegrapheService(rechercheService)" style="margin-top: -10px" ng-disabled="rechercheServiceForm.$invalid" class="btn btn-primary">Rechercher</button>
                                </form>
                            </li>
                            </li>
                            <li class="">

                                <div id="barchar_service" class="row-fluid"></div>
                            </li>


                        </ul>
                    </div>
                </div>



            </div>
        </div>

    </div>
</div>