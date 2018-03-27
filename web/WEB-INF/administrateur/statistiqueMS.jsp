
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<div class="row-fluid">
    <div class="span12">
        <!-- BEGIN CHART PORTLET-->
        <div class="widget">
            <div class="widget-title">
                <h4><i class="icon-reorder"> </i> Statistiques Entrer/Sortis des produits du: ${magasin.getNomMagasin()}</h4>
                <span class="tools">
                    <a href="javascript:;" class="icon-chevron-down"></a>

                </span>
            </div>
            <div class="widget-body">
                <form>
                    <div class="row-fluid">
                        <div class="span1">
                            <label class="control-label" for="">Annee</label>
                            <div class="controls ">
                                <select class="all-date span12" name="" id="">

                                </select>

                            </div>

                        </div>
                        <div class="span1">
                            <button style="margin-top: 25px"class="btn btn-success search-categom"><i class="icon-search"></i> </button>

                        </div>
                    </div>
                </form>

                <div class="row-fluid legende">

                </div>
                <div class="space20"></div>
                <div class="space20"></div>
                <c:if test="${not empty sessionScope.lien28  or sessionScope.GeneralAdministrateur == 'OK'}">
                    <h2 class="text-center">Statistique D'Entrer Des Produits Pour L'annee <strong class="choix-annee"></strong></h2>
                    <div class="text-center">
                        <div class="divlineMS">
                            <canvas id="lineMS" height="300" width="1100"></canvas>
                        </div>
                    </div>
                    <hr>
                </c:if>
                <div class="space20"></div>
                <div class="space20"></div>
                <c:if test="${not empty sessionScope.lien29  or sessionScope.GeneralAdministrateur == 'OK'}">
                    <h2 class="text-center">Statistique De Sortir Des Produits Pour L'annee <strong class="choix-annee"></strong></h2>

                    <div id="barchar" class="row-fluid"></div>
                    <hr>
                </c:if>
            </div>
        </div>
        <!-- END CHART PORTLET-->
    </div>
</div>