
<%--
    Document   : Listeproduit
    Created on : 19 nov. 2016, 15:53:48
    Author     : messi
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row-fluid">
    <input type="checkbox" class="menu-trigger hide">
        
       <ul class="menu hide" role="menu" style="margin-top: 50px">
            <li class="start">
            <a href="#">
                <svg preserveAspectRatio="xMidYMid meet" focusable="false" viewBox="-5 -5 34 34">
                <g><path d="M3 18h18v-2H3v2zm0-5h18v-2H3v2zm0-7v2h18V6H3z" fill="white"></path></g>
                </svg>
            </a>
        </li>
            <li class=""><a href="admin?action=getOnMagS&vue=editeMagasinS&idMagasin=${magasin.getIdMagasin()}">Infos Magasin</a></li>
                <c:if test="${ empty isnew}">
                    <c:if test="${1==3}">
                        <c:if test="${not empty sessionScope.lien25 or not empty sessionScope.lien26 or not empty sessionScope.lien27  or sessionScope.GeneralAdministrateur == 'OK'}">
                        <li class="list"><a class="" >Traitement</a>
                            <ul class="nav-sub">

                                <li><a href="commandeMS?vue=editeMagasinS&action=init&niveau=5&id_magasin=${magasin.getIdMagasin()}">Commander au magasin principal</a></li>
                                <li><a href="commanderecus?vue=editeMagasinS&action=allclient&id_magasin=${magasin.getIdMagasin()}&niveau=5">Traiter commande utilisateur</a></li>
                                <li><a href="commandeMS?vue=editeMagasinS&action=show&id_magasin=${magasin.getIdMagasin()}&niveau=5">Commandes Encours magasin principal</a></li>
                                <li><a href="transfert?vue=editeMagasinS&action=lister&id_magasin=${magasin.getIdMagasin()}&niveau=5">Valider commande Reçu magasin principal</a></li>
                                <li><a href="listeproduit?vue=editeMagasinS&action=sorti&id_magasin=${magasin.getIdMagasin()}&niveau=5">Effectuer une Sortie pour Consommation</a></li>
                            </ul>
                        </li>
                    </c:if>
                </c:if>
                <c:if test="${not empty sessionScope.lien18 or not empty sessionScope.lien19 or not empty sessionScope.lien20 or not empty sessionScope.lien21 or sessionScope.GeneralAdministrateur == 'OK'}">
                    <li class="list"><a class="" href="#">Etat de stock</a>
                        <ul class="nav-sub">
                            <li><a href="listeproduit?vue=editeMagasinS&action=all&id_magasin=${magasin.getIdMagasin()}&niveau=5">Stock Magasin</a></li>
                            <li><a href="listeproduit?vue=editeMagasinS&action=redirect&id_magasin=${magasin.getIdMagasin()}&niveau=5">Etat des sorties</a></li>
                        </ul>
                    </li>
                </c:if>


                <c:if test="${not empty sessionScope.lien22 or not empty sessionScope.lien23 or not empty sessionScope.lien24  or sessionScope.GeneralAdministrateur == 'OK'}">
                    <li class="list"><a href="#">Inventaire</a>
                        <ul class="nav-sub">
                            <li class="hidden"><a href="listeproduit?vue=editeMagasinS&action=all&id_magasin=${magasin.getIdMagasin()}&niveau=5&ad=yes">Effectuer inventaire</a></li>
                            <li><a href="ecatinventaire?vue=editeMagasinS&action=all&id_magasin=${magasin.getIdMagasin()}&niveau=5">Historique Inventaire</a></li>
                            <li><a href="listeproduit?vue=editeMagasinS&action=all_produit&id_magasin=${magasin.getIdMagasin()}&niveau=5&add=yes">Etat inventaire d'un article</a></li>
                        </ul>
                    </li>
                </c:if>

            </c:if>
        </ul>

    <nav class="">

        <ul class="nav-main" id="navigation">
            <li class="selected"><a href="admin?action=getOnMagS&vue=editeMagasinS&idMagasin=${magasin.getIdMagasin()}">Infos Magasin</a></li>
                <c:if test="${ empty isnew}">
                    <c:if test="${1==3}">
                        <c:if test="${not empty sessionScope.lien25 or not empty sessionScope.lien26 or not empty sessionScope.lien27  or sessionScope.GeneralAdministrateur == 'OK'}">
                        <li class="list"><a class="" >Traitement</a>
                            <ul class="nav-sub">

                                <li><a href="commandeMS?vue=editeMagasinS&action=init&niveau=5&id_magasin=${magasin.getIdMagasin()}">Commander au magasin principal</a></li>
                                <li><a href="commanderecus?vue=editeMagasinS&action=allclient&id_magasin=${magasin.getIdMagasin()}&niveau=5">Traiter commande utilisateur</a></li>
                                <li><a href="commandeMS?vue=editeMagasinS&action=show&id_magasin=${magasin.getIdMagasin()}&niveau=5">Commandes Encours magasin principal</a></li>
                                <li><a href="transfert?vue=editeMagasinS&action=lister&id_magasin=${magasin.getIdMagasin()}&niveau=5">Valider commande Reçu magasin principal</a></li>
                                <li><a href="listeproduit?vue=editeMagasinS&action=sorti&id_magasin=${magasin.getIdMagasin()}&niveau=5">Effectuer une Sortie pour Consommation</a></li>
                            </ul>
                        </li>
                    </c:if>
                </c:if>
                <c:if test="${not empty sessionScope.lien18 or not empty sessionScope.lien19 or not empty sessionScope.lien20 or not empty sessionScope.lien21 or sessionScope.GeneralAdministrateur == 'OK'}">
                    <li class="list"><a class="" href="#">Etat de stock</a>
                        <ul class="nav-sub">
                            <li><a href="listeproduit?vue=editeMagasinS&action=all&id_magasin=${magasin.getIdMagasin()}&niveau=5">Stock Magasin</a></li>
                            <li><a href="listeproduit?vue=editeMagasinS&action=redirect&id_magasin=${magasin.getIdMagasin()}&niveau=5">Etat des sorties</a></li>
                        </ul>
                    </li>
                </c:if>


                <c:if test="${not empty sessionScope.lien22 or not empty sessionScope.lien23 or not empty sessionScope.lien24  or sessionScope.GeneralAdministrateur == 'OK'}">
                    <li class="list"><a href="#">Inventaire</a>
                        <ul class="nav-sub">
                            <li class="hidden"><a href="listeproduit?vue=editeMagasinS&action=all&id_magasin=${magasin.getIdMagasin()}&niveau=5&ad=yes">Effectuer inventaire</a></li>
                            <li><a href="ecatinventaire?vue=editeMagasinS&action=all&id_magasin=${magasin.getIdMagasin()}&niveau=5">Historique Inventaire</a></li>
                            <li><a href="listeproduit?vue=editeMagasinS&action=all_produit&id_magasin=${magasin.getIdMagasin()}&niveau=5&add=yes">Etat inventaire d'un article</a></li>
                        </ul>
                    </li>
                </c:if>

            </c:if>
        </ul>



    </nav>
</div>

<c:set value="${magasin.getIdMagasin()}" var="id_magasinMSSat" scope="session"></c:set>
    <div class="space20"></div>
    <div class="space20"></div>
<c:if test="${!empty stock}">
    <c:set var="size" value="${stock.size()}" scope="session"/>
</c:if>
<c:if test="${info == 'OK'}">
    <c:if test="${not empty sessionScope.critique}">

        <c:set var="critique" value="${stock.size()}" scope="session"/>
        <a  href="commanderecus?vue=editeMagasinS&action=allclient&id_magasin=${magasin.getIdMagasin()}&niveau=5" class="btn btn-danger popovers"   data-trigger="hover" data-placement="bottom" data-content="passer une commande pour le magasin" data-original-title="stock critique" id="pulsate-regular">alert <c:out value="${stock.size()}" default="${sessionScope.size}"/> produit(s) critique(s) en stock </a>
        <div class="space20"></div>
    </c:if>
</c:if>


<c:if test="${info == 'OK'}">
    <div id="info" class="tab-pane fade in active">
        <div class="row-fluid">
            <div class="span12">
                <!-- BEGIN BLANK PAGE PORTLET-->

                <div class="widget">
                    <div class="widget-title">
                        <h4><i class="icon-edit"></i> Information sur: ${magasin.getNomMagasin()}</h4>
                        <span class="tools">
                            <a href="javascript:;" class="icon-chevron-down"></a>
                            <a href="javascript:;" class="icon-remove"></a>
                        </span>
                    </div>
                    <div class="widget-body">


                        <div class="row-fluid">
                            <div class="span12">
                                <div class="text-center">
                                    <img alt="" src="photo/${sessionScope.societe.getLogo()}">
                                </div>
                                <hr>

                            </div>
                        </div>
                        <div class="space20"></div>
                        <div class="row-fluid invoice-list">
                            <div class="span4">
                                <h4>LOCALISATION:</h4>

                                <ul class="unstyled">
                                    <li>REGION		: <strong><c:out value="${magasin.getSite().getRegion().getNomRegion()}"/></strong></li>
                                    <li>SITE		: <strong><c:out value="${magasin.getSite().getNomSite()}"/></strong></li>

                                </ul>

                            </div>
                            <div class="span4">
                                <h4>INFO MAGASIN</h4>
                                <ul class="unstyled">
                                    <li>NOM MAGASIN		: <strong><c:out value=" ${magasin.getNomMagasin()}"/></strong></li>
                                    <li>DESCRIPTION		: <strong><c:out value="${magasin.getDescription()}"/></strong></li>
                                    <li>MAGASIGNIER		:  <strong><a href="admin?action=editpersonnel&vue=editePersonnel&id=${personnel.getIdPersonnel()}"> <c:out value="${personnel.getNomPrenom()}"/></a></strong></li>
                                </ul>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
            <!-- END BLANK PAGE PORTLET-->
        </div>
    </div>
</c:if>
<!-- END PAGE CONTENT-->

<c:if test="${vues=='Commande produits'}">
    <c:import url="/WEB-INF/magasignerS/CommandeMSForm.jsp"/>
</c:if>

<c:if test="${vues=='Consulter les commandes'}">
    <c:import url="/WEB-INF/magasignerS/ShowCommandeMS.jsp"/>
</c:if>

<c:if test="${vues=='Réception transfert'}">
    <c:import url="/WEB-INF/magasignerS/BonEntre.jsp"/>
</c:if>

<c:if test="${vues=='Sortir pour consommation'}">
    <c:import url="/WEB-INF/magasignerS/CommandeClient.jsp"/>
</c:if>

<c:if test="${vues=='Réception commande client'}">
    <c:import url="/WEB-INF/magasignerS/commandeRecus.jsp"/>
</c:if>


<c:if test="${vues=='Statistique'}">
    <c:import url="/WEB-INF/magasignerS/statistique.jsp"/>
</c:if>


<c:if test="${vues=='Inventaire'}">
    <c:import url="/WEB-INF/magasignerS/UpdateProduits.jsp"/>
</c:if>

<c:if test="${vues=='Mouvement Produits'}">
    <c:import url="/WEB-INF/magasignerS/historique_produit.jsp"/>
</c:if>

<c:if test="${vues=='Etat de Stock'}">
    <c:import url="/WEB-INF/magasignerS/Listeproduit.jsp"/>
</c:if>

<c:if test="${vues=='Historique inventaire'}">
    <c:import url="/WEB-INF/magasignerS/InventaireMSForm.jsp"/>
</c:if>

<c:if test="${vues=='Etat de consommation'}">
    <c:import url="/WEB-INF/magasignerS/EtatMS.jsp"/>
</c:if>