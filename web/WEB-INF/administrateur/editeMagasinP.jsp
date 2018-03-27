
<%--
    Document   : Listeproduit
    Created on : 19 nov. 2016, 15:53:48
    Author     : messi
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row-fluid ">
    <input type="checkbox" class="menu-trigger hide">

    <ul class="menu hide" role="menu" style="margin-top: 50px">
        <li class="start">
            <a href="#">
                <svg preserveAspectRatio="xMidYMid meet" focusable="false" viewBox="-5 -5 34 34">
                <g><path d="M3 18h18v-2H3v2zm0-5h18v-2H3v2zm0-7v2h18V6H3z" fill="white"></path></g>
                </svg>
            </a>
        </li>
        <li class=""><a href="ListeProduitMP?action=seeInfoMP&vue=editeMagP&niveau=5&id_magasinP=${magasin.getIdMagasin()}">Infos Magasin</a></li>
                <c:if test="${ empty isnew}">

                <c:if test="${not empty sessionScope.lien33 or not empty sessionScope.lien34 or sessionScope.GeneralAdministrateur == 'OK'}">
                    <li class="list"><a class="" href="#">Etat de stock</a>
                        <ul class="nav-sub">
                            <li><a href="ListeProduitMP?action=all&vue=editeMagP&niveau=5&id_magasinP=${magasin.getIdMagasin()}&info=non">Stock magasin</a></li>
                            <li><a href="ListeProduitMP?vue=editeMagP&action=redirect&niveau=5&id_magasinP=${magasin.getIdMagasin()}">Etat des sorties</a></li>
                        </ul>
                    </li>
                </c:if>


                <c:if test="${not empty sessionScope.lien43 or not empty sessionScope.lien44 or not empty sessionScope.lien43 or sessionScope.GeneralAdministrateur == 'OK'}">
                    <li class="list"><a href="#">Inventaire</a>
                        <ul class="nav-sub">
                            <li><a href="MisaJourProduitMP?action=historique&vue=editeMagP&id_magasinP=${magasin.getIdMagasin()}&niveau=5">Historique</a></li>
                            <li><a href="ListeProduitMP?action=all_produit&vue=editeMagP&niveau=5&id_magasinP=${magasin.getIdMagasin()}&mouv=yes">Etat inventaire d'un article</a></li>
                        </ul>
                    </li>
                </c:if>


            </c:if>
    </ul>
    <nav class="">

        <ul class="nav-main" id="navigation">
            <li class="selected"><a href="ListeProduitMP?action=seeInfoMP&vue=editeMagP&niveau=5&id_magasinP=${magasin.getIdMagasin()}">Infos Magasin</a></li>
                <c:if test="${ empty isnew}">

                <c:if test="${not empty sessionScope.lien33 or not empty sessionScope.lien34 or sessionScope.GeneralAdministrateur == 'OK'}">
                    <li class="list"><a class="" href="#">Etat de stock</a>
                        <ul class="nav-sub">
                            <li><a href="ListeProduitMP?action=all&vue=editeMagP&niveau=5&id_magasinP=${magasin.getIdMagasin()}&info=non">Stock magasin</a></li>
                            <li><a href="ListeProduitMP?vue=editeMagP&action=redirect&niveau=5&id_magasinP=${magasin.getIdMagasin()}">Etat des sorties</a></li>
                        </ul>
                    </li>
                </c:if>


                <c:if test="${not empty sessionScope.lien43 or not empty sessionScope.lien44 or not empty sessionScope.lien43 or sessionScope.GeneralAdministrateur == 'OK'}">
                    <li class="list"><a href="#">Inventaire</a>
                        <ul class="nav-sub">
                            <li><a href="MisaJourProduitMP?action=historique&vue=editeMagP&id_magasinP=${magasin.getIdMagasin()}&niveau=5">Historique</a></li>
                            <li><a href="ListeProduitMP?action=all_produit&vue=editeMagP&niveau=5&id_magasinP=${magasin.getIdMagasin()}&mouv=yes">Etat inventaire d'un article</a></li>
                        </ul>
                    </li>
                </c:if>


            </c:if>
        </ul>





    </nav>
</div>

<c:set value="${magasin.getIdMagasin()}" var="id_magasinMPSat" scope="session"></c:set>
    <div class="space20"></div>
<c:if test="${!empty stockp}">
    <c:set var="size" value="${stockp.size()}" scope="session"/>
</c:if>
<c:if test="${info == 'OK'}">
    <c:if test="${not empty sessionScope.critiques}">

        <c:set var="critique" value="${stockp.size()}" scope="session"/>
        <a  href="CommandeRecusMP?vue=editeMagP&action=AllCommande&id_magasinP=${magasin.getIdMagasin()}&niveau=5" class="btn btn-danger popovers"   data-trigger="hover" data-placement="bottom" data-content="passer une commande pour le magasin" data-original-title="stock critique" id="pulsate-regular">alert <c:out value="${stockp.size()}" default="${sessionScope.size}"/> produit(s) critique(s) en stock </a>
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
                                    <li>MAGASIGNIER			:  <strong><a href="admin?action=editpersonnel&vue=editePersonnel&matricule=${magasin.getAffectationmagasinPList()[0].getPersonnel().getMatricule()}"> <c:out value="${magasin.getAffectationmagasinPList()[0].getPersonnel().getNomPrenom()}"/></a></strong></li>

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


<c:if test="${vues=='Mouvement Produits'}">

    <c:import url="/WEB-INF/magasignierP/historique_produit.jsp"/>

</c:if>

<c:if test="${vues=='Suivi Transfert'}">

    <c:import url="/WEB-INF/magasignierP/transfert.jsp"/>

</c:if>
<c:if test="${vues=='Commandes En Cours'}">
    <c:import url="/WEB-INF/magasignierP/CommandeEnCours.jsp"/>
</c:if>

<c:if test="${vues=='Historique inventaire'}">

    <c:import url="/WEB-INF/magasignierP/HistoriqueInventaireMP.jsp"/>

</c:if>

<c:if test="${vues=='Traitement Commande'}">

    <c:import url="/WEB-INF/magasignierP/ShowCommandeMS.jsp"/>

</c:if>

<c:if test="${vues=='Commande'}">

    <c:import url="/WEB-INF/magasignierP/CommandeMPForm.jsp"/>

</c:if>
<c:if test="${vues=='Etat Traitement Commandes Passés'}">

    <c:import url="/WEB-INF/magasignierP/CommandeIndice.jsp"/>

</c:if>
<c:if test="${vues=='CommandeTraiter'}">

    <c:import url="/WEB-INF/magasignierP/CommandeTraiter.jsp"/>

</c:if>

<c:if test="${vues=='Etat de Stock'}">

    <c:import url="/WEB-INF/magasignierP/ListeproduitMP.jsp"/>

</c:if>
<c:if test="${vues=='Bordereau'}">

    <c:import url="/WEB-INF/magasignierP/BordereauMP.jsp"/>

</c:if>

<c:if test="${vues=='Historique Commande'}">

    <c:import url="/WEB-INF/magasignierP/AncienCommande.jsp"/>

</c:if>

<c:if test="${vues=='showBordereauMP'}">

    <c:import url="/WEB-INF/magasignierP/showBordereauMP.jsp"/>

</c:if>

<c:if test="${vues=='Etat de consommation'}">

    <c:import url="/WEB-INF/magasignierP/EtatPeriodiqueMP.jsp"/>

</c:if>
