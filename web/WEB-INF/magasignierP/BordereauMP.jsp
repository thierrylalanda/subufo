<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="row-fluid">
    <div class="span12">
        <!-- BEGIN INLINE TABS PORTLET-->
        <div class="widget">
            <div class="widget-title">
                <h4><i class="icon-reorder"></i> Espace Magasin: ${magasin.getNomMagasin()}</h4>
                <span class="tools">
                    <a href="javascript:;" class="icon-chevron-down"></a>
                </span>
            </div>
            <div class="widget-body">
                <div class="bs-docs-example">
                    <ul class="nav nav-tabs" id="myTab">
                        <li class="active"><a data-toggle="tab" href="#saveBordereau">Réception Commande Fournisseur</a></li>
                    </ul>

                    <div class="tab-content" id="myTabContent">
                        <div id="saveBordereau" class="tab-pane fade in active">
                            <div class="space15"></div>
                            <div class="row-fluid">
                                <form method="post" action="bordereau?vue=${vue}&action=receptionCommandeFournisseur" class="form-inline">
                                    <div class="row-fluid layout-gt-xs-row layout-xs-column">
                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                            <label for="select" class="control-label">Fournisseur </label>
                                            <div class="controls ">
                                                <select id="select" class="form-control span12" name="fournisseur" required >
                                                    <c:forEach items="${founisseurs}" var="c">
                                                        <option value="${c.getIdFounisseur()}" >${c.getNomFounisseur()}</option>
                                                    </c:forEach>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="span1 flex-gt-xs-5 flex-xs">
                                            <button type="submit" style="margin-top: 25px"class="btn btn-success" >OK</button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <hr>
                            <table class="table table-bordered table-hover table-striped display simple_print"cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>categorie</th>
                                        <th>code</th>
                                        <th>designation</th>
                                        <th>quantite</th>
                                        <th class="hidden">QUANTITE</th>
                                        <th>total</th>
                                        <th>date </th>
                                        <th>derniere livraison</th>
                                        <th>fournisseur</th>
                                        <th>livraison</th>
                                        <th>option</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="t" value="${0}"/>
                                    <c:forEach items="${listCommande}" var="lis">
                                        <tr class="produits" name="${lis.getIdCommande()}">

                                            <td class="categories"><c:out value="${lis.getTypeProduit()}"/></td>
                                            <td class="code"><c:out value="${lis.getCodeProduit()}"/></td>
                                            <td class="designation"><c:out value="${lis.getDesignation()}"/></td>
                                            <td class="qteu"><f:formatNumber value="${lis.getQuantiteCommande()}" type="NUMBER"/></td>
                                            <td class="qteucF hidden"><input class="newvalCMPF" type='number' id=''  /></td>
                                            <td class=""><f:formatNumber value="${lis.getPrixTotal()}" type="CURRENCY" currencySymbol="FCFA"/></td>
                                            <td><f:formatDate value="${lis.getDate()}" type="Date" dateStyle="MEDIUM"/></td>
                                            <td class="pt"><f:formatDate value="${lis.getDerniereLivraison()}"  type="Date" dateStyle="MEDIUM" /></td>
                                            <td class="founisseur"><c:out value="${lis.getIdSA().getNomFounisseur()}"/></td>
                                            <td class="founisseur"><c:out value="${lis.getLivraison()}"/></td>
                                            <td class="founisseur">
                                                <a href="javascript:;" class="qteuF btn btn-primary">

                                                    <span class="icon"> <i class="icon-edit"></i> </span>
                                                </a>
                                                <a href="javascript:;" class="saveF btn btn-success hidden">
                                                    <span class="icon"> <i class="icon-save"></i> </span>

                                                </a>
                                            </td>
                                            <c:set var="tt" value="${lis.getPrixUnitaire() * lis.getQuantiteCommande()}"/>
                                            <c:set var="t" value="${t + tt}"/> </tr>
                                        </c:forEach>

                                </tbody>
                            </table>
                            <p  style="text-align: center">Total: <f:formatNumber value="${t}"type="CURRENCY" currencySymbol="FCFA"/></p>
                            <div class="space20"></div>
                            <hr>
                            <div class="row-fluid">

                                <a href="bordereau?vue=${vue}&action=receptionCompletCommandeFournisseur"data-toggle="tooltip" title='Tous Receptionnés' >  <button type="submit" class="btn btn-success"><i class="icon-save"></i>Tous Receptionner</button></a>

                            </div>
                            <c:if test="${not empty message}">
                                <div class="alert alert-success  text-center error_message hidden">
                                    <strong>${message.getMessage()}</strong>
                                </div><br><br>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END INLINE TABS PORTLET-->
    </div>
</div>
