

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="widget ">
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
                <li class="<c:if test="${empty transf and empty forme}">active</c:if>"><a data-toggle="tab" href="#home">Tous Les Magasins Principaux De La Region</a></li>
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
                            <c:forEach items="${sessionScope.principals}" var="mags">
                                <tr class="produit">
                                    <td > <c:out value="${mags.getNomMagasin()}"/> </td>
                                    <td class="code"><a href="#"> <c:out value="${mags.getAffectationmagasinPList()[0].getPersonnel().getNomPrenom()}"/></a></td>
                                    <td><c:out value="${mags.getDescription()}"/></td>
                                    <td > <c:out value="${mags.getSite().getNomSite()}"/> </td>
                                    <td > <c:out value="${mags.getSite().getRegion().getNomRegion()}"/> </td>
                                    <td >
                                        <div class="btn-group">

                                            <a title="" href="ListeProduitMP?vue=Historique MP&action=rien&niveau=4&id_magasinP=${mags.getIdMagasin()}" class="btn btn-primary" >  <span class="icon"> <i class="icon-eye-open"></i> </span></a>  

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