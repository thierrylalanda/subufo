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

<div id="etablirOA" class="modal fade hide" style="width: 850px;"tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header" style="background-color: #002752">


                <h3 class="text-center" style="color: white">Etablissement  de : {{getdemande.demandeur}}</h3>
            </div>
            <div class="modal-body">

                <div class="tab-pane" id="pills-tab5">
                    <div class="row-fluid">

                        <div class="span12">
                            <div class="clearfix">
                                <ul class="nav nav-list faq-list">
                                    <li>
                                        <a class="active" href="#"><i class=" icon-dropbox"></i> details Demande</a>
                                    </li>
                                    <li class="">
                                        <form role="form" name="demandeOAForm" ng-model="demandeOA">

                                            <div class="row-fluid">
                                                <div class="control-group form-group span2 ">
                                                    <label class="control-label">Region</label>
                                                    <div class=" controls">

                                                        <select required style="width: 75%" name="region" ng-change="Search(demandeOA.region)" ng-model="demandeOA.region" class=" " id="">
                                                            <option value="" ng-selected="true">--Aucune--</option>
                                                            <c:if test="${empty region}">
                                                                <c:forEach items="${regions}" var="reg">

                                                                    <option value="${reg.getIdRegion()}" class="">${reg.getNomRegion()}</option>

                                                                </c:forEach>
                                                            </c:if>
                                                            <c:if test="${not empty region}">
                                                                <option value="${region.getIdRegion()}" class="">${region.getNomRegion()}</option>
                                                            </c:if>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="control-group form-group span2">
                                                    <label class="control-label">Service</label>
                                                    <div class="controls ">

                                                        <select style="width: 75%" class="" name="service"  id="" ng-change="SearchCentre(demandeOA.service)" ng-model="demandeOA.service"  required>
                                                            <option value="" ng-selected="true">--Aucun--</option>
                                                            <option ng-repeat="ser in services" value="{{ser.id}}">{{ser.nom}}</option>

                                                        </select>

                                                    </div>
                                                </div>
                                                <div class="control-group form-group span2">
                                                    <label class="control-label">Centre cout</label>
                                                    <div class="controls ">

                                                        <select class="" required style="width: 75%" name="centrecout"  id="" ng-change="SearchBudget(demandeOA.centrecout)" ng-model="demandeOA.centrecout" >
                                                            <option value="" ng-selected="true">--Aucun--</option>
                                                            <option value="{{demandeOA.centrecout}}" ng-show="demandeOA.centrecout" ng-selected="true">{{demandeOA.centrecout.nom}}</option>
                                                            <option ng-repeat="ser in centres" value="{{ser}}">{{ser.nom}}</option>

                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="control-group form-group span2">
                                                    <label class="control-label">Budget</label>
                                                    <div class="controls ">

                                                        <select class="" style="width: 75%" name="budget"  id=""  ng-model="demandeOA.budget" required >
                                                            <option value="" ng-selected="true">--Aucun--</option>
                                                            <option ng-repeat="ser in budgets" value="{{ser.id}}">{{ser.nom}}</option>

                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="control-group form-group span2">
                                                    <label class="control-label">Quantite</label>
                                                    <div class="controls ">
                                                        <input type="number"  name="quantite" class="form-control " ng-model="demandeOA.quantite" required/>
                                                    </div>

                                                </div>
                                                <div class="control-group form-group span2">
                                                    <label class="control-label">Prix Unitaire</label>
                                                    <div class="controls ">
                                                        <input type="number"  name="prix_unitaire" class="form-control" ng-model="demandeOA.prix_unitaire" required/>
                                                    </div>

                                                </div>

                                                <div class="span1">
                                                    <a class="btn btn-primary  active" style="margin-top: 25px"
                                                       ng-disabled="demandeOAForm.$invalid" ng-if="update === false" ng-click="addToOA(demandeOA)"><i style="color: white" class="icon icon-plus-sign"></i></a>
                                                    <a class="btn btn-primary  active" style="margin-top: 25px" ng-if="update === true"
                                                       ng-disabled="demandeOAForm.$invalid" ng-click="updateOA(demandeOA)"><i style="color: white" class="icon icon-save"></i></a>
                                                </div>
                                            </div>
                                        </form>
                                    </li>
                                    <li>

                                        <table class="table table-bordered table-hover table-striped"  cellspacing="0" width="100%">
                                            <thead>
                                                <tr >
                                                    <th>Centre de Cout</th>
                                                    <th>Quantite</th>
                                                    <th>Prix Unitaire</th>
                                                    <th>Montant</th>
                                                    <th>Option</th>

                                                </tr>
                                            </thead>
                                            <tbody>





                                                <tr class="produit" ng-repeat="oa in allOA">


                                                    <td >{{oa.centrecout.nom}}</td>
                                                    <td > {{oa.quantite}}</td>
                                                    <td >{{oa.prix_unitaire}}</td>
                                                    <td >{{oa.prix_unitaire * oa.quantite}}</td>
                                                    <td > 
                                                        <div class="btn-group">
                                                            <a title=""  href="javascript:;" name="depense?action=editedepense&vue=depenses" ng-click="editeOA($index)" class="btn btn-primary" >  <span class="icon"> <i class="icon-edit"></i> </span></a>
                                                            <a class="btn btn-danger"  href="javascript:;" name="depense?action=deletedepense&vue=depenses" ng-click="deleteOA($index)" name="" data-target="" ><span class="icon"> <i class="icon-trash"></i> </span></a>

                                                        </div>
                                                    </td>
                                                </tr>



                                            </tbody>
                                        </table>
                                    </li>
                                    <li>
                                        <c:if test="${not empty controleur}">
                                            <div class="control-group form-group span2 ">
                                                <form role="form" name="oaform"  ng-model="oa">
                                                    <div class="row-fluid">

                                                        <div class="control-group form-group  ">
                                                            <label class="control-label">Control de gestion</label>
                                                            <div class="controls ">

                                                                <select class="select span12 form-control" id="" required name="controleur" ng-model="oa.controleur" required>
                                                                    <option ></option>
                                                                    <c:forEach items="${controleur}" var="perso">

                                                                        <option value="${perso.getIdPersonnel()}">${perso.getNomPrenom()} </option>

                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>


                                                    </div>    
                                                </form>
                                            </div>
                                        </c:if>
                                        <div class="control-group form-group span2 ">
                                            <button class="btn btn-primary" style="margin-top: 25px"
                                                    data-ng-disabled="allOA.length === 0 && oaform.$invalid" ng-click="saveOA(demandeOA,${demande.getIdEng()}, oa.controleur)">Enregistrer</button>

                                        </div>
                                        <div class="control-group form-group span2 ">
                                            <button class="btn btn-danger" style="margin-top: 25px"
                                                    ng-click="annulerOA()">Annuler</button>
                                        </div>


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