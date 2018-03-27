<%-- 
    Document   : voirDemande
    Created on : 31 janv. 2018, 15:18:09
    Author     : messi
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="editeDemande" class="modal fade hide layout-align-xs-center-center" tabindex="-1" style="height: 320px;width: 750px" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
    <div class="modal-dialog ">

        <div class="modal-content modal-sm">
            <div class="modal-header" style="background-color: #002752">
                <button type="button" class="close" data-dismiss="modal" style="background-color: red" aria-hidden="true">X</button>
                <h3 class="text-center" style="color: whitesmoke">Engagement de depense de  {{getdemande.demandeur}}</h3>
            </div>
            <div class="modal-body bg-primary">

                <form role="form" name="getdemandeForm" ng-model="getdemande">

                    <div class="tab-pane" id="pills-tab5">
                        <div class="row-fluid">
                            <div class="span6">
                                <div class="clearfix">
                                    <ul class="nav nav-list faq-list">
                                        <li>
                                            <a class="active" href="#"><i class=" icon-info"></i> Description demande</a>
                                        </li>
                                        <li class="">
                                            <div class="control-group form-group span12">
                                                <label class="control-label">Libelle</label>
                                                <div class="controls ">
                                                    <input type="text"  name="libelle" class="form-control span12" ng-model="getdemande.libelle"
                                                           required/>
                                                </div>

                                            </div>
                                        </li>
                                        <c:if test="${vue=='depensesMission'}">
                                            <li class="">

                                                <div class="control-group form-group span6 flex-100">
                                                    <label class="control-label">date Echeance</label>
                                                    <div class="controls ">
                                                        <input type="text"  name="date_echeance" value="{{getdemande.date_echeance| date:'dd/MM/yyyy'}}" class="datepicker form-control  span12" ng-model="getdemande.date_echeance" required/>
                                                    </div>

                                                </div>
                                            </li>
                                        </c:if>
                                        <li class="">
                                            <div class="control-group form-group span12">
                                                <label class="control-label">Description</label>
                                                <div class="controls ">
                                                    <div class="controls ">
                                                        <textarea   class="form-control span12" ng-model="getdemande.description" name="description" required></textarea>
                                                    </div>

                                                </div>
                                            </div>
                                        </li>

                                        <li class="">
                                            <div class="control-group form-group span12" ng-if="getdemande.piece_joint">
                                                <label class="control-label">Piece jointe : </label>
                                                <div class="controls ">
                                                    <div class="controls ">
                                                        <a target="_blank" href="UploadDownloadFileServlet?fileName={{getdemande.piece_joint}}">{{getdemande.piece_joint}}</a> 
                                                    </div>

                                                </div>
                                            </div>


                                        </li>

                                    </ul>
                                </div>
                            </div>

                            <div class="span5" >
                                <div class="clearfix">
                                    <ul class="nav nav-list faq-list">
                                        <li>
                                            <a class="active" href="#"><i class=" icon-dropbox"></i> details Demande</a>
                                        </li>
                                        <c:if test="${vue== 'depensesExterne'}">
                                            <li >
                                                <div class="control-group form-group span12 flex-100 ">
                                                    <label class="control-label">Fournisseur</label>
                                                    <div class="controls ">
                                                        <select name="fournisseur"  class=" " ng-model="getdemande.fournisseur" id="" required>
                                                            <option value="">--Aucun</option>
                                                            <c:forEach items="${fournisseurs}" var="perso">
                                                                <option value="${perso.getNomFounisseur()}">${perso.getNomFounisseur()} </option>
                                                            </c:forEach>
                                                        </select>

                                                    </div>
                                                </div>
                                            </li>
                                            <li class="">
                                                <div class="control-group form-group span5">
                                                    <label class="control-label">Quantite</label>
                                                    <div class="controls ">

                                                        <input type="number"  name="quantite" value="{{getdemande.quantite}}" class="form-control  span12" ng-model="getdemande.quantite" required/>

                                                    </div>

                                                </div>
                                                <div class="control-group form-group span6">
                                                    <label class="control-label">Prix unitaire</label>
                                                    <div class="controls ">
                                                        <input type="number"  name="prix_unitaire" value="{{getdemande.prix_unitaire}}" class="form-control  span12" ng-model="getdemande.prix_unitaire" required/>
                                                    </div>

                                                </div>
                                            </li>
                                            <li class="">
                                                <div class="control-group form-group span5" >
                                                    <label class="control-label">cond paiement</label>
                                                    <div class="controls ">

                                                        <input type="number"  name="quantite" value="{{getdemande.cond_paiment}}" class="form-control  span12" ng-model="getdemande.cond_paiment" required/>

                                                    </div>

                                                </div>
                                                <div class="control-group form-group span6" >
                                                    <label class="control-label">Cond Livraison</label>
                                                    <div class="controls ">
                                                        <input type="text"  name="prix_unitaire" value="{{getdemande.cond_livraison}}" class="form-control  span12" ng-model="getdemande.cond_livraison" required/>
                                                    </div>

                                                </div>
                                            </li>
                                            <li class="">
                                                <div class="control-group form-group span11">
                                                    <label class="control-label">cond transport</label>
                                                    <div class="controls ">

                                                        <input type="text"  name="quantite" value="{{getdemande.cond_transport}}" class="form-control  span12" ng-model="getdemande.cond_transport" required/>

                                                    </div>

                                                </div>

                                            </li>
                                            <li class="">
                                                <div class="control-group form-group span11">
                                                    <label class="control-label">Mode livraison</label>
                                                    <div class="controls ">

                                                        <input type="text"  name="quantite" value="{{getdemande.mode_livraison}}" class="form-control  span12" ng-model="getdemande.mode_livraison" required/>

                                                    </div>

                                                </div>

                                            </li>
                                        </c:if>
                                        <c:if test="${vue== 'depensesMission'}">
                                            <li class="" >
                                                <div class="control-group form-group span12">
                                                    <label class="control-label">Destination</label>
                                                    <div class="controls ">
                                                        <input type="text"  name="lieu" class="form-control span12" ng-model="getdemande.lieu"
                                                               required/>
                                                    </div>

                                                </div>
                                            </li>
                                            <li class="">

                                                <div class="control-group form-group span5 pull-left">
                                                    <label class="control-label">Du</label>
                                                    <div class="controls ">
                                                        <input type="text" value="{{getdemande.date_depart|date:'dd/MM/yyyy'}}" name="date_depart" class="datepicker form-control span12" ng-model="getdemande.date_depart" />
                                                    </div>

                                                </div>
                                                <div class="control-group form-group span5 pull-right">
                                                    <label class="control-label">Au</label>
                                                    <div class="controls ">
                                                        <input type="text"  name="date_retour" value="{{getdemande.date_retour|date:'dd/MM/yyyy'}}" class="datepicker form-control span12" ng-model="getdemande.date_retour"/>
                                                    </div>

                                                </div>

                                            </li>
                                            <li class="">

                                                <div class="control-group form-group span5 pull-left">
                                                    <label class="control-label">loger</label>
                                                    <div class="controls ">
                                                        <select name="loger"  class="span12 " ng-model="getdemande.loger" id="" required>
                                                            <option value="non" ng-selected="getdemande.loger === 'non'">non</option>
                                                            <option value="oui" ng-selected="getdemande.loger === 'oui'">oui</option>
                                                        </select>
                                                    </div>

                                                </div>


                                            </li>
                                            <li class="">
                                                <div class=" span12 ">
                                                    <label for="transport_commun"class="span7">Transport en commun</label>
                                                    <input type="radio" ng-checked=" getdemande.transport === 'transport en commun' " value="transport en commun"  id="transport_commun" required  name="transport" class=" span3" ng-model="getdemande.transport"/>   


                                                </div>
                                            </li>
                                            <li class="">
                                                <div class="control-group form-group span12">
                                                    <label for="transport_personnel"class="control-label span7">vehicule personnel</label>
                                                    <input type="radio" ng-checked="getdemande.transport === 'voiture personnelle'" value="voiture personnelle"  id="transport_personnel" required  name="transport" class="form-control span3" ng-model="getdemande.transport"/>   

                                                </div>
                                            </li>
                                            <li class="">
                                                <div class="control-group form-group span12">
                                                    <label for="vehicule_service"class="control-label span7">Vehicule de service</label>
                                                    <input type="radio" ng-checked="getdemande.transport === 'vehicule service'" value="vehicule service"  id="vehicule_service" required  name="transport" class="form-control span3" ng-model="getdemande.transport"/>   

                                                </div>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>




                        </div>

                    </div>
                    <button class="btn btn-primary"
                            data-ng-disabled="getdemandeForm.$invalid" ng-click="saveEditeDemande(getdemande)">Enregistrer</button>

                </form>
            </div>

        </div>
    </div>
</div>
