<%-- 
    Document   : facture
    Created on : 22 nov. 2017, 16:44:15
    Author     : Administrateur
--%>

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <!DOCTYPE html>
        <form role="form" name="facturePrestationForm" ng-model="facturePrestation">
            <div class="row-fluid">
                <div class="control-group span4">
                    <label class="control-label">Numero facture</label>
                    <div class="controls ">
                        <input type="text" name="numero" ng-disabled="demande!= null" class="span12">
                    </div>

                </div>
                <div class="control-group form-group span4">
                    <label class="control-label">prestataire</label>
                    <div class="controls ">
                        <select name="prestataire" ng-disabled="demande!= null" class="form-control span12" id="" ng-model="facturePrestation.prestataire"
                            required>

                            <option value="reparation" class="">reparation</option>


                        </select>
                    </div>
                </div>
                <div class="control-group form-group span4">
                    <label class="control-label">code imputation</label>
                    <div class="controls ">
                        <select name="type_budget" ng-disabled="demande!= null" class="form-control span12" id="" ng-model="facturePrestation.codeImputation"
                            required>

                            <option value="reparation" class="">reparation</option>


                        </select>

                    </div>
                </div>
            </div>
            <div class="row-fluid">
                <div class="control-group form-group span4">
                    <label class="control-label">Quantite</label>
                    <div class="controls">
                        <input type="number" ng-disabled="demande!= null" class="form-control span12" name="transport" ng-model="facturePrestation.quantite"
                            required />

                    </div>
                </div>
                <div class="control-group form-group span4">
                    <label class="control-label">Montant unitaire</label>
                    <div class="controls ">
                        <input type="number" ng-disabled="demande!= null" class="form-control span12" name="transport" ng-model="facturePrestation.montant"
                            required />

                    </div>
                </div>
                <div class="control-group form-group span4">
                    <label class="control-label">date</label>
                    <div class="controls">

                        <input type="date" ng-disabled="demande!= null" name="transport" ng-model="facturePrestation.date" required />

                    </div>
                </div>
            </div>
            <div class="row-fluid">

                <div class="control-group form-group span8">
                    <label class="control-label">piece jointe</label>
                    <div class="controls">

                        <div id="transition-value-toggle-button">
                            <input type="file" ng-disabled="demande!= null" name="transport" ng-model="facturePrestation.file" />
                        </div>
                    </div>
                </div>
            </div>
          
            <br>
            <a href="submit" ng-hide="demande!= null" ng-click="saveFacture(facturePrestation)" class="btn btn-primary"
                data-ng-disabled="facturePrestationForm.$invalid">soumettre</a>
            <a href="#/etablirOA/{{demande.type}}" ng-show="demande!= null" ng-click="etablirOA(demande)" class="btn btn-primary">Etablir OA</a>
        </form>