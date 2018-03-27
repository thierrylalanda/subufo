<%-- 
    Document   : Caisse
    Created on : 16 mars 2018, 13:20:29
    Author     : messi
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="row-fluid" ng-app="validerOA">
    <c:if test="${not empty message}">
        <div class="alert alert-block alert-danger error_message hidden" style="">

            <c:out value=" ${message}"/>

        </div>
    </c:if>
    <div class="span3">
        <div class="">
            <ul class="nav nav-list faq-list">
                <li>
                    <a class="active"><i class=" icon-signin"></i>demandes à payer </a>
                </li>
                <c:forEach items="${engagements}" var="depense">
                    <c:if test="${depense.getIdEngagement().getStatut()=='valider'}">
                        <li class="hide <c:if test="${not empty demande and depense.getIdEngagement().getIdEng() == demande.getIdEng()}">active</c:if>">

                                <a href="validerDepense?action=getDemande&vue=caisse&id_depense=${depense.getIdEngagement().getIdEng()}" class=""><i class="icon-user"></i>${depense.getIdEngagement().getDemandeur().getNomPrenom()}</a>
                        </li>
                    </c:if>
                </c:forEach>
                <li>
                    <form role="form" name="rejetform" method="post" action="validerDepense?action=getDemandeForCaisse&vue=caisse"  ng-model="rejet">
                        <div class="row-fluid layout-gt-xs-row layout-xs-column">

                            <div class="control-group form-group span6 flex-gt-xs-70 flex-xs">
                                <label class="control-label">Numero demande</label>
                                <div class="controls ">
                                    <input type="number" class="span12 form-control" name="id_depense" ng-model="rejet.raison" required />

                                </div>
                            </div>
                            <div class=" span2 flex-gt-xs-30 flex-xs">
                                <div class="controls ">
                                    <button style="margin-top: 25px"type="submit"  data-ng-disabled="rejetform.$invalid" class="btn  btn-success ">Rechercher</button>
                                </div>

                            </div>

                        </div>    
                    </form>
                </li>

            </ul>
        </div>
    </div>
    <c:if test="${not empty demande}">
        <div class="span9" ng-controller="validerOAController">
            <div class="bs-docs-example">
                <ul class="nav nav-tabs" id="myTab">
                    <li class=" active"><a href="#add_engagement" data-toggle="tab">Demande</a></li>

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
                                                                        <strong class="">Nombre de jours :</strong>
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
                                            <div class="span4">
                                                <c:if test="${demande.getStatut()=='valider'}">
                                                    <a style="margin-top: 25px" href="validerDepense?action=validation_Caisse&vue=caisse&id_depense=${demande.getIdEng()}"   class="btn  btn-primary ">Payer</a>

                                                </c:if>
                                                <c:if test="${demande.getStatut()!='valider'}">
                                                    <button class="btn btn-primary"> <span class="icon"> <i class="icon-ok-circle"></i> </span>  valider et payer</button>
                                                </c:if>
                                            </div>



                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>

                </div>
            </div>

        </div>
    </c:if>
</div>
