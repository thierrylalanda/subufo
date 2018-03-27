<%-- 
    Document   : ValiderOA
    Created on : 14 mars 2018, 11:52:25
    Author     : lalanda
--%>

<%-- 
    Document   : validerDemande
    Created on : 30 janv. 2018, 13:53:58
    Author     : Administrateur
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="row-fluid" ng-app="validerOA">
    <div class="span3">
        <div class="">
            <ul class="nav nav-list faq-list">
                <li>
                    <a class="active"><i class=" icon-signin"></i> Liste des demandes </a>
                </li>
                <c:forEach items="${engagements}" var="depense">
                    <c:if test="${depense.getIdEngagement().getStatut()=='encour...'}">
                        <li class=" <c:if test="${not empty demande and depense.getIdEngagement().getIdEng() == demande.getIdEng()}">active</c:if>">

                                <a href="validerDepense?action=getDemande&vue=autorisation&id_depense=${depense.getIdEngagement().getIdEng()}" class=""><i class="icon-user"></i>${depense.getIdEngagement().getDemandeur().getNomPrenom()}</a>
                        </li>
                    </c:if>
                </c:forEach>
                <c:if test="${empty  sessionScope.personnel.getDonneurOrdreList()}">
                    Aucune demande pour l'instant
                </c:if>




            </ul>
        </div>
    </div>
    <c:if test="${not empty demande}">
        <div class="span9" ng-controller="validerOAController">
            <div class="bs-docs-example">
                <ul class="nav nav-tabs" id="myTab">
                    <li class=" active"><a href="#add_engagement" data-toggle="tab">Demande</a></li>

                    <li class=""><a href="#all_engagement" data-toggle="tab">Budget du service</a> </li>
                        <c:if test="${not empty commandesMP}">
                        <li class=""><a href="#commandeMP" data-toggle="tab">Commande du Magasin</a> </li>
                        </c:if>
                </ul>
                <div class="tab-content" id="myTabContent">

                    <div id="add_engagement" class="tab-pane fade in active">

                        <!-- BEGIN Portlet PORTLET-->
                        <div class="span12" >
                            <div class="widget">
                                <div class="widget-title">
                                    <h4><i class="icon-info"></i> Engagement de depense de ${demande.getDemandeur().getNomPrenom()}</h4>
                                    <span class="tools">
                                        <a class="icon-chevron-down" href="javascript:;"></a>
                                        <a class="icon-remove" href="javascript:;"></a>
                                    </span>
                                </div>
                                <div class="widget-body">
                                    <div class="tab-pane" id="pills-tab5">
                                        <div class="row-fluid">
                                            <div class="span6">
                                                <div class="clearfix">
                                                    <ul class="nav nav-list faq-list">
                                                        <li>
                                                            <a class="active" href="#"><i class=" icon-info"></i> Description demande</a>
                                                        </li>
                                                        <li>
                                                            <div class=" row-fluid">
                                                                <div class=" span4">
                                                                    <strong class="">Libelle : </strong>
                                                                </div>
                                                                <div class=" span8">
                                                                    ${demande.getLibelle()}
                                                                </div>
                                                            </div> 

                                                        </li>

                                                        <c:if test="${demande.getMontantTtc() != 0}">
                                                            <li class="">
                                                                <div class=" row-fluid">
                                                                    <div class=" span4">
                                                                        <strong class="">Montant : </strong>
                                                                    </div>
                                                                    <div class=" span8">
                                                                        <f:formatNumber value="${demande.getMontantTtc()}"type="CURRENCY" currencySymbol="FCFA"/>
                                                                    </div>


                                                                </div>
                                                            </li>
                                                        </c:if>

                                                        <li class="">
                                                            <div class=" row-fluid">
                                                                <div class=" span4">
                                                                    <strong class="">Echeance : </strong>
                                                                </div>
                                                                <div class=" span8">
                                                                    <f:formatDate value="${demande.getDateEcheance()}" type="Date" dateStyle="MEDIUM"/> 
                                                                </div>


                                                            </div>

                                                        </li>

                                                        <li class="">
                                                            <div class=" row-fluid">
                                                                <div class=" span5">
                                                                    <strong class="">piece jointe : </strong>
                                                                </div>
                                                                <div class=" span6">
                                                                    <c:if test="${demande.getPieceJoint() != null}">
                                                                        <a target="_blank" href="UploadDownloadFileServlet?fileName=${demande.getPieceJoint()}">piece jointe</a> 

                                                                    </c:if>
                                                                    <c:if test="${demande.getPieceJoint() == null}">
                                                                        aucune piece jointe 
                                                                    </c:if>
                                                                </div>
                                                                <div class=" span1">


                                                                </div>


                                                            </div>

                                                        </li>
                                                        <li class="">
                                                            <div class=" row-fluid">
                                                                <div class=" span4">
                                                                    <strong class="">Description </strong>
                                                                </div>
                                                                <div class=" span8">
                                                                    ${demande.getObjetMission()}
                                                                </div>


                                                            </div>

                                                        </li>



                                                    </ul>
                                                </div>
                                            </div>

                                            <c:if test="${not empty demande.getLieu()}">



                                                <div class="span6" >
                                                    <div class="clearfix">
                                                        <ul class="nav nav-list faq-list">
                                                            <li>
                                                                <a class="active" href="#"><i class=" icon-info"></i> Infos Mission</a>
                                                            </li>

                                                            <li class="">
                                                                <div class=" row-fluid">


                                                                    <div class=" span4">
                                                                        <strong class="">Destination  :</strong>
                                                                    </div>
                                                                    <div class=" span8">
                                                                        ${demande.getLieu()}
                                                                    </div>


                                                                </div>

                                                            </li>
                                                            <li class="">

                                                                <div class=" row-fluid">
                                                                    <div class=" span4">
                                                                        <strong class="">Depart :</strong>
                                                                    </div>
                                                                    <div class=" span8">
                                                                        <f:formatDate value="${demande.getDateDepart()}" type="Date" dateStyle="MEDIUM"/> 
                                                                    </div>


                                                                </div>
                                                            </li>
                                                            <li class="">
                                                                <div class=" row-fluid">
                                                                    <div class=" span4">
                                                                        <strong class="">Retour :</strong>
                                                                    </div>
                                                                    <div class=" span8">
                                                                        <f:formatDate value="${demande.getDateRetour()}" type="Date" dateStyle="MEDIUM"/>
                                                                    </div>


                                                                </div>

                                                            </li>
                                                            <li class="">
                                                                <div class=" row-fluid">
                                                                    <div class=" span4">
                                                                        <strong class="">Durée :</strong>
                                                                    </div>
                                                                    <div class=" span8">
                                                                        ${Math.round((demande.getDateRetour().getTime() - demande.getDateDepart().getTime())/(24 * 3600 * 1000))} Jour(s)
                                                                    </div>


                                                                </div>

                                                            </li>

                                                        </ul>
                                                    </div>
                                                </div>
                                            </c:if>

                                            <c:if test="${not empty demande.getFournisseur()}">
                                                <div class="span6">
                                                    <div class="clearfix">
                                                        <ul class="nav nav-list faq-list">
                                                            <li>
                                                                <a class="active" href="#"><i class=" icon-info"></i> Infos Reglement Facture</a>
                                                            </li>
                                                            <li class="">
                                                                <div class=" row-fluid">
                                                                    <div class=" span5">
                                                                        <strong class="">Fournisseur : </strong>
                                                                    </div>
                                                                    <div class=" span7">
                                                                        ${demande.getFournisseur()}
                                                                    </div>


                                                                </div>
                                                            </li>
                                                            <li class="">
                                                                <div class=" row-fluid">
                                                                    <div class=" span5">
                                                                        <strong class="">Quantite :</strong>
                                                                    </div>
                                                                    <div class=" span7">
                                                                        ${demande.getQuantite()}
                                                                    </div>


                                                                </div>
                                                            </li>
                                                            <li class="">
                                                                <div class=" row-fluid">
                                                                    <div class=" span5">
                                                                        <strong class="">prix unitaire :</strong>
                                                                    </div>
                                                                    <div class=" span7">
                                                                        <f:formatNumber value="${demande.getPrixUnitaire()}"type="CURRENCY" currencySymbol=" FCFA"/>

                                                                    </div>


                                                                </div>
                                                            </li>
                                                            <li class="">
                                                                <div class=" row-fluid">
                                                                    <div class=" span5">
                                                                        <strong class="">Total :</strong>
                                                                    </div>
                                                                    <div class=" span7">
                                                                        <f:formatNumber value="${demande.getMontantTtc()}"type="CURRENCY" currencySymbol=" FCFA"/>


                                                                    </div>


                                                                </div>
                                                            </li>
                                                            <li class="">
                                                                <div class=" row-fluid">
                                                                    <div class=" span5">
                                                                        <strong class="">cond paiement :</strong>
                                                                    </div>
                                                                    <div class=" span7">
                                                                        ${demande.getCondPaiement()} Jour(s)
                                                                    </div>


                                                                </div>
                                                            </li>
                                                            <li class="">
                                                                <div class=" row-fluid">
                                                                    <div class=" span5">
                                                                        <strong class="">Cond Livraison :</strong>
                                                                    </div>
                                                                    <div class=" span7">
                                                                        ${demande.getCondLivraison()}
                                                                    </div>


                                                                </div>
                                                            </li>
                                                            <li class="">
                                                                <div class=" row-fluid">
                                                                    <div class=" span5">
                                                                        <strong class="">cond Transport :</strong>
                                                                    </div>
                                                                    <div class=" span7">
                                                                        ${demande.getCondTransport()}
                                                                    </div>


                                                                </div>
                                                            </li>

                                                        </ul>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="">

                                        <div class="row-fluid">
                                            <div class="span2">
                                                <a style="margin-top: 25px" ng-click="annuler = false;suivre = false;valider = true" href="#"   class="btn  btn-primary ">Valider</a>
                                            </div>
                                            <c:if test="${not empty sessionScope.lien79 or not empty sessionScope.lien83 or sessionScope.GeneralAdministrateur == 'OK'}">

                                            </c:if>
                                            <div class="span4">
                                                <button style="margin-top: 25px"type="submit" ng-click="annuler = false;suivre = true;valider = false"   class="btn  btn-primary "> valider et faire suivre</button>
                                            </div> 
                                            <div class="span2">
                                                <button style="margin-top: 25px"type="submit" ng-click="annuler = true;suivre = false;valider = false"  class="btn  btn-danger">Annuler</button>
                                            </div>
                                            <c:if test="${not empty sessionScope.lien79 or not empty sessionScope.lien83 or sessionScope.GeneralAdministrateur == 'OK'}">
                                            </c:if>
                                            <div class="span4" ng-if="valider === true">
                                                <form role="form" name="oaform" method="post" action="validerDepense?action=validation&vue=autorisation&id_depense=${demande.getIdEng()}"  ng-model="oa">
                                                    <div class="row-fluid">

                                                        <div class="control-group form-group span6 ">
                                                            <label class="control-label">Etablisseur</label>
                                                            <div class="controls ">

                                                                <select class="select span12 form-control" id="" required name="secretaire" ng-model="oa.secretaire" required>
                                                                    <option ></option>
                                                                    <c:forEach items="${secretaires}" var="perso">

                                                                        <option value="${perso.getIdPersonnel()}">${perso.getNomPrenom()} </option>


                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class=" span2">
                                                            <div class="controls ">
                                                                <button style="margin-top: 25px"type="submit" data-ng-disabled="oaform.$invalid" class="btn  btn-success ">Envoyer</button>
                                                            </div>

                                                        </div>

                                                    </div>    
                                                </form>
                                            </div>
                                            <div class="span4" ng-if="suivre === true">
                                                <form role="form" name="vaform" method="post" action="validerDepense?action=suivreDepense&vue=autorisation&id_depense=${demande.getIdEng()}"  ng-model="va">
                                                    <div class="row-fluid">

                                                        <div class="control-group form-group span6 ">
                                                            <label class="control-label">Valideur</label>
                                                            <div class="controls ">

                                                                <select class="select span12 form-control" id="" required name="controleur" ng-model="va.controleur" required>
                                                                    <option ></option>
                                                                    <c:forEach items="${superieur}" var="pers">
                                                                        <c:if test="${pers.getIdPersonnel() != sessionScope.personnel.getIdPersonnel()}">
                                                                            <option value="${pers.getIdPersonnel()}">${pers.getNomPrenom()} </option>
                                                                        </c:if>

                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class=" span2">
                                                            <div class="controls ">
                                                                <button style="margin-top: 25px"type="submit" data-ng-disabled="vaform.$invalid" class="btn  btn-success ">Envoyer</button>
                                                            </div>

                                                        </div>

                                                    </div>    
                                                </form>
                                            </div>

                                            <div class="span4" ng-if="annuler === true">
                                                <form role="form" name="rejetform" method="post" action="validerDepense?action=rejetDemande&vue=autorisation&id_depense=${demande.getIdEng()}"  ng-model="rejet">
                                                    <div class="row-fluid">

                                                        <div class="control-group form-group span6 ">
                                                            <label class="control-label">raison du rejet</label>
                                                            <div class="controls ">
                                                                <textarea class="span12 form-control" name="raison" ng-model="rejet.raison" required>raison du rejet</textarea>

                                                            </div>
                                                        </div>
                                                        <div class=" span2">
                                                            <div class="controls ">
                                                                <button style="margin-top: 25px" ng-if="annuler === true"type="submit"  data-ng-disabled="rejetform.$invalid" class="btn  btn-success ">Ok</button>
                                                            </div>

                                                        </div>

                                                    </div>    
                                                </form>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>
                    <div id="all_engagement" class="tab-pane fade"  ng-controller="demandeController">
                        <table class="table table-bordered table-hover table-striped simple_print"  cellspacing="0" width="100%">
                            <thead>
                                <tr >
                                    <th>Centre cout</th>
                                    <th>Nature</th>
                                    <th>Montant</th>                                
                                    <th>Montant Restant</th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach items="${centre_cout}" var="cc">
                                    <c:forEach items="${cc.getButgetList()}" var="budget">
                                        <tr class="produit" ng-controller="printController">
                                            <td >${cc.getLibelle()}</td>
                                            <td >${budget.getTypeBudget()}</td>
                                            <td ><f:formatNumber value="${budget.getMontant()}"type="CURRENCY" currencySymbol=" FCFA"/></td>
                                            <td ><f:formatNumber value="${budget.getMontantRestant()}"type="CURRENCY" currencySymbol=" FCFA"/> </td>
                                        </tr>
                                    </c:forEach>
                                </c:forEach>


                            </tbody>
                        </table>

                    </div>

                    <div id="commandeMP" class="tab-pane fade">
                        <div class="row-fluid responsive">   
                            <table class="table table-bordered table-hover table-striped simple_print"cellspacing="0" width="100%">
                                <thead >
                                    <tr>
                                        <th>CATEGORIE</th>
                                        <th>CODE</th>
                                        <th>DESIGNATION</th>
                                        <th>QUANTITE</th>                  
                                        <th>DATE</th>
                                        <th>FOURNISSEUR</th>
                                        <th>Etat</th>

                                    </tr>
                                </thead> 
                                <tbody>
                                    <c:set var="t" value="${0}"/>
                                    <c:forEach items="${commandesMP}" var="lis">  
                                        <tr class="produits">

                                            <td class="categories"><c:out value="${lis.getTypeProduit()}"/></td>
                                            <td class="code"><c:out value="${lis.getCodeProduit()}"/></td>
                                            <td class="designation"><c:out value="${lis.getDesignation()}"/></td>
                                            <td class="quantiter"><f:formatNumber value="${lis.getQuantiteCommande()}" type="NUMBER"/></td>                                           
                                            <td><f:formatDate value="${lis.getDate()}" type="Date" dateStyle="MEDIUM"/></td>                           
                                            <td class="founisseur"><c:out value="${lis.getIdSA().getNomFounisseur()}"/></td>  
                                            <td class="categories"><c:out value="${lis.getEtat()}"/></td>
                                            <c:set var="tt" value="${lis.getPrixUnitaire() * lis.getQuantiteCommande()}"/>
                                            <c:set var="t" value="${t + tt}"/> </tr>
                                        </c:forEach>
                                </tbody>

                            </table>
                            <p  class="total_commande" style="text-align: center">Total: <f:formatNumber value="${t}"type="CURRENCY" currencySymbol="FCFA"/></p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </c:if>
</div>
