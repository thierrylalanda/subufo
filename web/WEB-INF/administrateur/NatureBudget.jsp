<%-- 
    Document   : NatureBudget
    Created on : 1 mars 2018, 07:45:23
    Author     : lalanda
--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h3 class="page-title">
    Mise à jour des Nature
</h3>
<ul class="breadcrumb">
    <li>

        <a href="admin?vue=accueil&action=getAll"><i class="icon-home"></i> Home</a>
        <span class="divider">/</span>
    </li>
    <li>
        <a href="#"><i class="icon-group"></i> Natures</a>

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
        <h4><i class="icon-reorder"></i> Mise à jour des Natures</h4>
        <span class="tools">
            <a href="javascript:;" class="icon-chevron-down"></a>
            <a href="javascript:;" class="icon-remove"></a>
        </span>
    </div>
    <div class="widget-body">
        <div class="bs-docs-example">

            <div class="row-fluid">
                <c:if test="${empty update}">

                    <form action="personnel?action=addCategorieProduits&vue=nature&stocker=non" id="" method="post">
                        <div class="row-fluid layout-row">
                            <div class="control-group span2 flex-20">
                                <label class="form-control-label">Nature</label>
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
                        <form action="parametre?action=updateCategorie&vue=nature&id_categorie=${categorie.getIdCategorieProduit()}" id="fileForm" method="post">
                            <div class="row-fluid layout-row">
                                <div class="control-group span2 flex-20">
                                    <label class="control-label">Nature</label>
                                    <div class="controls">
                                        <input type="text"  class="form-control span12 " required value="${categorie.getTypeCategorie()}" name="type_categorie" id="">
                                    </div>
                                </div>

                                <div class="span1 flex-10">
                                    <div class="control-group ">
                                        <button type="submit" onclick="chargement()" name="${categorie.getIdCategorieProduit()}" class="btn btn-success " style="margin-top: 25px;" ><i class="icon-save"> </i></button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </c:if>
                <table class="table table-bordered table-hover table-striped simple_print">
                    <thead>
                        <tr >
                            <th>Nature</th>

                            <th>option</th>

                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${type_categorie}" var="cat">


                            <c:if test="${not empty cat.getStocker()}">
                                <tr class="produit">
                                    <td > <c:out value="${cat.getTypeCategorie()}"/> </td>
                                   
                                    <td >
                                        <div class="btn-group">
                                            <a title="" href="parametre?action=editCategorie&vue=nature&id_categorie=${cat.getIdCategorieProduit()}" class="btn btn-primary" >  <span class="icon"> <i class="icon-edit"></i> </span></a>
                                            <a class="btn btn-danger"  href="parametre?action=deleteCategorie&vue=nature&id_categorie=${cat.getIdCategorieProduit()}" name="" data-toggle="modal" data-target="" ><span class="icon"> <i class="icon-trash"></i> </span></a>

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


