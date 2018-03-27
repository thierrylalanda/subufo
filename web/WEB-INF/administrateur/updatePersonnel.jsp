<%--
    Document   : addPersonnel
    Created on : 25 mars 2017, 02:07:02
    Author     : lalanda
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="widget-body">
    <div class="bs-docs-example">
        <ul class="nav nav-tabs" id="myTab">
            <c:if test="${not empty sessionScope.lien4 or sessionScope.GeneralAdministrateur == 'OK'}">
                <li class="active"><a data-toggle="tab" href="#h1">Données personnel</a></li>
                </c:if>
                <c:if test="${not empty sessionScope.lien5 or sessionScope.GeneralAdministrateur == 'OK'}">
                <li><a data-toggle="tab" href="#pass">Change Password</a></li>
                </c:if>
                <c:if test="${not empty sessionScope.lien6 or sessionScope.GeneralAdministrateur == 'OK'}">
                <li><a data-toggle="tab" href="#access">Changer groupe</a></li>
                </c:if>
                <c:if test="${sessionScope.GeneralAdministrateur == 'OK' or not empty sessionScope.lien88}">
                <li><a data-toggle="tab" href="#newPass">Nouveau Login</a></li>
                </c:if>
                <c:if test="${sessionScope.GeneralAdministrateur == 'OK' or not empty sessionScope.lien89}">
                <li><a data-toggle="tab" href="#userName">Change user name</a></li>
                </c:if>
                <c:if test="${empty defautAppareil}">
                    <c:if test="${sessionScope.GeneralAdministrateur == 'OK' or not empty sessionScope.lien90}">
                    <li><a data-toggle="tab" href="#appareil">Appareil par défaut</a></li>
                    </c:if>
                </c:if>

            <c:if test="${sessionScope.GeneralAdministrateur == 'OK'or not empty sessionScope.lien87}">
                <li><a data-toggle="tab" href="#affectMS">Affectation à un magasin</a></li>
                </c:if>
                <c:if test="${sessionScope.GeneralAdministrateur == 'OK'or not empty sessionScope.lien87}">
                <li><a data-toggle="tab" href="#signature">Signature</a></li>
                </c:if>

        </ul>
        <div class="tab-content" >
            <div id="signature" class="tab-pane fade in">
                <div class="row-fluid" ng-app="signature">
                    <form ng-controller="signatureController" action="ChargerSignature_personnel?action=addSociete&vue=editePersonnel" id="fileForm" method="post" enctype="multipart/form-data">
                        <div class="control-group">
                            <label class="control-label">nouveau logo</label>
                            <div class="controls">
                                <div data-provides="fileupload" class="fileupload fileupload-new">
                                    <div style="width: 200px; height: 150px;" class="fileupload-new thumbnail">
                                        <img alt="" src="signature/${personnel.getMatricule()}.png">
                                    </div>
                                    <div style="max-width: 200px; max-height: 150px; line-height: 20px;" class="fileupload-preview fileupload-exists thumbnail"></div>
                                    <div>
                                        <span class="btn btn-file"><span class="fileupload-new">Select image</span>
                                            <span class="fileupload-exists">Change</span>
                                            <input type="file" class="default" name="file" ng-model="myFile" id="file"></span>
                                        <a data-dismiss="fileupload" class="btn fileupload-exists" href="#">Remove</a>
                                    </div>
                                </div>
                                <span class="label label-important">NOTE!</span>
                                <span>
                                    choisir un logo de type png
                                </span>
                            </div>
                        </div>
                        <div class="row-fluid">
                            <button type="submit" class="btn btn-success span3"  id="submitfile">nouveau logo</button>
                        </div>
                    </form>
                </div>
            </div>
            <div id="h1" class="tab-pane fade in active">

                <div class="row-fluid">

                    <h2>Modifier les Donnees De: ${personnel.getNomPrenom()}</h2>

                    <div class="widget">
                        <div class="widget-title" >
                            <h4><i class="icon-reorder"></i> Change Data for this User: ${personnel.getNomPrenom()}</h4>
                        </div>
                        <div class="widget-body ">
                            <div class="space15"></div>
                            <form class="layout-column" method="POST" role="form" action="SettingPersonnal?vue=editePersonnel&action=updatedatapersonnel&idPersonne=${personnel.getIdPersonnel()}">
                                <div class="row-fluid flex-auto layout-gt-xs-row layout-xs-column">

                                    <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                                        <label class="control-label" for="region_service">Region</label>
                                        <div class="controls ">
                                            <select name="region" id="region_service" class="form-control input-lg span12" >
                                                <option value="${personnel.getService().getSite().getRegion().getIdRegion()}" class="affectation">${personnel.getService().getSite().getRegion().getNomRegion()}</option>
                                                <c:forEach items="${regions}" var="region">
                                                    <c:if  test="${personnel.getService().getSite().getRegion().getIdRegion() != region.getIdRegion()}">
                                                        <option value="${region.getIdRegion()}" class="affectation">${region.getNomRegion()}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>

                                        </div>
                                    </div>

                                    <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                        <label class="control-label" for="direction">Diretion</label>
                                        <div class="controls ">
                                            <select name="direction" id=""  class="form-control input-lg span12"  >
                                                <option value="${direc.getIdDirection()}">${personnel.getService().getDirection().getNomDirection()}</option>
                                                <c:forEach items="${directions}" var="direc">
                                                    <c:if  test="${personnel.getService().getDirection().getIdDirection() != direc.getIdDirection()}">
                                                        <option value="${direc.getIdDirection()}">${direc.getNomDirection()}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>

                                        </div>
                                    </div>
                                    <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                        <label class="control-label" for="site">Site</label>
                                        <div class="controls ">
                                            <select name="site" id="site_service" class="form-control input-lg span12" >
                                                <option>${personnel.getService().getSite().getNomSite()}</option>
                                            </select>

                                        </div>
                                    </div>
                                    <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                        <label class="form-control-label"> Service</label>
                                        <div class="controls ">
                                            <select name="service" id="service" class="form-control input-lg span12">
                                                <option value="${personnel.getService().getIdService()}">${personnel.getService().getNomService()}</option>
                                            </select>
                                        </div>

                                    </div>
                                    <div class="control-group span2 flex-gt-xs-15 flex-xs layout-column">
                                        <label class="control-label flex">Nom</label>
                                        <div class="controls flex">
                                            <input type="text"  style="" class=" input-lg form-control span12" name="nom" value="${personnel.getNomPrenom()}" placeholder="Votre Nom">

                                        </div>
                                    </div>
                                    <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                        <label class="control-label"> Email</label>
                                        <div class="controls ">
                                            <input type="email"  style="" class=" input-lg form-control span12" name="email" value="${personnel.getEmail()}" id="email" placeholder="Email">

                                        </div>
                                    </div>



                                </div>
                                <div class="row-fluid flex layout-gt-xs-row layout-xs-column">

                                    <div class="control-group  span2 flex-gt-xs-15 flex-xs">
                                        <label class="form-control-label">Telephone</label>
                                        <div class="controls ">
                                            <input type="text"  style="" class=" input-lg form-control span12" name="phone" value="${personnel.getTelephone()}" placeholder="Telephone">
                                        </div>
                                    </div>

                                    <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                        <label class="form-control-label"> Matricule</label>
                                        <div class="controls ">
                                            <input type="text"  style="" class=" input-lg form-control span12" value="${personnel.getMatricule()}" name="matricule" placeholder="Matricule">
                                        </div>
                                    </div>

                                    <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                        <label class="form-control-label">Fonction</label>
                                        <div class="controls ">
                                            <input type="text" style="" class=" input-lg form-control span12" name="fonction" value="${personnel.getFonction()}" placeholder="fontion">

                                        </div>
                                    </div>
                                    <div class="control-group span2 flex-gt-xs-15 flex-xs ">
                                        <label class="form-control-label">Etablir OA</label>
                                        <div class="controls ">
                                            <select name="oa" id="service" class="form-control input-lg span12">
                                                <c:if test="${not empty personnel.getFonctionSubufo()}">
                                                    <c:if test="${personnel.getFonctionSubufo() != 'rien'}">
                                                        <option value="oui" selected>oui</option>
                                                        <option value="non">non</option>

                                                    </c:if>
                                                    <c:if test="${personnel.getFonctionSubufo() == 'rien'}">
                                                        <option value="non" selected>non</option>
                                                        <option value="oui">oui</option>
                                                    </c:if>



                                                </c:if>
                                                <c:if test="${empty personnel.getFonctionSubufo()}">
                                                    <option value="non" selected>non</option>
                                                    <option value="oui">oui</option>

                                                </c:if>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="control-group span2 flex-gt-xs-15 flex-xs ">
                                        <label class="form-control-label">Chef service</label>
                                        <div class="controls ">
                                            <select name="chef_service" id="" class="form-control input-lg span12">
                                                <c:if test="${personnel.getChefService() =='oui'}">
                                                    <option value="oui" selected>oui</option>
                                                    <option value="non" >non</option>
                                                </c:if>
                                                <c:if test="${personnel.getChefService() =='non'}">

                                                    <option value="oui" >oui</option>
                                                    <option value="non" selected>non</option>
                                                </c:if>
                                                <c:if test="${personnel.getChefService() == 'rien'}">

                                                    <option value="oui" >oui</option>
                                                    <option value="non" selected>non</option>
                                                </c:if>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="control-group span2 flex-gt-xs-15 flex-xs ">
                                        <label class="form-control-label">Caissier</label>
                                        <div class="controls ">
                                            <select name="caissier" id="" class="form-control input-lg span12">
                                                <c:if test="${personnel.getRole() =='caissier'}">
                                                    <option value="oui" selected>oui</option>
                                                    <option value="non" >non</option>
                                                </c:if>
                                                <c:if test="${personnel.getRole() !='caissier'}">

                                                    <option value="oui" >oui</option>
                                                    <option value="non" selected>non</option>
                                                </c:if>


                                            </select>
                                        </div>
                                    </div>
                                </div>
                           
                                <div class="form-actions flex layout-gt-xs-row layout-xs-row">
                                    <button type="submit" class="btn btn-success flex-gt-xs-10 flex-xs span12">Enregistrer</button>
                                    <button type="reset"  class="btn  btn-danger flex-gt-xs-10 flex-xs span12">Annuler</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>

            <div id="pass" class="tab-pane fade in ">
                <div class="row-fluid">



                    <div class="widget">
                        <div class="widget-title" style="background-color: #23527c">
                            <h4><i class="icon-reorder"></i> Changer le mot de passe de : ${personnel.getNomPrenom()}</h4>

                        </div>
                        <div class="widget-body ">
                            <div class="space15"></div>
                            <form class="form-horizontal layout-gt-xs-column layout-xs-column" method="POST" action="SettingPersonnal?vue=editePersonnel&action=updateLoginpersonnel&idPersonne=${personnel.getIdPersonnel()}&niveau=5">
                                <div class="control-group lex-gt-xs-20 flex-xs-20">
                                    <label class="control-label">Current Password</label>
                                    <div class="controls">
                                        <input type="password"  style="" name="password1" required class=" ">
                                    </div>
                                </div>
                                <div class="control-group lex-gt-xs-20 flex-xs-20">
                                    <label class="control-label">New Password</label>
                                    <div class="controls">
                                        <input type="password"  style="" required class=" "name="password">
                                    </div>
                                </div>
                                <div class="control-group lex-gt-xs-20 flex-xs-20" >
                                    <label class="control-label">Re-type New Password</label>
                                    <div class="controls">
                                        <input type="password"  style="" required class=" " name="password2">
                                    </div>
                                </div>

                                <div class="form-actions flex-gt-xs-20 flex-xs-20">
                                    <button type="submit" class="btn btn-success">Enregistrer</button>
                                    <button type="reset"  class="btn  btn-danger">Annuler</button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div id="appareil" class="tab-pane fade in ">
                <div class="row-fluid">

                    <h2>Créé un appariel pour: ${personnel.getNomPrenom()}</h2>

                    <div class="widget">
                        <div class="widget-title" style="background-color: #23527c">
                            <h4><i class="icon-reorder"></i>Appareil par Défaut: ${personnel.getNomPrenom()}</h4>

                        </div>
                        <div class="widget-body ">
                            <div class="space15"></div>
                            <form class="form-horizontal" method="POST" action="SettingPersonnal?vue=editePersonnel&action=AddAppareilDefaut&idPersonne=${personnel.getIdPersonnel()}&niveau=5">

                                <button type="submit" class="btn btn-success  center span6">Cliquer Ici</button>
                            </form>
                            <div class="space20"></div>
                            <div class="space20"></div>

                        </div>
                    </div>

                </div>
            </div>

            <div id="affectMS" class="tab-pane fade in ">
                <div class="row-fluid">
                    <div class="widget">
                        <div class="widget-title" style="background-color: #23527c">
                            <h4><i class="icon-reorder"></i> Affecter un magasin secondaire de commande à ce personnel: ${personnel.getNomPrenom()}</h4>
                        </div>
                        <div class="widget-body ">
                            <div class="space15"></div>
                            <form class="form-horizontal personnel" method="POST" action="SettingPersonnal?vue=editePersonnel&action=affectpersonnelToMS&idPersonne=${personnel.getIdPersonnel()}&niveau=5" personnel="${personnel.getIdPersonnel()}" >
                                <div class="control-group">
                                    <label class="control-label">Region</label>
                                    <div class="controls">
                                        <select name="region" id="regiontomagasinupdate" class="input-lg" >

                                            <c:if  test="${sessionScope.GeneralAdministrateur == 'OK'}">
                                                <option value="${personnel.getService().getSite().getRegion().getIdRegion()}" class="affectation">${personnel.getService().getSite().getRegion().getNomRegion()}</option>
                                                <c:forEach items="${regions}" var="region">

                                                    <c:if  test="${personnel.getService().getSite().getRegion().getIdRegion() != region.getIdRegion()}">
                                                        <option value="${region.getIdRegion()}" class="affectation">${region.getNomRegion()}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            <c:if  test="${empty sessionScope.GeneralAdministrateur}">

                                                <option value="${sessionScope.personnel.getService().getSite().getRegion().getIdRegion()}" class="affectation">${sessionScope.personnel.getService().getSite().getRegion().getNomRegion()}</option>


                                            </c:if>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Magasin</label>
                                    <div class="controls" id="ff">
                                        <select name="magasin" id="" class="input-lg  exampleSelect magasinbyregionupdate"  >
                                            <c:forEach items="${personnel.getAffectMsToPersonnelList()}" var="mag">
                                                <option value="${mag.getMagasin().getIdMagasin()}" class=" ">${mag.getMagasin().getNomMagasin()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <button type="submit" class="btn btn-success btn-large btn-lg">Enregistrer</button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div id="userName" class="tab-pane fade in ">
                <div class="row-fluid">

                    <div class="widget">
                        <div class="widget-title" style="background-color: #23527c">
                            <h4><i class="icon-reorder"></i> Changer le nom d'utilisateur de : ${personnel.getNomPrenom()}</h4>

                        </div>
                        <div class="widget-body ">
                            <div class="space15"></div>
                            <form class="form-horizontal" method="POST" action="SettingPersonnal?vue=editePersonnel&action=updateUserNamepersonnel&idPersonne=${personnel.getIdPersonnel()}&niveau=5">
                                <div class="control-group">
                                    <label class="control-label">New User Name</label>
                                    <div class="controls">
                                        <input type="text"  style="" required class="span6 "name="user">
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <button type="submit" class="btn btn-success ">Change UserName</button>
                                    <button type="reset"  class="btn  btn-danger">Cancel</button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div id="newPass" class="tab-pane fade in ">
                <div class="row-fluid">

                    <h2>Nouveau Login Pour: ${personnel.getNomPrenom()}</h2>

                    <div class="widget">
                        <div class="widget-title" style="background-color: #23527c">
                            <h4><i class="icon-reorder"></i>Nouveau Login: ${personnel.getNomPrenom()}</h4>

                        </div>
                        <div class="widget-body ">
                            <div class="space15"></div>
                            <form class="form-horizontal" method="POST" action="SettingPersonnal?vue=editePersonnel&action=newLoginforpersonnel&idPersonne=${personnel.getIdPersonnel()}&niveau=5">
                                <div class="control-group">
                                    <label class="control-label">User Name</label>
                                    <div class="controls">
                                        <input type="text" name="user_name" required class="span6 ">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">New Password</label>
                                    <div class="controls">
                                        <input type="password" required class="span6 "name="password">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Re-type New Password</label>
                                    <div class="controls">
                                        <input type="password" required class="span6 " name="password2">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Groupe Par Défaut</label>
                                    <div class="controls">
                                        <select name="groupe" class="span6 " >
                                            <c:forEach items="${sessionScope.All_Groupe}" var="gr">
                                                <c:if  test="${gr.getNiveau() == 1}">
                                                    <option value="${gr.getIdGroupes()}" class="select">${gr.getNomGroupe()}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-actions">
                                    <button type="submit" class="btn btn-success ">OK</button>
                                    <button type="reset"  class="btn  btn-danger">Annuler</button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div id="access" class="tab-pane fade in ">
                <div class="row-fluid">

                    <h2 id="userid" class="${personnel.getIdPersonnel()}">Change Groupe or Access Pages Groupe for ${personnel.getNomPrenom()}</h2>

                    <div class="widget ">
                        <div class="widget-title">
                            <h4><i class="icon-reorder"></i> Change Permissions Groupe for this User: ${personnel.getNomPrenom()}</h4>

                        </div>
                        <div class="widget-body ">
                            <div class="space15"></div>
                            <div class="row-fluid">
                                <form name="form1" id="form1" method="POST" action="SettingPersonnal?vue=editePersonnel&action=updatepersonnel&idPersonne=${personnel.getIdPersonnel()}">
                                    <div class="row-fluid">
                                        <div class="control-group form-group span2">
                                            <label class="control-label">Niveau Access</label>
                                            <div class="controls ">
                                                <select name="affectation" id=""  type="text" class="form-control span12 affectation" >
                                                    <c:choose >
                                                        <c:when test="${personnel.getLoginList().getNiveauAcces() == 1}">
                                                            <option value="${personnel.getLoginList().getNiveauAcces()}" class="affectation">personnel simple</option>
                                                        </c:when>
                                                        <c:when test="${personnel.getLoginList().getNiveauAcces() == 2}">
                                                            <option value="${personnel.getLoginList().getNiveauAcces()}" class="affectation">magasinier secondaire</option>
                                                        </c:when>
                                                        <c:when test="${personnel.getLoginList().getNiveauAcces() == 3}">
                                                            <option value="${personnel.getLoginList().getNiveauAcces()}" class="affectation">magasinier principal</option>
                                                        </c:when>
                                                        <c:when test="${personnel.getLoginList().getNiveauAcces() == 4}">
                                                            <option value="${personnel.getLoginList().getNiveauAcces()}" class="affectation">controlleur</option>
                                                        </c:when>
                                                        <c:when test="${personnel.getLoginList().getNiveauAcces() == 5}">
                                                            <option value="${personnel.getLoginList().getNiveauAcces()}" class="affectation">Administrateur</option>
                                                        </c:when>
                                                    </c:choose>
                                                    <c:if  test="${personnel.getLoginList().getNiveauAcces() != 1}">
                                                        <option value="1" class="affectation">personnel simple</option>
                                                    </c:if>
                                                    <c:if  test="${personnel.getLoginList().getNiveauAcces() != 2}">
                                                        <option value="2" class="affectation">magasinier secondaire</option>
                                                    </c:if>
                                                    <c:if  test="${personnel.getLoginList().getNiveauAcces() != 3}">
                                                        <option value="3" class="affectation">magasinier principal</option>
                                                    </c:if>
                                                    <c:if  test="${personnel.getLoginList().getNiveauAcces() != 4}">
                                                        <option value="4" class="affectation">controlleur</option>
                                                    </c:if>
                                                    <c:if  test="${personnel.getLoginList().getNiveauAcces() != 5 and sessionScope.GeneralAdministrateur == 'OK'}">
                                                        <option value="5" class="affectation">Administrateur Regional</option>
                                                    </c:if>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="control-group form-group span2">
                                            <label class="control-label">Groupe</label>
                                            <div class="controls " id="groupe">
                                                <select  class="input-lg span12 selectgroupes" id="selectgroupe"  name="groupe">
                                                    <option class="" value="${personnel.getLoginList().getGroupes().getIdGroupes()}">${personnel.getLoginList().getGroupes().getNomGroupe()}</option>
                                                    <c:forEach items="${groupes}" var="page">
                                                        <c:if test="${personnel.getLoginList().getGroupes().getIdGroupes() != page.getIdGroupes()}">
                                                            <c:if test="${personnel.getLoginList().getGroupes().getNiveau() == page.getNiveau()}">
                                                                <option class="" value="${page.getIdGroupes()}" >${page.getNomGroupe()}</option>
                                                            </c:if>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </div>

                                        </div>
                                        <div class="control-group form-group span2 magasin hidden">
                                            <label class="control-label"> Magasin</label>
                                            <div class="controls ">
                                                <select name="magasin" id="magasin" class="form-control  span12">
                                                    <c:if test="${not empty personnel.getAffectationmagasinPList()[0].getMagasinP().getIdMagasin()}">
                                                        <option value="${personnel.getAffectationmagasinPList().get(0).getMagasinP().getIdMagasin()}"></option>
                                                    </c:if>
                                                    <c:if test="${not empty personnel.getAffectationmagasinSList()[0].getMagasinS().getIdMagasin()}">
                                                        <option value="${personnel.getAffectationmagasinSList().get(0).getMagasinS().getIdMagasin()}"></option>
                                                    </c:if>
                                                </select>
                                            </div>
                                        </div>


                                        <div class="control-group form-group span2 typecontrol hidden">
                                            <label class="control-label"> Type control</label>
                                            <div class="controls ">
                                                <select name="type_controle" id="role_personnel" class="form-control span12">
                                                    <c:if test="${not empty personnel.getAffectationControleursList()[0].getResponsableValidation().getIdResponsableValidation()}">
                                                        <option value="${personnel.getAffectationControleursList().get(0).getResponsableValidation().getIdResponsableValidation()}"></option>
                                                    </c:if>
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
                                                            <span>Recherche:</span>
                                                            <input type="text" id="box1Filter" />
                                                            <button type="button" class="btn" id="box1Clear">X</button>
                                                        </div>

                                                        <select id="box1View" multiple="multiple" name="" style="height:300px;width:100%">
                                                            <c:forEach items="${pagegroupe}" var="page">
                                                                <option value="${page.getIdPage()}">${page.getNomPage()}</option>

                                                            </c:forEach>
                                                        </select><br/>

                                                        <span id="box1Counter" class="countLabel"></span>

                                                        <select id="box1Storage">

                                                        </select>

                                                    </td>
                                                    <td style="width: 30%; vertical-align: middle;text-align: center">
                                                        <button id="to2" class="btn" type="button">&nbsp;>&nbsp;</button>

                                                        <button id="allTo2" class="btn" type="button">&nbsp;>>&nbsp;</button>

                                                        <button id="allTo1" class="btn" type="button">&nbsp;<<&nbsp;</button>

                                                        <button id="to1" class="btn" type="button">&nbsp;<&nbsp;</button>
                                                    </td>
                                                    <td style="width: 35%">
                                                        <div class="d-sel-filter">
                                                            <span>Recherche:</span>
                                                            <input type="text" id="box2Filter" />
                                                            <button type="button" class="btn" id="box2Clear">X</button>
                                                        </div>

                                                        <select id="box2View" multiple="multiple" name="pages" style="height:300px;width:100%;">
                                                            <c:forEach items="${personnel.getLoginList().getGroupes().getPermissionsList()}" var="page">
                                                                <option value="${page.getPage().getIdPage()}">${page.getPage().getNomPage()}</option>

                                                            </c:forEach>
                                                        </select><br/>
                                                        <span id="box2Counter" class="countLabel"></span>

                                                        <select id="box2Storage">

                                                        </select>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>

                                    <div class="space20"></div>
                                    <div class="form-actions mtop20 text-center">
                                        <button type="submit" class="btn btn-success "style="margin-right: 100px">Save Change</button>
                                        <button type="reset"  class="btn btn-danger">Annuler</button>
                                    </div>

                                </form>
                            </div>
                            <div class="space20"></div>
                            <div class="space20"></div>

                        </div>
                    </div>
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
        </div>
    </div>

</div>











