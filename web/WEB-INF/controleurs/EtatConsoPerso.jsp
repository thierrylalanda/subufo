<%-- 
    Document   : EtatMS
    Created on : 29 janv. 2017, 22:17:22
    Author     : messi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="widget">
    <div class="widget-title">
        <h4><i class="icon-reorder"></i>Vos etats de consommations : ${sessionScope.personnel.getNomPrenom()}</h4>
        <span class="tools">
            <a href="javascript:;" class="icon-chevron-down"></a>
        </span>
    </div>
    <div class="widget-body">
        <div class="bs-docs-example">
            <div class="row-fluid ">
                <div class="space12 ">

                    <form method="post" action="Commande_All_Client?vue=Vos Etats De Consommations&niveau=4&idperso=${sessionScope.personnel.getIdPersonnel()}&action=etatperiodeperso" class="form-inline">
                        <div class="row-fluid  layout-gt-xs-row layout-xs-column">
                            <div class=" span2 flex-gt-xs-15 flex-xs">
                                <!-- Les champs texte avec le code "onclick" déclenchant le script -->
                                <label for="date1 "class="form-control-label " >DU</label>

                                <input type="text" style="" class="form-control datepicker span12" name="date1" required>


                            </div>
                            <div class=" span2 flex-gt-xs-15 flex-xs">
                                <label for="date2 "class="form-control-label " >AU</label>

                                <input type="text" style="" class="form-control datepicker span12" name="date2" required>


                            </div>
                            <div class=" span1 flex-gt-xs-5 flex-xs">

                                <button  type="submit" style="margin-top: 25px"class="btn btn-primary  btn-primary pull-left " id="sendcc" ><i class="icon-search"></i></button>

                            </div>
                        </div>
                    </form>
                    <form class="form-inline hide"method="post" action="Commande_All_Client?vue=Vos Etats De Consommations&action=tousa&magasin=controlleur">
                        <div class="form-group ">
                            <button type="submit" class="btn btn-warning  btn-success" id="sendcc" >Etat Annuel</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class=" space12 "></div>

        </div>
        <div class="space20 "></div>
         <div class="space20 "></div>
          <div class="space20 "></div>
        <table class="table table-hover table-responsive table-bordered simple_print"cellspacing="0" width="100%">
            <thead class="text-primary">
                <tr>
                    <th>DEMANDEUR</th>
                    <th>DATE</th>
                    <th>CATEGORIE</th>
                    <th>CODE</th>
                    <th>DESIGNATION</th>
                    <th>QUANTITE</th>
                    <th>PRIX UNITAIRE</th>
                    <th>PRIX TOTAL</th>
                    <th>APPARIEL</th>

                </tr>
            </thead>
            <tbody id="tbody">
                <c:set var="t" value="${0}"/>
                <c:forEach items="${operation}" var="com">
                    <tr class="produits">
                        <td class="categories"><c:out value="${com.getPersonnel().getNomPrenom()}"/></td>
                        <td class="date"><f:formatDate value="${com.getDate()}" type="Date" dateStyle="MEDIUM" /></td>
                        <td class="categories"><c:out value="${com.getCategorie()}"/></td>
                        <td class="code"><c:out value="${com.getCodeProduit()}"/></td>
                        <td class="pt"><c:out value="${com.getDesignation()}"/></td>
                        <td class="qte"><f:formatNumber value="${com.getQuantite()}"type="NUMBER"/></td>
                        <td class="pu"><f:formatNumber value="${com.getPrix()}"type="CURRENCY"currencySymbol="FCFA"/></td>
                        <td class="pt"><f:formatNumber value="${com.getPrixTotal()}" type="CURRENCY" currencySymbol="FCFA"/></td>
                        <td class="pt"><c:out value="${com.getAppariel()}"/></td>
                        <c:set var="t" value="${t+com.getPrixTotal()}"/>
                    </tr>
                </c:forEach>

            </tbody>
            <tfoot>
                <tr  class="text-capitalize text-center text-success text-primary text-info">
                    <td colspan="9">
                        La Somme Total est de:<f:formatNumber value="${t}" type="CURRENCY" currencySymbol="FCFA"/>
                    </td>

                </tr>
            </tfoot>              
        </table>
    </div>
</div>

