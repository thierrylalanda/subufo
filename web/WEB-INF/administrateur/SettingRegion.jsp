

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
    Mise à jour d'une région
</h3>
<ul class="breadcrumb">
    <li>

        <a href="admin?vue=accueil&action=getAll"><i class="icon-home"></i> Home</a>
        <span class="divider">/</span>
    </li>
    <li>
        <a href="#"><i class="icon-group"></i> Region</a>

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
        <h4><i class="icon-reorder"></i> Mise à jour d'une région</h4>
        <span class="tools">
            <a href="javascript:;" class="icon-chevron-down"></a>
            <a href="javascript:;" class="icon-remove"></a>
        </span>
    </div>
    <div class="widget-body">
        <div class="bs-docs-example">
            <ul class="nav nav-tabs" id="myTab">
                <li class="active"><a href="#all-direction" data-toggle="tab">Liste des Regions</a></li>

                <li><a href="#add-direction" data-toggle="tab">Ajouter Une Region</a> </li>

            </ul>

            <div class="tab-content" id="myTabContent">
              
                <div id="all-direction" class="tab-pane fade in active">
                    <c:if test="${not empty region}">
                    <form action="admin?action=editeRegion&idregion=${region.getIdRegion()}&edite=edition&vue=region" method="post">
                        <div class="row-fluid layout-gt-xs-row layout-xs-column">
                            <div class="control-group form-group span2 flex-gt-xs-20 flex-xs">
                                <label class="control-label"> Nom Region</label>
                                <div class="controls ">
                                    <input type="text" style="" class="form-control "value="${region.getNomRegion()}" name="newval" required placeholder="Nouveau Nom De La Region"/>
                                </div>
                            </div>

                            <div class="span2 flex-gt-xs-20 flex-xs">
                                <div class="control-group ">
                                    <button type="submit" class="btn btn-success " style="margin-top: 25px" ><i class="icon-save"></i></button>
                                </div>
                            </div>
                        </div>
                    </form>
                </c:if>
                    <table class="table table-bordered table-hover table-striped simple_print"  cellspacing="0" width="100%">
                        <thead>
                            <tr >
                                <th>Nom Region</th>
                                <th class="hidden">Region</th>
                                <th>Site</th>
                                <th>Service</th>
                                <th>Options</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${regions}" var="dir">
                                <tr class="produits">
                                    <c:set var="servi" value="${0}"></c:set>

                                    <c:set var="perso" value="${0}"></c:set>
                                    <td class="lastName"> ${dir.getNomRegion()}</td>
                                    <td class="hidden update"><input type="text" name="newName" class="newval" link="admin?action=editeRegion&idregion=${dir.getIdRegion()}" placeholder="nouveau nom"/></td>

                                    <td > ${dir.getSiteList().size()}</td>
                                    <td class="code">
                                        <c:forEach items="${dir.getSiteList()}" var="site">
                                            <c:set var="servi" value="${servi + site.getServiceList().size()}"></c:set>
                                        </c:forEach>
                                        ${servi}

                                    </td>
                                    <td >
                                        <div class="btn-group">
                                            <a title="" href="admin?action=editeRegion&idregion=${dir.getIdRegion()}&vue=region" class="btn btn-primary">  <span class="icon"> <i class="icon-pencil"></i> </span></a>  
                                            <c:if test="${sessionScope.GeneralAdministrateur == 'OK'}">
                                                <a class="btn btn-danger <c:if test="${dir.getSiteList().size()!=0 or servi!=0}">disabled-delete</c:if>"  href="admin?action=deleteRegion&vue=region&idregion=${dir.getIdRegion()}" ><span class="icon"> <i class="icon-trash"></i> </span></a>
                                            </c:if>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div id="add-direction" class="tab-pane fade">
                  

                    <form action="personnel?action=addRegion&vue=region" method="post">
                        <div class="row-fluid layout-gt-xs-row layout-xs-column">
                            <div class="control-group form-group span2 flex-gt-xs-20 flex-xs">
                                <label class="control-label">Nom Region</label>
                                <div class="controls ">
                                    <input type="text" style="" class="form-control " name="region" required placeholder="nom Region"/>

                                </div>
                            </div>

                            <div class="span2 flex-gt-xs-10 flex-xs">
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
                </div>



            </div>
        </div>
    </div>
</div>

