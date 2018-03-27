
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="widget">
    <div class="widget-title">
        <h4><i class="icon-reorder"></i> Magasin Secondaire</h4>
        <span class="tools">
            <a href="javascript:;" class="icon-chevron-down"></a>
            <a href="javascript:;" class="icon-remove"></a>
        </span>
    </div>
    <div class="widget-body">
        <div class="bs-docs-example">
            <ul class="nav nav-tabs" id="myTab">
                <c:if test="${not empty sessionScope.MouvEMSControl or not empty sessionScope.MouvSMSControl or not empty sessionScope.StatistiqueMS or not empty sessionScope.StockMSControl or not empty sessionScope.ConsGeneralMSControl }">
                    <li class="<c:if test="${empty transf and empty forme}">active</c:if>"><a data-toggle="tab" href="#home">Tous Les Magasins Secondaires</a></li>
                    </c:if>
            </ul>
            <div class="tab-content" id="myTabContent">


                <div id="home" class="tab-pane fade in active">

                    <table class="table table-bordered table-hover table-striped simple_print"cellspacing="0" width="100%">
                        <thead>
                            <tr >
                                <th>Nom Magasin</th>
                                <th>Description</th>
                                <th>Magasignier</th>
                                <th>site</th>
                                <th>Region</th>
                                <th>Options</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${sessionScope.secondaires}" var="mags">

                                <tr class="produit">

                                    <td > <c:out value="${mags.getNomMagasin()}"/> </td>
                                    <td><c:out value="${mags.getDescription()}"/></td>
                                    <td class="code"><a href="#"> <c:out value="${mags.getAffectationmagasinSList()[0].getPersonnel().getNomPrenom()}"/></a></td>
                                    <td > <c:out value="${mags.getSite().getNomSite()}"/> </td>
                                    <td > <c:out value="${mags.getSite().getRegion().getNomRegion()}"/> </td>
                                    <td >
                                        <div class="btn-group">

                                            <a title="" href="listeproduit?vue=Historique MS&action=rien&niveau=4&id_magasin=${mags.getIdMagasin()}" class="btn btn-primary" >  <span class="icon"> <i class="icon-eye-open"></i> </span></a>  

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
</div>
