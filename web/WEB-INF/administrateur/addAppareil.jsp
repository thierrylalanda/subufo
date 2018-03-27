<%--
    Document   : addStock
    Created on : 19 mai 2017, 07:28:36
    Author     : lalanda
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="widget ">
    <div class="widget-title">
        <h4><i class="icon-reorder"></i> Nouvel Appariel</h4>

    </div>
    <div class="widget-body ">
        <div class="bs-docs-example">
            <ul class="nav nav-tabs" id="myTab2">


                <li class="active"><a href="#formulaire" data-toggle="tab">Depuis un formulaire</a> </li>
                <li><a href="#fichier" data-toggle="tab">Depuis un fichier</a> </li>
            </ul>

            <div class="tab-content" id="myTabContent2">
                <div id="formulaire" class="tab-pane fade in active">

                    <form class="form-horizontal" method="POST" action="SettingPersonnal?vue=Appariels&action=AddAppariel">

                        <div class="row-fluid layout-gt-xs-row layout-xs-column" >

                            <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                                <label class="control-label">Numero Parck</label>
                                <div class="control-group">
                                    <input type="text" class="form-control span12" style="" name="numeroParck" required/>
                                </div>
                            </div>
                            <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                <label class="control-label"> Type Appareil</label>
                                <div class="control-group">
                                    <select class="select span12" id="" required name="type">
                                        <c:forEach items="${typeappareil}" var="type">
                                            <option value="${type.getId()}">${type.getNom()} </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                <label class="control-label"> Lieu</label>
                                <div class="control-group">
                                    <select class="select span12" id="" required name="lieu">
                                        <c:forEach items="${sites}" var="site">
                                            <option value="${site.getNomSite()}">${site.getNomSite()} </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>


                            <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                                <label class="control-label">Numero Serie</label>
                                <div class="control-group">
                                    <input style="" type="text" class=" input-lg form-control span12" required name="numeroSerie" >
                                </div>
                            </div>

                            <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                                <label class="control-label">Model </label>
                                <div class="control-group">
                                    <select class="select selectMS span12" id="" required name="model">
                                        <c:forEach items="${models}" var="model">
                                            <option >${model.getNomModel()} </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                                <label class="control-label">Fabricant </label>
                                <div class="control-group">
                                    <select class="select span12" id="" required name="fabricant">
                                        <c:forEach items="${fabriquants}" var="fabri">
                                            <option >${fabri.getNomFabriquant()} </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row-fluid layout-gt-xs-row layout-xs-column">
                            <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                                <label class="control-label">Proprietaire</label>
                                <div class="control-group">
                                    <select class="select cat_select " id="" required name="utilisateur">
                                        <option ></option>
                                        <c:forEach items="${personnels}" var="perso">
                                            <option value="${perso.getIdPersonnel()}">${perso.getNomPrenom()} </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="span2 flex-gt-xs-10 flex-xs">
                                <div class="control-group ">
                                    <button type="submit" class="btn btn-success " style="margin-top: 25px" ><i class="icon-save"></i></button>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>
                <div id="fichier" class="tab-pane ">
                    <div class="row-fluid">
                        <form method="post" role="form"  id="addstockform" enctype="multipart/form-data" action="UploadFileAppariels?vue=Appariels">

                            <div class="row-fluid layout-gt-xs-row layout-xs-column">

                                <div class="control-group form-group span3 flex-gt-xs-20 flex-xs">
                                    <label class="control-label">Insere un fichier</label>
                                    <div class="controls ">
                                        <input type="file"  class="form-control span12" name="uploadFile"/>
                                    </div>
                                </div>
                                <div class="span2 flex-gt-xs-15 flex-xs">
                                    <div class="control-group ">
                                        <button type="submit" class="btn btn-success " style="margin-top: 25px" id="addstockbtn" >Inserer</button>
                                    </div>
                                </div>
                            </div>

                        </form>
                        <div class="space15"></div>
                        <div class="space15"></div>
                        <p class="text-center text-info text-capitalize"><strong>Voici Un Example Du Formatage Du Fichier Excel</strong></p>
                        <p class="text-danger" style="color: red">Rassurer Vous Que le Fichier Excel Que Vous avez charger est Sur cette forme:</p>
                        <p class="text-danger" style="color: red">ne pas introduit la premiere ligne de l'exemple dans votre fichier excel</p>

                        <img src="image/appariel.png" alt="Exemple de fichier Excel"/>
                    </div>
                </div>
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
</div>




