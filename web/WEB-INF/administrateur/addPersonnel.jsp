<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="row-fluid">
    <div class="span12">
        <div class="widget box">
            <div class="widget-title"style="background-color: #0044cc">
                <h4>
                    <i class="icon-reorder"></i><span> Enregistrement d'un Personnel Etape 1 a  5</span>
                </h4>

            </div>
            <div class="widget-body">
                <form class="form-horizontal add-user" id="formtemplate"action="SettingPersonnal?action=newpersonnel&vue=vue&controleur=non" method="POST" >
                    <div id="tabsleft" class="tabbable tabs-left">
                        <ul>

                            <li><a href="#pills-tab1" data-toggle="tab"> <span class="strong">Etape 1</span> <span class="muted">Localisation</span></a></li>
                            <li><a href="#pills-tab2" data-toggle="tab"> <span class="strong">Etape 2</span> <span class="muted">Details Personnel</span></a></a></li>
                            <li><a href="#pills-tab3" data-toggle="tab"><span class="strong">Etape 3</span> <span class="muted">Securité</span></a></li>
                            <li><a href="#pills-tab4" data-toggle="tab"><span class="strong">Etape 4</span> <span class="muted">Droit D'accès</span></a></li>
                            <li><a href="#pills-tab5" data-toggle="tab"><span class="strong">Etape 5</span> <span class="muted">Confirmation</span></a></li>
                        </ul>
                        <div class="progress progress-info progress-striped">
                            <div class="bar"></div>
                        </div>
                        <div class="tab-content" style="overflow-wrap: inherit">
                            <div class="tab-pane" id="pills-tab1">
                                <h3>Localisation</h3>
                                <div class="control-group">
                                    <label class="control-label" for="direction">Region</label>
                                    <div class="controls ">
                                        <select name="region" id="region_service" class="form-control input-lg span6" >
                                            <c:forEach items="${regions}" var="region">
                                                <option value="${region.getIdRegion()}" class="region">${region.getNomRegion()}</option>

                                            </c:forEach>
                                        </select>

                                    </div>
                                </div>

                                <div class="control-group ">
                                    <label class="control-label">Direction</label>
                                    <div class="controls">
                                        <select name="direction" id="directionS" class="input-sm span6" >
                                            <c:forEach items="${directions}" var="dir">
                                                <option value="${dir.getIdDirection()}" class="">${dir.getNomDirection()}</option>

                                            </c:forEach>
                                        </select>

                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="site">Site</label>
                                    <div class="controls ">
                                        <select name="site" id="site_service" class="form-control input-lg span6" >

                                        </select>

                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label"> Service</label>
                                    <div class="controls ">
                                        <select name="service" id="service" class="form-control input-lg span6">

                                        </select>
                                    </div>

                                </div>
                            </div>

                            <div class="tab-pane" id="pills-tab2">
                                <h3>Détails Personnel</h3>
                                <div class="control-group form-group ">
                                    <label class="control-label">Nom et Prenom</label>
                                    <div class="controls ">
                                        <input type="text" class=" input-lg form-control span6" name="name" required id="name" placeholder="First name">

                                    </div>
                                </div>

                                <div class="control-group ">
                                    <label class="control-label"> Email</label>
                                    <div class="controls ">
                                        <input type="email" class=" input-lg form-control span6" name="email" id="email" required placeholder="Email">

                                    </div>
                                </div>

                                <div class="control-group ">
                                    <label class="control-label">Chef service</label>
                                    <div class="controls ">
                                        <select name="chef_service" id="chef_service" class="form-control input-lg span6">
                                            <option value="non" class="">non</option>
                                            <option value="oui" class="">oui</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group ">
                                    <label class="control-label">Fonction</label>
                                    <div class="controls ">
                                        <input type="text" class=" input-lg form-control span6" name="fonction" required id="fonction" placeholder="fontion">

                                    </div>
                                </div>

                                <div class="control-group ">
                                    <label class="control-label"> Matricule</label>
                                    <div class="controls ">
                                        <input type="text" style="width: 95px" class=" input-lg form-control span6"required name="matricule" id="matricule" placeholder="matricule">
                                    </div>
                                </div>


                                <div class="control-group ">
                                    <label class="control-label"> Tel:</label>
                                    <div class="controls ">

                                        <input type="text" style="width: 95px" name="phone" class="input-lg form-control span6"required id="telephone" placeholder="phone" required>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="pills-tab3">
                                <h3>Sécurité</h3>
                                <div class="control-group ">
                                    <label class="control-label">Nom d'utilisateur </label>
                                    <div class="controls">
                                        <input type="text" class="input-lg form-control span6" maxlength="8" name="username" id="usernamex" autocomplete="off" value="" placeholder="username" required/>

                                    </div>
                                </div>

                                <div class="control-group ">
                                    <label class="control-label">Mot de passe</label>
                                    <div class="controls ">
                                        <input type="password" class="input-lg span6" name="password" id="password1" value=""  placeholder="password"autocomplete="off" required/>


                                    </div>

                                </div>



                                <div class="control-group ">
                                    <label class="control-label">confirmer le Mot de Passe</label>
                                    <div class="controls">
                                        <input type="password" class="input-lg span6" name="password" id="password2" value="" required placeholder="Repeat Password" autocomplete="off" required style="margin-right: 10px;"/>
                                        <span id="pwmatch" class="icon-remove" style="color:#FF0004;"></span> Confirmation Du Mot De Passe
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="pills-tab4">
                                <h3>Droit D'accès</h3>
                                <div class="control-group ">
                                    <label class="control-label">Niveau Access</label>
                                    <div class="controls ">
                                        <select name="affectation" id="niveau_acces"  class="form-control input-lg span6 affectation" required>
                                            <option value="1" class="affectation">personnel simple</option>
                                            <option value="2" class="affectation">magasinier secondaire</option>
                                            <option value="3" class="affectation">magasinier principal</option>
                                            <option value="4" class="affectation">controlleur</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">Groupe</label>
                                    <div class="controls" id="groupe">

                                        <select  class="input-lg span6 sousgroupes" id="selectgroupe"  name="groupe">

                                        </select>


                                    </div>

                                </div>

                                <div class="control-group  typecontrol hidden">
                                    <label class="control-label"> Type control</label>
                                    <div class="controls ">
                                        <select name="type_controle" id="role_personnel" class="form-control input-lg span6">

                                        </select>
                                    </div>
                                </div>
                                <div class="control-group  magasin hidden">
                                    <label class="control-label"> Magasin</label>
                                    <div class="controls ">
                                        <select name="magasin" id="magasin" class="form-control input-lg span6">

                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="pills-tab5">

                                <div class="row-fluid">
                                    <div class="span3">
                                        <div class="clearfix">
                                            <ul class="nav nav-list faq-list">
                                                <li>
                                                    <a class="active" href="#"><i class=" icon-home"></i> Localisation</a>
                                                </li>

                                                <li class="">
                                                    Region: <strong class="" id="region_servicefinal"> </strong>
                                                </li>
                                                <li class="">
                                                    Direction: <strong class="" id="directionSfinal"> </strong>
                                                </li>
                                                <li class="">
                                                    Site: <strong class="" id="site_servicefinal"> </strong>
                                                </li>
                                                <li class="">
                                                    Service: <strong class="" id="servicefinal"> </strong>
                                                </li>



                                            </ul>
                                        </div>
                                    </div>
                                    <div class="span3">
                                        <div class="clearfix">
                                            <ul class="nav nav-list faq-list">
                                                <li>
                                                    <a class="active" href="#"><i class=" icon-user"></i> Details personnel</a>
                                                </li>

                                                <li class="">
                                                    Nom Complet: <strong class="" id="namefinal"> </strong>
                                                </li>
                                                <li class="">
                                                    Matricule: <strong class="" id="matriculefinal"> </strong>
                                                </li>
                                                <li class="">
                                                    Fonction: <strong class="" id="fonctionfinal"> </strong>
                                                </li>
                                                <li class="">
                                                    chef service : <strong class="" id="chef_servicefinal"> </strong>
                                                </li>
                                                <li class="">
                                                    Email: <strong class="" id="emailfinal"> </strong>
                                                </li>
                                                <li class="">
                                                    Phone: <strong class="l" id="telephonefinal"> </strong>
                                                </li>


                                            </ul>
                                        </div>


                                    </div>
                                    <div class="span3">
                                        <div class="clearfix">
                                            <ul class="nav nav-list faq-list">
                                                <li>
                                                    <a class="active" href="#"><i class=" icon-lock"></i> sécurité</a>
                                                </li>

                                                <li class="">
                                                    Nom utilisateur: <strong class="" id="usernamexfinal"> </strong>
                                                </li>
                                                <li class="">
                                                    Mot de passe: <strong class="" id="password1final"> </strong>
                                                </li>


                                            </ul>
                                        </div>


                                    </div>
                                    <div class="span3">

                                        <div class="clearfix">
                                            <ul class="nav nav-list faq-list">
                                                <li>
                                                    <a class="active" href="#"><i class=" icon-group"></i> Droits d'accès</a>
                                                </li>

                                                <li class="">
                                                    Niveau D'accèss: <strong class="" id="niveau_accesfinal"> </strong>
                                                </li>
                                                <li class="">
                                                    Groupe:  <strong class="" id="selectgroupefinal"> </strong>
                                                </li>
                                                <li class="typecontrol hidden">
                                                    Type control:  <strong class="" id="role_personnelfinal"> </strong>
                                                </li>
                                                <li class="magasin hidden">
                                                    Magasin:  <strong class="" id="magasinfinal"> </strong>
                                                </li>


                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-fluid control-group">
                                    <label class="control-label"></label>
                                    <div class="controls">
                                        <label class="radio">
                                            <input type="radio" name="confirm" value="oui"/> Je Confirme
                                        </label>
                                        <label class="radio">

                                            <input type="radio" name="confirm" checked value="non"/> non

                                        </label>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <ul class="pager wizard">
                            <li class="previous first"><a href="javascript:;">First</a></li>
                            <li class="previous"><a href="javascript:;">Previous</a></li>
                            <li class="next last"><a href="javascript:;">Last</a></li>
                            <li class="next"><a href="javascript:;">Next</a></li>
                            <li class="next finish" style="display:none;" id=""><a href="">Finish</a></li>

                        </ul>
                    </div>


            </div>
            </form>
        </div>
    </div>
</div>
