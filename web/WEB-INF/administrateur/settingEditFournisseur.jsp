<%-- 
    Document   : settingEditFournisseur
    Created on : 15 mai 2017, 16:34:33
    Author     : lalanda
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--Pill Tabs   -->
<div class="widget">
    <div class="widget-title text-capitalize text-info">
        <h4><i class="icon-reorder"></i> Fournisseurs</h4>
    </div>
    <div class="widget-body">
        <ul class="nav nav-pills">
            <li class="active"><a href="#home-pills" data-toggle="tab">Liste des Fournisseurs</a>
            </li>
            <li><a href="#profile-pills" data-toggle="tab">Ajouter Fournisseur</a>
            </li>

        </ul>

        <div class="tab-content">
            <div class="tab-pane fade in active" id="home-pills">
                <c:if test="${editFour == 'OK'}">
                    <div class="row-fluid">
                        <form action="personnel?action=UpdateFournisseur&vue=fournisseur&idfournis=${fournisseur.getIdFounisseur()}" method="post">
                            <div class="row-fluid layout-gt-xs-row layout-xs-row">
                                <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                    <label class="control-label">Code</label>
                                    <div class="controls ">
                                        <input type="text" style="" class="form-control span12" name="code" value="${fournisseur.getNomFounisseur()}"/>
                                    </div>
                                </div>
                                <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                    <label class="control-label">Nom Fournisseur</label>
                                    <div class="controls ">
                                        <input type="text" style="" class="form-control span12" name="nom_fournisseur" value="${fournisseur.getNomFounisseur()}"/>
                                    </div>
                                </div>

                                <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">

                                    <label class="control-label">Adresse</label>
                                    <div class="controls ">
                                        <input type="text"  style="" class="form-control span12" name="adresse_fournisseur" value="${fournisseur.getAdresse()}"/>

                                    </div>
                                </div>

                                <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">

                                    <label class="control-label">Tel</label>
                                    <div class="controls ">
                                        <input type="text" class="form-control span12"style="" name="phone_fournisseur" value="${fournisseur.getTelephone()}"/>
                                    </div>
                                </div>

                                <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">

                                    <label class="control-label">E-Mail</label>
                                    <div class="controls ">
                                        <input type="email" style="" class="form-control span12" name="mail" value="${fournisseur.getEmail()}"/>
                                    </div>

                                </div>
                                <div class="span2 flex-gt-xs-10 flex-xs">
                                    <div class="control-group ">
                                        <button type="submit" class="btn btn-success " style="margin-top: 25px" >Enregistrer</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </c:if>

                <table class="table table-bordered table-hover table-striped simple_print">
                    <thead>
                        <tr >
                            <th>Nom</th>
                            <th>Adresse</th>
                            <th>E-Mail</th>
                            <th>Téléphone</th>
                            <th>Options</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${fournisseurs}" var="respo">
                            <tr class="produit">
                                <td >${respo.getNomFounisseur()}</td>
                                <td >${respo.getAdresse()}</td>
                                <td >${respo.getEmail()}</td>
                                <td >${respo.getTelephone()}</td>
                                <td >
                                    <div class="btn-group">
                                        <a title="" href="personnel?action=selectFournisseur&vue=fournisseur&idfournis=${respo.getIdFounisseur()}" class="btn btn-primary" >  <span class="icon"> <i class="icon-edit"></i> </span></a>  
                                        <a class="btn btn-danger delete-insert"href="#" name="personnel?action=deleteFournisseur&vue=fournisseur&idfournis=${respo.getIdFounisseur()}" data-toggle="modal" data-target="" ><span class="icon"> <i class="icon-trash"></i> </span></a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="tab-pane fade" id="profile-pills">

                <div class="row-fluid">
                    <form action="personnel?action=addFournisseur&vue=fournisseur" method="post">
                        <div class="row-fluid layout-gt-xs-row layout-xs-row">
                            <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                <label class="control-label">Code</label>
                                <div class="controls ">
                                    <input type="text" style="" class="form-control span12" name="code" />
                                </div>
                            </div>
                            <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                                <label class="control-label">Nom Fournisseur</label>
                                <div class="controls ">
                                    <input type="text"  style="" class="  form-control span12" name="nom_fournisseur"  required  placeholder="nom du fournisseur"/>
                                </div>
                            </div>
                            <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                                <label class="control-label">Adresse</label>
                                <div class="controls ">
                                    <input type="text"  style="" class="form-control span12" name="adresse_fournisseur" required placeholder="Adresse"/>

                                </div>
                            </div>

                            <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                                <label class="control-label">Tel</label>
                                <div class="controls ">
                                    <input type="text"  style="" class="form-control span12" name="phone_fournisseur" maxlength="15"  placeholder="Telephone"/>

                                </div>
                            </div>
                            <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
                                <label class="control-label">E-Mail</label>
                                <div class="controls ">
                                    <input type="email"  style="" class="form-control span12" name="mail"  placeholder="Adresse Mail"/>

                                </div>
                            </div>
                            <div class="span2 flex-gt-xs-10 flex-xs">
                                <div class="control-group ">
                                    <button type="submit" class="btn btn-success" style="margin-top: 25px" >Enregistrer</button>
                                </div>
                            </div>
                        </div>
                </div>
                </form>
            </div>
            <br>           


        </div>

    </div>
</div>
</div>
<!--End Pill Tabs   -->
