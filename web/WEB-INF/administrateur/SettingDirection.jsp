

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
    Mis à jour d'une direction
</h3>
<ul class="breadcrumb">
    <li>

        <a href="admin?vue=accueil&action=getAll"><i class="icon-home"></i> Home</a>
        <span class="divider">/</span>
    </li>
    <li>
        <a href="#"><i class="icon-group"></i> Directions</a>

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
        <h4><i class="icon-reorder"></i>Mise à jour d'une direction</h4>
        <span class="tools">
            <a href="javascript:;" class="icon-chevron-down"></a>
            <a href="javascript:;" class="icon-remove"></a>
        </span>
    </div>
    <div class="widget-body">
        <div class="bs-docs-example">
            <ul class="nav nav-tabs" id="myTab">
                <li class="active"><a href="#all-direction" data-toggle="tab">Liste des directions</a></li>

                <li><a href="#add-direction" data-toggle="tab">Ajouter Une Direction</a> </li>

            </ul>
            <div class="tab-content" id="myTabContent">
               
                <div id="all-direction" class="tab-pane fade in active">
                    <c:if test="${not empty direction}">
                    <form action="admin?action=editeDirection&iddirection=${direction.getIdDirection()}&edite=edition&vue=settingdirection" method="post">
                        <div class="row-fluid layout-gt-xs-row layout-xs-column">
                            <div class="control-group form-group span2 flex-gt-xs-20 flex-xs">
                                <label class="control-label">Region</label>
                                <div class="controls ">
                                    <select name="region" class="form-control " required>
                                        <c:forEach items="${regions}" var="region">
                                            <option value="${region.getIdRegion()}" class="">${region.getNomRegion()}</option>

                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="control-group form-group span2 flex-gt-xs-20 flex-xs">
                                <label class="control-label"> Nom De La Direction</label>
                                <div class="controls ">
                                    <input type="text" style="" class="  form-control"value="${direction.getNomDirection()}" name="newval" required placeholder="Nouveau Nom De La Direction"/>

                                </div>
                            </div>
                            <div class="span2 flex-gt-xs-10 flex-xs">
                                <div class="control-group ">
                                    <button type="submit" class="btn btn-success " style="margin-top: 25px" ><i class="icon-save"></i> </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </c:if>
                    <table class="table table-bordered table-hover table-striped simple_print"  cellspacing="0" width="100%" >
                        <thead>
                            <tr >

                                <th>Nom Direction</th>
                                <th class="hidden">Region</th>
                                <th>Region</th>
                                <th>Total Service</th>
                                <th>Options</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${directions}" var="dir">
                                <tr class="produits">

                                    <td class="lastName"> ${dir.getNomDirection()}</td>
                                    <td class="hidden update"><input type="text" name="newName" class="newval" link="admin?action=editeDirection&iddirection=${dir.getIdDirection()}" placeholder="nouveau nom"/></td>
                                    <td > ${dir.getRegion().getNomRegion()}</td>
                                    <td>
                                        <a href="#">
                                            ${dir.getServiceList().size()}
                                        </a>
                                    </td>
                                    <td >
                                        <div class="btn-group">
                                            <a title="" href="admin?action=editeDirection&iddirection=${dir.getIdDirection()}&vue=settingdirection" class="btn btn-primary">  <span class="icon"> <i class="icon-pencil"></i> </span></a>  
                                            <c:if test="${sessionScope.GeneralAdministrateur == 'OK'}">
                                                <a class="btn btn-danger <c:if test="${dir.getServiceList().size()!=0}">disabled-delete</c:if>" href="admin?action=deleteDirection&vue=settingdirection&iddirection=${dir.getIdDirection()}" name="admin?action=deleteDirection&vue=settingdirection&iddirection=${dir.getIdDirection()}" data-toggle="modal" data-target="" ><span class="icon"> <i class="icon-trash"></i> </span></a>
                                            </c:if>
                                        </div>
                                    </td>
                                </tr>


                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div id="add-direction" class="tab-pane fade">
                   

                    <form action="personnel?action=addDirection&vue=settingdirection" method="post">
                        <div class="row-fluid layout-gt-xs-row layout-xs-column">
                            <div class="control-group form-group span2 flex-gt-xs-20 flex-xs">
                                <label class="control-label">Region</label>
                                <div class="controls ">
                                    <select name="region" class="form-control " required>
                                        <c:forEach items="${regions}" var="region">
                                            <option value="${region.getIdRegion()}" class="">${region.getNomRegion()}</option>

                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group form-group span2 flex-gt-xs-20 flex-xs">
                                <label class="control-label">Nom Direction</label>
                                <div class="controls ">
                                    <input type="text" style="" class="form-control " name="nom_direction" required placeholder="nom direction"/>

                                </div>
                            </div>

                            <div class="span2 flex-gt-xs-10 flex-xs">
                                <div class="control-group ">
                                    <button type="submit" class="btn btn-success " style="margin-top: 25px" ><i class="icon-save"></i> </button>
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

