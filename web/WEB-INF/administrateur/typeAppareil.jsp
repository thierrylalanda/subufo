<%-- 
    Document   : typeAppareil
    Created on : 17 août 2017, 10:43:38
    Author     : Administrateur
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h3 class="page-title">
    Mise à jour Type Appareil
</h3>
<ul class="breadcrumb">
    <li>

        <a href="admin?vue=accueil&action=getAll"><i class="icon-home"></i> Home</a>
        <span class="divider">/</span>
    </li>
    <li>
        <a href="#"><i class="icon-group"></i> Type Appareil</a>

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
        <h4><i class="icon-reorder"></i>Mise à jour Type Appareil</h4>
        <span class="tools">
            <a href="javascript:;" class="icon-chevron-down"></a>
            <a href="javascript:;" class="icon-remove"></a>
        </span>
    </div>
    <div class="widget-body">
        <div class="bs-docs-example">


            <div class="row-fluid">
                <c:if test="${empty updatetype}">

                    <form action="personnel?action=addTypeAppareil&vue=typeappareil" id="fileForm" method="post">
                        <div class="row-fluid layout-gt-xs-row layout-xs-column">
                            <div class="control-group span2 flex-gt-xs-20 flex-xs">
                                <label class="control-label">type appareil</label>
                                <div class="controls">
                                    <input type="text" style="" placeholder="type appareil" class="form-control span12 " required name="type_appareil" id="">
                                </div>
                            </div>
                            <div class="span2  flex-gt-xs-20 flex-xs">
                                <div class="control-group ">
                                    <button type="submit" class="btn btn-success " style="margin-top: 25px" >Ajouter</button>
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
                <c:if test="${not empty updatetype}">

                    <div class="row-fluid">
                        <form action="personnel?action=updateTypeAppareil&vue=typeappareil&id_type=${typeapp.getId()}" id="fileForm" method="post">
                            <div class="row-fluid layout-gt-xs-row layout-xs-column">
                                <div class="control-group span2 flex-gt-xs-20 flex-xs">

                                    <label class="control-label">type appareil</label>
                                    <div class="controls">

                                        <input type="text" class="form-control span12 " style=""  value="${typeapp.getNom()}" name="type_categorie" id="">
                                    </div>
                                </div>
                                <div class="span2 flex-gt-xs-20 flex-xs">
                                    <div class="control-group ">
                                        <button type="submit" class="btn btn-success " style="margin-top: 25px" >Enregistrer</button>
                                    </div>
                                </div>

                            </div>
                        </form>
                    </div>
                </c:if>
                <table class="table table-bordered table-hover table-striped simple_print"  cellspacing="0" width="100%">
                    <thead>
                        <tr >
                            <th>Type Appareil</th>

                            <th>option</th>

                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${typeappareil}" var="app">



                            <tr class="produit">
                                <td > <c:out value="${app.getNom()}"/> </td>
                                <td > 
                                    <div class="btn-group">
                                        <a title="" href="personnel?action=editTypeAppareil&vue=typeappareil&id_type=${app.getId()}" class="btn btn-primary" >  <span class="icon"> <i class="icon-edit"></i> </span></a>  
                                        <a class="btn btn-danger delete-insert"  name="personnel?action=deleteTypeAppareil&vue=typeappareil&id_type=${app.getId()}" href="#" data-toggle="modal" data-target="" ><span class="icon"> <i class="icon-trash"></i> </span></a>

                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
