<%-- 
    Document   : FormDepense
    Created on : 31 janv. 2018, 10:21:16
    Author     : messi
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:if test="${not empty message}">
    <div class="alert alert-block alert-danger error_message hidden" style="">

        <c:out value=" ${message}"/>

    </div>
</c:if>
<h3>Vous voulez effectuer une depense? veuillez renseigner vos besoins ici</h3>
<div class="row-fluid " id="draggable_portlets">

    <div class="row-fluid column sortable" ng-controller="demandeController">
        <!-- BEGIN Portlet PORTLET-->

        <form role="form" name="facturePrestationForm" method="post" action="depense?vue=${vue}&action=addDepense&isnew=yes" ng-model="facturePrestation">
            <div class="tab-pane" id="pills-tab5">
                <div class="row-fluid ">
                    <div class="span6">
                        <div class="clearfix">
                            <ul class="nav nav-list faq-list">
                                <li>
                                    <a class="active" href="#"><i class=" icon-info"></i> Description demande</a>
                                </li>
                                <li class="layout-row">

                                    <div class="control-group form-group span2 flex-50">
                                        <label class="control-label">Demandeur</label>
                                        <div class="controls ">

                                            <select class=" pull-left "  id="articlesCateories"  name="id_demandeur" ng-model="facturePrestation.demandeur" required>

                                                <c:forEach items="${personnels}" var="perso">
                                                    <option value="${perso.getIdPersonnel()}">${perso.getNomPrenom()} </option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                    </div>
                                </li>
                                <li class="layout-row" >
                                <md-input-container flex >
                                    <label>Libelle</label>
                                    <input name="libelle" ng-model="facturePrestation.libelle" required>
                                </md-input-container>
                                </li>


                                <c:if test="${vue !='depensesExterne'}">
                                    <li class="layout-row ">
                                        <div class="control-group form-group span5 flex-33">
                                            <label class="control-label">Echeance</label>
                                            <div class="controls ">

                                                <input type="text"  name="date_echeance" class=" datepicker form-control span12" ng-model="facturePrestation.echeance" required/>
                                            </div>

                                        </div>


                                    </li>
                                </c:if>


                                <li class="layout-row">
                                    <div class="control-group form-group span12 flex-100">
                                        <label class="control-label">Description</label>
                                        <div class="controls ">
                                            <div class="controls ">
                                                <textarea   class="form-control span12" ng-model="facturePrestation.description" name="description" required></textarea>
                                            </div>

                                        </div>
                                    </div>

                                </li>
                                <li class="layout-row">
                                    <div class="control-group form-group span12 flex-90">
                                        <label class="control-label ">Pièce jointe</label>
                                        <div class="controls ">
                                            <input type = "file" class="" file-model = "myFile"  ng-model="fileForm.fileName"/>
                                            <a data-ng-disabled="fileForm.fileName.$invalid" class="btn active" ng-click = "uploadFile()"><i style="color: white" class="icon icon-upload"></i></a>
                                        </div>
                                    </div>
                                </li>
                                <li class="layout-row">
                                    <button style="margin-left: 0px" type="submit" class="btn btn-primary flex-20"
                                            data-ng-disabled="facturePrestationForm.$invalid">soumettre</button>


                                </li>

                            </ul>
                        </div>
                    </div>

                    <c:if test="${vue== 'depensesExterne'}">
                        <div class="span5">
                            <div class="clearfix">
                                <ul class="nav nav-list faq-list">
                                    <li>
                                        <a class="active" href="#"><i class=" icon-info"></i> Autres Informations</a>
                                    </li>
                                    <li class="layout-row">

                                        <div class="control-group form-group span12 flex-100 ">
                                            <label class="control-label">Fournisseur</label>
                                            <div class="controls ">
                                                <select name="fournisseur"  class=" " ng-model="facturePrestation.type" id="" required>
                                                    <option value="">--Aucun</option>
                                                    <c:forEach items="${fournisseurs}" var="perso">
                                                        <option value="${perso.getIdFounisseur()}">${perso.getNomFounisseur()} </option>
                                                    </c:forEach>
                                                </select>

                                            </div>
                                        </div>
                                    </li>
                                    <li class="layout-row">

                                        <div class="control-group form-group span4 flex-33">
                                            <label class="control-label">quantite</label>
                                            <div class="controls ">
                                                <input  type="number" required  name="quantite" class=" form-control span12"  ng-model="facturePrestation.quantite" />
                                            </div>

                                        </div>
                                        <div class="control-group form-group span4 flex-33">
                                            <label class="control-label">prix unitaire</label>
                                            <div class="controls ">
                                                <input  type="number" required name="prix_unitaire" class=" form-control span12" ng-model="facturePrestation.prix_unitaire"/>
                                            </div>

                                        </div>
                                        <div class="control-group form-group span4 flex-33">
                                            <label class="control-label">Total Ttc</label>
                                            <div class="controls ">
                                                <input  type="number" name="total" ng-disabled="true" value="{{facturePrestation.quantite * facturePrestation.prix_unitaire}}" class=" form-control span12" ng-model="facturePrestation.total"/>
                                            </div>

                                        </div>

                                    </li>

                                    <li class="layout-row">

                                        <div class="control-group form-group span4 flex-33">
                                            <label class="control-label">Delais(Jours)</label>
                                            <div class="controls ">

                                                <input  type="number" value="30" required class="form-control span12" name="cond_paiment" 
                                                        />
                                            </div>
                                        </div>
                                        <div class="control-group form-group span4 flex-33">
                                            <label class="control-label">cond transport</label>
                                            <div class="controls ">

                                                <input  type="text" value="XXXXX" required  name="cond_transport" class=" form-control span12"   />
                                            </div>

                                        </div>
                                        <div class="control-group form-group span4 flex-33">
                                            <label class="control-label">Cond livraison</label>
                                            <div class="controls ">
                                                <input  type="text" value="XXXXX" required name="cond_livraison"  class=" form-control span12" />
                                            </div>

                                        </div>
                                    </li>

                                    <li class="layout-row">
                                    <md-input-container flex >
                                        <label>Mode livraison</label>
                                        <input required name="mode_livraison" value="XXXXX" >
                                    </md-input-container>

                                    </li>

                                </ul>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${vue== 'depensesMission'}">
                        <div class="span5">
                            <div class="clearfix">
                                <ul class="nav nav-list faq-list">
                                    <li>
                                        <a class="active" href="#"><i class=" icon-info"></i> Autres Informations</a>
                                    </li>
                                    <li class="">

                                    </li>
                                    <li class="layout-row">
                                    <md-input-container flex >
                                        <label>Destination</label>
                                        <input required name="lieu" ng-model="facturePrestation.lieuMission" required>
                                    </md-input-container>


                                    </li>
                                    <li class="layout-row">

                                        <div class="control-group form-group span5 flex-40">
                                            <label class="control-label">Du</label>
                                            <div class="controls ">

                                                <input type="text" required  name="date_depart" class="datepicker form-control span12"  ng-model="facturePrestation.depart" />
                                            </div>

                                        </div>
                                        <div class="control-group form-group span5 pull-right flex-40">
                                            <label class="control-label">Au</label>
                                            <div class="controls ">

                                                <input type="text" required  name="date_retour" class="datepicker form-control span12" ng-model="facturePrestation.arriver"/>
                                            </div>

                                        </div>
                                        <div class="control-group form-group span12 flex-20 ">
                                            <label class="control-label">Loger</label>
                                            <div class="controls ">
                                                <select name="loger"  class="span12 " ng-model="facturePrestation.loger" id="" required>
                                                    <option value="non">non</option>
                                                    <option value="oui">oui</option>
                                                </select>

                                            </div>
                                        </div>
                                    </li>

                                    <li class="layout-row">
                                        <div class=" span12 flex-70">
                                            <label for="transport_commun"class="span7">Transport en commun</label>
                                            <input type="radio"  value="transport en commun"  id="transport_commun" required  name="transport" class=" span3" ng-model="facturePrestation.transport"/>   


                                        </div>
                                    </li>
                                    <li class="layout-row">
                                        <div class="control-group form-group span12  flex-70">
                                            <label for="transport_personnel"class="control-label span7">vehicule personnel</label>
                                            <input type="radio" value="voiture personnelle"  id="transport_personnel" required  name="transport" class="form-control span3" ng-model="facturePrestation.transport"/>   

                                        </div>
                                    </li>
                                    <li class="layout-row">
                                        <div class="control-group form-group span12 flex-70">
                                            <label for="vehicule_service"class="control-label span7">Vehicule de service</label>
                                            <input type="radio" value="vehicule service"  id="vehicule_service" required  name="transport" class="form-control span3" ng-model="facturePrestation.transport"/>   

                                        </div>
                                    </li>

                                </ul>
                            </div>
                        </div>
                    </c:if>

                </div>

            </div>

            <br>


        </form>


    </div>


</div>
