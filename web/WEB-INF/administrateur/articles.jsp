<%--
    Document   : controlleur
    Created on : 18 avr. 2017, 16:50:59
    Author     : lalanda
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h3 class="page-title">
    Mise à jour d'un article
</h3>
<ul class="breadcrumb">
    <li>

        <a href="admin?vue=accueil&action=getAll"><i class="icon-home"></i> Home</a>
        <span class="divider">/</span>
    </li>
    <li>
        <a href="#"><i class="icon-group"></i> Articles</a>

    </li>

    <li class="pull-right search-wrap">
        <form action="search_result.html" class="hidden-phone">
            <div class="input-append search-input-area">
                <input class="" id="appendedInputButton" type="text">
                <button class="btn" type="button"><i class="icon-search"></i> </button>
            </div>
        </form>
    </li>
</ul>

<div class="widget">
    <div class="widget-title">
        <h4><i class="icon-reorder"></i>Mise à jour d'un article</h4>
        <span class="tools">
            <a href="javascript:;" class="icon-chevron-down"></a>
            <a href="javascript:;" class="icon-remove"></a>
        </span>
    </div>
    <div class="widget-body">
        <div class="bs-docs-example">
            <ul class="nav nav-tabs" id="myTab">

                <li class="<c:if test="${actif!='actif'}">active</c:if>"><a href="#all-articles" data-toggle="tab">Liste des articles</a> </li>
                <li class="<c:if test="${actif=='actif'}">active</c:if>"><a href="#add-articles" data-toggle="tab">Ajouter un Article</a> </li>

                </ul>
                <div class="tab-content" id="myTabContent">
                    <div id="all-articles" class="tab-pane fade in <c:if test="${actif!='actif'}"> active</c:if>">
                        <div class="row-fluid update">
                        <c:if test="${not empty update}">
                            <form class="form-inline" method="post" role="form" action="parametre?vue=articles&action=SaveUpdatearticles&article=${article.getIdArticle()}" >
                                <div class="row-fluid layout-gt-xs-row layout-xs-column">

                                    <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                        <label class="control-label">Categorie</label>
                                        <div class="controls ">
                                            <select name="categorie" class="form-control span12" disabled required>
                                                <option value="${article.getCategorie().getIdCategorieProduit()}">${article.getCategorie().getTypeCategorie()}</option>
                                                <c:forEach  items="${allcategorieProduits}" var="catt">
                                                    <c:if test="${empty catt.getStocker()}">
                                                        <c:if test="${article.getCategorie().getIdCategorieProduit() != catt.getIdCategorieProduit()}">
                                                            <option value="${catt.getIdCategorieProduit()}">${catt.getTypeCategorie()}</option>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                            </select>

                                        </div>
                                    </div>
                                    <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                        <label class="control-label">Code</label>
                                        <div class="controls ">
                                            <input type="text" style="" class="form-control span12" value="${article.getCode()}" name="code"/>

                                        </div>
                                    </div>
                                    <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                        <label class="control-label"> Designation</label>
                                        <div class="controls ">
                                            <input type="text" style="" class="form-control span12"  value="${article.getDesignation()}" name="designation"/>
                                        </div>
                                    </div>

                                    <div class="control-group form-group span2 flex-gt-xs-15 flex-xs" >
                                        <label class="control-label">stock alerte</label>
                                        <div class="controls ">
                                            <input type="number" class=" form-control span12" name="stock_alerte" value="${article.getCritique()}" placeholder="stock alerte">
                                        </div>
                                    </div>

                                    <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                                        <label class="control-label">Prix Unitaire</label>
                                        <div class="controls ">
                                            <input type="number" class="form-control span12" name="pu" value="${article.getPrix()}" placeholder="Prix Unitaire">
                                        </div>
                                    </div>
                                    <div class="span2 flex-gt-xs-15 flex-xs">
                                        <div class="control-group ">
                                            <button type="submit" onclick="chargement()" class="btn btn-success " style="margin-top: 25px" >Enregistrer</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="space15"></div>


                            </form>
                        </c:if>
                    </div>
                    <div class="row-fluid">
                        <a href="parametre?vue=articles&action=redirect"><span class="icon"><button class="btn-large"> <i class="icon-refresh"></button></i> </span></a>
                        <table class="table table-bordered table-hover table-striped simple_print"cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>categorie</th>
                                    <th>code</th>
                                    <th>designation</th>
                                    <th>prix unitaire</th>
                                    <th>stock alerte</th>
                                    <th>option</th>

                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach  items="${articles}" var="bud">
                                    <tr class="">
                                        <td >${bud.getCategorie().getTypeCategorie()}</td>
                                        <td >${bud.getCode()}</td>
                                        <td class="pt">${bud.getDesignation()}</td>
                                        <td class="pt"><f:formatNumber value="${bud.getPrix()}"type="CURRENCY" currencySymbol="FCFA"/></td>
                                        <td>${bud.getCritique()}</td>
                                        <td >
                                            <div class="btn-group">
                                                <a title="" href="parametre?vue=articles&action=Editearticles&article=${bud.getIdArticle()}" class="btn btn-primary">  <span class="icon"> <i class="icon-edit"></i> </span></a>

                                                <a class="btn btn-danger delete-insert" href="#" name="parametre?vue=articles&action=deletearticles&article=${bud.getIdArticle()}" data-toggle="modal" data-target="" ><span class="icon"> <i class="icon-trash"></i> </span></a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>

                <div id="add-articles" class="tab-pane fade  <c:if test="${actif=='actif'}"> in active </c:if> ">

                    <c:import url="/WEB-INF/administrateur/addArticle.jsp"/>
                </div>
            </div>


            <div class="space20"></div>

        </div>
    </div>
</div>
