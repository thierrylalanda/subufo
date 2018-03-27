<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="row-fluid">    
    <form method="post" action="commandeMS?vue=editeMagasinS&action=create&id_magasin=${magasin.getIdMagasin()}&niveau=5" class="form-horizontal">
        <div class="row-fluid">
            <div class=" span2 ">
                <label for="selectx" class="form-control-label">Magasin</label>
                <select  class="form-control"name="fournisseur" required>
                    <option value="${magasinMP.getIdMagasin()}" >${magasinMP.getNomMagasin()}</option>
                    <c:forEach items="${fournisseur}" var="cc">  
                        <option  value="${cc.getIdMagasin()}" >${cc.getNomMagasin()}</option>  
                    </c:forEach>

                </select>               
            </div>

            <div class=" span2 ">
                <label for="selectx" class="form-control-label">Categorie </label>
                <select id="categorie" class=" form-control"name="categorie" required >
                    <c:forEach items="${magasin.getCategorieproduitMSList()}" var="cc">  
                        <option >${cc.getNomCategorie()}</option>  
                    </c:forEach>

                </select>
            </div>
            <div class=" span2 ">
                <label for="selectx" class="form-control-label">Designation </label>
                <input type="text"   class=" form-control tag  span12"style="width: 150px" required id="designation" placeholder="Designation" name="designation"/>             
            </div>
            <div class=" span2 ">
                <label   for="code "  class="form-control-label">Code</label> 
                <input type="text" id="code" class=" form-control  span12" style="width: 150px"placeholder="Code Produit" required name="code" />
            </div>
            <div class=" span2 ">
                <label for="quantite "  class="form-control-label">Quantite</label> 
                <input type="number" id="quantite" class=" form-control span12 " placeholder="Quantite" required name="quantite" />

            </div>
            <div class=" span2 ">
                <button type="submit" style="margin-top: 25px"class="btn btn-success  btn-primary pull-righ " ><i class="icon-shopping-cart"></i> ajouter</button>
            </div>

        </div>
    </form>
</div>
<div class="space20"></div>

<div class="row-fluid">    
    <table class="table table-hover table-responsive table-bordered simple_print"cellspacing="0" width="100%">
        <thead class="text-primary">
            <tr>
                <th>CATEGORIE</th>
                <th>CODE</th>
                <th>DESIGNATION</th>
                <th>QUANTITE EN STOCK</th>
                <th>QUANTITE COMMANDER</th>
                <th class="hidden">QUANTITE</th>
                <th>COMMANDER LE</th>
                <th>DERNIERE LIVRAISON</th>


            </tr>
        </thead> 
        <tbody>
            <c:forEach items="${listt}" var="liss">  
                <tr class="produits">

                    <td class="categories"><c:out value="${liss.getTypeProduit()}"/></td>
                    <td class="code"><c:out value="${liss.getCodeProduit()}"/></td>
                    <td class="designation"><c:out value="${liss.getDesignation()}"/></td>
                    <td class="qte"><f:formatNumber value="${liss.getQuantiteEnStock()}" type="NUMBER"/></td>
                    <td class="qteu"><f:formatNumber value="${liss.getQuantiteCommande()}" type="NUMBER"/></td>
                    <td class="qteuc hidden"><input class="newvalcms" type='text' id='qteu'  /></td>                       
                    <td><f:formatDate value="${liss.getDate()}" type="Date" dateStyle="MEDIUM"/></td>                           
                    <td class="pt"><f:formatDate value="${liss.getDerniereLivraison()}"  type="Date" dateStyle="MEDIUM" /></td>

                </tr>

            </c:forEach>

        </tbody>
    </table> 

</div>
<div class="space20"></div>

<div class="row-fluid">
    <div class="form-actions">
        <a href="commandeMS?action=save&vue=editeMagasinS&id_magasin=${magasin.getIdMagasin()}&niveau=5 "data-toggle="tooltip" title='Cliquer ici pour Envoyer cette commande' >  <button type="submit" class="btn btn-success"><i class="icon-save"></i> Enregistrer</button></a>
        <button type="button" class="btn btn-danger "value="5" name="${magasin.getIdMagasin()}"  id="deleteMS"><i class="icon-remove"></i>supprimer</button>
    </div>

</div>
<c:if test="${OK=='OK'}">
    <div class="alert alert-success  span12 text-center error_message hidden">
        <strong>${message.getMessage()}</strong>
    </div>
</c:if>