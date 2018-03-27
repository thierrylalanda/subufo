<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h3 class="page-title">
    ${vue}
</h3>
<ul class="breadcrumb">
    <li>
        <a href="RedirectionVue?vue=Accueil"><i class="icon-home"></i> Home</a>
        <span class="divider">/</span>
    </li>
    <li>
        <a href="#">${vue}</a>

    </li>

    <li class="pull-right search-wrap">
        <form action="#" class="hidden-phone">
            <div class="input-append search-input-area">
                <input class="" id="appendedInputButton" type="text">
                <button class="btn" type="button"><i class="icon-search"></i> </button>
            </div>
        </form>
    </li>
</ul>

<div class="widget">
    <div class="widget-title">
        <h4><i class="icon-reorder"></i> Passer Vos Commandes Au Magasin Principal Ici</h4>
        <span class="tools">
            <a href="javascript:;" class="icon-chevron-down"></a>
        </span>
    </div>
    <div class="widget-body">
        <div class="bs-docs-example">
            <ul class="nav nav-tabs" id="myTab">

                <c:if test="${not empty sessionScope.lien4}">
                    <li class="sub-menu <c:if test="${vue=='Commande produits'}">active</c:if>" ><a class="" href="${sessionScope.lien4}">Commander article</a></li>
                    </c:if>
                    <c:if test="${not empty sessionScope.lien11}">
                    <li class="sub-menu <c:if test="${vue=='Consulter les commandes'}">active</c:if>"><a href="${sessionScope.lien11}">Mis à jour commande article</a></li>
                    </c:if>
                    <c:if test="${not empty sessionScope.lien6}">
                    <li class="sub-menu <c:if test="${vue=='Réception transfert'}">active</c:if>"><a href="${sessionScope.lien6}">Valider commande Reçu</a></li>
                    </c:if>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div id="" class="tab-pane fade in <c:if test="${vue=='Consulter les commandes'}"> active</c:if>">

                    <c:if test="${vue=='Consulter les commandes'}">
                        <c:import url="/WEB-INF/magasignerS/ShowCommandeMS.jsp"/>
                    </c:if>
                </div>
                <div id="" class="tab-pane fade in <c:if test="${vue=='Réception transfert'}"> active</c:if>">

                    <c:if test="${vue=='Réception transfert'}">
                        <c:import url="/WEB-INF/magasignerS/BonEntre.jsp"/>
                    </c:if>
                </div>
                <div id="" class="tab-pane fade in <c:if test="${vue=='Commande produits'}"> active</c:if>">
                    <c:if test="${vue=='Commande produits'}">
                        <form method="post" action="commandeMS?vue=${vue}&action=create" class="form-inline">

                            <div class="row-fluid layout-gt-xs-row layout-xs-column">
                                <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                    <label class="control-label"> Magasin</label>
                                    <div class="controls ">
                                        <select  class=" form-control span12"name="fournisseur" required style="margin-right: 50px">
                                            <option value="${magasinMP.getIdMagasin()}" >${magasinMP.getNomMagasin()}</option>
                                            <c:forEach items="${fournisseur}" var="cc">
                                                <option  value="${cc.getIdMagasin()}" >${cc.getNomMagasin()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                    <label class="control-label"> Categorie</label>
                                    <div class="controls ">
                                        <select class="form-control span12" id="categorietoarticles" required name="categorie" style="margin-left: auto">
                                            <option value="${categos.getIdCategorie()}" selected>${categos.getNomCategorie()}</option>
                                            <c:forEach items="${sessionScope.categoriee}" var="cc">
                                                <option value="${cc.getIdCategorie()}">${cc.getNomCategorie()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group span2 flex-gt-xs-15 flex-xs" >
                                    <label class="control-label"> Article</label>
                                    <div class="controls ff " id="">
                                        <select class="form-control exampleSelect span12" id="articlesCateorie" required name="designation"style="margin-right: auto">

                                        </select>
                                    </div>
                                </div>

                                <div class="control-group span2 flex-gt-xs-10 flex-xs">
                                    <label class="control-label"> Quantite</label>
                                    <div class="controls ">
                                        <input type="number" id="quantite" class=" form-control span12"  placeholder="Quantite" required name="quantite" style="margin-left:  0px; margin-right: 60px"/>
                                    </div>
                                </div>
                                <div class="control-group span2 flex-gt-xs-10 flex-xs">
                                    <div class="controls ">
                                        <button type="submit" class="btn btn-success  "style="margin-top: 25px" ><span class="icon icon-shopping-cart"></span></button>

                                    </div>
                                </div>

                            </div>

                        </form>

                        <div class="row-fluid">
                            <table class="table table-hover table-responsive table-bordered simple_print"cellspacing="0" width="100%">
                                <thead class="text-primary">
                                    <tr>
                                        <th>CATEGORIE</th>
                                        <th>CODE</th>
                                        <th>DESIGNATION</th>
                                        <th>QUANTITE EN STOCK</th>
                                        <th>QUANTITE COMMANDER</th>
                                        <th class="hidden">QUANTITE</th>
                                        <th>COMMANDER LE</th>
                                        <th>DERNIERE LIVRAISON</th>
                                        <th>Option</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listt}" var="liss">
                                        <tr class="produits">

                                            <td class="categories"><c:out value="${liss.getTypeProduit()}"/></td>
                                            <td class="code"><c:out value="${liss.getCodeProduit()}"/></td>
                                            <td class="designation"><c:out value="${liss.getDesignation()}"/></td>
                                            <td class="qte"><f:formatNumber value="${liss.getQuantiteEnStock()}" type="NUMBER"/></td>
                                            <td class="qteu"><f:formatNumber value="${liss.getQuantiteCommande()}" type="NUMBER"/></td>
                                            <td class="qteuc hidden"><input class="newvalcms" type='text' id='qteu'  /></td>
                                            <td><f:formatDate value="${liss.getDate()}" type="Date" dateStyle="MEDIUM"/></td>
                                            <td class="pt"><f:formatDate value="${liss.getDerniereLivraison()}"  type="Date" dateStyle="MEDIUM" /></td>
                                            <td >
                                                <a title="" href="commandeMS?action=delete&vue=${vue}&code=${liss.getCodeProduit()}" class="btn btn-danger" >  <span class="icon"> <i class="icon-remove"></i> </span></a>
                                            </td>
                                        </tr>

                                    </c:forEach>

                                </tbody>
                            </table>

                        </div>
                        <div class="space20"></div>

                        <div class="row-fluid">
                            <div class="form-actions">
                                <a href="commandeMS?action=save&vue=${vue}"data-toggle="tooltip" title='Cliquer ici pour Envoyer cette commande' >  <button type="submit" class="btn   btn-success" style="margin-right: 60px"><i class="icon-save">Valider commande</i> </button></a>
                            </div>

                        </div>
                        <c:if test="${not empty message}">
                            <div class="alert alert-danger text-center error_message hidden">
                                <strong>${message.getMessage()}</strong>
                            </div>
                        </c:if>
                    </c:if>
                </div>
                <div class="space20"></div>
                <div class="space20"></div>
                <div class="space20"></div>
            </div>

        </div>
    </div>
</div>
