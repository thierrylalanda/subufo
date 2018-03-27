
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h3 class="page-title">
    Rapport Periodique des Categories d'Articles
</h3>
<ul class="breadcrumb">
    <li>
        <a href="StatistiqueMP?vue=Accueil&action=autre"><i class="icon-home"></i> Home</a>
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

<!-- BEGIN INLINE TABS PORTLET-->
<div class="widget">
    <div class="widget-title">
        <h4><i class="icon-reorder"></i> Rapport du magasin</h4>
        <span class="tools">
            <a href="javascript:;" class="icon-chevron-down"></a>
            <a href="javascript:;" class="icon-remove"></a>
        </span>
    </div>
    <div class="widget-body">




        <form method="post" action="parametre?action=getRepporting&vue=rapport&niveau=3" class="non-regionp hidden-phone" id_magasinP="${categories.get(0).getMagasinPrincipal().getIdMagasin()}">   
            <div class="row-fluid layout-gt-xs-row layout-xs-column">
                <div class="control-group span2 flex-gt-xs-15 flex-xs">
                    <label class="control-label">Categorie</label>
                    <div class="controls ">
                        <select name="categorie" id="" class="cat_select span12" multiple="multiple">
                            <c:forEach items="${categories}" var="cate">
                                <option value="${cate.getIdCategorie()}">${cate.getNomCategorie()}</option>
                            </c:forEach>
                        </select>	

                    </div>
                </div>

                <div class="span1 flex-gt-xs-10 flex-xs">
                    <label class="control-label">Détails</label>
                    <div class="controls ">
                        <input type="radio" class="span12" name="choix" value="tous" />

                    </div>

                </div>
                <div class="span1 flex-gt-xs-10 flex-xs">

                    <label class="control-label">Magasin</label>
                    <div class="controls ">
                        <input type="radio" name="choix" class="span12" value="non" checked/>

                    </div>
                </div>
                <div class="input-append input-prepend  span3 flex-gt-xs-15 flex-xs">
                    <label class="control-label">Interval</label>
                    <input class="reservation span12" name="interval" id="" placeholder="interval de temps" type="text">

                </div>
                <div class="span1 flex-gt-xs-5 flex-xs">
                    <button class="btn btn-success search-catego" style="margin-top: 25px" name="parametre?action=ReportingAllMSDansMP&id_magasinP=${categories.get(0).getMagasinPrincipal().getIdMagasin()}"type="submit"><i class="icon-search"></i> </button>
                </div>
            </div>


        </form>




        <c:if test="${not empty statreporting}">
            <div class="table-rapport">
                <table titre="raport sur les ${cat.getNomCategorie()}" class="table table-hover table-responsive table-bordered table-rapport simple_print " categori="${cat.getIdCategorie()}"cellspacing="0" width="100%">
                    <thead >
                        <tr>
                            <th>Articles</th>
                            <th>QUANTITE</th>
                            <th>Prix Unitaire</th>
                            <th>Prix Total</th>
                        </tr>
                    </thead>

                    <tbody class="stat-perso">
                        <c:set var="t" value="${0}"/>
                        <c:set var="qt" value="${0}"/>
                        <c:forEach items="${reporting}" var="rep">
                            <tr>
                                <td>${rep.getArticles()}</td>
                                <td>${rep.getQuantite()}</td>
                                <td><f:formatNumber value="${rep.getPrix()}" type="CURRENCY" currencySymbol="FCFA"/></td>
                                <td><f:formatNumber value="${rep.getPrixtotal()}" type="CURRENCY" currencySymbol="FCFA"/></td>
                                <c:set var="t" value="${t + rep.getPrixtotal()}"/>
                                <c:set var="qt" value="${qt + rep.getQuantite()}"/>
                            </tr>
                        </c:forEach>

                    </tbody>
                    <tfoot style="color: #2fade7">
                        <tr  class="text-capitalize text-center text-success text-primary text-info">
                            <td colspan="4">
                                La Quantite Total D'articles est de: <f:formatNumber value="${qt}"/> Pour un Montant Total De: <f:formatNumber value="${t}" type="CURRENCY" currencySymbol="FCFA"/>
                            </td>

                        </tr>
                    </tfoot>
                </table>
            </div>
        </c:if>
        <br>
        <a class="btn btn-inverse   hidden-print print-pdf" style="margin-left: 400px;margin-bottom: 10px;border-radius: 5px">Imprimer <i class="icon-print icon-big"></i></a>
        <br><div class="row-fluid all-table portlet-scroll-1">


        </div>
    </div>
</div>