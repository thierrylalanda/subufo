<%--
    Document   : ShowCommandeMS
    Created on : 8 févr. 2017, 13:56:17
    Author     : messi
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="widget">
    <div class="widget-title">
        <h4><i class="icon-reorder"></i> Commandes</h4>
        <span class="tools">
            <a href="javascript:;" class="icon-chevron-down"></a>
        </span>
    </div>
    <div class="widget-body">
        <div class="bs-docs-example">
            <c:if test="${not empty modifier}">
                <div class="row-fluid">
                    <form method="post" action="commandeMS?vue=${vue}&action=saveUpdate" class="form-inline"cellspacing="0" width="100%">
                        <div class="form-group responsive layout-gt-xs-row layout-xs-column">
                            
                                <div class="control-group span4 flex-gt-xs-15 flex-xs">
                                    <label class="control-label"> Magasin Principal!</label>
                                    <div class="controls ">
                                        <select  class="form-control span12"name="fournisseur" disabled>
                                            <option >${cms.getIdMP().getNomMagasin()}</option>

                                        </select>
                                    </div>
                                </div>

                                <div class="control-group span4 flex-gt-xs-15 flex-xs">
                                    <label class="control-label"> Categorie</label>
                                    <div class="controls ">
                                        <select id="selectx" class=" form-control span12"name="categorie" disabled>
                                            <option >${cms.getTypeProduit()}</option>

                                        </select>
                                    </div>
                                </div>
                                <div class="control-group span4 flex-gt-xs-15 flex-xs" >
                                    <label class="control-label"> Designation</label>
                                    <div class="controls" id="">
                                        <input type="text" value="${cms.getDesignation()}"  class=" form-control tag  span12" required id="designation" placeholder="Designation" name="designation" disabled/>

                                    </div>
                                </div>
                            
                            
                                <div class="control-group span4 flex-gt-xs-15 flex-xs">
                                    <label class="control-label"> Code Produit</label>
                                    <div class="controls ">
                                        <input type="text"value="${cms.getCodeProduit()}" id="code" class="span12 form-control  "disabled placeholder="Code Produit"  />

                                    </div>
                                </div>

                                <div class="control-group span4 flex-gt-xs-5 flex-xs">
                                    <label class="control-label"> Quantite</label>
                                    <div class="controls ">
                                        <input type="number" value="${cms.getQuantiteCommande()}" id="quantite" class="span12 form-control  " placeholder="Quantite" required name="quantite" />

                                    </div>
                                </div>

                                <div class="control-group span4 flex-gt-xs-5 flex-xs">
                                    <div class="controls ">
                                        <button type="submit"name="code" value="${cms.getIdCommande()}" class="btn btn-success  btn-primary pull-righ btn-lg btn-large"style="margin-top: 22px" >Modifier</button>
                                    </div>

                                </div>
                            
                        </div>
                    </form>
                </div>
            </c:if>
            <div class="space20"></div>
            <div class="row-fluid responsive ">
                <table class="table table-hover table-responsive table-bordered simple_print"cellspacing="0" width="100%">
                    <thead class="text-primary">
                        <tr>
                            <th>CATEGORIE</th>
                            <th>CODE</th>
                            <th>DESIGNATION</th>
                            <th>DERNIERE LIVRAISON</th>
                            <th>QUANTITE EN STOCK</th>
                            <th>QUANTITE COMMANDER</th>
                            <th>Commander le</th>
                            <th>ETAT</th>
                            <th>MODIFIER</th>


                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listeCommande}" var="lis">
                            <tr class="produits">

                                <td class="categories"><c:out value="${lis.getTypeProduit()}"/></td>
                                <td class="code"><c:out value="${lis.getCodeProduit()}"/></td>
                                <td class="designation"><c:out value="${lis.getDesignation()}"/></td>
                                <td class="pt"><f:formatDate value="${lis.getDerniereLivraison()}"  type="BOTH" dateStyle="MEDIUM" timeStyle="MEDIUM" /></td>
                                <td class="qte"><f:formatNumber value="${lis.getQuantiteEnStock()}" type="NUMBER"/></td>
                                <td class="q"><f:formatNumber value="${lis.getQuantiteCommande()}" type="NUMBER"/></td>
                                <td><f:formatDate value="${lis.getDate()}" type="BOTH" dateStyle="MEDIUM" timeStyle="MEDIUM"/></td>
                                <td class="categories"><c:out value="${lis.getEtatCommande()}"/></td>
                                <td class="categories">
                                    <div class="btn-group">
                                        <a title="" href="commandeMS?action=modifier&vue=${vue}&code=${lis.getIdCommande()}" class="btn btn-primary">  <span class="icon"> <i class="icon-edit"></i> </span></a>

                                        <a class="btn btn-danger" href="commandeMS?action=deleteCMS&vue=${vue}&code=${lis.getIdCommande()}" ><span class="icon"> <i class="icon-trash"></i> </span></a>

                                    </div>
                                </td>
                            </tr>

                        </c:forEach>

                    </tbody>
                </table>
                <div class="space20"></div>
                <c:if test="${OK=='OK'}">
                    <div class="alert alert-success  text-center error_message hidden">
                        <strong>${message.getMessage()}</strong>
                    </div>
                </c:if>
                <c:if test="${empty listeCommande}">
                    <div class="alert alert-danger   text-center error_message hidden">
                        <strong><c:out value="Vous n'avez passer Aucune commande pour l'instant"/></strong>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>
