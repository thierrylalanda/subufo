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
<div class="row-fluid">
    <div class="span3">
        <div class="">
            <ul class="nav nav-list faq-list">
                <li>
                    <a class="active"><i class=" icon-signin"></i> Liste des demandes </a>
                </li>
                <c:forEach items="${engagements}" var="depense">
                    <c:if test="${depense.getIdEngagement().getStatut() == 'traitement'}">
                        <li class=" <c:if test="${not empty demande and depense.getIdEngagement().getIdEng() == demande.getIdEng()}">active</c:if>">

                                <a href="validerDepense?action=getDemande&vue=etablirOA&id_depense=${depense.getIdEngagement().getIdEng()}" class=""><i class="icon-user"></i>${depense.getIdEngagement().getDemandeur().getNomPrenom()}</a>
                        </li>
                    </c:if>
                </c:forEach>

                <c:if test="${empty  engagements}">
                    Aucune demande pour l'instant
                </c:if>




            </ul>
        </div>
    </div>
    <c:if test="${not empty demande}">
        <div class="span9" ng-app="depense">
            <div class="bs-docs-example">
                <ul class="nav nav-tabs" id="myTab">
                    <li class=" active"><a href="#add_engagement" data-toggle="tab">Demande</a></li>
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
                                <div class="widget-body" ng-controller="demandeController">
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
                                                        <c:if test="${not empty demande.getNatureDepense()}">
                                                            <li class="">
                                                                <div class=" row-fluid">
                                                                    <div class=" span4">
                                                                        <strong class="">Nature : </strong>
                                                                    </div>
                                                                    <div class=" span8">
                                                                        ${demande.getNatureDepense()}
                                                                    </div>

                                                                </div>

                                                            </li>
                                                        </c:if>
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
                                                        <c:if test="${not empty demande.getDateEcheance()}">
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
                                                        </c:if>
                                                        <li class="">
                                                            <div class=" row-fluid">
                                                                <div class=" span11">
                                                                    <c:if test="${demande.getPieceJoint() != null}">
                                                                        <a target="_blank" href="UploadDownloadFileServlet?fileName=${demande.getPieceJoint()}">piece jointe</a> 

                                                                    </c:if>
                                                                    <c:if test="${demande.getPieceJoint() == null}">
                                                                        aucune piece jointe associée à cette demande
                                                                    </c:if>
                                                                </div>
                                                                <div class=" span1">


                                                                </div>


                                                            </div>

                                                        </li>

                                                        <li class="">
                                                            <div class=" row-fluid">
                                                                <div class=" span4">
                                                                    <strong class="">Description :</strong>
                                                                </div>
                                                                <div class=" span8">
                                                                    ${demande.getObjetMission()}
                                                                </div>


                                                            </div>

                                                        </li>
                                                        <c:if test="${not empty demande.getRaisonRejet()}">
                                                            <li class="">
                                                                <div class=" row-fluid">
                                                                    <div class=" span4">
                                                                        <label class="label label-warning"><strong class="">rejeter pour :</strong></label>
                                                                    </div>
                                                                    <div class=" span8 label label-warning">
                                                                        ${demande.getRaisonRejet()}
                                                                    </div>


                                                                </div>

                                                            </li>
                                                        </c:if>

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
                                                <c:if test="${(demande.getStatut() == 'valider' and not empty sessionScope.lien80) or (demande.getStatut() == 'valider' and sessionScope.GeneralAdministrateur == 'OK')}">

                                                </c:if>
                                                <a title="" href="#" name="depense?action=editedepense&vue=depenses" ng-click="showOA(${demande.getIdEng()})" class="btn btn-primary" >  <span class="icon"> Etablir </span></a>  


                                            </div>


                                        </div>

                                    </div>
                                    <c:import url="/WEB-INF/common/etablirOA.jsp"/>
                                </div>
                            </div>
                        </div>



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
                                        <c:if test="${lis.getEtat() != 'OK' && lis.getEtat() != 'rejeter'}">
                                            <tr class="produits">
                                                <td class="categories"><c:out value="${lis.getTypeProduit()}"/></td>
                                                <td class="code"><c:out value="${lis.getCodeProduit()}"/></td>
                                                <td class="designation"><c:out value="${lis.getDesignation()}"/></td>
                                                <td class="quantiter"><f:formatNumber value="${lis.getQuantiteCommande()}" type="NUMBER"/></td>                                           
                                                <td><f:formatDate value="${lis.getDate()}" type="Date" dateStyle="MEDIUM"/></td>                           
                                                <td class="founisseur"><c:out value="${lis.getIdSA().getNomFounisseur()}"/></td>  
                                                <td class="categories"><c:out value="${lis.getEtat()}"/></td>
                                                <c:set var="tt" value="${lis.getPrixUnitaire() * lis.getQuantiteCommande()}"/>
                                                <c:set var="t" value="${t + tt}"/> 
                                            </tr>
                                        </c:if>
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
