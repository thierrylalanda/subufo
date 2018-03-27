

<%--
    Document   : controlleur
    Created on : 18 avr. 2017, 16:50:59
    Author     : lalanda
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h4 class="page-title">
    Evolution consommation et budgetaire
</h4>
<ul class="breadcrumb">
    <li>
        <a href="StatistiqueMP?vue=Accueil&action=autre"><i class="icon-home"></i> Accueil</a>
        <span class="divider">/</span>
    </li>
    <li>
        <a href="#">${vue}</a>

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


<div class="widget">
    <div class="widget-title">
        <h4><i class="icon-reorder"></i>Evolution consommation et budgetaire</h4>
        <span class="tools">
            <a href="javascript:;" class="icon-chevron-down"></a>
            <a href="javascript:;" class="icon-remove"></a>
        </span>
    </div>
    <div class="widget-body">
        <div class="bs-docs-example">
            <ul class="nav nav-tabs" id="myTab">
                <li class="active"><a href="#all-region" data-toggle="tab">Evolution consommation</a></li>
                <li class=""><a href="#all-budget" data-toggle="tab">Evolution budgetaire</a></li>
                <li><a href="#widget_tab3" data-toggle="tab">Evolution comparative</a></li>

            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade in" id="widget_tab3">


                    <c:import url="/WEB-INF/administrateur/comparaisonservice.jsp"/>
                </div>
                <div id="all-budget" class="tab-pane fade ">
                    <div class="row-fluid">
                        <div class="span12">
                            <div class="widget">
                                <div class="widget-title">
                                    <h4><i class="icon-reorder"></i>Statistique budgetaire</h4>
                                    <span class="tools">

                                    </span>
                                </div>
                                <div class="widget-body">
                                    <div class="row-fluid layout-gt-xs-row layout-xs-column">
                                        <div class="control-group span3 flex-gt-xs-15 flex-xs">
                                            <label class="control-label">Region</label>
                                            <div class="controls ">
                                                <select name="region" id="region-tb" class="span12">

                                                    <c:forEach items="${regions}" var="co">
                                                        <c:if test="${co.getNomRegion()==region.getNomRegion()}">
                                                            <option class="" value="${co.getIdRegion()}" selected>
                                                                ${co.getNomRegion()}
                                                            </option>
                                                        </c:if>
                                                        <c:if test="${co.getNomRegion()!=region.getNomRegion()}">
                                                            <option  class="" value="${co.getIdRegion()}">
                                                                ${co.getNomRegion()}
                                                            </option>
                                                        </c:if>

                                                    </c:forEach>
                                                </select>

                                            </div>
                                        </div>






                                    </div>
                                    <div class="row-fluid stat-camanber">
                                        <h4 style="text-align: center"><u >STATISTIQUE BUGETAIRE POUR <span class="titre"></span></u></h4>
                                        <div class="row-fluid stat">

                                        </div>
                                        <hr>

                                        <div class="row-fluid " id="stat-chart">

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>


                <div id="all-region" class="tab-pane fade in active">

                    <div class="row-fluid">
                        <div class="span12">
                            <div class="widget">
                                <div class="widget-title">
                                    <h4><i class="icon-reorder"></i>RAPPORT DES CONSOMMATIONS</h4>
                                    <span class="tools">

                                    </span>
                                </div>
                                <div class="widget-body">
                                    <div class="bs-docs-example">
                                        <ul class="nav nav-tabs" id="myTabp">
                                            <li class="li-stat "><a data-toggle="tab" href='#rapport_societe'>Societe</a></li>
                                            <li class="li-stat active"><a data-toggle="tab" href='#rapport_region'>Region</a></li>
                                            <li class="li-stat "><a data-toggle="tab" href='#rapport_direction'>Direction</a></li>
                                            <li class="li-stat "><a data-toggle="tab" href='#rapport_site'>Site</a></li>
                                            <li class="li-stat "><a data-toggle="tab" href='#rapport_service'>Service</a></li>
                                            <li class="li-stat "><a data-toggle="tab" href='#rapport_mags'>Magasin Secondaire</a></li>
                                            <li class="li-stat "><a data-toggle="tab" href='#rapport_magp'>Magasin Principal</a></li>
                                            <li class="li-stat "><a data-toggle="tab" href='#rapport_personnel'>Personnel</a></li>

                                        </ul>
                                        <div class="tab-content" id="myTabContent2">
                                            <div id='rapport_mags' class="tab-pane fade">
                                                <form>
                                                    <div class="row-fluid layout-gt-xs-row layout-xs-column">

                                                        <div class="span2 flex-gt-xs-10 flex-xs">
                                                            <label class="control-label" for="">Annee</label>
                                                            <div class="controls ">
                                                                <select class="all-date span12" name="" id="">

                                                                </select>

                                                            </div>
                                                        </div>

                                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                            <label class="control-label">Region</label>
                                                            <div class="controls ">
                                                                <select name="" id="" class="region_mags span12">

                                                                    <c:forEach items="${regions}" var="co">
                                                                        <c:if test="${co.getNomRegion()==region.getNomRegion()}">
                                                                            <option value="${co.getIdRegion()}" selected>
                                                                                ${co.getNomRegion()}
                                                                            </option>
                                                                        </c:if>
                                                                        <c:if test="${co.getNomRegion()!=region.getNomRegion()}">
                                                                            <option  value="${co.getIdRegion()}">
                                                                                ${co.getNomRegion()}
                                                                            </option>
                                                                        </c:if>

                                                                    </c:forEach>
                                                                </select>

                                                            </div>
                                                        </div>

                                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                            <label class="control-label">Magasin</label>
                                                            <div class="controls ">
                                                                <select name="magasin" id="stat-magasins" class="span12 magasinS magasin">

                                                                </select>

                                                            </div>
                                                        </div>



                                                    </div>
                                                </form>
                                            </div>
                                            <div id='rapport_magp' class="tab-pane fade">
                                                <form>
                                                    <div class="row-fluid layout-gt-xs-row layout-xs-column">

                                                        <div class="span2 flex-gt-xs-10 flex-xs">
                                                            <label class="control-label" for="">Annee</label>
                                                            <div class="controls ">
                                                                <select class="all-date span12" name="" id="">

                                                                </select>

                                                            </div>
                                                        </div>

                                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                            <label class="control-label">Region</label>
                                                            <div class="controls ">
                                                                <select name="" id="" class="region_magp span12">

                                                                    <c:forEach items="${regions}" var="co">
                                                                        <c:if test="${co.getNomRegion()==region.getNomRegion()}">
                                                                            <option value="${co.getIdRegion()}" selected>
                                                                                ${co.getNomRegion()}
                                                                            </option>
                                                                        </c:if>
                                                                        <c:if test="${co.getNomRegion()!=region.getNomRegion()}">
                                                                            <option  value="${co.getIdRegion()}">
                                                                                ${co.getNomRegion()}
                                                                            </option>
                                                                        </c:if>

                                                                    </c:forEach>
                                                                </select>

                                                            </div>
                                                        </div>

                                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                            <label class="control-label">Magasin</label>
                                                            <div class="controls ">
                                                                <select name="magasin" id="stat-magasinp" class="span12 magasinP">

                                                                </select>

                                                            </div>
                                                        </div>



                                                    </div>
                                                </form>
                                            </div>
                                            <div id='rapport_personnel' class="tab-pane fade">
                                                <form>
                                                    <div class="row-fluid layout-gt-xs-row layout-xs-column">
                                                        <div class="span2 flex-gt-xs-10 flex-xs">
                                                            <label class="control-label" for="">Annee</label>
                                                            <div class="controls ">
                                                                <select class="all-date span12" name="" id="">

                                                                </select>

                                                            </div>
                                                        </div>

                                                        <div class="span2 flex-gt-xs-15 flex-xs">
                                                            <label class="control-label" for="region">Region</label>
                                                            <div class="controls ">
                                                               
                                                                    <select class="region_direction_stat span12" name="" id="region_direction_stat">

                                                                        <c:forEach items="${regions}" var="co">
                                                                            <c:if test="${co.getNomRegion()==region.getNomRegion()}">
                                                                                <option value="${co.getIdRegion()}" selected>
                                                                                    ${co.getNomRegion()}
                                                                                </option>
                                                                            </c:if>
                                                                            <c:if test="${co.getNomRegion()!=region.getNomRegion()}">
                                                                                <option  value="${co.getIdRegion()}">
                                                                                    ${co.getNomRegion()}
                                                                                </option>
                                                                            </c:if>

                                                                        </c:forEach>
                                                                    </select>
                                                               
                                                            </div>
                                                        </div>

                                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                            <label for="stat-site" class="control-label">Direction</label>
                                                            <div class="controls ">
                                                                <select name="" id="" class="span12 input-lg direction_service_stat" >


                                                                </select>

                                                            </div>
                                                        </div>
                                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                            <label class="control-label" for="service">Service</label>
                                                            <div class="controls ">
                                                                <select name="" id="" class="span12 service_stat_perso form-control input-lg "  >

                                                                </select>

                                                            </div>
                                                        </div>





                                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                            <label class="control-label" for="stat-service">personnel</label>
                                                            <div class="controls ">
                                                                <select name="personnel" id="stat-personnel" class="span12 personnels form-control input-lg "  >

                                                                </select>

                                                            </div>
                                                        </div>


                                                        <div class="span1  hidden flex-gt-xs-15 flex-xs">
                                                            <label class="control-label" for="">categorie</label>
                                                            <div class="controls ">
                                                                <div class="input-append ">
                                                                    <input type="text" class=" span12 disabled hidden" name="categorie" value="${cat.getTypeCategorie()}"/>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </form>
                                            </div>
                                            <div id='rapport_societe' class="tab-pane fade in ">
                                                <form>
                                                    <div class="row-fluid layout-gt-xs-row layout-xs-column">


                                                        <div class="span2 flex-gt-xs-10 flex-xs">
                                                            <label class="control-label" for="">Annee</label>
                                                            <div class="controls ">
                                                                <select class="all-date span12" name="" id="">

                                                                </select>

                                                            </div>
                                                        </div>
                                                        <div class="control-group span2 flex-gt-xs-10 flex-xs">

                                                            <div class="controls ">
                                                                <a class="btn btn-primary" style="margin-top: 25px" id="stat-societe"><span class="icon icon-search"></span></a>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </form>
                                            </div>
                                            <div id='rapport_region' class="tab-pane fade in active">
                                                <form>
                                                    <div class="row-fluid layout-gt-xs-row layout-xs-column">

                                                        <div class="span2 flex-gt-xs-10 flex-xs">
                                                            <label class="control-label" for="">Annee</label>
                                                            <div class="controls ">
                                                                <select class="all-date span12" name="" id="">

                                                                </select>

                                                            </div>
                                                        </div>

                                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                            <label class="control-label">Region</label>
                                                            <div class="controls ">
                                                                <select name="region" class="span12"id="stat-region">

                                                                    <c:forEach items="${regions}" var="co">
                                                                        <c:if test="${co.getNomRegion()==region.getNomRegion()}">
                                                                            <option value="${co.getIdRegion()}" selected>
                                                                                ${co.getNomRegion()}
                                                                            </option>
                                                                        </c:if>
                                                                        <c:if test="${co.getNomRegion()!=region.getNomRegion()}">
                                                                            <option  value="${co.getIdRegion()}">
                                                                                ${co.getNomRegion()}
                                                                            </option>
                                                                        </c:if>

                                                                    </c:forEach>
                                                                </select>

                                                            </div>
                                                        </div>



                                                    </div>
                                                </form>
                                            </div>


                                            <div id='rapport_direction' class="tab-pane fade in ">
                                                <form>
                                                    <div class="row-fluid layout-gt-xs-row layout-xs-column">
                                                        <div class="span2 flex-gt-xs-10 flex-xs">
                                                            <label class="control-label" for="">Annee</label>
                                                            <div class="controls ">
                                                                <select class="all-date span12" name="" id="">

                                                                </select>

                                                            </div>
                                                        </div>
                                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                            <label class="control-label">Region</label>
                                                            <div class="controls ">
                                                                <select name="region" id="" class="region span12">

                                                                    <c:forEach items="${regions}" var="co">
                                                                        <c:if test="${co.getNomRegion()==region.getNomRegion()}">
                                                                            <option value="${co.getIdRegion()}" selected>
                                                                                ${co.getNomRegion()}
                                                                            </option>
                                                                        </c:if>
                                                                        <c:if test="${co.getNomRegion()!=region.getNomRegion()}">
                                                                            <option  value="${co.getIdRegion()}">
                                                                                ${co.getNomRegion()}
                                                                            </option>
                                                                        </c:if>

                                                                    </c:forEach>
                                                                </select>

                                                            </div>
                                                        </div>
                                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                            <label for="stat-direction" class="control-label">Direction</label>
                                                            <div class="controls ">
                                                                <select name="region" id="stat-direction" class="span12 input-lg direction" >


                                                                </select>

                                                            </div>
                                                        </div>




                                                    </div>
                                                </form>
                                            </div>


                                            <div id='rapport_site' class="tab-pane fade in ">
                                                <form>
                                                    <div class="row-fluid layout-gt-xs-row layout-xs-column">
                                                        <div class="span2 flex-gt-xs-10 flex-xs">
                                                            <label class="control-label" for="">Annee</label>
                                                            <div class="controls ">
                                                                <select class="all-date span12" name="" id="">

                                                                </select>

                                                            </div>
                                                        </div>
                                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                            <label class="control-label">Region</label>
                                                            <div class="controls ">
                                                                <select name="region" id="" class="region_service span12">

                                                                    <c:forEach items="${regions}" var="co">
                                                                        <c:if test="${co.getNomRegion()==region.getNomRegion()}">
                                                                            <option value="${co.getIdRegion()}" selected>
                                                                                ${co.getNomRegion()}
                                                                            </option>
                                                                        </c:if>
                                                                        <c:if test="${co.getNomRegion()!=region.getNomRegion()}">
                                                                            <option  value="${co.getIdRegion()}">
                                                                                ${co.getNomRegion()}
                                                                            </option>
                                                                        </c:if>

                                                                    </c:forEach>
                                                                </select>

                                                            </div>
                                                        </div>

                                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                            <label for="stat-site" class="control-label">Site</label>
                                                            <div class="controls ">
                                                                <select name="region" id="stat-site" class="span12 input-lg site_service" >


                                                                </select>

                                                            </div>
                                                        </div>



                                                    </div>
                                                </form>
                                            </div>


                                            <div id='rapport_service' class="tab-pane fade in ">
                                                <form>
                                                    <div class="row-fluid layout-gt-xs-row layout-xs-column">
                                                        <div class="span2 flex-gt-xs-10 flex-xs">
                                                            <label class="control-label" for="">Annee</label>
                                                            <div class="controls ">
                                                                <select class="all-date span12" name="" id="">

                                                                </select>

                                                            </div>
                                                        </div>
                                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                            <label class="control-label">Region</label>
                                                            <div class="controls ">
                                                                <select name="region" id="" class="span12 region_direction_stat">

                                                                    <c:forEach items="${regions}" var="co">
                                                                        <c:if test="${co.getNomRegion()==region.getNomRegion()}">
                                                                            <option value="${co.getIdRegion()}" selected>
                                                                                ${co.getNomRegion()}
                                                                            </option>
                                                                        </c:if>
                                                                        <c:if test="${co.getNomRegion()!=region.getNomRegion()}">
                                                                            <option  value="${co.getIdRegion()}">
                                                                                ${co.getNomRegion()}
                                                                            </option>
                                                                        </c:if>

                                                                    </c:forEach>
                                                                </select>

                                                            </div>
                                                        </div>

                                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                            <label for="stat-site" class="control-label">Direction</label>
                                                            <div class="controls ">
                                                                <select name="region" id="" class="span12 input-lg direction_service_stat" >


                                                                </select>

                                                            </div>
                                                        </div>
                                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                            <label class="control-label" for="stat-service">Service</label>
                                                            <div class="controls ">
                                                                <select name="direction" id="stat-service" class="span12 form-control input-lg service_stat"  >

                                                                </select>

                                                            </div>
                                                        </div>


                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>



                                    <div class="row-fluid">
                                        <div class="span12">
                                            <!-- BEGIN CHART PORTLET-->



                                            <div id="liness" height="400" width="1100"></div>
                                            <div class="space20"></div>
                                            <div class="space20"></div>

                                            <hr>



                                            <!-- END CHART PORTLET <div id="barchar" height="400" width="1100"></div> -->
                                        </div>
                                    </div>


                                </div>
                            </div>

                        </div>
                    </div>

                </div>

            </div>


            <div class="space20"></div>

        </div>
    </div>
</div>


