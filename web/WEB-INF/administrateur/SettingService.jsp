

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
    Mise à jour d'un service
</h3>
<ul class="breadcrumb">
    <li>

        <a href="admin?vue=accueil&action=getAll"><i class="icon-home"></i> Home</a>
        <span class="divider">/</span>
    </li>
    <li>
        <a href="#"><i class="icon-group"></i> Service</a>

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
        <h4><i class="icon-reorder"></i> Mise à jour d'un service</h4>
        <span class="tools">
            <a href="javascript:;" class="icon-chevron-down"></a>
            <a href="javascript:;" class="icon-remove"></a>
        </span>
    </div>
    <div class="widget-body">
        <div class="bs-docs-example">
            <ul class="nav nav-tabs" id="myTab">
                <li class="active"><a href="#all-direction" data-toggle="tab">Liste des services</a></li>

                <li><a href="#add-direction" data-toggle="tab">Ajouter Un Service</a> </li>

            </ul>
            <div class="tab-content" id="myTabContent">

                <div id="all-direction" class="tab-pane fade in active">
                    <c:if test="${not empty service}">
                        <c:import url="/WEB-INF/administrateur/updateService.jsp"/>


                    </c:if>
                    <table class="table table-bordered table-hover table-striped simple_print"  cellspacing="0" width="100%">
                        <thead>
                            <tr >

                                <th>Nom Service</th>
                                <th class="hidden">service</th>
                                <th>Region</th>
                                <th>Direction</th>
                                <th>Site</th>                               
                                <th>Total Personnel</th>
                                <th>Options</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach  items="${services}" var="ser">
                                <tr class="produits">
                                    <td class="lastName">${ser.getNomService()}</td>
                                    <td class="hidden update"><input type="text" name="newName" class="newval" link="admin?action=editeService&idservice=${ser.getIdService()}" placeholder="nouveau nom"/></td>

                                    <td > ${ser.getSite().getRegion().getNomRegion()}</td>
                                    <td class="">${ser.getDirection().getNomDirection()}</td>
                                    <td class="">${ser.getSite().getNomSite()}</td>                                   
                                    <td > ${ser.getPersonnelList().size()} </td>
                                    <td >
                                        <div class="btn-group">
                                            <a title="" href="admin?action=editeService&idservice=${ser.getIdService()}&vue=settingservice" class="btn btn-primary">  <span class="icon"> <i class="icon-pencil"></i> </span></a>  
                                            <c:if test="${sessionScope.GeneralAdministrateur == 'OK'}">
                                                <a class="btn btn-danger <c:if test="${ser.getPersonnelList().size()!=0}">disabled-delete</c:if>" href="admin?action=deleteService&vue=settingservice&idservice=${ser.getIdService()}" name="admin?action=deleteService&vue=settingservice&idservice=${ser.getIdService()}" data-toggle="modal" data-target="" ><span class="icon"> <i class="icon-trash"></i> </span></a>
                                            </c:if>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div id="add-direction" class="tab-pane fade">
                   
                    <div class="row-fluid">

                        <form role="form" action="personnel?action=addService&vue=settingservice" method="post">
                            <div class="row-fluid layout-gt-xs-row layout-xs-column">
                                <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                                    <label class="control-label">Region</label>
                                    <div class="controls ">
                                        <select name="region" class="form-control span12" required id="region_service">
                                            <option>...</option>
                                            <c:forEach items="${regions}" var="region">

                                                <option value="${region.getIdRegion()}" class="region">${region.getNomRegion()}</option>

                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group span2 form-group flex-gt-xs-15 flex-xs">
                                    <label class="control-label">Direction</label>
                                    <div class="controls ">
                                        <select name="direction" class="form-control span12" required id="">
                                            <c:forEach items="${directions}" var="dir">
                                                <option value="${dir.getIdDirection()}" class="direction">${dir.getNomDirection()}</option>

                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="control-group span2 form-group flex-gt-xs-15 flex-xs ">
                                    <label class="control-label">Site</label>
                                    <div class="controls ">
                                        <select name="site" class="form-control span12" required id="site_service">

                                        </select>
                                    </div>
                                </div>

                                <div class="control-group span2 form-group flex-gt-xs-15 flex-xs ">
                                    <label class="control-label">Service</label>
                                    <div class="controls ">
                                        <input type="text" style="" class=" form-control span12" name="nom_service" required placeholder="Service"/>

                                    </div>
                                </div>                               
                                <div class="span2 flex-gt-xs-10 flex-xs">
                                    
                                    <div class="control-group ">
                                        <button type="submit" class="btn btn-success " style="margin-top: 25px" ><i class="icon-save"></i></button>
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

                <div class="space20"></div>

            </div>
        </div>
    </div>
</div>

