<%-- 
    Document   : stagiaire
    Created on : 22 nov. 2017, 16:41:05
    Author     : Administrateur
--%>

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <!DOCTYPE html>
        <form role="form" name="deplacementStagiaire" ng-submit="saveDeplacementStagiaire(deplacementStagiaire)" ng-model="deplacementStagiaire">
            <div class="row-fluid">
                <div class="control-group form-group span12">
                    <label class="control-label">objet</label>
                    <div class="controls ">
                        <input type="text" class="form-control span12" ng-model="deplacementStagiaire.objet" ng-disabled="demande!= null" required/>
                    </div>

                </div>
            </div>
            <div class="row-fluid">
                <div class="control-group form-group span12">
                    <label class="control-label">Destination</label>
                    <div class="controls ">
                        <input type="text" class="form-control span12" ng-model="deplacementStagiaire.lieu" ng-disabled="demande!= null" required/>
                    </div>

                </div>

            </div>
            <div class="row-fluid">

                <div class="control-group form-group span6 ">
                    <label class="control-label">Envoyer à</label>
                    <div class="controls ">
                        <input type="text" class="span12 form-control" ng-model="deplacementStagiaire.responsable" required/>

                    </div>
                </div>
            

            </div>
            <div class="row-fluid">
                <div class="control-group form-group span12">
                    <label class="control-label">description</label>
                    <div class="controls ">
                        <textarea ng-model="deplacementStagiaire.description" class="form-control span12" ng-disabled="demande!=null" required></textarea>
                    </div>

                </div>
            </div>
            <br>
            <button type="submit" class="btn btn-primary" ng-click="saveDeplacementStagiaire(deplacementStagiaire)" ng-hide="demande!=null"
                data-ng-disabled="deplacementStagiaire.$invalid">soumettre</button>
            <a href="#/etablirOA/{{demande.type}}" ng-show="demande!= null" ng-click="etablirOA(demande)" class="btn btn-primary">Etablir OA</a>
        </form>