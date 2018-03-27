<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h3 class="page-title">
    Mis à jour d'un Appareil
</h3>
<ul class="breadcrumb">
    <li>

        <a href="admin?vue=accueil&action=getAll"><i class="icon-home"></i> Home</a>
        <span class="divider">/</span>
    </li>
    <li class="active">
        <a href="admin?vue=Appariels&action=goHome"><i class="icon-desktop"></i> Appareil</a>
        <span class="divider">/</span>
    </li>
    <li class="active">
        <a href="#"><i class="icon-tablet"></i> Mis à jour appareil</a>

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


<div class="row-fluid">

    <div class="widget ">
        <div class="widget-title">
            <h4><i class="icon-reorder"></i> Mis à Jour Appariel</h4>

        </div>
        <div class="widget-body ">
            <div class="space15"></div>
            <form class="form-horizontal" method="POST" action="SettingPersonnal?vue=Appariels&action=EditAppariel">

                <div class="row-fluid layout-gt-xs-row layout-xs-column" >

                    <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                        <label class="control-label">Numero Parck</label>

                        <input type="text" style="" class="form-control input-lg span12" required value="${apparielSelect.getNumeroParck()}" name="numeroParck" />

                    </div>
                    <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                        <label class="control-label">Numero Serie</label>

                        <input type="text"style=""  class="span12 input-lg form-control" required name="numeroSerie" value="${apparielSelect.getNumeroSerie()}">

                    </div>

                    <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                        <label class="control-label">Fabricant </label>
                        <select class="select span12" id="" required name="fabricant">
                            <option >${apparielSelect.getFabricant()} </option>
                            <c:forEach items="${fabriquants}" var="fabri">
                                <c:if test="${apparielSelect.getFabricant() != fabri.getNomFabriquant()}">
                                    <option >${fabri.getNomFabriquant()} </option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>



                    <div class="control-group span2 flex-gt-xs-15 flex-xs">
                        <label class="control-label"> Lieu</label>
                        <select class="select span12" id="" required name="lieu">
                            <option value="${apparielSelect.getLieu()}">${apparielSelect.getLieu()} </option>
                            <c:forEach items="${sites}" var="site">
                                <c:if test="${apparielSelect.getLieu() != site.getNomSite()}">
                                    <option value="${site.getNomSite()}">${site.getNomSite()} </option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="control-group span2 flex-gt-xs-15 flex-xs">
                        <label class="control-label"> Type Appareil</label>
                        <select class="select span12" id="" required name="type">
                            <option value="${apparielSelect.getTypeAppareil().getId()}">${apparielSelect.getTypeAppareil().getNom()} </option>
                            <c:forEach items="${typeappareil}" var="type">
                                <c:if test="${apparielSelect.getTypeAppareil().getNom() != type.getNom()}">
                                    <option value="${type.getId()}">${type.getNom()} </option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                        <label class="control-label">Model </label>
                        <select class="select span12" id="" required name="model">
                            <option >${apparielSelect.getModel()} </option>
                            <c:forEach items="${modeles}" var="model">
                                <c:if test="${apparielSelect.getModel() != model.getNomModel()}">
                                    <option >${model.getNomModel()} </option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>

                </div>


                <div class="row-fluid layout-gt-xs-row layout-xs-column">
                    <div class="control-group form-group span2 flex-gt-xs-20 flex-xs">
                        <label class="control-label">Proprietaire</label>
                        <select class="select span12 cat_select" name="utilisateur">
                            <option value="${apparielSelect.getProprietaire().getIdPersonnel()}">${apparielSelect.getProprietaire().getNomPrenom()}</option>
                            <option class="select"></option>
                            <c:forEach items="${personnels}" var="perso">
                                <c:if test="${perso.getIdPersonnel() != apparielSelect.getProprietaire().getIdPersonnel()}">
                                    <option value="${perso.getIdPersonnel()}">${perso.getNomPrenom()} </option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="control-group span2 "flex-gt-xs-10 flex-xs>
                        <button type="submit" style="margin-top: 25px" class="btn btn-success " value="${apparielSelect.getNumeroParck()}" name="numeroParck">Enregistrer</button>

                    </div>
                </div>
                <div class="space20"></div>
                <div class="space20"></div>
                <div class="row-border">


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
            <div class="space20"></div>
            <div class="space20"></div>
            <div class="space20"></div>
            <div class="space20"></div>
            <div class="space20"></div>
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




