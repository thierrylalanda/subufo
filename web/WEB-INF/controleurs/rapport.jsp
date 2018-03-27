

<%--
    Document   : controlleur
    Created on : 18 avr. 2017, 16:50:59
    Author     : lalanda
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<div class="widget">
    <div class="widget-title">
        <p class="niveau_personnel hidden">${sessionScope.login.getNiveauAcces()}</p>
        <p class="service_personnel hidden">${sessionScope.personnel.getService().getNomService()}</p>
        <h4><i class="icon-reorder"></i>Evolution Consommation Et Budgetaire</h4>
        <span class="tools">
            <a href="javascript:;" class="icon-chevron-down"></a>
            <a href="javascript:;" class="icon-remove"></a>
        </span>
    </div>
    <div class="widget-body">
        <div class="bs-docs-example">
            <ul class="nav nav-tabs" id="myTab">
                <li class="active"><a href="#all-region" data-toggle="tab">EVOLUTION CONSOMMATION</a></li>
                <li class=""><a href="#all-budget" data-toggle="tab">EVOLUTION BUDGETAIRE</a></li>
                    <c:if test="${sessionScope.login.getNiveauAcces() == 4}">
                    <li><a href="#widget_tab3" data-toggle="tab">Reporting comparatif et visuel </a></li>
                    </c:if>


            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade in" id="widget_tab3">
                    <c:import url="/WEB-INF/controleurs/comparaisonservice.jsp"/>
                </div>
                <div id="all-budget" class="tab-pane fade ">
                    <div class="row-fluid ">
                        <div class="span12">
                            <div class="widget">
                                <div class="widget-title">
                                    <h4><i class="icon-reorder"></i>STATISTIQUES BUDGETAIRES</h4>
                                    <span class="tools">

                                    </span>
                                </div>
                                <div class="widget-body">
                                    <form   class="<c:if test="${sessionScope.login.getNiveauAcces() == 1}">hidden</c:if>" >
                                            <div class="row-fluid layout-gt-xs-row layout-xs-column">
                                                <div class="control-group span3 flex-gt-xs-15 flex-xs">
                                                    <label class="control-label">Region</label>
                                                    <div class="controls ">
                                                        <select name="region" id="region" class="span12">
                                                            <option value="${sessionScope.personnel.getService().getSite().getRegion().getIdRegion()}" selected>${sessionScope.personnel.getService().getSite().getRegion().getNomRegion()}</option>

                                                    </select>

                                                </div>
                                            </div>



                                        </div>
                                    </form>
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
                                            <c:if test="${sessionScope.login.getNiveauAcces() == 4}">
                                                <li class="li-stat "><a data-toggle="tab" href='#rapport_societe'>Societe</a></li>
                                                <li class="li-stat active"><a data-toggle="tab" href='#rapport_region'>Region</a></li>
                                                <li class="li-stat "><a data-toggle="tab" href='#rapport_direction'>Direction</a></li>
                                                <li class="li-stat "><a data-toggle="tab" href='#rapport_site'>Site</a></li>
                                                <li class="li-stat "><a data-toggle="tab" href='#rapport_mags'>Magasin Secondaire</a></li>
                                                <li class="li-stat "><a data-toggle="tab" href='#rapport_magp'>Magasin Principal</a></li>
                                                </c:if>
                                            <li class="li-stat <c:if test="${sessionScope.login.getNiveauAcces() != 4}"> active </c:if>"><a data-toggle="tab" href='#rapport_service'>Service</a></li>
                                            <li class="li-stat "><a data-toggle="tab" href='#rapport_personnel'><c:if test="${sessionScope.login.getNiveauAcces() == 4}">Personnel</c:if><c:if test="${sessionScope.login.getNiveauAcces() != 4}">${sessionScope.personnel.getNomPrenom()}</c:if></a></li>
                                                <li class="li-stat "><a data-toggle="tab" href='#rapport_mon_service'>Tous les utilisateurs</a></li>

                                            </ul>
                                            <div class="tab-content" id="myTabContent2">
                                                <div id='rapport_mags' class="tab-pane fade">
                                                    <form>
                                                        <div class="row-fluid layout-gt-xs-row layout-xs-column">

                                                            <div class="span2 flex-gt-xs-5 flex-xs">
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
                                                                        <option value="${sessionScope.personnel.getService().getSite().getRegion().getIdRegion()}" selected>${sessionScope.personnel.getService().getSite().getRegion().getNomRegion()}</option>
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

                                                        <div class="span2 flex-gt-xs-5 flex-xs">
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
                                                                    <option value="${sessionScope.personnel.getService().getSite().getRegion().getIdRegion()}" selected>${sessionScope.personnel.getService().getSite().getRegion().getNomRegion()}</option>

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
                                            <div id='rapport_mon_service' class="tab-pane fade">
                                                <form>
                                                    <div class="row-fluid layout-gt-xs-row layout-xs-column">
                                                        <div class="span2 flex-gt-xs-5 flex-xs">
                                                            <label class="control-label" for="">Annee</label>
                                                            <div class="controls ">
                                                                <select class="all-date span12" name="" id="">

                                                                </select>

                                                            </div>
                                                        </div>
                                                        <div class="span1 flex-gt-xs-5 flex-xs">
                                                            <button type="submit"  class="btn btn-primary search-service-user" style="margin-top: 25px">
                                                                <span class="icon icon-search "></span>
                                                            </button>
                                                        </div>



                                                        <div class="span2 hidden flex-gt-xs-15 flex-xs">
                                                            <label class="control-label" for="region">Region</label>
                                                            <div class="controls ">
                                                                <div class="input-append ">
                                                                    <select class="region_direction_stat span12" name="" id="region_direction_stat">
                                                                        <option value="${sessionScope.personnel.getService().getSite().getRegion().getIdRegion()}" selected>${sessionScope.personnel.getService().getSite().getRegion().getNomRegion()}</option>

                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>



                                                        <div class="control-group span2 hidden flex-gt-xs-15 flex-xs">
                                                            <label class="control-label" for="service">Service</label>
                                                            <div class="controls ">
                                                                <select name="service" id="" class="span12 mon_service_stat form-control input-lg "  >

                                                                    <option value="${sessionScope.personnel.getService().getIdService()}" selected>${sessionScope.personnel.getService().getNomService()}</option>



                                                                </select>

                                                            </div>
                                                        </div>


                                                    </div>
                                                </form>
                                            </div>
                                            <div id='rapport_personnel' class="tab-pane fade">
                                                <form>
                                                    <div class="row-fluid layout-gt-xs-row layout-xs-column">
                                                        <div class="span2 flex-gt-xs-5 flex-xs">
                                                            <label class="control-label" for="">Annee</label>
                                                            <div class="controls ">
                                                                <select class="all-date span12 " name="" id="">

                                                                </select>

                                                            </div>
                                                        </div>
                                                        <c:if test="${sessionScope.login.getNiveauAcces() != 4}">
                                                            <div class="span1 flex-gt-xs-5 flex-xs">
                                                                <button type="submit"  class="btn btn-primary service-user" style="margin-top: 25px">
                                                                    <span class="icon icon-search "></span>
                                                                </button>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${sessionScope.login.getNiveauAcces() == 4}">
                                                            <div class="span2 flex-gt-xs-15 flex-xs">
                                                                <label class="control-label" for="region">Region</label>
                                                                <div class="controls ">
                                                                    
                                                                        <select class="region_direction_stat span12" name="" id="region_direction_stat">
                                                                            <option value="${sessionScope.personnel.getService().getSite().getRegion().getIdRegion()}" selected>${sessionScope.personnel.getService().getSite().getRegion().getNomRegion()}</option>

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
                                                        </c:if>
                                                        <div class="flex-gt-xs-15 flex-xs control-group span2 <c:if test="${sessionScope.login.getNiveauAcces() != 4}">hidden</c:if>">
                                                                <label class="control-label" for="service">Service</label>
                                                                <div class="controls ">
                                                                    <select name="" id="" class="span12 service_stat_perso form-control input-lg "  >


                                                                </select>

                                                            </div>
                                                        </div>





                                                        <div class="flex-gt-xs-15 flex-xs control-group span2 <c:if test="${sessionScope.login.getNiveauAcces() != 4}">hidden</c:if>" >
                                                                <label class="control-label" for="stat-service">personnel</label>
                                                                <div class="controls ">
                                                                    <select name="personnel" id="stat-personnel" class="span12 <c:if test="${sessionScope.login.getNiveauAcces() == 4}">personnels</c:if> form-control input-lg "  >
                                                                    <c:if test="${sessionScope.login.getNiveauAcces() != 4}">
                                                                        <option value="${sessionScope.personnel.getIdPersonnel()}" selected>${sessionScope.personnel.getNomPrenom()}</option>

                                                                    </c:if>
                                                                </select>

                                                            </div>
                                                        </div>


                                                        <div class="span1  hidden flex-gt-xs-15 flex-xs">
                                                            <label class="control-label" for="">categorie</label>
                                                            <div class="controls ">
                                                                <div class="input-append ">
                                                                    <input type="text" class="disabled hidden span12" name="categorie" value="${cat.getTypeCategorie()}"/>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </form>
                                            </div>
                                            <div id='rapport_societe' class="tab-pane fade in ">
                                                <form>
                                                    <div class="row-fluid layout-gt-xs-row layout-xs-column">


                                                        <div class="span2 flex-gt-xs-5 flex-xs">
                                                            <label class="control-label" for="">Annee</label>
                                                            <div class="controls ">
                                                                <select class="all-date span12" name="" id="">

                                                                </select>

                                                            </div>
                                                        </div>
                                                        <div class="control-group span2 flex-gt-xs-5 flex-xs">

                                                            <div class="controls ">
                                                                <a class="btn btn-primary" style="margin-top: 25px" id="stat-societe"><span class="icon icon-search"></span></a>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </form>
                                            </div>
                                            <c:if test="${sessionScope.login.getNiveauAcces() == 4}">
                                                <div id='rapport_region' class="tab-pane fade in active">
                                                    <form>
                                                        <div class="row-fluid layout-gt-xs-row layout-xs-column">

                                                            <div class="span2 flex-gt-xs-5 flex-xs">
                                                                <label class="control-label" for="">Annee</label>
                                                                <div class="controls ">
                                                                    <select class="all-date span12" name="" id="">

                                                                    </select>

                                                                </div>
                                                            </div>

                                                            <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                                <label class="control-label">Region</label>
                                                                <div class="controls ">
                                                                    <select name="region" id="stat-region" class="span12">
                                                                        <option value="${sessionScope.personnel.getService().getSite().getRegion().getIdRegion()}" selected>${sessionScope.personnel.getService().getSite().getRegion().getNomRegion()}</option>

                                                                    </select>

                                                                </div>
                                                            </div>



                                                        </div>
                                                    </form>
                                                </div>

                                            </c:if>
                                            <div id='rapport_direction' class="tab-pane fade in ">
                                                <form>
                                                    <div class="row-fluid layout-gt-xs-row layout-xs-column">
                                                        <div class="span2 flex-gt-xs-5 flex-xs">
                                                            <label class="control-label span12" for="">Annee</label>
                                                            <div class="controls ">
                                                                <select class="all-date" name="" id="">

                                                                </select>

                                                            </div>
                                                        </div>
                                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                            <label class="control-label">Region</label>
                                                            <div class="controls ">
                                                                <select name="region" id="" class="region span12">
                                                                    <option value="${sessionScope.personnel.getService().getSite().getRegion().getIdRegion()}" selected>${sessionScope.personnel.getService().getSite().getRegion().getNomRegion()}</option>

                                                                </select>

                                                            </div>
                                                        </div>
                                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                            <label for="stat-direction" class="control-label">Direction</label>
                                                            <div class="controls ">
                                                                <select name="region" id="stat-direction" class="input-lg direction span12" >


                                                                </select>

                                                            </div>
                                                        </div>




                                                    </div>
                                                </form>
                                            </div>


                                            <div id='rapport_site' class="tab-pane fade in ">
                                                <form>
                                                    <div class="row-fluid layout-gt-xs-row layout-xs-column">
                                                        <div class="span2 flex-gt-xs-5 flex-xs">
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
                                                                    <option value="${sessionScope.personnel.getService().getSite().getRegion().getIdRegion()}" selected>${sessionScope.personnel.getService().getSite().getRegion().getNomRegion()}</option>

                                                                </select>

                                                            </div>
                                                        </div>

                                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                            <label for="stat-site" class="control-label">Site</label>
                                                            <div class="controls ">
                                                                <select name="region" id="stat-site" class="input-lg site_service span12" >


                                                                </select>

                                                            </div>
                                                        </div>



                                                    </div>
                                                </form>
                                            </div>


                                            <div id='rapport_service' class="tab-pane fade in <c:if test="${sessionScope.login.getNiveauAcces() != 4}"> active </c:if>">
                                                    <form>
                                                        <div class="row-fluid layout-gt-xs-row layout-xs-column">
                                                            <div class="span2 flex-gt-xs-5 flex-xs">
                                                                <label class="control-label" for="">Annee</label>
                                                                <div class="controls ">
                                                                    <select class="all-date span12" name="" id="">

                                                                    </select>

                                                                </div>
                                                            </div>
                                                        <c:if test="${sessionScope.login.getNiveauAcces() == 4}">
                                                            <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                                <label class="control-label">Region</label>
                                                                <div class="controls ">
                                                                    <select name="region" id="" class="region_direction_stat span12">
                                                                        <option value="${sessionScope.personnel.getService().getSite().getRegion().getIdRegion()}" selected>${sessionScope.personnel.getService().getSite().getRegion().getNomRegion()}</option>

                                                                    </select>

                                                                </div>
                                                            </div>

                                                            <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                                <label for="stat-site" class="control-label">Direction</label>
                                                                <div class="controls ">
                                                                    <select name="region" id="" class="input-lg direction_service_stat span12" >


                                                                    </select>

                                                                </div>
                                                            </div>
                                                        </c:if>
                                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                            <label class="control-label" for="stat-service">Service</label>
                                                            <div class="controls ">
                                                                <select name="direction" id="stat-service" class="span12 form-control input-lg service_stat"  >
                                                                    <c:if test="${sessionScope.login.getNiveauAcces() != 4}">
                                                                        <option value="${sessionScope.personnel.getService().getIdService()}" selected>${sessionScope.personnel.getService().getNomService()}</option>

                                                                    </c:if>
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



                                            <div class="row-fluid compare-service-users">


                                            </div>


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


