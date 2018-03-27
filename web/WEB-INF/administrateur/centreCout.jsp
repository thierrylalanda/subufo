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
    Mise à jour centre de cout
</h3>
<ul class="breadcrumb">
    <li>

        <a href="admin?vue=accueil&action=getAll"><i class="icon-home"></i>Home</a>
        <span class="divider">/</span>
    </li>
    <li>
        <a href="#"><i class="icon-group"></i>Centre Cout</a>

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
        <h4><i class="icon-reorder"></i> Mise à jour Centre De Cout</h4>
        <span class="tools">
            <a href="javascript:;" class="icon-chevron-down"></a>
            <a href="javascript:;" class="icon-remove"></a>
        </span>
    </div>
    <div class="widget-body">
        <div class="bs-docs-example">


            <div class="row-fluid">

                <c:if test="${empty update}">

                    <h4>nouveau centre de cout</h4>
                    <div class="row-fluid">


                        <form action="personnel?action=addcentrecout&vue=centre cout" id="fileForm" method="post">
                            <div class="row-fluid layout-gt-xs-row layout-xs-column">
                                <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                    <label class="control-label" for="region">Region</label>
                                    <div class="controls ">
                                        <select name="region" id="region_service" class="form-control input-lg span12" >
                                            <c:forEach items="${regions}" var="region">
                                                <option value="${region.getIdRegion()}" class="region">${region.getNomRegion()}</option>

                                            </c:forEach>
                                        </select>

                                    </div>
                                </div>

                                <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                    <label class="control-label" for="site">Site</label>
                                    <div class="controls ">
                                        <select name="site" id="site_service" class="form-control input-lg span12" >

                                        </select>

                                    </div>
                                </div>
                                <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                    <label class="control-label"> Service</label>
                                    <div class="controls ">
                                        <select name="service" id="service" class="form-control input-lg span12">

                                        </select>
                                    </div>

                                </div>
                                <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                    <label class="control-label">centre de coute</label>
                                    <div class="controls">
                                        <input type="text" placeholder="centre de cout" style="" class="span12 form-control span12" required name="centrecout" id="">
                                    </div>
                                </div>
                                <div class="span2 flex-gt-xs-10 flex-xs">
                                    <div class="control-group ">
                                        <button type="submit" class="btn btn-success span12" style="margin-top: 25px" >Ajouter</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <c:if test="${not empty message}">
                            <div class="alert alert-danger  span12 text-center error_message hidden">
                                <strong>${message.getMessage()}</strong>
                            </div>
                        </c:if>
                    </div>
                </c:if>

            </div>
            <div class="row-fluid">
                <c:if test="${not empty update}">
                    <h4>Mise à jour </h4>
                    <div class="row-fluid">
                        <form action="personnel?action=updatecentrecout&vue=centre cout&id_cc=${cc.getIdCout()}" id="fileForm" method="post">
                            <div class="row-fluid layout-gt-xs-row layout-xs-column">
                                <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                    <label class="control-label" for="region">Region</label>
                                    <div class="controls ">
                                        <select name="region" id="region_service" class="form-control input-lg span12" >
                                            <c:forEach items="${regions}" var="region">
                                                <option value="${region.getIdRegion()}" class="region">${region.getNomRegion()}</option>

                                            </c:forEach>
                                        </select>

                                    </div>
                                </div>

                                <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                    <label class="control-label" for="site">Site</label>
                                    <div class="controls ">
                                        <select name="site" id="site_service" class="form-control input-lg span12" >
                                            <option value="${cc.getService().getSite().getIdSite()}" class="region">${cc.getService().getSite().getNomSite()}</option>
                                        </select>

                                    </div>
                                </div>
                                <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                    <label class="control-label"> Service</label>
                                    <div class="controls ">
                                        <select name="service" id="service" class="form-control input-lg span12">
                                            <option value="${cc.getService().getIdService()}" class="region">${cc.getService().getNomService()}</option>
                                        </select>
                                    </div>

                                </div>
                                <div class="control-group span2 flex-gt-xs-15 flex-xs">

                                    <label class="control-label">centre de cout</label>
                                    <div class="controls">

                                        <input type="text" style="" class="span12 form-control "  value="${cc.getLibelle()}" name="centrecout" id="">
                                    </div>
                                </div>
                                <div class="span2 flex-gt-xs-10 flex-xs">
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
                            <th>Service</th>
                            <th>centre de cout</th>

                            <th>option</th>

                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${centreCout}" var="cc">



                            <tr class="produit">
                                <td > <c:out value="${cc.getService().getNomService()}"/> </td>
                                <td > <c:out value="${cc.getLibelle()}"/> </td>
                                <td > 
                                    <div class="btn-group">
                                        <a title="" href="personnel?action=editecentrecout&vue=centre cout&id_cc=${cc.getIdCout()}" class="btn btn-primary" >  <span class="icon"> <i class="icon-edit"></i> </span></a>  
                                        <a class="btn btn-danger delete-insert"  href="#" name="personnel?action=deletecentrecout&vue=centre cout&id_cc=${cc.getIdCout()}" name="" data-toggle="modal" data-target="" ><span class="icon"> <i class="icon-trash"></i> </span></a>

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
