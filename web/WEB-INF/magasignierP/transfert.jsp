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
        <h4><i class="icon-reorder"></i> Espace Traitement Commande: ${magasin.getNomMagasin()}</h4>
        <span class="tools">
            <a href="javascript:;" class="icon-chevron-down"></a>
            <a href="javascript:;" class="icon-remove"></a>
        </span>
    </div>
    <div class="widget-body">
        <div class="bs-docs-example">

            <c:if test="${not empty modifier}">
                <div class="row-fluid">
                    <form method="post" action="CommandeRecusMP?vue=Suivi Transfert&action=saveedit" class="form-inline">
                        <div class="row-fluid layout-gt-xs-row layout-xs-column">
                            <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                <label style="" class="" for="code">CODE</label>
                                <div class="controls ">
                                    <input style="" type="text" class=" form-control  span12" id="code" disabled="true" value="${transf.getCodeProduit()}"  name="code" />
                                </div>
                            </div>
                            <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                <label  for="designation" class="">DESIGNATION</label>

                                <div class="controls ">
                                    <input style="" type="text" class=" form-control  span12" disabled="true" value="${transf.getDesignation()}" id="designation" name="designation" />

                                </div>
                            </div>

                            <div class="control-group span2 flex-gt-xs-5 flex-xs">
                                <label style="" for="quantite">QUANTITE</label>

                                <div class="controls ">
                                    <input style="" type="number" class=" form-control  span12"  value="${transf.getQuantite()}" id="quantite" name="quantite" />

                                </div>
                            </div>
                            <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                <label for="raison">Votre Observation :</label>
                                
                                <div class="controls ">
                                   <textarea style="" type="text" id="raison" class="span12 form-control" required="true" name="raison"></textarea>

                                </div>
                            </div>
                            <div class="control-group span2 flex-gt-xs-5 flex-xs">
                                <button type="submit" class="btn btn-success  btn-primary pull-righ " >Envoyer</button>

                            </div>




                            <input type="text" class=" form-control  hidden"id="code"  value="${transf.getIdTransfert()}"  name="id" />

                        </div>
                    </form>
                </div>
            </c:if>
            <div class="space20"></div> 
            <c:if test="${not empty messagelast }">
                <div class="alert alert-info text-center error_message hidden">
                    <strong>${messagelast.getMessage()}</strong>
                </div>
            </c:if>
            <div class="space20"></div> 
            <div class="row-fluid ">  
                <table class="table table-bordered table-hover simple_print"cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th class="hidden">id</th>
                            <th>Magasin</th>
                            <th>CATEGORIE</th>
                            <th>CODE</th>
                            <th>DESIGNATION</th>
                            <th>QUANTITE</th>
                            <th>PRIX TOTAL</th>
                            <th>DATE</th>                  
                            <th>Etat du transfert</th>
                                <c:if test="${empty messagelast}">
                                <th>Raison</th>
                                <th>Options</th>
                                </c:if>
                        </tr>
                    </thead>
                    <tbody id="tbody">
                        <c:forEach items="${transfert}" var="transf">
                            <tr class="produits">
                                <td class="hidden"> <c:out value="${transf.getIdTransfert()}"/></td>
                                <td> <c:out value="${transf.getMs().getNomMagasin()}"/></td>
                                <td> <c:out value="${transf.getTypeProduit()}"/></td>
                                <td class="code"> <c:out value="${transf.getCodeProduit()}"/></td>
                                <td> <c:out value="${transf.getDesignation()}"/></td>
                                <td> <f:formatNumber value="${transf.getQuantite()}" type="NUMBER"/></td>
                                <td> <f:formatNumber value="${transf.getPrixTotal()}" type="CURRENCY" currencySymbol="FCFA" maxFractionDigits="0"/></td>
                                <td> <f:formatDate value="${transf.getDate()}" type="BOTH" dateStyle="MEDIUM" timeStyle="MEDIUM"/></td>                      
                                <td> <c:out value="${transf.getEtat()}"/></td>
                                <c:if test="${empty messagelast}">
                                    <td> <c:out value="${transf.getCommentaireMS()}"/></td>
                                    <td class="categories">
                                        <div class="btn-group">
                                            <a title="" href="CommandeRecusMP?idtransfert=${transf.getIdTransfert()}&action=edittransfert&vue=Suivi Transfert" class="btn btn-primary">  <span class="icon"> <i class="icon-edit"></i> </span></a>  

                                            <a class="btn btn-danger" href="CommandeRecusMP?idtransfert=${transf.getIdTransfert()}&action=deletetransfert&vue=Suivi Transfert" ><span class="icon"> <i class="icon-trash"></i> </span></a>

                                        </div>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table> <br>
                <c:if test="${not empty message}">
                    <div class="alert alert-danger text-center error_message hidden">
                        <strong>${message.getMessage()}</strong>
                    </div>
                </c:if>

            </div>
        </div>
    </div>
</div>
