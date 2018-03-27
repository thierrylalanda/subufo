<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<h3 class="page-title">
    ${vue}
</h3>
<ul class="breadcrumb">
    <li>
        <a href="StatistiqueMP?vue=Accueil&action=autre"><i class="icon-home"></i> Home</a>
        <span class="divider">/</span>
    </li>
    <li>
        <a href="#">${vue}</a>

    </li>

    <li class="pull-right search-wrap">
        <form action="" class="hidden-phone">
            <div class="input-append search-input-area">
                <input class="" id="appendedInputButton" type="text">
                <button class="btn" type="button"><i class="icon-search"></i> </button>
            </div>
        </form>
    </li>
</ul>

<div class="row-fluid">
    <div class="span12">
        <!-- BEGIN INLINE TABS PORTLET-->
        <div class="widget">
            <div class="widget-title">
                <h4><i class="icon-reorder"></i> Espace Magasin: ${magasin.getNomMagasin()}</h4>
                <span class="tools">
                    <a href="javascript:;" class="icon-chevron-down"></a>
                    <a href="javascript:;" class="icon-remove"></a>
                </span>
            </div>
            <div class="widget-body">
                <div class="bs-docs-example">
                    <ul class="nav nav-tabs" id="myTab">
              
                            <c:if test="${not empty sessionScope.lien5}">
                            <li class=" <c:if test="${vue=='Traitement Commande'}"> active</c:if>"><a class="" href="${sessionScope.lien5}">Commandes Recus</a></li>
                            </c:if>    
                            <c:if test="${not empty sessionScope.lien11}">
                            <li class=" <c:if test="${vue=='Suivi Transfert'}"> active</c:if>"><a class="" href="${sessionScope.lien11}">Suivi Transfert</a></li>
                            </c:if>
                    </ul>

                    <div class="tab-content" id="myTabContent">
                        <div id="commandePerso" class="tab-pane fade in <c:if test="${vue=='Suivi Transfert'}">active</c:if>">
                            <c:if test="${vue=='Suivi Transfert'}">

                                <c:import url="/WEB-INF/magasignierP/transfert.jsp"/>

                            </c:if>
                        </div>
                        <div id="commandePerso" class="tab-pane fade in <c:if test="${vue=='Traitement Commande'}">active</c:if>">
                            <c:if test="${vue=='Traitement Commande'}">
                                <div class="row-fluid">
                                    <div class="span3">
                                        <h4 class="title grey">Sections  Magasin Secondaire</h4>
                                        <div class="clearfix">
                                            <ul class="nav nav-list faq-list">
                                                <li>
                                                    <a class="active" href="#"><i class=" icon-signin"></i> Magasins Secondaires </a>
                                                </li>
                                                <c:if test="${empty commandeur}" >

                                                    <li class="alert alert-block alert-danger error_message hidden" style="margin-left: -20px;margin-right: -15px">
                                                        <h4>Oups !</h4>
                                                        <c:out value="Aucun Magasin n'a Passer De Commande Pour L'instant..."/> <i class="icon-dropbox"></i>
                                                    </li>

                                                </c:if>

                                                <c:forEach items="${commandeur}" var="client">
                                                    <li><a class="<c:if test="${Onecommande[0].getIdMS().getIdMagasin()==client.getIdMagasin()}" >active</c:if>" href="CommandeRecusMP?idMS=${client.getIdMagasin()}&action=lister&vue=Traitement Commande"><i class="icon-home"></i> ${client.getNomMagasin()}</a></li>
                                                    </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="space15"></div>
                                    <div class="span12">
                                        <c:if test="${not empty modifiers}">

                                            <form method="post" action="CommandeRecusMP?vue=Traitement Commande&action=savetransf" class="form-inline">
                                                <div class="row-fluid layout-gt-xs-row layout-xs-column">
                                                    <input type="text" value="${cms.getDesignation()}"  class="  form-control  flex-gt-xs-15 flex-xs" disabled="true" id="designation" name="designation"/>             

                                                    <input type="text"  class=" form-control flex-gt-xs-15 flex-xs" value="${cms.getCodeProduit()}" style="margin-right: 30px" disabled="true"  />

                                                    <input type="number" id="quantite" class=" form-control flex-gt-xs-15 flex-xs" value="${cms.getQuantiteCommande()}"style="margin-right: 30px"  required name="quantite" />

                                                    <textarea type="text"   class="  form-control  flex-gt-xs-15 flex-xs"  id="designation" placeholder="Donnee une Raison" name="raison" style="margin-right: 30px"></textarea>             

                                                    <button type="submit" class="btn btn-success  btn-primary pull-righ flex-gt-xs-5 flex-xs" >Envoyer</button>

                                                    <input type="text"  class=" form-control hidden flex-gt-xs-15 flex-xs" value="${cms.getIdCommande()}"  name="id" />

                                                    <input type="text"  class=" form-control hidden flex-gt-xs-15 flex-xs" value="${idMS}"  name="idMS" />

                                                    <input type="text" class=" form-control  hidden flex-gt-xs-15 flex-xs" value="${cms.getCodeProduit()}"   name="code" />
                                                </div>
                                            </form>

                                        </c:if>

                                        <c:if test="${not empty modifier}">

                                            <form method="post" action="CommandeRecusMP?vue=Traitement Commande&action=refuser" class="form-inline">
                                                <div class="row-fluid layout-gt-xs-row layout-xs-column">
                                                    <input type="text" value="${cms.getDesignation()}"  class=" form-control tag  flex-gt-xs-15 flex-xs" disabled="true" id="designation" name="designation"/>             

                                                    <input type="text"  class=" form-control  flex-gt-xs-15 flex-xs" value="${cms.getCodeProduit()}"  disabled="true"  />

                                                    <label for="quantite "class="form-control-label flex-gt-xs-5 flex-xs" >Quantite</label>
                                                    <input type="number"   class=" form-control  flex-gt-xs-15 flex-xs"disabled="true" required id="quantite" value="${cms.getQuantiteCommande()}"style="margin-right: 30px" name="quantite"/>             

                                                    <textarea type="text"   class=" form-control flex-gt-xs-15 flex-xs" required id="designation"placeholder="Donnee une Raison" name="raison" style="margin-right: 30px"></textarea>             

                                                    <button type="submit" class="btn btn-success  btn-primary flex-gt-xs-5 flex-xs" >Envoyer</button>

                                                    <input type="text" class=" form-control hidden flex-gt-xs-15 flex-xs" value="${cms.getIdCommande()}"  name="id" />
                                                </div>
                                            </form>

                                        </c:if>
                                    </div>
                                </div>
                                <c:if test="${action=='detaill'}">

                                    <div class="row-fluid">  
                                        <div class="span12">  
                                            <table class="table table-hover table-bordered display simple_print"id="" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th>CATEGORIE</th>

                                                        <th>DESIGNATION</th>
                                                        <th>QUANTITE Init</th>
                                                        <th>DERNIERE LIVRAISON</th>
                                                        <th>QUANTITE </th>
                                                        <th class="hidden">QUANTITE</th>
                                                        <th>Commander le</th>
                                                        <th>Etat</th>
                                                        <th>valider</th>

                                                    </tr>
                                                </thead> 
                                                <tbody>
                                                    <c:forEach items="${Onecommande}" var="lis">  
                                                        <tr>

                                                            <c:forTokens var="token" items="${lis.getTypeProduit()}" delims="I" begin="${0}" end="${0}">
                                                                <td class="categories"><c:out value="${token}"/></td>
                                                            </c:forTokens>


                                                            <td class="designation"><c:out value="${lis.getDesignation()}"/></td>
                                                            <td class="qte"><f:formatNumber value="${lis.getQuantiteEnStock()}" type="NUMBER"/></td>
                                                            <td class="pt"><f:formatDate value="${lis.getDerniereLivraison()}"  type="DATE" dateStyle="MEDIUM" /></td>
                                                            <td class="qteu"><f:formatNumber value="${lis.getQuantiteCommande()}" type="NUMBER"/></td>
                                                            <td class="qteuc hidden"><input class="newvaltransf focus" autofocus="true" type='number' id='qteu' /></td>                       
                                                            <td><f:formatDate value="${lis.getDate()}" type="BOTH" dateStyle="MEDIUM" timeStyle="MEDIUM"/></td>                           
                                                            <td class="categories"><c:out value="${lis.getEtatCommande()}"/></td>
                                                            <td class="raison td">
                                                                <div class="btn-group">
                                                                    <a title="" href="CommandeRecusMP?action=traiter&vue=Traitement Commande&id=${lis.getIdCommande()}&code=${lis.getCodeProduit()}&idMS=${lis.getIdMS().getIdMagasin()}" class="btn btn-success">  <span class="icon"> <i class="icon-save"></i> </span></a>  
                                                                    <a title="" href="CommandeRecusMP?action=edit&vue=Traitement Commande&id=${lis.getIdCommande()}&code=${lis.getCodeProduit()}&idMS=${lis.getIdMS().getIdMagasin()}" class="btn btn-primary">  <span class="icon"> <i class="icon-edit"></i> </span></a>  
                                                                    <a title="" href="CommandeRecusMP?action=refus&vue=Traitement Commande&id=${lis.getIdCommande()}" class="btn btn-danger"  >  <span class="icon"> <i class="icon-eject"></i> </span></a>  

                                                                </div>

                                                                <c:set value="${lis.getIdMS().getIdMagasin()}" var="idMS" scope="page"></c:set>
                                                                </td>
                                                            </tr>

                                                    </c:forEach>

                                                </tbody>
                                            </table> <br><br>
                                            <div>
                                                <a href="CommandeRecusMP?action=traiterTous&vue=Traitement Commande" ><p  class="btn bouton btn-success  save " ><span class="icon-ok"> Valider Tous</span></p> </a>
                                            </div>
                                        </div>

                                    </div><br><br>

                                    <c:if test="${not empty message}">
                                        <div class="alert alert-success  text-center error_message hidden">
                                            <strong>${message.getMessage()}</strong>
                                        </div><br><br>
                                    </c:if>

                                </c:if> 
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END INLINE TABS PORTLET-->
    </div>
</div>
