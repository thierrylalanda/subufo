<%-- 
    Document   : personnel
    Created on : 22 nov. 2017, 16:42:23
    Author     : Administrateur
--%>

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <!DOCTYPE html>
        <form role="form" name="loginForm" ng-submit="saveDeplacementPersonnel(deplacementPersonnel)" ng-model="deplacementPersonnel">
            <div class="row-fluid">

            </div>
            <div class="row-fluid">
                <div class="control-group form-group span8">
                    <label class="control-label">objet</label>
                    <div class="controls ">
                        <input type="text" ng-model="deplacementPersonnel.objet" ng-disabled="demande!= null" class="span12" required/>
                    </div>

                </div>
                <div class="control-group form-group span4">
                    <label class="control-label">Destination</label>
                    <div class="controls ">
                        <input type="text" ng-model="deplacementPersonnel.lieu" ng-disabled="demande!= null" class="span12" required/>
                    </div>

                </div>

            </div>
            <div class="row-fluid">
                <div class="control-group form-group span4">
                    <label class="control-label">date Depart</label>
                    <div class="controls ">
                        <input type="date" ng-model="deplacementPersonnel.depart" ng-disabled="demande!= null" class="span12" required/>
                    </div>

                </div>
                <div class="control-group form-group span4">
                    <label class="control-label">date retour</label>
                    <div class="controls ">
                        <input type="date" ng-model="deplacementPersonnel.arriver" ng-disabled="demande!= null" class="span12" />
                    </div>

                </div>
                <div class="control-group form-group span4">
                    <label class="control-label">vehicule</label>
                    <div class="controls ">
                        <select name="type_budget" class="form-control span12" ng-disabled="demande!= null" id="" ng-model="deplacementPersonnel.vehicule"
                            required>

                            <option value="oui" class="">oui</option>
                            <option value="non" class="">non</option>


                        </select>

                    </div>
                </div>
            </div>
            <div class="row-fluid">
                <div class="control-group form-group span12">
                    <label class="control-label">description</label>
                    <div class="controls">
                        <textarea class="form-control span12" ng-disabled="demande!= null" ng-model="deplacementPersonnel.description" required></textarea>
                    </div>

                </div>
            </div>
            <div class="row-fluid">
                <div class="control-group form-group span12">
                    <label class="control-label">piece jointe</label>
                    <div class="controls">

                        <div id="transition-value-toggle-button">
                            <input type="file" class="form-control span12" ng-disabled="demande!= null" name="transport" ng-model="deplacementPersonnel.file"
                            />
                        </div>
                    </div>
                </div>
            </div>
            <div class="row-fluid">

                <div class="control-group form-group span6 ">
                    <label class="control-label">Envoyer à</label>
                    <div class="controls ">
                        <input type="text" class="span12 form-control" ng-model="deplacementPersonnel.responsable" required/>

                    </div>
                </div>


            </div>
            <br>
            <button type="submit" class="btn btn-primary" ng-click="saveDeplacementPersonnel(deplacementPersonnel)" ng-hide="demande!= null"
                data-ng-disabled="loginForm.$invalid">soumettre</button>
            <a href="#/etablirOA/{{demande.type}}" ng-show="demande!= null" ng-click="etablirOA(demande)" class="btn btn-primary">Etablir OA</a>
        </form>