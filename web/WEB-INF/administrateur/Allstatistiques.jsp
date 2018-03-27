
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h3 class="page-title">
    Journal de consommation des articles sur une periode 
</h3>
<ul class="breadcrumb">
    <li>

        <a href="admin?vue=accueil&action=getAll"><i class="icon-home"></i> Home</a>
        <span class="divider">/</span>
    </li>
    <li class="active">
        <a href="#"><i class="icon-list"></i> Etats</a>

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
<div class="widget widget-left">
    <div class="widget-title">
        <ul class="nav nav-tabs">

            <li class="active"><a href="#widget_tab1" data-toggle="tab">Repporting Général</a></li>


        </ul>
    </div>
    <div class="widget-body">
        <div class="tabbable ">

            <div class="tab-content">

                <div class="tab-pane active" id="widget_tab1">

                    <div class="bs-docs-example">
                        <ul class="nav nav-tabs" id="myTabp">

                            <li class="li-table <c:if test="${statreporting=='region'}">active</c:if> "><a data-toggle="tab" href='#rapport_region'>Region</a></li>
                            <li class="li-table <c:if test="${statreporting=='direction'}">active</c:if>"><a data-toggle="tab" href='#rapport_direction'>Direction</a></li>
                            <li class="li-table <c:if test="${statreporting=='site'}">active</c:if>"><a data-toggle="tab" href='#rapport_site'>Site</a></li>
                            <li class="li-table <c:if test="${statreporting=='service'}">active</c:if>"><a data-toggle="tab" href='#rapport_service'>Service</a></li>
                            <li class="li-table <c:if test="${statreporting=='centre_cout'}">active</c:if>"><a data-toggle="tab" href='#rapport_centre_cout'>centre de cout</a></li>
                            <li class="li-table <c:if test="${statreporting=='MS'}">active</c:if>"><a data-toggle="tab" href='#rapport_mags'>Magasin Secondaire</a></li>
                            <li class="li-table <c:if test="${statreporting=='MP'}">active</c:if>"><a data-toggle="tab" href='#rapport_magp'>Magasin Principal</a></li>
                            <li class="li-table <c:if test="${statreporting=='personnel'}">active</c:if>"><a data-toggle="tab" href='#rapport_personnel'>Personnel</a></li>

                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <div id='rapport_centre_cout' class="tab-pane fade in <c:if test="${statreporting=='centre_cout'}">active</c:if>">
                                    <form method="post" action="parametre?action=getRepporting&vue=statistiques&niveau=5">   
                                        <div class="row-fluid layout-gt-xs-row layout-xs-row">
                                            <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                <label class="control-label">Categorie</label>
                                                <div class="controls ">
                                                    <select name="categorie" required id="" multiple="multiple" class="cat_select span12">
                                                    <c:forEach items="${categories}" var="cate">
                                                        <option value="${cate.getIdCategorieProduit()}">${cate.getTypeCategorie()}</option>
                                                    </c:forEach>
                                                </select>	

                                            </div>
                                        </div>
                                        <div class="span3 flex-gt-xs-15 flex-xs">
                                            <label class="control-label" for="">duree</label>
                                            <div class="controls ">
                                                <input id=""  required name="interval" type="text" class="span12 reservation m-ctrl-medium" />

                                            </div>
                                        </div>    

                                        <div class="span2 flex-gt-xs-15 flex-xs">
                                            <label class="control-label" for="">Region</label>
                                            <div class="controls ">

                                                <select class="region_direction_cc span12" name="" id="">
                                                    <c:if test="${empty sessionScope.Region_Administrateur}">
                                                        <c:forEach items="${regions}" var="co">
                                                            <c:if test="${co.getNomRegion()== region.getNomRegion()}">
                                                                <option value="${co.getIdRegion()}" selected>
                                                                    ${co.getNomRegion()}
                                                                </option> 
                                                            </c:if>
                                                            <c:if test="${co.getNomRegion()!=region.getNomRegion()}">
                                                                <option  value="${co.getIdRegion()}">
                                                                    ${co.getNomRegion()}
                                                                </option> 
                                                            </c:if>

                                                        </c:forEach>
                                                    </c:if>
                                                    <c:if test="${not empty sessionScope.Region_Administrateur}">
                                                        <option value="${Region_Administrateur.getIdRegion()}" selected>${Region_Administrateur.getNomRegion()}</option> 
                                                    </c:if>	
                                                </select>

                                            </div>
                                        </div>

                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                            <label for="" class="control-label">Direction</label>
                                            <div class="controls ">
                                                <select name="" id="" class="input-lg direction_centre_cout for_end span12" >


                                                </select>	

                                            </div>
                                        </div>
                                        <div class="control-group span3 flex-gt-xs-15 flex-xs">
                                            <label class="control-label" for="">centre de cout</label>
                                            <div class="controls ff">
                                                <select name="centre_cout" id="" required class="span12 form-control input-lg centre_cout all_select"  >


                                                </select>	

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid layout-gt-xs-row layout-xs-row">




                                        <div class="span1 flex-gt-xs-10 flex-xs">
                                            <label class="control-label">Détails</label>
                                            <div class="controls ">
                                                <input type="radio" name="choix" class="span12" value="tous" checked/>

                                            </div>

                                        </div>
                                        <div class="span1 flex-gt-xs-10 flex-xs">

                                            <label class="control-label">Par Article</label>
                                            <div class="controls ">
                                                <input type="radio" name="choix" class="span12" value="non"/>

                                            </div>
                                        </div>
                                        <div class="span1 flex-gt-xs-5 flex-xs">
                                            <button type="submit" class="btn btn-primary search-catego" name="parametre?action=ReportingAllUserService" style="margin-top: 25px">
                                                <span class="icon icon-search "></span>
                                            </button>
                                        </div>

                                    </div>


                                </form>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                            </div>
                            <div id='rapport_magp' class="tab-pane fade in <c:if test="${statreporting=='MP'}">active</c:if>">
                                    <form action="parametre?action=getRepporting&vue=statistiques&niveau=5" method="post" class=""> 
                                        <div class="row-fluid layout-gt-xs-row layout-xs-row">
                                            <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                <label class="control-label">Categorie</label>
                                                <div class="controls ">
                                                    <select name="categorie" id="" multiple="multiple" class="cat_select span12">
                                                    <c:forEach items="${categories}" var="cate">
                                                        <option value="${cate.getIdCategorieProduit()}">${cate.getTypeCategorie()}</option>
                                                    </c:forEach>
                                                </select>	

                                            </div>
                                        </div>
                                        <div class="span3 flex-gt-xs-15 flex-xs">
                                            <label class="control-label" for="">duree</label>
                                            <div class="controls ">
                                                <input id=""  name="interval"type="text" class="span12 reservation m-ctrl-medium" />

                                            </div>
                                        </div>    

                                        <div class="span2 flex-gt-xs-15 flex-xs">
                                            <label class="control-label" for="region">Region</label>
                                            <div class="controls ">

                                                <select class="region_magp for_end span12" name="" id="">

                                                    <c:if test="${empty sessionScope.Region_Administrateur}">
                                                        <c:forEach items="${regions}" var="co">
                                                            <c:if test="${co.getNomRegion()==region.getNomRegion()}">
                                                                <option value="${co.getIdRegion()}" selected>
                                                                    ${co.getNomRegion()}
                                                                </option> 
                                                            </c:if>
                                                            <c:if test="${co.getNomRegion()!=region.getNomRegion()}">
                                                                <option  value="${co.getIdRegion()}">
                                                                    ${co.getNomRegion()}
                                                                </option> 
                                                            </c:if>

                                                        </c:forEach>
                                                    </c:if>
                                                    <c:if test="${not empty sessionScope.Region_Administrateur}">
                                                        <option value="${Region_Administrateur.getIdRegion()}" selected>${Region_Administrateur.getNomRegion()}</option> 
                                                    </c:if>	
                                                </select>

                                            </div>
                                        </div>
                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                            <label class="control-label">Magasin</label>
                                            <div class="controls ff ">
                                                <select name="id_magasinP" id="" class="magasinP all_select span12">

                                                </select>	

                                            </div>
                                        </div>

                                        <div class="span1 flex-gt-xs-10 flex-xs">
                                            <label class="control-label">Détails</label>
                                            <div class="controls ">
                                                <input type="radio" name="choix" class="span12" value="tous" class="" />

                                            </div>

                                        </div>
                                        <div class="span1 flex-gt-xs-10 flex-xs">

                                            <label class="control-label">Par Article</label>
                                            <div class="controls ">
                                                <input type="radio" name="choix" value="non" checked class="span12" />

                                            </div>
                                        </div>
                                        <div class="span1 flex-gt-xs-5 flex-xs">
                                            <button type="submit" name="parametre?action=ReportingAllMSInMP" class="btn btn-primary search-catego" style="margin-top: 25px">
                                                <span class="icon icon-search "></span>
                                            </button>
                                        </div>
                                    </div>


                                </form>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                            </div>
                            <div id='rapport_mags' class="tab-pane fade in <c:if test="${statreporting=='MS'}">active</c:if>">
                                    <form method="post" action="parametre?action=getRepporting&vue=statistiques&niveau=5" class=""> 
                                        <div class="row-fluid layout-gt-xs-row layout-xs-row">
                                            <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                <label class="control-label">Categorie</label>
                                                <div class="controls ">
                                                    <select name="categorie" id="" multiple="multiple" class="cat_select span12">
                                                    <c:forEach items="${categories}" var="cate">
                                                        <option value="${cate.getIdCategorieProduit()}">${cate.getTypeCategorie()}</option>
                                                    </c:forEach>
                                                </select>	

                                            </div>
                                        </div>
                                        <div class="span3 flex-gt-xs-15 flex-xs">
                                            <label class="control-label" for="">duree</label>
                                            <div class="controls ">
                                                <input id=""  name="interval" type="text" class="span12 reservation m-ctrl-medium" />

                                            </div>
                                        </div>    

                                        <div class="span2 flex-gt-xs-15 flex-xs">
                                            <label class="control-label" for="region">Region</label>
                                            <div class="controls ">

                                                <select class="region_mags for_end span12" name="" id="">

                                                    <c:if test="${empty sessionScope.Region_Administrateur}">
                                                        <c:forEach items="${regions}" var="co">
                                                            <c:if test="${co.getNomRegion()==region.getNomRegion()}">
                                                                <option value="${co.getIdRegion()}" selected>
                                                                    ${co.getNomRegion()}
                                                                </option> 
                                                            </c:if>
                                                            <c:if test="${co.getNomRegion()!=region.getNomRegion()}">
                                                                <option  value="${co.getIdRegion()}">
                                                                    ${co.getNomRegion()}
                                                                </option> 
                                                            </c:if>

                                                        </c:forEach>
                                                    </c:if>
                                                    <c:if test="${not empty sessionScope.Region_Administrateur}">
                                                        <option value="${Region_Administrateur.getIdRegion()}" selected>${Region_Administrateur.getNomRegion()}</option> 
                                                    </c:if>	
                                                </select>

                                            </div>
                                        </div>
                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                            <label class="control-label">Magasin</label>
                                            <div class="controls ff">
                                                <select name="id_magasin" id="" class="magasinS all_select span12">

                                                </select>	

                                            </div>
                                        </div>
                                        <div class="span1 flex-gt-xs-10 flex-xs">
                                            <label class="control-label">Détails</label>
                                            <div class="controls ">
                                                <input type="radio" name="choix" value="tous" class="span12" />

                                            </div>

                                        </div>
                                        <div class="span1 flex-gt-xs-10 flex-xs">

                                            <label class="control-label">Par Article</label>
                                            <div class="controls ">
                                                <input type="radio" name="choix" value="non" checked class="span12" />

                                            </div>
                                        </div>
                                        <div class="span1 flex-gt-xs-5 flex-xs">
                                            <button type="submit" name="parametre?action=ReportingAllUserMS" class="btn btn-primary search-catego" style="margin-top: 25px">
                                                <span class="icon icon-search "></span>
                                            </button>
                                        </div>

                                    </div>



                                </form>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                            </div>
                            <div id='rapport_region' class="tab-pane fade in <c:if test="${statreporting=='region'}">active</c:if>">
                                    <form method="post" action="parametre?action=getRepporting&vue=statistiques&niveau=5">   
                                        <div class="row-fluid layout-gt-xs-row layout-xs-row">
                                            <div class="control-group span2">
                                                <label class="control-label">Categorie</label>
                                                <div class="controls ">
                                                    <select name="categorie"multiple="multiple" id="" class="cat_select span12">
                                                    <c:forEach items="${categories}" var="cate">
                                                        <option value="${cate.getIdCategorieProduit()}">${cate.getTypeCategorie()}</option>
                                                    </c:forEach>
                                                </select>	

                                            </div>
                                        </div>
                                        <div class="span3 flex-gt-xs-15 flex-xs">
                                            <label class="control-label" for="">duree</label>
                                            <div class="controls ">
                                                <input id=""  name="interval" type="text" class="span12 reservation m-ctrl-medium" />

                                            </div>
                                        </div>    

                                        <div class="span2 flex-gt-xs-15 flex-xs">
                                            <label class="control-label" for="region">Region</label>
                                            <div class="controls ">

                                                <select class="cat_select span12" multiple="multiple" name="region" id="">

                                                    <c:if test="${empty sessionScope.Region_Administrateur}">
                                                        <c:forEach items="${regions}" var="co">
                                                            <c:if test="${co.getNomRegion()==region.getNomRegion()}">
                                                                <option value="${co.getIdRegion()}" selected>
                                                                    ${co.getNomRegion()}
                                                                </option> 
                                                            </c:if>
                                                            <c:if test="${co.getNomRegion()!=region.getNomRegion()}">
                                                                <option  value="${co.getIdRegion()}">
                                                                    ${co.getNomRegion()}
                                                                </option> 
                                                            </c:if>

                                                        </c:forEach>
                                                    </c:if>
                                                    <c:if test="${not empty sessionScope.Region_Administrateur}">
                                                        <option value="${Region_Administrateur.getIdRegion()}" selected>${Region_Administrateur.getNomRegion()}</option> 
                                                    </c:if>	
                                                </select>

                                            </div>
                                        </div>

                                        <div class="span1 flex-gt-xs-10 flex-xs">
                                            <label class="control-label">Détails</label>
                                            <div class="controls ">
                                                <input type="radio" name="choix" value="tous" checked class="span12" />

                                            </div>

                                        </div>
                                        <div class="span1 flex-gt-xs-10 flex-xs">

                                            <label class="control-label">Par Article</label>
                                            <div class="controls ">
                                                <input type="radio" name="choix" value="non" class="span12" />

                                            </div>
                                        </div>
                                        <div class="span1 flex-gt-xs-5 flex-xs">
                                            <button type="submit" class="btn btn-primary search-catego" name="parametre?action=ReportingAllUserRegion"style="margin-top: 25px">
                                                <span class="icon icon-search "></span>
                                            </button>
                                        </div>
                                    </div>


                                </form>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                            </div>


                            <div id='rapport_direction' class="tab-pane fade in <c:if test="${statreporting=='direction'}">active</c:if>">

                                    <form method="post" action="parametre?action=getRepporting&vue=statistiques&niveau=5">   
                                        <div class="row-fluid layout-gt-xs-row layout-xs-row">
                                            <div class="control-group span2">
                                                <label class="control-label">Categorie</label>
                                                <div class="controls ">
                                                    <select name="categorie"multiple="multiple" id="" class="span12 cat_select">
                                                    <c:forEach items="${categories}" var="cate">
                                                        <option value="${cate.getIdCategorieProduit()}">${cate.getTypeCategorie()}</option>
                                                    </c:forEach>
                                                </select>	

                                            </div>
                                        </div>

                                        <div class="span3 flex-gt-xs-15 flex-xs">
                                            <label class="control-label" for="">duree</label>
                                            <div class="controls ">
                                                <input id=""  name="interval" type="text" class="span12 reservation m-ctrl-medium" />

                                            </div>
                                        </div>    

                                        <div class="span2 flex-gt-xs-15 flex-xs">
                                            <label class="control-label" for="region">Region</label>
                                            <div class="controls ">

                                                <select class="region for_end span12" name="" id="">

                                                    <c:if test="${empty sessionScope.Region_Administrateur}">
                                                        <c:forEach items="${regions}" var="co">
                                                            <c:if test="${co.getNomRegion()==region.getNomRegion()}">
                                                                <option value="${co.getIdRegion()}" selected>
                                                                    ${co.getNomRegion()}
                                                                </option> 
                                                            </c:if>
                                                            <c:if test="${co.getNomRegion()!=region.getNomRegion()}">
                                                                <option  value="${co.getIdRegion()}">
                                                                    ${co.getNomRegion()}
                                                                </option> 
                                                            </c:if>

                                                        </c:forEach>
                                                    </c:if>
                                                    <c:if test="${not empty sessionScope.Region_Administrateur}">
                                                        <option value="${Region_Administrateur.getIdRegion()}" selected>${Region_Administrateur.getNomRegion()}</option> 
                                                    </c:if>	
                                                </select>

                                            </div>
                                        </div>
                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                            <label for="" class="control-label">Direction</label>
                                            <div class="controls ff">
                                                <select name="direction" id="" class="span12 input-lg direction all_select" >




                                                </select>	

                                            </div>
                                        </div>
                                        <div class="span1 flex-gt-xs-10 flex-xs">
                                            <label class="control-label">Détails</label>
                                            <div class="controls ">
                                                <input type="radio" name="choix" value="tous" checked class="span12" />

                                            </div>

                                        </div>
                                        <div class="span1 flex-gt-xs-10 flex-xs">

                                            <label class="control-label">Par Article</label>
                                            <div class="controls ">
                                                <input type="radio" name="choix" value="non"class="span12" />

                                            </div>
                                        </div>

                                        <div class="span1 flex-gt-xs-10 flex-xs">
                                            <button type="submit" class="btn btn-primary search-catego" name="parametre?action=ReportingAllUserDirection" style="margin-top: 25px">
                                                <span class="icon icon-search "></span>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="row-fluid">

                                    </div>


                                </form>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                            </div>

                            <div id='rapport_site' class="tab-pane fade in <c:if test="${statreporting=='site'}">active</c:if>">
                                    <form method="post" action="parametre?action=getRepporting&vue=statistiques&niveau=5">   
                                        <div class="row-fluid layout-gt-xs-row layout-xs-row">
                                            <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                <label class="control-label">Categorie</label>
                                                <div class="controls ">
                                                    <select name="categorie" multiple="multiple"id="" class="cat_select span12">
                                                    <c:forEach items="${categories}" var="cate">
                                                        <option value="${cate.getIdCategorieProduit()}">${cate.getTypeCategorie()}</option>
                                                    </c:forEach>
                                                </select>	

                                            </div>
                                        </div>
                                        <div class="span3 flex-gt-xs-15 flex-xs">
                                            <label class="control-label" for="">duree</label>
                                            <div class="controls ">
                                                <input id=""  name="interval" type="text" class="span12 reservation m-ctrl-medium" />

                                            </div>
                                        </div>    

                                        <div class="span2 flex-gt-xs-15 flex-xs">
                                            <label class="control-label" for="region">Region</label>
                                            <div class="controls ">

                                                <select class="region_service for_end span12"name="" id="">

                                                    <c:if test="${empty sessionScope.Region_Administrateur}">
                                                        <c:forEach items="${regions}" var="co">
                                                            <c:if test="${co.getNomRegion()==region.getNomRegion()}">
                                                                <option value="${co.getIdRegion()}" selected>
                                                                    ${co.getNomRegion()}
                                                                </option> 
                                                            </c:if>
                                                            <c:if test="${co.getNomRegion()!=region.getNomRegion()}">
                                                                <option  value="${co.getIdRegion()}">
                                                                    ${co.getNomRegion()}
                                                                </option> 
                                                            </c:if>

                                                        </c:forEach>
                                                    </c:if>
                                                    <c:if test="${not empty sessionScope.Region_Administrateur}">
                                                        <option value="${Region_Administrateur.getIdRegion()}" selected>${Region_Administrateur.getNomRegion()}</option> 
                                                    </c:if>	
                                                </select>

                                            </div>
                                        </div>

                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                            <label for="stat-site" class="control-label">Site</label>
                                            <div class="controls ff">
                                                <select name="site" id="" class="input-lg site_service all_select span12" >


                                                </select>	

                                            </div>
                                        </div>
                                        <div class="span1 flex-gt-xs-10 flex-xs">
                                            <label class="control-label">Détails</label>
                                            <div class="controls ">
                                                <input type="radio" name="choix" value="tous" checked class="span12" />

                                            </div>

                                        </div>
                                        <div class="span1 flex-gt-xs-10 flex-xs">

                                            <label class="control-label">Par Article</label>
                                            <div class="controls ">
                                                <input type="radio" name="choix" value="non" class="span12" />

                                            </div>
                                        </div>
                                        <div class="span1 flex-gt-xs-5 flex-xs">
                                            <button type="submit" class="btn btn-primary search-catego" name="parametre?action=ReportingAllUserSite" style="margin-top: 25px">
                                                <span class="icon icon-search "></span>
                                            </button>
                                        </div>
                                    </div>



                                </form>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                            </div>


                            <div id='rapport_service' class="tab-pane fade in <c:if test="${statreporting=='service'}">active</c:if>">
                                    <form method="post" action="parametre?action=getRepporting&vue=statistiques&niveau=5">   
                                        <div class="row-fluid layout-gt-xs-row layout-xs-row">
                                            <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                <label class="control-label">Categorie</label>
                                                <div class="controls ">
                                                    <select name="categorie"multiple="multiple" id="" class="span12 cat_select">
                                                    <c:forEach items="${categories}" var="cate">
                                                        <option value="${cate.getIdCategorieProduit()}">${cate.getTypeCategorie()}</option>
                                                    </c:forEach>
                                                </select>	

                                            </div>
                                        </div>
                                        <div class="span3 flex-gt-xs-15 flex-xs">
                                            <label class="control-label" for="">duree</label>
                                            <div class="controls ">
                                                <input id=""  name="interval" type="text" class="span12 reservation m-ctrl-medium" />

                                            </div>
                                        </div>    

                                        <div class="span2 flex-gt-xs-15 flex-xs">
                                            <label class="control-label" for="">Region</label>
                                            <div class="controls ">

                                                <select class="region_direction span12" name="" id="">
                                                    <c:if test="${empty sessionScope.Region_Administrateur}">
                                                        <c:forEach items="${regions}" var="co">
                                                            <c:if test="${co.getNomRegion()==region.getNomRegion()}">
                                                                <option value="${co.getIdRegion()}" selected>
                                                                    ${co.getNomRegion()}
                                                                </option> 
                                                            </c:if>
                                                            <c:if test="${co.getNomRegion()!=region.getNomRegion()}">
                                                                <option  value="${co.getIdRegion()}">
                                                                    ${co.getNomRegion()}
                                                                </option> 
                                                            </c:if>

                                                        </c:forEach>
                                                    </c:if>
                                                    <c:if test="${not empty sessionScope.Region_Administrateur}">
                                                        <option value="${Region_Administrateur.getIdRegion()}" selected>${Region_Administrateur.getNomRegion()}</option> 
                                                    </c:if>	
                                                </select>

                                            </div>
                                        </div>

                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                            <label for="" class="control-label">Direction</label>
                                            <div class="controls ">
                                                <select name="" id="" class="input-lg direction_service for_end span12">


                                                </select>	

                                            </div>
                                        </div>
                                        <div class="control-group span3 flex-gt-xs-15 flex-xs">
                                            <label class="control-label" for="">Service</label>
                                            <div class="controls ff">
                                                <select name="service" id="" class="form-control input-lg service all_select span12"  >


                                                </select>	

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid layout-gt-xs-row layout-xs-row">


                                        <div class="span1 flex-gt-xs-15 flex-xs">
                                            <label class="control-label">Détails</label>
                                            <div class="controls ">
                                                <input type="radio" name="choix" value="tous" checked class="span12" />

                                            </div>

                                        </div>
                                        <div class="span1 flex-gt-xs-15 flex-xs">

                                            <label class="control-label">par article</label>
                                            <div class="controls ">
                                                <input type="radio" name="choix" value="non" class="span12"/>

                                            </div>
                                        </div>
                                        <div class="span1 flex-gt-xs-15 flex-xs" style="margin-left: 0px">
                                            <button type="submit" class="btn btn-primary search-catego" name="parametre?action=ReportingAllUserService" style="margin-top: 25px">
                                                <span class="icon icon-search "></span>
                                            </button>
                                        </div>

                                    </div>


                                </form>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                            </div>


                            <div id='rapport_personnel' class="tab-pane fade in <c:if test="${statreporting=='personnel'}">active</c:if>">
                                    <form method="post" action="parametre?action=getRepporting&vue=statistiques&niveau=5"> 
                                        <div class="row-fluid layout-gt-xs-row layout-xs-row">


                                            <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                                <label class="control-label">Categorie</label>
                                                <div class="controls ">
                                                    <select name="categorie"multiple="multiple" id="" class="cat_select span12">
                                                    <c:forEach items="${categories}" var="cate">
                                                        <option value="${cate.getIdCategorieProduit()}">${cate.getTypeCategorie()}</option>
                                                    </c:forEach>
                                                </select>	

                                            </div>
                                        </div>
                                        <div class="span3 flex-gt-xs-15 flex-xs">
                                            <label class="control-label" for="">duree</label>
                                            <div class="controls ">
                                                <input id=""  name="interval" type="text" class="span12 reservation m-ctrl-medium" />

                                            </div>
                                        </div>    

                                        <div class="span2 flex-gt-xs-15 flex-xs">
                                            <label class="control-label" for="region">Region</label>
                                            <div class="controls ">
                                                
                                                    <select class="region_service span12" name="" id="region_service">

                                                        <c:if test="${empty sessionScope.Region_Administrateur}">
                                                            <c:forEach items="${regions}" var="co">
                                                                <c:if test="${co.getNomRegion()==region.getNomRegion()}">
                                                                    <option value="${co.getIdRegion()}" selected>
                                                                        ${co.getNomRegion()}
                                                                    </option> 
                                                                </c:if>
                                                                <c:if test="${co.getNomRegion()!=region.getNomRegion()}">
                                                                    <option  value="${co.getIdRegion()}">
                                                                        ${co.getNomRegion()}
                                                                    </option> 
                                                                </c:if>

                                                            </c:forEach>
                                                        </c:if>
                                                        <c:if test="${not empty sessionScope.Region_Administrateur}">
                                                            <option value="${Region_Administrateur.getIdRegion()}" selected>${Region_Administrateur.getNomRegion()}</option> 
                                                        </c:if>	
                                                    </select>
                                               
                                            </div>
                                        </div>

                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                            <label for="stat-site" class="control-label">Site</label>
                                            <div class="controls ">
                                                <select name="" id="" class="input-lg site_service span12" >


                                                </select>	

                                            </div>
                                        </div>
                                        <div class="control-group span3 flex-gt-xs-15 flex-xs">
                                            <label class="control-label" for="service">Service</label>
                                            <div class="controls ">
                                                <select name="" id="" class="service form-control input-lg for_end span12"  >

                                                </select>	

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid layout-gt-xs-row layout-xs-row">


                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                            <label class="control-label" for="stat-service">personnel</label>
                                            <div class="controls ff">
                                                <select name="personnel" id="" class="span12 personnels form-control input-lg all_select"  >

                                                </select>	

                                            </div>
                                        </div>
                                        <div class="span1 flex-gt-xs-10 flex-xs">
                                            <button type="submit" class="btn btn-primary search-catego" name="parametre?action=ReportingAllUserSite" style="margin-top: 25px">
                                                <span class="icon icon-search "></span>
                                            </button>
                                        </div>
                                        <div class="span1 hidden flex-gt-xs-10 flex-xs">
                                            <label class="control-label">Détails</label>
                                            <div class="controls ">
                                                <input type="radio" name="choix" value="tous" class="span12" />

                                            </div>

                                        </div>
                                        <div class="span1 hidden flex-gt-xs-10 flex-xs">

                                            <label class="control-label">Personnel</label>
                                            <div class="controls ">
                                                <input type="radio" name="choix" value="non" checked class="span12"/>

                                            </div>
                                        </div>

                                    </div>



                                </form>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                                <div class="space20"></div>
                            </div>


                        </div>
                    </div>

                    <c:if test="${not empty statreporting}">
                        <div class="rapport ">
                            <c:forEach items="${reporting}" var="tab">
                                <div class="table-rapport ">
                                    <div class="space20"></div>
                                    <c:if test="${not empty message}">
                                        <div class="alert alert-info text-center">
                                            <h5>  <strong>${message.getMessage()}${tab.keySet()}</strong></h5>
                                        </div>
                                    </c:if>
                                    <div class="space20"></div>
                                    <table  class="table table-hover table-responsive table-bordered table-rapport  perso" name="${message.getMessage()}${tab.keySet()}" cellspacing="0" width="100%">
                                        <thead >
                                            <tr>
                                                <th>Articles</th>
                                                <th>QUANTITE</th>
                                                <th>Prix Unitaire</th>
                                                <th>Prix Total</th>
                                            </tr>
                                        </thead>

                                        <tbody class="stat-perso">
                                            <c:set var="t" value="${0}"/>
                                            <c:set var="qt" value="${0}"/>
                                            <c:forEach items="${tab.values()}" var="tab1">
                                                <c:forEach items="${tab1}" var="rep">

                                                    <tr>
                                                        <td>${rep.getArticles()}</td>
                                                        <td>${rep.getQuantite()}</td>
                                                        <td><f:formatNumber value="${rep.getPrix()}" type="CURRENCY" currencySymbol="FCFA"/></td>
                                                        <td><f:formatNumber value="${rep.getPrixtotal()}" type="CURRENCY" currencySymbol="FCFA"/></td>
                                                        <c:set var="t" value="${t + rep.getPrixtotal()}"/>
                                                        <c:set var="qt" value="${qt + rep.getQuantite()}"/>
                                                    </tr>

                                                </c:forEach>
                                            </c:forEach>
                                        </tbody>
                                        <tfoot style="color: #2fade7">
                                            <tr  class="text-capitalize text-center text-success text-primary text-info">
                                                <td>
                                                    Total

                                                </td>
                                                <td><f:formatNumber value="${qt}"/></td>
                                                <td>#######</td>
                                                <td><f:formatNumber value="${t}" type="CURRENCY" currencySymbol="FCFA"/></td>

                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>

                    <br>
                    <a class="btn btn-inverse   hidden-print print-pdf" style="margin-left: 400px;margin-bottom: 10px;border-radius: 5px">Imprimer <i class="icon-print icon-big"></i></a>
                    <br>

                    <div class="row-fluid all-table portlet-scroll-1">


                    </div>

                </div>
            </div>
        </div>
    </div>
</div>