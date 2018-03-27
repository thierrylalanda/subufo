<%--
    Document   : BonEntre
    Created on : 22 nov. 2016, 15:13:03
    Author     : messi
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="widget">
    <div class="widget-title">
        <h4><i class="icon-reorder"></i> Transferts Recus</h4>
        <span class="tools">
            <a href="javascript:;" class="icon-chevron-down"></a>
        </span>
    </div>
    <div class="widget-body">
        <div class="bs-docs-example">
            <c:if test="${not empty modifier}">
                <form method="post" action="transfert?vue=${vue}&action=refuser" class="form-inline">
                    <div class="row-fluid layout-gt-xs-row layout-xs-column">
                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                            <label for="code" class="control-label">Categorie</label>
                            <div class="controls ">
                                <input type="text" class=" form-control  span12"id="code" disabled="true" value="${transf.getTypeProduit()}"  name="code" />
                            </div>
                        </div>
                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                            <label for="code" class="control-label">Code</label>
                            <div class="controls ">
                                <input type="text" class=" form-control  span12"id="code" disabled="true" value="${transf.getCodeProduit()}"  name="code" />
                            </div>
                        </div>
                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                            <label for="designation" class="control-label">Designation</label>
                            <div class="controls ">
                                <input type="text" class=" form-control  span12" disabled="true" value="${transf.getDesignation()}" id="designation" name="designation" />
                            </div>
                        </div>
                        <div class="control-group span2 flex-gt-xs-5 flex-xs">
                            <label for="quantite" class="control-label">Quantite</label>
                            <div class="controls ">
                                <input type="text" class=" form-control span12 " disabled="true" value="${transf.getQuantite()}" id="quantite" name="quantite" />
                            </div>
                        </div>
                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                            <label for="textarea" class="control-label">Votre Raison</label>
                            <div class="controls ">
                                <textarea class="  form-control " required="true" name="raison" ></textarea>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success flex-gt-xs-5 flex-xs btn-lg btn-large btn-primary"style="" >Envoyer</button>
                        <input type="text" class=" form-control input-sm input-mini hidden" value="${transf.getIdTransfert()}"  name="id" />
                        <div class="space20"></div>
                    </div>
                </form>
            </c:if>
            <div class="row-fluid ">
                <table class="table tabl table-hover table-responsive table-bordered simple_print" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>CATEGORIE</th>
                            <th>CODE</th>
                            <th>DESIGNATION</th>
                            <th>QUANTITE</th>
                            <th>PRIX UNITAIRE</th>
                            <th>PRIX TOTAL</th>
                            <th>DATE LIVRAISON</th>
                            <th>Visa Fournisseur</th>
                            <th>Observation</th>
                            <th>Etat du transfert</th>
                            <th>valider</th>
                        </tr>
                    </thead>
                    <tbody id="tbody">
                        <c:forEach items="${transfert}" var="transf">
                            <tr class="produits">
                                <td> <c:out value="${transf.getTypeProduit()}"/></td>
                                <td class="code"> <c:out value="${transf.getCodeProduit()}"/></td>
                                <td> <c:out value="${transf.getDesignation()}"/></td>
                                <td> <f:formatNumber value="${transf.getQuantite()}" type="NUMBER"/></td>
                                <td> <c:out value="${transf.getPrixUnitaire()}"/></td>
                                <td> <f:formatNumber value="${transf.getPrixTotal()}" type="CURRENCY" currencySymbol="FCFA" maxFractionDigits="0"/></td>
                                <td> <f:formatDate value="${transf.getDate()}" type="BOTH" dateStyle="MEDIUM" timeStyle="MEDIUM"/></td>
                                <td> <c:out value="${transf.getVisaMP()}"/></td>
                                <td> <c:out value="${transf.getCommentaireMP()}"/></td>
                                <td> <c:out value="${transf.getVisaMS()}"/></td>
                                <td class="raison td">
                                    <div class="btn-group">
                                        <c:set value="${transf.getCodeProduit()}" var="code" ></c:set>
                                        <a title="" class="btn btn-primary" href="transfert?code=${transf.getCodeProduit()}&action=validerOn&vue=${vue}&id=${transf.getIdTransfert()}">  <span class="icon"> <i class="icon-edit"></i> </span></a>

                                        <a class="btn btn-danger"href="transfert?code=${transf.getCodeProduit()}&action=refus&vue=${vue}&id=${transf.getIdTransfert()}" ><span class="icon"> <i class="icon-trash"></i> </span></a>

                                    </div>

                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="space20"></div>
                <div class="row-fluid">
                    <c:if test="${empty message }">
                        <a href="transfert?vue=${vue}&action=valider"data-toggle="tooltip" title='Approuver tous les Transferts' >  <button type="submit" class="btn btn-success btn-lg btn-large"><i class="icon-save"></i> Valider</button></a>
                    </c:if>
                    <c:if test="${not empty message }">
                        <div class="alert alert-danger  text-center error_message hidden">
                            <strong>${message.getMessage()}</strong>
                        </div>
                    </c:if>


                </div>

            </div>

        </div>
    </div>
</div>

