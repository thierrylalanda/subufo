
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h3 class="page-title">
    Mise à jour d'un magasin principal
</h3>
<ul class="breadcrumb">
    <li>

        <a href="admin?vue=accueil&action=getAll"><i class="icon-home"></i> Home</a>
        <span class="divider">/</span>
    </li>
    <li class="active">
        <a href="#"><i class="icon-list"></i> Magasins</a>

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

<div class="widget">
    <div class="widget-title">
        <h4><i class="icon-reorder"></i>Mise à jour magasin principal</h4>
        <span class="tools">
            <a href="javascript:;" class="icon-chevron-down"></a>

        </span>
    </div>
    <div class="widget-body">
        <div class="bs-docs-example">
            <ul class="nav nav-tabs" id="myTab">
                <c:if test="${not empty sessionScope.lien30  or sessionScope.GeneralAdministrateur == 'OK'}">
                    <li class="<c:if test="${empty transf and empty form}">active</c:if>"><a data-toggle="tab" href="#home">Liste de tous Les Magasins Principaux</a></li>
                    </c:if>
                    <c:if test="${not empty parametre}">
                        <c:if test="${not empty sessionScope.lien31 or sessionScope.GeneralAdministrateur == 'OK'}">
                        <li ><a data-toggle="tab" href="#dropdown1">Ajouter Un Magasin Principal</a></li>
                        </c:if>
                        <c:if test="${not empty sessionScope.lien32 or sessionScope.GeneralAdministrateur == 'OK'}">
                        <li class="<c:if test="${form == 'OK'}">active</c:if>"><a data-toggle="tab" href="#profile">Ajouter Un Stock Pour Un Magasin Principal</a></li>
                        </c:if>
                    <li class="<c:if test="${transf == 'OK'}">active</c:if>"><a data-toggle="tab" href="#transfert">Transfert de categories</a></li>
                    </c:if>
            </ul>
            <div class="tab-content" id="myTabContent">


                <div id="transfert" class="tab-pane fade <c:if test="${transf == 'OK'}">in active</c:if>">
                        <form method="POST" action="parametre?action=tranfertCategorieMP&vue=createMagP" >
                            <div class="row-fluid layout-gt-xs-row layout-xs-column">
                                <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                                    <label class="control-label">Magasin Expediteur</label>
                                    <div class="controls ">
                                        <select name="magasin1" id="magasinexpediteurMp" required class="form-control input-lg span12" >
                                            <option></option>
                                        <c:forEach items="${MagasinsP}" var="mags">
                                            <option value="${mags.getIdMagasin()}">
                                                ${mags.getNomMagasin()}
                                            </option>
                                        </c:forEach>
                                    </select>	


                                </div>
                            </div>
                            <div class=" span4 flex-gt-xs-15 flex-xs"></div>
                            <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                                <label class="control-label">Magasin recepteur</label>
                                <div class="controls ">
                                    <select name="magasin2" id="site_service" required class="form-control input-lg span12" >
                                        <option></option>
                                        <c:forEach items="${MagasinsP}" var="mags">
                                            <option value="${mags.getIdMagasin()}">
                                                ${mags.getNomMagasin()}
                                            </option>
                                        </c:forEach>
                                    </select>	

                                </div>
                            </div>
                        </div>
                        <div class="row-fluid">


                            <div class="control-group span12 form-group">
                                <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTk5MjI0ODUwOWRkJySmk0TGHOhSY+d9BU9NHeCKW6o=" />

                                <table style="width: 100%;" class="">
                                    <tr>
                                        <td style="width: 35%">

                                            <div class="d-sel-filter">
                                                <h4><strong> Categories Magasin Expediteur</strong></h4>

                                            </div>

                                            <select id="box1View" multiple="multiple"  style="height:300px;width:75%">

                                            </select><br/>

                                            <span id="box1Counter" class="countLabel"></span>

                                            <select id="box1Storage">

                                            </select>
                                        </td>
                                        <td style="width: 21%; vertical-align: middle">
                                            <button id="to2" class="btn" type="button">&nbsp;>&nbsp;</button>

                                            <button id="allTo2" class="btn" type="button">&nbsp;>>&nbsp;</button>

                                            <button id="allTo1" class="btn" type="button">&nbsp;<<&nbsp;</button>

                                            <button id="to1" class="btn" type="button">&nbsp;<&nbsp;</button>
                                        </td>
                                        <td style="width: 35%">

                                            <div class="d-sel-filter">
                                                <h4><strong>Categories Magasin Recepteur</strong></h4>

                                            </div>

                                            <select id="box2View" multiple="multiple" name="categorie" style="height:300px;width:75%;">

                                            </select><br/>

                                            <span id="box2Counter" class="countLabel"></span>

                                            <select id="box2Storage">

                                            </select>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="row-fluid">
                                <button type="submit" class="btn btn-success">transferer</button>
                            </div>
                        </div>
                    </form>
                    <c:if test="${not empty message1}">
                        <div class="alert alert-danger  span12 text-center error_message hidden">
                            <strong>${message1.getMessage()}</strong>
                        </div>
                    </c:if>
                </div>

                <div id="home" class="tab-pane fade <c:if test="${empty transf and empty form}">in active</c:if>">

                    <c:if test="${updateMagp=='oui'}">
                        <div class="row-fluid">

                            <form class="form-inline" method="POST"  role="form" action="parametre?vue=createMagP&action=SaveUpdateMP&magasin=${magasin.getIdMagasin()}">
                                <div id="" class="tabbable tabs-left">
                                    <div  class="tab-content">
                                        <div class="row-fluid layout-gt-xs-row layout-xs-column">

                                            <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                <label class="control-label">Region</label>
                                                <div class="controls ">
                                                    <select name="region_site" id="" required class="span12 form-control input-lg region_site" >

                                                        <option></option>

                                                        <c:forEach items="${regions}" var="region">
                                                            <c:if test="${region.getIdRegion()==magasin.getSite().getRegion().getIdRegion()}">
                                                                <option value="${region.getIdRegion()}" class="region_site" selected>${region.getNomRegion()}</option>
                                                            </c:if>
                                                            <c:if test="${region.getIdRegion()==magasin.getSite().getRegion().getNomRegion()}">
                                                                <option value="${region.getIdRegion()}" class="region_site" >${region.getNomRegion()}</option>
                                                            </c:if>


                                                        </c:forEach>
                                                    </select>	

                                                </div>
                                            </div>
                                            <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                <label class="control-label" for="site_service">Site</label>
                                                <div class="controls ">
                                                    <select name="site" id="site" class="span12 form-control input-lg" >
                                                        <option value="${magasin.getSite().getIdSite()}">${magasin.getSite().getNomSite()}</option>
                                                    </select>	

                                                </div>
                                            </div>
                                            <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                                                <label class="control-label">Categorie(s) Produit(s)</label>
                                                <div class="controls ">
                                                    <select name="type_categorie" id="example-getting-starte" class="form-control input-lg span12">
                                                        <c:forEach items="${magasin.getCategorieproduitMPList()}" var="catego">
                                                            <option value="${catego.getIdCategorie()}"><c:out value="${catego.getNomCategorie()}"></c:out></option>
                                                        </c:forEach>
                                                    </select>

                                                </div>
                                            </div>

                                            <div class="control-group form-group span2 flex-gt-xs-20 flex-xs">
                                                <label class="control-label">Nom Magasin</label>
                                                <div class="controls ">
                                                    <input type="text" style=""value="${magasin.getNomMagasin()}" class=" input-lg form-control span12" name="nom_magasin" required >
                                                </div>
                                            </div>
                                            <div class="control-group span2 flex-gt-xs-20 flex-xs">
                                                <label class="control-label"> Description</label>
                                                <div class="controls ">
                                                    <textarea class="form-control description span12"  name="description"><c:out value="${magasin.getDescription()}"/></textarea>		
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row-fluid layout-gt-xs-row layout-xs-column">

                                            <div class="span2 flex-gt-xs-20 flex-xs">
                                                <a class="span12 btn btn-primary addcategoriebtnMP" href="" name="${magasin.getIdMagasin()}" data-toggle="modal" data-target="" >ajouter une categorie</a><br>

                                            </div>

                                            <div class="span2 flex-gt-xs-20 flex-xs">
                                                <a class="btn btn-primary deletecategoriebtnMP span12" href="" name="${magasin.getIdMagasin()}" data-toggle="modal" data-target="" >supprimer une categorie</a><br>

                                            </div>

                                            <div class="span2 flex-gt-xs-20 flex-xs">
                                                <a class="btn btn-primary deletearticlebtnMP span12"href="" name="${magasin.getIdMagasin()}" data-toggle="modal" data-target="" >supprimer un article</a><br>

                                            </div>
                                            <div class="span3 flex-gt-xs-10 flex-xs">
                                                <button type="submit" class="btn  btn-success " style="margin-left: 5px" >Enregistrer</button>

                                            </div>
                                        </div>

                                        <div class="space20"></div>
                                        <div class="space20"></div>

                                    </div>

                                </div>

                                <hr>



                            </form>
                        </div>    
                    </c:if>
                    <table class="table table-bordered table-hover table-striped simple_print">
                        <thead>
                            <tr >
                                <th>Nom Magasin</th>
                                <th>Magasignier</th>
                                <th>Description</th>
                                <th>site</th>
                                <th>Region</th>
                                <th>Options</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${empty sessionScope.GeneralAdministrateur}">
                                <c:forEach items="${MagasinsP}" var="mags">
                                    <c:if test="${sessionScope.personnel.getService().getSite().getRegion().getIdRegion() == mags.getSite().getRegion().getIdRegion()}">
                                        <tr class="produit">
                                            <td > <c:out value="${mags.getNomMagasin()}"/> </td>
                                            <td class="code"><a href="admin?action=editpersonnel&vue=editePersonnel&id=${mags.getAffectationmagasinPList()[0].getPersonnel().getIdPersonnel()}"> <c:out value="${mags.getAffectationmagasinPList()[0].getPersonnel().getNomPrenom()}"/></a></td>
                                            <td><c:out value="${mags.getDescription()}"/></td>
                                            <td > <c:out value="${mags.getSite().getNomSite()}"/> </td>
                                            <td > <c:out value="${mags.getSite().getRegion().getNomRegion()}"/> </td>
                                            <td >
                                                <div class="btn-group">
                                                    <c:if test="${vue=='magP'}">
                                                        <a title="" href="ListeProduitMP?action=seeInfoMP&vue=editeMagP&niveau=5&id_magasinP=${mags.getIdMagasin()}" class="btn btn-primary" >  <span class="icon"> <i class="icon-eye-open"></i> </span></a>  
                                                    </c:if>
                                                    <c:if test="${vue=='createMagP'}">
                                                        <a title="" href="parametre?action=editeMP&vue=createMagP&id_magasinP=${mags.getIdMagasin()}" class="btn btn-primary" >  <span class="icon"> <i class="icon-edit"></i> </span></a>  
                                                    </c:if>
                                                    <c:if test="${sessionScope.GeneralAdministrateur == 'OK'}">
                                                        <a class="btn btn-danger delete" href="#" name="SettingPersonnal?action=DeletteMP&vue=createMagP&idMP=${mags.getIdMagasin()}" data-toggle="modal" data-target="" ><span class="icon"> <i class="icon-trash"></i> </span></a>
                                                    </c:if>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <c:if test="${not empty sessionScope.GeneralAdministrateur}">
                                <c:forEach items="${MagasinsP}" var="mags">
                                    <tr class="produit">
                                        <td > <c:out value="${mags.getNomMagasin()}"/> </td>
                                        <td class="code"><a href="admin?action=editpersonnel&vue=editePersonnel&id=${mags.getAffectationmagasinPList()[0].getPersonnel().getIdPersonnel()}"> <c:out value="${mags.getAffectationmagasinPList()[0].getPersonnel().getNomPrenom()}"/></a></td>
                                        <td><c:out value="${mags.getDescription()}"/></td>
                                        <td > <c:out value="${mags.getSite().getNomSite()}"/> </td>
                                        <td > <c:out value="${mags.getSite().getRegion().getNomRegion()}"/> </td>
                                        <td >
                                            <div class="btn-group">
                                                <c:if test="${vue=='magP'}">
                                                    <a title="" href="ListeProduitMP?action=seeInfoMP&vue=editeMagP&niveau=5&id_magasinP=${mags.getIdMagasin()}" class="btn btn-primary" >  <span class="icon"> <i class="icon-eye-open"></i> </span></a>  
                                                </c:if>
                                                <c:if test="${vue=='createMagP'}">
                                                    <a title="" href="parametre?action=editeMP&vue=createMagP&id_magasinP=${mags.getIdMagasin()}" class="btn btn-primary" >  <span class="icon"> <i class="icon-edit"></i> </span></a>  
                                                </c:if>
                                                <c:if test="${sessionScope.GeneralAdministrateur == 'OK'}">
                                                    <a class="btn btn-danger delete" href="#" name="SettingPersonnal?action=DeletteMP&vue=createMagP&idMP=${mags.getIdMagasin()}" data-toggle="modal" data-target="" ><span class="icon"> <i class="icon-trash"></i> </span></a>
                                                </c:if>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </tbody>
                    </table>
                </div>
                <div id="dropdown1" class="tab-pane fade">
                    <c:import url="addMagasinP.jsp"/>
                </div>
                <div id="profile" class="tab-pane fade <c:if test="${form == 'OK'}">in active</c:if>">
                    <c:import url="addStockMagP.jsp"/>
                </div>
            </div>
        </div>
    </div>
</div>
