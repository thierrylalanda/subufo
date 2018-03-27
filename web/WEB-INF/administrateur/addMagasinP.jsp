<%-- 
    Document   : addMagasin
    Created on : 25 avr. 2017, 21:19:35
    Author     : lalanda
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<form class="form-inline" method="POST" role="form" action="admin?vue=createMagP&action=addMagasinP">



    <h3>Renseignement Des Donnees Du Magasin principal <strong>Etape 1</strong></h3>
    <hr>
    <div class="row-fluid layout-gt-xs-row layout-xs-column">
        <div class="control-group form-group span2 flex-gt-xs-15 flex-xs ">
            <label class="control-label">Nom Magasin</label>
            <div class="controls ">

                <input type="text" style=""class="span12 input-lg form-control magasinP" name="nom_magasin" required >
            </div>
        </div>
        <div class="control-group span2 flex-gt-xs-15 flex-xs">
            <label class="control-label">Region</label>
            <div class="controls ">
                <select name="region" id="" required class="form-control input-lg region_site span12" >
                    <option></option>
                    <c:forEach items="${regions}" var="region">
                        <option value="${region.getIdRegion()}" class="region_site">${region.getNomRegion()}</option>

                    </c:forEach>
                </select>	

            </div>
        </div>
        <div class="control-group span2 flex-gt-xs-15 flex-xs">
            <label class="control-label" for="site_service">Site</label>
            <div class="controls ">
                <select name="site" id="site" class="form-control input-lg span12" required >

                </select>	

            </div>
        </div>
        <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
            <label class="control-label">Categories Produits</label>
            <div class="controls ">
                <select  name="type_categorie" id="articlesCateories" multiple="multiple" required class="span12 form-control input-lg">
                    <c:forEach items="${type_categorie}" var="catego">
                        <c:if test="${catego.getArticleList().size() > 0}">
                            <option ><c:out value="${catego.getTypeCategorie()}"></c:out></option>
                        </c:if>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="control-group span4 flex-gt-xs-20 flex-xs">
            <label class="control-label"> Description</label>
            <div class="controls ">
                <textarea class="form-control description span12" required name="description"></textarea>		
            </div>
        </div>
    </div>
    <div class="row-fluid layout-gt-xs-row layout-xs-column">
        <div class="span3 flex-gt-xs-10 flex-xs">
            <button type="submit" class="btn  btn-success ">enregistrer</button>
        </div>
    </div>

    <div class="space20"></div>
    <div class="space20"></div>



    <hr>



    <div class="space20"></div>
    <div class="space20"></div>
</form>



