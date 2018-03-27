<%-- 
    Document   : UpdateProduits
    Created on : 10 déc. 2016, 17:04:40
    Author     : lalanda
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<div class="space20"></div>
<h3 class="page-title">
    Passer votre commande
</h3>
<ul class="breadcrumb">
    <li>
        <a href="RedirectionVue?vue=Accueil"><i class="icon-home"></i> Home</a>
        <span class="divider">/</span>
    </li>
    <li>
        <a href="#">commander</a>

    </li>

    <li class="pull-right search-wrap">
        <form action="search_result.html" class="hidden-phone">
            <div class="input-append search-input-area">
                <input class="" id="appendedInputButton" type="text">
                <button class="btn" type="button"><i class="icon-search"></i> </button>
            </div>
        </form>
    </li>
</ul>
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
                <form method="post" action="Commande_All_Client?vue=Commande Interne&action=ajouter&niveau=2" class="form-inline" id="commandeClit">


                    <div class="row-fluid layout-gt-xs-row layout-xs-column">

                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                            <label class="control-label"> Matricule ou Appareil</label>
                            <div class="controls ">
                                <select id="select" class=" form-control span12" name="appariel" placeholder="Vos Appareils" required>
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
                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                            <label class="control-label"> Magasin</label>
                            <div class="controls ">
                                <select  class="span12 form-control magasinbyregion "name="magasin" required >
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
                                <select class="form-control exampleSelect span12" id="articlesCateorie" required name="designation">

                                </select>
                            </div>
                        </div>
                        <div class="control-group span2 flex-gt-xs-10 flex-xs">
                            <label class="control-label"> Quantite</label>
                            <div class="controls ">
                                <input type="number" id="quantite" class=" form-control  span12"  placeholder="Quantite" required name="quantite" />

                            </div>
                        </div>
                        <div class="control-group span2 flex-gt-xs-5 flex-xs">
                            <div class="controls ">
                                <button type="submit" class="btn btn-success  btn-primary"style="margin-top: 25px;" ><i class="icon-shopping-cart"></i></button>

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
                        <th>Option</th>
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
                            <td class="app">
                                <a title="" href="Commande_All_Client?action=delete&code=${list.getCodeProduit()}&vue=Commande Interne&niveau=2" class="btn btn-danger">  <span class="icon"> <i class="icon-remove"></i> </span></a>  
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table> 
            <hr>
            <c:if test="${not empty message.getMessage()}">
                <div class="alert alert-danger text-center error_message hidden"><strong><c:out value="${message.getMessage()}"/></strong></div>
                    </c:if>

            <div class="row-fluid">

                <a href="Commande_All_Client?vue=Commande Interne&action=saveClient&niveau=2"data-toggle="tooltip" title='Enregistrer Votre Commande' >  <button type="submit" class="btn  btn-success"><i class="icon-save"></i> Enregistrer</button></a>
            </div>

        </div>
        <div class="space20"></div>
    </div>
</div>