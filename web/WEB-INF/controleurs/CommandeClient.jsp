<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page session="true" %>


<!-- BEGIN INLINE TABS PORTLET-->
<div class="widget">
    <div class="widget-title">
        <h4><i class="icon-reorder"></i> Passer Votre Commande Ici</h4>
        <span class="tools">
            <a href="javascript:;" class="icon-chevron-down"></a>

        </span>
    </div>
    <div class="widget-body">
        <div class="bs-docs-example">

            <div class="row-fluid responsive ">    
                <form method="post" action="Commande_All_Client?vue=Commande Personnel&action=ajouter" class="" id="commandeClit">

                    <div class="form-group responsive">
                        <div class="row-fluid layout-gt-xs-row layout-xs-column">

                            <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                <label class="form-control-label"> Magasin</label>
                                <div class="controls ">
                                    <select  class="span12 form-control magasinbyregion "name="magasin" required>
                                        <c:forEach items="${sessionScope.magasinSSS}" var="cc">  
                                            <option value="${cc.getIdMagasin()}" >${cc.getNomMagasin()}</option>  
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                <label class="control-label"> Categorie</label>
                                <div class="controls ">
                                    <select class="form-control span12" id="categorietoarticles" required name="categorie">
                                        <option value="${categos.getIdCategorie()}" selected>${categos.getNomCategorie()}</option>
                                        <c:forEach items="${categoriesMS}" var="cat">
                                            <c:if test="${cat.getIdCategorie() != categos.getIdCategorie() }">
                                                <option value="${cat.getIdCategorie()}">${cat.getNomCategorie()}</option>
                                            </c:if>
                                        </c:forEach>

                                    </select>
                                </div>
                            </div>



                            <div class="control-group span2 flex-gt-xs-15 flex-xs" >
                                <label class="control-label"> Article</label>
                                <div class="controls ff" id="">
                                    <select class="form-control exampleSelect span12" id="articlesCateorie" required name="designation"style="margin-left: 0px">

                                    </select>
                                </div>
                            </div>
                            <div class="control-group span2 flex-gt-xs-10 flex-xs">
                                <label class="control-label"> Quantite</label>
                                <div class="controls ">
                                    <input type="number" id="quantite" class=" form-control  span12"  placeholder="Quantite" required name="quantite" />

                                </div>
                            </div>
                            <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                <label class="control-label"> Vos Appariels</label>
                                <div class="controls ">
                                    <select class=" form-control span12" name="appariel" placeholder="Vos Appareils" required>
                                        <c:forEach items="${sessionScope.personnel.getApparielList()}" var="cc">
                                            <c:if test="${cc.getNumeroSerie() != '000000'}">
                                                <option >${cc.getNumeroParck()}</option>  
                                            </c:if>
                                            <c:if test="${cc.getNumeroSerie() == '000000'}">
                                                <option value="${cc.getNumeroParck()}">Pour moi même</option>  
                                            </c:if>
                                        </c:forEach>

                                    </select>
                                </div>
                            </div>



                            <div class="control-group span2 flex-gt-xs-10 flex-xs">
                                <div class="controls ">
                                    <button type="submit" class="btn btn-success  btn-primary"style="margin-top: 22px;" ><i class="icon-shopping-cart"></i> ajouter</button>

                                </div>
                            </div>

                        </div>
                    </div>


                </form>
            </div>

            <table class="table table-hover table-responsive table-bordered simple_print" cellspacing="0" width="100%">
                <thead class="text-primary">
                    <tr>
                        <th>CATEGORIE</th>
                        <th>CODE</th>
                        <th>DESIGNATION</th>
                        <th>QUANTITE</th>
                        <th class="hidden">QUANTITE</th>
                        <th>PRIX UNITAIRE</th>
                        <th>PRIX TOTAL</th>
                        <th>APPARIEL</th>

                    </tr>
                </thead>
                <tbody id="tbody">
                    <c:forEach items="${listeoperation}" var="list">  
                        <tr class="produits">

                            <td class="categories col-lg-3" ><c:out value="${list.getCategorie()}"/></td>
                            <td class="code"><c:out value="${list.getCodeProduit()}"/></td>
                            <td class="designation"><c:out value="${list.getDesignation()}"/></td>
                            <td class="qteu"><f:formatNumber value="${list.getQuantite()}" type="NUMBER"/></td>
                            <td class="qteuc hidden"><input class="newvalcc" type='text' id='qteu'  /></td>
                            <td class="pu"><f:formatNumber value="${list.getPrix()}" type="CURRENCY"currencySymbol="FCFA"/></td>
                            <td class="pt"><f:formatNumber value="${list.getPrixTotal()}"type="CURRENCY" currencySymbol="FCFA"/></td>
                            <c:if test="${not empty list.getAppariel()}">
                                <td class="app"><c:out value="${list.getAppariel()}"/></td>
                            </c:if>                           
                        </tr>
                    </c:forEach>

                </tbody>
            </table> 
            <hr>
            <c:if test="${not empty message.getMessage()}">
                <div class="alert alert-danger text-center error_message hidden"><strong><c:out value="${message.getMessage()}"/></strong></div>
                    </c:if>

            <div class="row-fluid">

                <a href="Commande_All_Client?vue=Commande Personnel&action=saveClient"data-toggle="tooltip" title='Enregistrer Votre Commande' >  <button type="submit" class="btn  btn-success"><i class="icon-save"></i> Enregistrer</button></a>
                <button type="button" id="deleteP" class="btn btn-danger  delete"data-toggle="tooltip" title='Supprimer La Commande Selectionner' style="margin-left: 30px"><i class="icon-trash"></i> supprimer</button>

            </div>

        </div>
        <div class="space20"></div>
    </div>
</div>