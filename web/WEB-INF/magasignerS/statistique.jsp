
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="space20"></div>
<h4 class="page-title">
    Tableau de bord
</h4>
<ul class="breadcrumb">
    <li>
        <a href="RedirectionVue?vue=Accueil"><i class="icon-home"></i> Home</a>
        <span class="divider">/</span>
    </li>
    <li>
        <a href="#">consommation et budget</a>

    </li>

   
</ul>

<div class="row-fluid ">
    <div class="container">
        <!-- BEGIN CHART PORTLET-->
        <div class="widget">
            <div class="widget-title">
                <h4><i class="icon-reorder"> </i> evolution  consommations</h4>
                <span class="tools">
                    <a href="javascript:;" class="icon-chevron-down"></a>
                </span>
            </div>
            <div class="widget-body">
                <div class="bs-docs-example">
                    <ul class="nav nav-tabs" id="myTab">

                        <li class="active"><a data-toggle="tab" href="#consommation">consommation Magasin</a></li>
                        <li class=""><a data-toggle="tab" href="#tableau_bord">consommation service</a></li>

                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div id="tableau_bord" class="row-fluid tab-pane fade">
                            <c:import url="/WEB-INF/common/rapport.jsp"/>
                        </div>

                        <div id="consommation" class="row-fluid tab-pane fade in active">
                            <form>
                                <div class="row-fluid layout-gt-xs-row layout-xs-column">
                                    <div class="span1 flex-gt-xs-5 flex-xs">
                                        <label class="control-label" for="">Annee</label>
                                        <div class="controls ">
                                            <select class="all-date span12" name="" id="">

                                            </select>

                                        </div>

                                    </div>
                                    <div class="span1 flex-gt-xs-5 flex-xs">
                                        <button style="margin-top: 25px"class="btn btn-success search-categom"><i class="icon-search"></i> </button>

                                    </div>
                                </div>
                            </form>
                            <div class="row-fluid legende">

                            </div>
                            <div class="space20"></div>
                            <div class="space20"></div>
                            <c:if test="${not empty sessionScope.StatistiqueEntrerMS }">
                                <h2 class="text-center">Statistique sortir des consommables pour l'annee <strong class="choix-annee"></strong></h2>

                                <div class="text-center">
                                    <div class="divlineMS">
                                        <canvas id="line" height="300" width="1100"></canvas>
                                    </div>
                                </div>
                                <hr>
                            </c:if>
                            <div class="space20"></div>
                            <div class="space20"></div>
                            <c:if test="${not empty sessionScope.StatistiqueSortiMS}">
                                <h2 class="text-center">Statistique d'entrer des consommables pour l'annee <strong class="choix-annee"></strong></h2>

                                <div id="barchar" class="row-fluid"></div>
                                <hr>
                            </c:if>
                        </div>


                    </div>
                </div>


            </div>
        </div>
        <!-- END CHART PORTLET-->
    </div>
</div>