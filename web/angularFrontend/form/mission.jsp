<%-- 
    Document   : mission
    Created on : 22 nov. 2017, 16:39:31
    Author     : Administrateur
--%>

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <!DOCTYPE html>
        <form role="form" name="missionPersonnel" ng-model="missionPersonnel">
            <div class="row-fluid">
                <div class="control-group form-group span8">
                    <label class="control-label">objet</label>
                    <div class="controls ">
                        <input type="text" ng-disabled="demande!= null" class="form-control span12" name="objet" ng-model="missionPersonnel.objetMission"
                            required/>
                    </div>

                </div>
                <div class="control-group form-group span4">
                    <label class="control-label">code imputation</label>
                    <div class="controls ">
                        <select name="codeImputation" ng-disabled="demande!= null" class="form-control span12" id="" ng-model="missionPersonnel.codeImputation"
                            required>

                            <option value="reparation" class="">reparation</option>


                        </select>

                    </div>
                </div>



            </div>
            <div class="row-fluid">
                <div class="control-group form-group span4">
                    <label class="control-label">Destination</label>
                    <div class="controls ">
                        <input type="text" ng-disabled="demande!= null" name="lieu" class="form-control span12" ng-model="missionPersonnel.lieuMission"
                            required/>
                    </div>

                </div>
                <div class="control-group form-group span4">
                    <label class="control-label">date Depart</label>
                    <div class="controls ">
                        <input type="date" ng-disabled="demande!= null" class="form-control span12" ng-model="missionPersonnel.depart" required/>
                    </div>

                </div>
                <div class="control-group form-group span4">
                    <label class="control-label">date retour</label>
                    <div class="controls ">
                        <input type="date" ng-disabled="demande!= null" class="form-control span12" ng-model="missionPersonnel.arriver" required/>
                    </div>

                </div>
            </div>
            <div class="row-fluid">
                <div class="control-group form-group span4" ng-show="demande!= null">
                    <label class="control-label">loger</label>
                    <div class="controls ">
                        <select name="type_budget" ng-change="showlogement(missionPersonnel.logement)" class="form-control span12" id="" ng-model="missionPersonnel.logement"
                            required>

                            <option value="oui" class="">oui</option>
                            <option value="non" class="">non</option>


                        </select>

                    </div>
                </div>
                <div class="control-group form-group span4" ng-if="hotel === true">
                    <label class="control-label">Hotel</label>
                    <div class="controls ">
                        <select name="type_budget" class="form-control span12" id="" ng-model="missionPersonnel.hotel" required>

                            <option value="oui" class="">oui</option>
                            <option value="non" class="">non</option>


                        </select>

                    </div>
                </div>
                <div class="control-group form-group span4">
                    <label class="control-label">vehicule</label>
                    <div class="controls ">
                        <select name="type_budget" ng-disabled="demande!= null" class="form-control span12" id="" ng-model="missionPersonnel.vehicule"
                            required>

                            <option value="oui" class="">oui</option>
                            <option value="non" class="">non</option>


                        </select>

                    </div>
                </div>
            </div>
           
            <div class="row-fluid">
                <div class="control-group form-group span12">
                    <label class="control-label">description mission</label>
                    <div class="controls ">
                        <textarea ng-model="missionPersonnel.description" ng-disabled="demande!= null" class="form-control span12" required></textarea>
                    </div>

                </div>
            </div>
            <br>
            <button type="submit" ng-hide="demande!= null" ng-click="saveMission(missionPersonnel)" class="btn btn-primary"
                data-ng-disabled="missionPersonnel.$invalid">soumettre</button>
            <a href="#/etablirOA/{{demande.type}}" ng-show="demande!= null" ng-click="etablirOA(demande)" class="btn btn-primary">Etablir OA</a>
        </form>