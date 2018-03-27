
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h3 class="page-title">
    ${vue}
</h3>
<ul class="breadcrumb">
    <li>
        <a href="StatistiqueMP?vue=Accueil&action=autre"><i class="icon-home"></i> Home</a>
        <span class="divider">/</span>
    </li>
    <li>
        <a href="#">${vue}</a>

    </li>

 
</ul>


<div class="row-fluid">
    <div class="span12">
        <!-- BEGIN CHART PORTLET-->
        <div class="widget">
            <div class="widget-title">
                <h4><i class="icon-reorder"> </i> Statistiques Entrer/Sortis des consommables</h4>
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
                            <div class="row-fluid">
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
                            </div>
                            <div class="row-fluid legende">

                            </div>
                            <div class="space20"></div>
                            <div class="space20"></div>
                            <c:if test="${not empty sessionScope.StatistiqueEntrerMP }">
                                <h2 class="text-center">Statistique Sortir Des consommables Pour L'annee <strong class="choix-annee"></strong></h2>
                                <div class="text-center">
                                    <div class="divlineMP">
                                        <canvas id="lineMP" height="300" width="1100"></canvas>
                                    </div>
                                </div>
                                <hr>
                            </c:if>
                            <div class="space20"></div>
                            <div class="space20"></div>
                            <c:if test="${not empty sessionScope.StatistiqueSortiMP }">
                                <h2 class="text-center">Statistique D'Entrer Des consommables Pour L'annee <strong class="choix-annee"></strong></h2>

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