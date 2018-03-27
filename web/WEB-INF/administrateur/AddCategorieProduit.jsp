

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
    Mise à jour des categories de consommables
</h3>
<ul class="breadcrumb">
    <li>

        <a href="admin?vue=accueil&action=getAll"><i class="icon-home"></i> Home</a>
        <span class="divider">/</span>
    </li>
    <li>
        <a href="#"><i class="icon-group"></i> Categories</a>

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

<div class="widget ">
    <div class="widget-title">
        <h4><i class="icon-reorder"></i> Mise à jour des categories de consommables</h4>
        <span class="tools">
            <a href="javascript:;" class="icon-chevron-down"></a>
            <a href="javascript:;" class="icon-remove"></a>
        </span>
    </div>
    <div class="widget-body">
        <div class="bs-docs-example">

            <div class="row-fluid">
                <c:if test="${empty update}">

                    <form action="personnel?action=addCategorieProduits&vue=Categories Produits&stocker=" id="" method="post">
                        <div class="row-fluid layout-row">
                            <div class="control-group span2 flex-20">
                                <label class="form-control-label">nouvelle categorie</label>
                                <div class="controls">
                                    <input type="text" style=""class="form-control span12 " required name="type_categorie" id="">
                                </div>
                            </div>
                            <div class="span1 flex-10">
                                <div class="control-group ">
                                    <button type="submit" class="btn btn-success" style="margin-top: 25px" ><i class="icon-save"></i></button>
                                </div>
                            </div>
                        </div>

                    </form>
                    <c:if test="${not empty message}">
                        <div class="alert alert-danger  span12 text-center error_message hidden">
                            <strong>${message.getMessage()}</strong>
                        </div>
                    </c:if>

                </c:if>
            </div>
            <div class="row-fluid">
                <c:if test="${update=='oui'}">
                    <div class="row-fluid">
                        <form action="parametre?action=updateCategorie&vue=Categories Produits&id_categorie=${categorie.getIdCategorieProduit()}" id="fileForm" method="post">
                            <div class="row-fluid layout-gt-xs-row layout-xs-column">
                                <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                    <label class="control-label">Designation</label>
                                    <div class="controls">
                                        <input type="text" style="" class="form-control span12 " required value="${categorie.getTypeCategorie()}" name="type_categorie" id="">
                                    </div>
                                </div>
                                <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                                    <label class="control-label">Articles</label>
                                    <div class="controls ">
                                        <select  name="all_article" id=""  multiple="multiple" class="span12 form-control cat_select">
                                            <c:forEach items="${categorie.getArticleList()}" var="catego">

                                                <option value="${catego.getIdArticle()}" selected><c:out value="${catego.getDesignation()}"></c:out></option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="span1 flex-gt-xs-15 flex-xs">
                                    <div class="control-group ">
                                        <button type="submit" onclick="chargement()" name="${categorie.getIdCategorieProduit()}" class="btn btn-success" style="margin-top: 25px;" ><i class="icon-save"> </i></button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </c:if>
                <table class="table table-bordered table-hover table-striped simple_print">
                    <thead>
                        <tr >
                            <th>Nom categorie</th>
                            <th>Total Articles</th>
                            <th>option</th>

                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${type_categorie}" var="cat">
                            <c:if test="${empty cat.getStocker()}">
                                <tr class="produit">
                                    <td > <c:out value="${cat.getTypeCategorie()}"/> </td>
                                    <td > <c:out value="${cat.getArticleList().size()}"/> </td>
                                    <td >
                                        <div class="btn-group">
                                            <a title="" href="parametre?action=editCategorie&vue=Categories Produits&id_categorie=${cat.getIdCategorieProduit()}" class="btn btn-primary" >  <span class="icon"> <i class="icon-edit"></i> </span></a>
                                            <a class="btn btn-danger <c:if test="${cat.getArticleList().size()!=0}">disabled-delete</c:if>"  href="parametre?action=deleteCategorie&vue=Categories Produits&id_categorie=${cat.getIdCategorieProduit()}" name="" data-toggle="modal" data-target="" ><span class="icon"> <i class="icon-trash"></i> </span></a>

                                            </div>
                                        </td>
                                    </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


