
<%--
    Document   : EtatPeriodiqueMP
    Created on : 19 févr. 2017, 14:18:13
    Author     : messi
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h3 class="page-title">
    ${vue}
</h3>
<ul class="breadcrumb">
    <li>
        <a href="StatistiqueMP?vue=Accueil&action=autre"><i class="icon-home"></i> Home</a>
        <span class="divider">/</span>
    </li>
    <li>
        <a href="javascript:;">${vue}</a>

    </li>

    <li class="pull-right search-wrap">
        <form action="" class="hidden-phone">
            <div class="input-append search-input-area">
                <input class="" id="appendedInputButton" type="text">
                <button class="btn" type="button"><i class="icon-search"></i> </button>
            </div>
        </form>
    </li>
</ul>


<div class="row-fluid">
    <div class="span12">
        <!-- BEGIN INLINE TABS PORTLET-->
        <div class="widget">
            <div class="widget-title">
                <h4><i class="icon-reorder"></i> Espace Magasin: ${magasin.getNomMagasin()}</h4>
                <span class="tools">
                    <a href="javascript:;" class="icon-chevron-down"></a>
                    <a href="javascript:;" class="icon-remove"></a>
                </span>
            </div>
            <div class="widget-body">
                <div class="bs-docs-example">
                    <ul class="nav nav-tabs" id="myTab">

                        <c:if test="${not empty sessionScope.CommandeTraiterMP or not empty sessionScope.CommandeRecepMP or not empty sessionScope.CommandeNonRecepMP or not empty sessionScope.PasserCommandeMP }">
                            <li class=" <c:if test="${vue=='Commande'}"> active</c:if>"><a class="" href="passerCommande?vue=Commande&action=init">Commande fournisseur</a></li>
                            </c:if>
                            <c:if test="${not empty sessionScope.CommandeNonRecepMP}">
                            <li class=" <c:if test="${vue=='Commandes En Cours'}"> active</c:if>"><a class="" href="passerCommande?vue=Commandes En Cours&action=init">Suivi commande</a></li>
                            </c:if>
                            <c:if test="${not empty sessionScope.lien7}">
                            <li class=" <c:if test="${vue=='Bordereau'}"> active</c:if>"><a class="" href="bordereau?vue=Bordereau&action=redirect">Reception commande </a></li>
                            </c:if>
                            <c:if test="${not empty sessionScope.CommandeTraiterMP}">
                            <li class=" <c:if test="${vue=='CommandeTraiter' or vue=='Etat Traitement Commandes Passés'}"> active</c:if>"><a class="" href="passerCommande?vue=CommandeTraiter&action=init">Suivi validation</a></li>
                            </c:if>
                            <c:if test="${not empty sessionScope.lien7}">

                            <li class=" <c:if test="${vue=='Historique Commande'}"> active</c:if>"><a class="" href="bordereau?vue=Historique Commande&action=redirect">Suivi livraison</a></li>
                            </c:if>
                    </ul>
                  
                    <div class="tab-content" id="myTabContent">
                        <div id="" class="tab-pane fade in <c:if test="${vue=='Commandes En Cours'}"> active</c:if>">
                            <c:if test="${vue=='Commandes En Cours'}">
                                <c:import url="/WEB-INF/magasignierP/CommandeEnCours.jsp"/>
                            </c:if>
                        </div>
                        <div id="" class="tab-pane fade in <c:if test="${vue=='Bordereau'}"> active</c:if>">
                            <c:if test="${vue=='Bordereau'}">

                                <c:import url="/WEB-INF/magasignierP/BordereauMP.jsp"/>

                            </c:if>
                        </div>
                        <div id="" class="tab-pane fade in <c:if test="${vue=='CommandeTraiter' or vue=='Etat Traitement Commandes Passés'}"> active</c:if>">
                            <c:if test="${vue=='CommandeTraiter'}">

                                <c:import url="/WEB-INF/magasignierP/CommandeTraiter.jsp"/>

                            </c:if>
                            <c:if test="${vue=='Etat Traitement Commandes Passés'}">

                                <c:import url="/WEB-INF/magasignierP/CommandeIndice.jsp"/>

                            </c:if>
                        </div>
                        <div id="" class="tab-pane fade in <c:if test="${vue=='Historique Commande'}"> active</c:if>">
                            <c:if test="${vue=='Historique Commande'}">

                                <c:import url="/WEB-INF/magasignierP/AncienCommande.jsp"/>

                            </c:if>
                        </div>
                        <div id="transfert" class="tab-pane fade in <c:if test="${vue=='Commande'}"> active</c:if>">
                            <c:if test="${vue=='Commande'}">
                                <div class="row-fluid responsive">

                                    <form method="post" action="passerCommande?vue=${vue}&action=create" class="form-inline">

                                        <div class="row-fluid layout-gt-xs-row layout-xs-column">

                                            <div class="control-group form-group  span2 flex-gt-xs-15 flex-xs">
                                                <label class="control-label">Fournisseur</label>
                                                <div class="controls ">
                                                    <select  class=" form-control span12"name="fournisseur" required>
                                                        <c:forEach items="${sessionScope.founisseurs}" var="c">
                                                            <option >${c.getNomFounisseur()}</option>
                                                        </c:forEach>

                                                    </select>


                                                </div>
                                            </div>

                                            <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                <label class="control-label"> Categorie</label>
                                                <div class="controls ">
                                                    <select class="form-control span12" id="categorietoarticlesMP" required name="categorie">
                                                        <option value="${categos.getIdCategorie()}" selected >${categos.getNomCategorie()}</option>
                                                        <c:forEach items="${sessionScope.categorieMP}" var="cc">
                                                            <option value="${cc.getIdCategorie()}">${cc.getNomCategorie()}</option>
                                                        </c:forEach>

                                                    </select>
                                                </div>


                                            </div>

                                            <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                <label class="control-label"> Article</label>
                                                <div class="controls ff" id="">
                                                    <select class="form-control exampleSelect span12" id="articlesCateorieMP" required name="designation">

                                                    </select>
                                                </div>
                                            </div>

                                            <div class="control-group span1 flex-gt-xs-10 flex-xs">
                                                <label class="control-label"> Quantite</label>
                                                <div class="controls ">
                                                    <input type="number" class="form-control span12" required name="quantite" />
                                                </div>
                                            </div>
                                            <div class="control-group span2 flex-gt-xs-5 flex-xs">
                                                <div class="controls ">
                                                    <button type="submit" class="btn btn-success btn-primary"style="margin-top: 22px;" ><span class="icon icon-shopping-cart"></span> </button>

                                                </div>
                                            </div>
                                        </div>





                                    </form>

                                </div>

                                <div class="row-fluid responsive">
                                    <table class="table table-bordered table-hover table-striped display simple_print"cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>categorie</th>
                                                <th>code</th>
                                                <th>designation</th>
                                                <th>En stock</th>
                                                <th>quantite</th>
                                                <th class="hidden">QUANTITE</th>
                                                <th>prix </th>
                                                <th>total</th>
                                                <th>date</th>
                                                <th>derniere livraison</th>
                                                <th>fournisseur</th>
                                                <th>option</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="t" value="${0}"/>
                                            <c:forEach items="${list}" var="lis">
                                                <tr class="produits">

                                                    <td class="categories"><c:out value="${lis.getTypeProduit()}"/></td>
                                                    <td class="code"><c:out value="${lis.getCodeProduit()}"/></td>
                                                    <td class="designation"><c:out value="${lis.getDesignation()}"/></td>
                                                    <td class="qte"><f:formatNumber value="${lis.getQuantiteEnStock()}" type="NUMBER"/></td>
                                                    <td class="qteu"><f:formatNumber value="${lis.getQuantiteCommande()}" type="NUMBER"/></td>
                                                    <td class="qteuc hidden"><input class="newvalCMP" type='number' id='qteu'  /></td>
                                                    <td class="qteu"><f:formatNumber value="${lis.getPrixUnitaire()}" type="CURRENCY" currencySymbol="FCFA"/></td>
                                                    <td class="qteu"><f:formatNumber value="${lis.getPrixTotal()}" type="CURRENCY" currencySymbol="FCFA"/></td>
                                                    <td><f:formatDate value="${lis.getDate()}" type="Date" dateStyle="MEDIUM"/></td>
                                                    <td class="pt"><f:formatDate value="${lis.getDerniereLivraison()}"  type="Date" dateStyle="MEDIUM" /></td>
                                                    <td class="founisseur"><c:out value="${lis.getIdSA().getNomFounisseur()}"/></td>
                                                    <td class="founisseur"><a class="btn btn-danger "  href="passerCommande?vue=${vue}&code=${lis.getCodeProduit()}&action=delete&id_magasinP=${magasin.getIdMagasin()}&niveau=${sessionScope.niveau}" data-toggle="modal" data-target=""> <span class="icon"> <i class="icon-remove"></i> </span></a> </td>
                                                    <c:set var="tt" value="${lis.getPrixUnitaire() * lis.getQuantiteCommande()}"/>
                                                    <c:set var="t" value="${t + tt}"/> </tr>
                                                </c:forEach>

                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th colspan="10" style="text-align: center">Total: <f:formatNumber value="${t}"type="CURRENCY" currencySymbol="FCFA"/></th>

                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>

                                <div class="space20"></div>

                                <div class="row-fluid">

                                    <form method="post" action="passerCommande?action=save&vue=${vue}" class="form-inline">
                                        <div class="span12">                                       
                                            <div class="form-group">
                                                <button  style="margin-left: 20px;margin-top: 25px" type="submit" class="btn btn-success  " ><span class="icon icon-save"> Enregistrer</span></button>

                                            </div>
                                        </div>
                                    </form>


                                </div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <c:if test="${not empty message}">
                                    <div class="alert alert-success  span12 text-center error_message hidden">
                                        <strong>${message.getMessage()}</strong>
                                    </div>
                                </c:if>
                            </c:if>
                        </div>
                    </div>
                </div>


            </div>
        </div>

    </div>

</div>

</div>



