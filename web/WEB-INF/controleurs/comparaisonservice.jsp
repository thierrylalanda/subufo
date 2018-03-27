<%--
    Document   : comparaisonservice
    Created on : 29 sept. 2017, 07:28:41
    Author     : Administrateur
--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>




<div class="bs-docs-example">
    <ul class="nav nav-tabs" id="myTabp2">
        <li class="li-table"><a data-toggle="tab" href='#_personnel'>Personnel</a></li>
        <li class="li-table active"><a data-toggle="tab" href='#_service'>Service</a></li>
        <li class="li-table"><a data-toggle="tab" href='#_centre_cout'>centre de cout</a></li>
            <c:if test="${sessionScope.login.getNiveauAcces() == 4}">
            <li class="li-table"><a data-toggle="tab" href='#_mags'>Magasin Secondaire</a></li>
            <li class="li-table"><a data-toggle="tab" href='#_magp'>Magasin Principal</a></li>
            <li class="li-table"><a data-toggle="tab" href='#_site'>Site</a></li>
            <li class="li-table"><a data-toggle="tab" href='#_direction'>Direction</a></li>
            </c:if>

    </ul>
    <div class="tab-content" id="myTabContent2">
        <div id='_centre_cout' class="tab-pane fade in">
            <form method="post" action="parametre?action=camabertAllCentreCout&niveau=5&camabert=oui">
                <div class="row-fluid layout-gt-xs-row layout-xs-column">
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
                            <input id=""  name="interval" type="text" class="span12 reservation" />

                        </div>
                    </div>
                    <c:if test="${sessionScope.login.getNiveauAcces() == 4}">
                        <div class="span2 flex-gt-xs-15 flex-xs">
                            <label class="control-label" for="">Region</label>
                            <div class="controls ">
                                <div class="input-append ">
                                    <select class="region_direction_cc_ span12" name="" id="">

                                        <option value="${sessionScope.personnel.getService().getSite().getRegion().getIdRegion()}" selected>${sessionScope.personnel.getService().getSite().getRegion().getNomRegion()}</option>

                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                            <label for="" class="control-label">Direction</label>
                            <div class="controls ">
                                <select name="" id="" class="span12 input-lg direction_centre_cout_ for_end">


                                </select>

                            </div>
                        </div>
                    </c:if>
                    <div class="control-group span2 flex-gt-xs-15 flex-xs">
                        <label class="control-label" for="">centre de cout</label>
                        <div class="controls ff">
                            <select name="centre_cout" id="" class="span12 form-control input-lg centre_cout_ all_select"  >


                            </select>

                        </div>
                    </div>


                    <div class="span1 flex-gt-xs-5 flex-xs">
                        <button type="submit" class="btn btn-primary search-service" name="parametre?action=ReportingAllUsercentre" style="margin-top: 25px">
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
        <div id='_magp' class="tab-pane fade in ">
            <form action="parametre?action=camabertAllMP&camabert=oui" method="post" class="">
                <div class="row-fluid layout-gt-xs-row layout-xs-column">
                    <div class="control-group span2 flex-gt-xs-15 flex-xs">
                        <label class="control-label">Categorie</label>
                        <div class="controls ">
                            <select name="categorie" id="" multiple="multiple" class="span12 cat_select">
                                <c:forEach items="${categories}" var="cate">
                                    <option value="${cate.getIdCategorieProduit()}">${cate.getTypeCategorie()}</option>
                                </c:forEach>
                            </select>

                        </div>
                    </div>
                    <div class="span3 flex-gt-xs-15 flex-xs">
                        <label class="control-label" for="">duree</label>
                        <div class="controls ">
                            <input id=""  name="interval"type="text" class="reservation span12" />


                        </div>
                    </div>

                    <div class="span2 flex-gt-xs-15 flex-xs">
                        <label class="control-label" for="region">Region</label>
                        <div class="controls ">

                            <select class="region_magp_ for_end span12" name="" id="">
                                <option value="${sessionScope.personnel.getService().getSite().getRegion().getIdRegion()}" selected>${sessionScope.personnel.getService().getSite().getRegion().getNomRegion()}</option>

                            </select>

                        </div>
                    </div>
                    <div class="control-group span2 flex-gt-xs-15 flex-xs">
                        <label class="control-label">Magasin</label>
                        <div class="controls ff">
                            <select name="id_magasinP" id="" class="magasinP_ all_select span12">

                            </select>

                        </div>
                    </div>

                    <div class="span1 flex-gt-xs-5 flex-xs">
                        <button type="submit" name="parametre?action=ReportingAllMSInMP" class="btn btn-primary search-service" style="margin-top: 25px">
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
        <div id='_mags' class="tab-pane fade in">
            <form method="post" action="parametre?action=camabertAllMS&camabert=oui" class="">
                <div class="row-fluid layout-gt-xs-row layout-xs-column">
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
                            <input id=""  name="interval" type="text" class="span12 reservation " />

                        </div>
                    </div>

                    <div class="span2 flex-gt-xs-15 flex-xs">
                        <label class="control-label" for="region">Region</label>
                        <div class="controls ">

                            <select class="region_mags_ for_end span12" name="" id="">

                                <option value="${sessionScope.personnel.getService().getSite().getRegion().getIdRegion()}" selected>${sessionScope.personnel.getService().getSite().getRegion().getNomRegion()}</option>

                            </select>

                        </div>
                    </div>
                    <div class="control-group span2 flex-gt-xs-15 flex-xs">
                        <label class="control-label">Magasin</label>
                        <div class="controls ff">
                            <select name="id_magasin" id="" class="magasinS_ all_select span12">

                            </select>

                        </div>
                    </div>

                    <div class="span1 flex-gt-xs-5 flex-xs">
                        <button type="submit" name="parametre?action=ReportingAllUserMS" class="btn btn-primary search-service" style="margin-top: 25px">
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

        <div id='_direction' class="tab-pane fade in ">

            <form method="post" action="parametre?action=camabertAllDirection&camabert=oui">
                <div class="row-fluid layout-gt-xs-row layout-xs-column">
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
                            <input id=""  name="interval" type="text" class="span12 reservation" />

                        </div>
                    </div>

                    <div class="span2 flex-gt-xs-15 flex-xs">
                        <label class="control-label" for="region">Region</label>
                        <div class="controls ">

                            <select class="region for_end span12" name="" id="">

                                <option value="${sessionScope.personnel.getService().getSite().getRegion().getIdRegion()}" selected>${sessionScope.personnel.getService().getSite().getRegion().getNomRegion()}</option>

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
                    <div class="span1 flex-gt-xs-5 flex-xs">
                        <button type="submit" class="btn btn-primary search-service" name="parametre?action=ReportingAllUserDirection" style="margin-top: 25px">
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

        <div id='_site' class="tab-pane fade in">
            <form method="post" action="parametre?action=camabertAllsite&niveau=5&camabert=oui">
                <div class="row-fluid layout-gt-xs-row layout-xs-column">
                    <div class="control-group span2">
                        <label class="control-label">Categorie</label>
                        <div class="controls ">
                            <select name="categorie" multiple="multiple"id="" class="span12 cat_select">
                                <c:forEach items="${categories}" var="cate">
                                    <option value="${cate.getIdCategorieProduit()}">${cate.getTypeCategorie()}</option>
                                </c:forEach>
                            </select>

                        </div>
                    </div>
                    <div class="span3 flex-gt-xs-15 flex-xs">
                        <label class="control-label" for="">duree</label>
                        <div class="controls ">
                            <input id=""  name="interval" type="text" class="span12 reservation" />

                        </div>
                    </div>

                    <div class="span2 flex-gt-xs-15 flex-xs">
                        <label class="control-label" for="region">Region</label>
                        <div class="controls ">

                            <select class="region_ for_end span12"name="" id="">

                                <option value="${sessionScope.personnel.getService().getSite().getRegion().getIdRegion()}" selected>${sessionScope.personnel.getService().getSite().getRegion().getNomRegion()}</option>

                            </select>

                        </div>
                    </div>

                    <div class="control-group span2 flex-gt-xs-15 flex-xs">
                        <label for="stat-site" class="control-label">Site</label>
                        <div class="controls ff">
                            <select name="site" id="" class="input-lg site_ all_select span12" >


                            </select>

                        </div>
                    </div>
                    <div class="span1 flex-gt-xs-5 flex-xs">
                        <button type="submit" class="btn btn-primary search-service" name="parametre?action=ReportingAllUserSite" style="margin-top: 25px">
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


        <div id='_service' class="tab-pane fade in active ">
            <form method="post" action="parametre?action=camabertAllservice&niveau=5&camabert=oui">
                <div class="row-fluid layout-gt-xs-row layout-xs-column">
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
                           <input id=""  name="interval" type="text" class="span12 reservation" />
                        
                        </div>
                    </div>
                    <c:if test="${sessionScope.login.getNiveauAcces() == 4}">
                        <div class="span2 flex-gt-xs-15 flex-xs">
                            <label class="control-label" for="">Region</label>
                            <div class="controls ">
                                
                                    <select class="region_direction_ span12" name="" id="">

                                        <option value="${sessionScope.personnel.getService().getSite().getRegion().getIdRegion()}" selected>${sessionScope.personnel.getService().getSite().getRegion().getNomRegion()}</option>

                                    </select>
                                
                            </div>
                        </div>

                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                            <label for="" class="control-label">Direction</label>
                            <div class="controls ">
                                <select name="" id="" class="span12 input-lg direction_service_ for_end">


                                </select>

                            </div>
                        </div>
                    </c:if>
                    <div class="control-group span2 flex-gt-xs-15 flex-xs">
                        <label class="control-label" for="">Service</label>
                        <div class="controls ff">
                            <select name="service" id="" class="span12 form-control input-lg service_ all_select"  >
                                <c:if test="${sessionScope.login.getNiveauAcces() != 4}">
                                    <option value="${sessionScope.personnel.getService().getIdService()}" selected>${sessionScope.personnel.getService().getNomService()}</option>

                                </c:if>

                            </select>

                        </div>
                    </div>


                    <div class="span1 flex-gt-xs-5 flex-xs">
                        <button type="submit" class="btn btn-primary search-service" name="parametre?action=ReportingAllUserService" style="margin-top: 25px">
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

        <div id='_personnel' class="tab-pane fade ">
            <form method="post" action="parametre?action=camabertAllPersonnelServiceByPeriode&niveau=5&camabert=oui">
                <div class="row-fluid layout-gt-xs-row layout-xs-column">
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
                             <input id=""  name="interval" type="text" class="span12 reservation" />
                            
                        </div>
                    </div>
                    <c:if test="${sessionScope.login.getNiveauAcces() == 4}">
                        <div class="span2 flex-gt-xs-15 flex-xs">
                            <label class="control-label" for="">Region</label>
                            <div class="controls ">
                               
                                    <select class="region_direction_ span12" name="" id="">

                                        <option value="${sessionScope.personnel.getService().getSite().getRegion().getIdRegion()}" selected>${sessionScope.personnel.getService().getSite().getRegion().getNomRegion()}</option>

                                    </select>
                                
                            </div>
                        </div>

                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                            <label for="" class="control-label">Direction</label>
                            <div class="controls ">
                                <select name="" id="" class="input-lg direction_service_ span12">


                                </select>

                            </div>
                        </div>
                    </c:if>
                    <div class="control-group span2 flex-gt-xs-15 flex-xs">
                        <label class="control-label" for="">Service</label>
                        <div class="controls ">
                            <select name="service" id="" class="span12 form-control input-lg service_  for_end"  >
                                <c:if test="${sessionScope.login.getNiveauAcces() != 4}">
                                    <option value="${sessionScope.personnel.getService().getIdService()}" selected>${sessionScope.personnel.getService().getNomService()}</option>

                                </c:if>

                            </select>

                        </div>
                    </div>
                </div>
                <div class="row-fluid layout-gt-xs-row layout-xs-column">
                    <div class="control-group span2 flex-gt-xs-15 flex-xs">
                        <label for="" class="control-label">Personnel</label>
                        <div class="controls ff">
                            <select name="" id="" class="input-lg personnel_ all_select span12">


                            </select>

                        </div>
                    </div>


                    <div class="span1 flex-gt-xs-5 flex-xs">
                        <button type="submit" class="btn btn-primary search-service" name="parametre?action=ReportingAllUserService" style="margin-top: 25px">
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



    </div>
</div>


<div class="row-fluid compare-service  stat">


</div>

