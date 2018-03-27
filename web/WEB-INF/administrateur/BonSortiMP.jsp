
<%-- 
    Document   : EtatPeriodiqueMP
    Created on : 19 févr. 2017, 14:18:13
    Author     : messi
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="row-fluid">



    <form method="post" action="ListeProduitMP?vue=editeMagP&action=date&id_magasinP=${magasin.getIdMagasin()}&niveau=5" class="">
        <div class="row-fluid">
            <div class="span2">
                <label for="date1 "class="control-label " >DU</label>
                <input class="datepicker form-control span12" style="width: 150px" required name="date1" type="text"/> 
            </div>
            <div class="span2">
                <label for="date2 "class="control-label " >AU</label>
                <input class="datepicker form-control span12" style="width: 150px" name="date2"  required type="text"/>
            </div>
            <div class="span2">
                <button type="submit" style="margin-top: 25px" class="btn btn-success" id="sendcc" >Search</button>
            </div>
        </div>
    </form>

    <a href="ListeProduitMP?vue=editeMagP&action=redirect&id_magasinP=${magasin.getIdMagasin()}&niveau=5" class="hidden" > <button class="btn btn-warning " >Tous!</button></a>


</div>
<div class="row-fluid">

    <form method="post" action="ListeProduitMP?vue=editeMagP&action=One&id_magasinP=${magasin.getIdMagasin()}&niveau=5" class="form-inline" id="commandeClit">
        <div class="row-fluid">
            <div class="span2">
                <label for="date1 "class="control-label " >Magasin secondaire</label>
                <select   <c:if test="${empty MS}">disabled</c:if>  class="form-control" name="magasinS" required>
                    <c:forEach items="${MS}" var="c"> 
                        <option ><c:out value="${c}"/></option>  
                    </c:forEach>
                </select>
            </div>
            <div class="span2">
                <button style="margin-top: 25px" type="submit" <c:if test="${empty MS}">disabled</c:if>  class="btn   btn-primary " id="sendcc" ><i class="icon-save"></i></button>
                </div>
            </div>
    </div>
</form>

<table class="table table-hover table-responsive table-bordered simple_print" cellspacing="0" width="100%">
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
        </tr>
    </thead>
    <tbody id="tbody" >
    <c:set var="to" value="${0}" scope="page"></c:set>
    <c:forEach items="${operations}" var="com">
        <tr class="produits">
            <td class="categories"><c:out value="${com.getMs().getNomMagasin()}"/></td>
            <td class="date"><f:formatDate value="${com.getDate()}" type="Date"dateStyle="MEDIUM"/></td>
            <td class="categories"><c:out value="${com.getTypeProduit()}"/></td>
            <td class="code"><c:out value="${com.getCodeProduit()}"/></td>
            <td class="pt"><c:out value="${com.getDesignation()}"/></td>
            <td class="qte"><f:formatNumber value="${com.getQuantite()}"type="NUMBER"/></td>
            <td class="pu"><f:formatNumber value="${com.getPrixUnitaire()}"type="CURRENCY"/></td>
            <td class="pt"><f:formatNumber value="${com.getPrixTotal()}"  type="CURRENCY" currencySymbol="FCFA"/></td>
            <c:set var="to" value="${to + com.getPrixTotal()}" scope="page"></c:set>
            </tr>
    </c:forEach>

</tbody>
<tfoot class="columns panel-footer">
    <tr  class="text-capitalize text-center text-success text-primary text-info">                        
        <td colspan="8">
            La Somme Total est de :<f:formatNumber value="${to}"  type="CURRENCY" currencySymbol="FCFA"/></td>

        </td>
    </tr>
</tfoot>        
</table>

