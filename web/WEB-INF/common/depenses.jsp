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
<div class="widget" ng-app="depense">
    <div class="widget-title">
        <h4><i class="icon-reorder"></i>Engagement de depense</h4>
        <span class="tools">
            <a href="javascript:;" class="icon-chevron-down"></a>
            <a href="javascript:;" class="icon-remove"></a>
        </span>
    </div>
    <div class="widget-body">

        <div class="bs-docs-example">
            <ul class="nav nav-tabs" id="myTab">
                <li class="<c:if test="${isnew == 'yes'}"> active</c:if>"><a href="#add_engagement" data-toggle="tab">Nouvel engagement</a></li>

                    <li class="<c:if test="${isnew == 'no'}"> active</c:if>"><a href="#all_engagement" data-toggle="tab">Engagement engendrés</a> </li>

                </ul>
                <div class="tab-content " id="myTabContent">

                    <div id="add_engagement" class="tab-pane fade  <c:if test="${isnew == 'yes'}">in active</c:if>">
                    <c:import url="/WEB-INF/common/FormDepense.jsp"/>

                </div>
                <div id="all_engagement" class="tab-pane fade <c:if test="${isnew == 'no'}">in active</c:if>"  ng-controller="demandeController">
                        <table class="table table-bordered table-hover table-striped simple_print"  cellspacing="0" width="100%">
                            <thead>
                                <tr >
                                    <th>Libelle</th>
                                    <th>Demandeur</th>
                                    <th>Date</th>
                                    <th>Statut</th>                                
                                    <th>Option</th>
                                </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${depenses}" var="depense">
                                <c:if test="${vue== 'depenses' && empty depense.getLieu() && empty depense.getFournisseur()}">


                                    <tr class="produit" ng-controller="printController">
                                        <td >${depense.getLibelle()} </td>

                                        <td >${depense.getDemandeur().getNomPrenom()} </td>
                                        <td ><f:formatDate value="${depense.getDateDemande()}" type="Date" dateStyle="MEDIUM"/> </td>
                                        <td ><span class="label <c:if test="${depense.getStatut() == 'valider'}">label-success</c:if> <c:if test="${depense.getStatut() == 'rejeter'}">label-warning</c:if><c:if test="${depense.getStatut() == 'encour...'}">label-info</c:if>">${depense.getStatut()}</span></td>

                                            <td> 
                                                <div class="btn-group">


                                                            <a title="" href="javascript:;" name="depense?action=editedepense&vue=depenses" ng-click="showDemande(${depense.getIdEng()})" class="btn btn-primary" >  <span class="icon"> <i class="icon-eye-open"></i> </span></a>  
                                                <c:if test="${(depense.getStatut() != 'valider' && depense.getStatut() != 'receptionner' and not empty sessionScope.lien82 && depense.getDonneurOrdreList().size() < 2) or (depense.getStatut() != 'valider' && depense.getStatut() != 'receptionner' and sessionScope.GeneralAdministrateur == 'OK' && depense.getDonneurOrdreList().size() < 2)}">
                                                    <a title=""  href="javascript:;" name="depense?action=editedepense&vue=depenses" ng-click="editeDemande(${depense.getIdEng()})" class="btn btn-primary" >  <span class="icon"> <i class="icon-edit"></i> </span></a>
                                                </c:if>

                                                <c:if test="${(depense.getStatut() == 'valider' and not empty sessionScope.lien80) or (depense.getStatut() == 'valider' and sessionScope.GeneralAdministrateur == 'OK')}">
                                                    <a title="" href="javascript:;" name="depense?action=editedepense&vue=depenses" ng-click="showOA(${depense.getIdEng()})" class="btn btn-primary" >  <span class="icon"> <i class="icon-money"></i> </span></a>  

                                                </c:if>
                                                <c:if test="${depense.getStatut() != 'valider' && depense.getStatut() != 'receptionner'}">
                                                    <a class="btn btn-danger"  href="javascript:;" name="depense?action=deletedepense&vue=depenses" ng-click="deleteDemande(${depense.getIdEng()})" name="" data-target="" ><span class="icon"> <i class="icon-trash"></i> </span></a>
                                                </c:if>
                                                <c:if test="${ (depense.getStatut() == 'valider' and not empty sessionScope.lien81) or (depense.getStatut() == 'receptionner' and sessionScope.GeneralAdministrateur == 'OK')}">
                                                    <button title="" ng-click="toPrintPdf(${depense.getIdEng()}, 0)" name="depense?action=editedepense&vue=depenses" class="btn btn-primary" >  <span class="icon"> <i class="icon-print"></i> </span></button>
                                                </c:if>
                                                <button title="" ng-click="toPrintPdf(${depense.getIdEng()}, 0)" name="depense?action=editedepense&vue=depenses" class="btn btn-primary" >  <span class="icon"> <i class="icon-print"></i> </span></button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:if>
                                <c:if test="${vue== 'depensesExterne' && not empty depense.getFournisseur()}">


                                    <tr class="produit" ng-controller="printController">
                                        <td >${depense.getLibelle()} </td>

                                        <td >${depense.getDemandeur().getNomPrenom()} </td>
                                        <td ><f:formatDate value="${depense.getDateDemande()}" type="Date" dateStyle="MEDIUM"/> </td>
                                        <td ><span class="label <c:if test="${depense.getStatut() == 'valider'}">label-success</c:if> <c:if test="${depense.getStatut() == 'rejeter'}">label-warning</c:if><c:if test="${depense.getStatut() == 'encour...'}">label-info</c:if>">${depense.getStatut()}</span></td>

                                            <td > 
                                                <div class="btn-group">
                                                <c:if test="${depense.getMagasin() != 0}">
                                                    <a href="javascript:;" data-toggle="tooltip"   title='Voir commande du magasin' ng-click="showCommande(${depense.getIdEng()},${depense.getMagasin()})" class="btn btn-primary" >  <span class="icon"> <i class="icon-table"></i> </span></a>  

                                                </c:if>

                                                <a data-toggle="tooltip" title='Voir la demande' ng-click="showDemande(${depense.getIdEng()})" class="btn btn-primary" >  <span class="icon"> <i class="icon-eye-open"></i> </span></a>  
                                                <c:if test="${(depense.getStatut() != 'valider' && depense.getStatut() != 'receptionner' and not empty sessionScope.lien82 && depense.getDonneurOrdreList().size() < 2 and depense.getMagasin() == 0) or (depense.getStatut() != 'valider' && depense.getStatut() != 'receptionner' and sessionScope.GeneralAdministrateur == 'OK' && depense.getDonneurOrdreList().size() < 2 and depense.getMagasin() == 0)}">
                                                    <a   href="javascript:;" data-toggle="tooltip"   title='editer la demande' ng-click="editeDemande(${depense.getIdEng()})" class="btn btn-primary" >  <span class="icon"> <i class="icon-edit"></i> </span></a>
                                                </c:if>

                                                <c:if test="${(depense.getStatut() == 'valider' and not empty sessionScope.lien80) or (depense.getStatut() == 'valider' and sessionScope.GeneralAdministrateur == 'OK')}">
                                                    <a  href="javascript:;"  ng-click="showOA(${depense.getIdEng()})" class="btn btn-primary" >  <span class="icon"> <i class="icon-money"></i> </span></a>  

                                                </c:if>
                                                <c:if test="${depense.getStatut() == 'encour...' or depense.getStatut() == 'rejeter'}">
                                                    <a class="btn btn-danger"  href="javascript:;" data-toggle="tooltip"   title='Supprimer la demande' ng-click="deleteDemande(${depense.getIdEng()})" name="" data-target="" ><span class="icon"> <i class="icon-trash"></i> </span></a>
                                                </c:if>
                                                <c:if test="${ (depense.getStatut() == 'valider' and not empty sessionScope.lien81) or (depense.getStatut() == 'valider' and sessionScope.GeneralAdministrateur == 'OK')}">
                                                    <button data-toggle="tooltip"   title='imprimer OA'  ng-click="toPrintPdf(${depense.getIdEng()}, 1)"  class="btn btn-primary " >  <span class="icon"> <i class="icon-print"></i> </span></button>
                                                </c:if>
                                                <c:if test="${ (depense.getStatut() == 'payer' and not empty sessionScope.lien81) or (depense.getStatut() == 'payer' and sessionScope.GeneralAdministrateur == 'OK')}">
                                                    <button data-toggle="tooltip"   title='Imprimer OA'  ng-click="toPrintPdf(${depense.getIdEng()}, 1)" name="depense?action=editedepense&vue=depenses" class="btn btn-primary " >  <span class="icon"> <i class="icon-print"></i> </span></button>
                                                </c:if>
                                            </div>
                                        </td>
                                    </tr>


                                </c:if>
                                <c:if test="${vue== 'depensesMission' && not empty depense.getLieu()}">

                                    <tr class="produit" ng-controller="printController">
                                        <td >${depense.getLibelle()} </td>

                                        <td >${depense.getDemandeur().getNomPrenom()} </td>
                                        <td ><f:formatDate value="${depense.getDateDemande()}" type="Date" dateStyle="MEDIUM"/> </td>
                                        <td ><span class="label <c:if test="${depense.getStatut() == 'valider'}">label-success</c:if> <c:if test="${depense.getStatut() == 'rejeter'}">label-warning</c:if><c:if test="${depense.getStatut() == 'encour...'}">label-info</c:if>">${depense.getStatut()}</span></td>

                                            <td> 
                                                <div class="btn-group">


                                                    <a href="javascript:;" data-toggle="tooltip"   title='Voir la demande' ng-click="showDemande(${depense.getIdEng()})" class="btn btn-primary" >  <span class="icon"> <i class="icon-eye-open"></i> </span></a>  
                                                <c:if test="${(depense.getStatut() != 'valider' && depense.getStatut() != 'receptionner' and not empty sessionScope.lien82 && depense.getDonneurOrdreList().size() < 2) or (depense.getStatut() != 'valider' && depense.getStatut() != 'receptionner' and sessionScope.GeneralAdministrateur == 'OK' && depense.getDonneurOrdreList().size() < 2)}">
                                                    <a   href="javascript:;" data-toggle="tooltip"   title='Editer la demande' ng-click="editeDemande(${depense.getIdEng()})" class="btn btn-primary" >  <span class="icon"> <i class="icon-edit"></i> </span></a>
                                                </c:if>

                                                <c:if test="${(depense.getStatut() == 'valider' and not empty sessionScope.lien80) or (depense.getStatut() == 'valider' and sessionScope.GeneralAdministrateur == 'OK')}">
                                                    <a  href="javascript:;"  ng-click="showOA(${depense.getIdEng()})" class="btn btn-primary" >  <span class="icon"> <i class="icon-money"></i> </span></a>  

                                                </c:if>
                                                <c:if test="${depense.getStatut() == 'encour...' or depense.getStatut() == 'rejeter' }">
                                                    <a class="btn btn-danger"  href="javascript:;" data-toggle="tooltip"   title='Supprimer la demande' ng-click="deleteDemande(${depense.getIdEng()})" name="" ><span class="icon"> <i class="icon-trash"></i> </span></a>
                                                </c:if>
                                                <c:if test="${ (depense.getStatut() == 'valider' ) or (depense.getStatut() == 'valider' and sessionScope.GeneralAdministrateur == 'OK')}">
                                                    <button  ng-click="toPrintPdf(${depense.getIdEng()}, 4)" data-toggle="tooltip"   title='Imprimer OP' class="btn btn-primary" >  <span class="icon"> <i class="icon-print"></i> </span></button>
                                                </c:if>
                                                <c:if test="${ (depense.getStatut() == 'payer') or (depense.getStatut() == 'receptionner' and sessionScope.GeneralAdministrateur == 'OK')}">
                                                    <button  ng-click="toPrintPdf(${depense.getIdEng()}, 2)" data-toggle="tooltip"   title='Imprimer OP' class="btn btn-primary" >  <span class="icon"> <i class="icon-print"></i> </span></button>
                                                </c:if>
                                                <c:if test="${depense.getStatut() == 'traitement'}">
                                                    <button  ng-click="toPrintPdf(${depense.getIdEng()}, 3)" data-toggle="tooltip"   title='Imprimer OM' class="btn btn-primary" >  <span class="icon"> <i class="icon-book"></i> </span></button>
                                                </c:if>
                                            </div>
                                        </td>
                                    </tr>

                                </c:if>
                            </c:forEach>


                        </tbody>
                    </table>
                    <c:import url="/WEB-INF/common/voirDemande.jsp"/>
                    <c:import url="/WEB-INF/common/editeDemande.jsp"/>

                    <c:import url="/WEB-INF/common/voirCommandeMP.jsp"/>
                </div>
            </div>
        </div>
    </div>
</div>