<%--
    Document   : register
    Created on : 27 oct. 2017, 11:42:19
    Author     : Administrateur
--%>

<div id="registers" class="modal fade hide" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">

                <h1 class="text-center">Enregistrement</h1>
            </div>
            <div class="modal-body">
                <div class="row-fluid bychoix">
                    <button class="btn btn-danger demoversion " style="border-radius: 5px;box-shadow: 0 20px 20px rgba(0, 0, 2, .8)">version demo</button>
                    <button class="btn btn-success integraleversion " style="border-radius: 5px;box-shadow: 0 20px 20px rgba(0, 0, 2, .8)">activer le logiciel</button><hr>
                </div>
                <p class="counter"></p>
                <div class="row-fluid bydemo hide" style="border-radius: 5px;box-shadow: 0 20px 20px rgba(0, 0, 2, .8)">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="text-center">

                                <p><h3>Enregistrer le code pour la version demo.</h3></p>
                                <div class="panel-body">
                                    <form  method="POST" autocomplete="off" action="security?action=essai">
                                        <fieldset>
                                            <div class="form-group">
                                                <input class="form-control input-lg input-large focused span12"required placeholder="code demo" name="code" type="text">
                                            </div>
                                            <input class="btn btn-lg btn-primary btn-block span12 savedemo" value="Enregistrer" type="submit">
                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row-fluid bylicence hide" style="border-radius: 5px;box-shadow: 0 20px 20px rgba(0, 0, 2, .8)">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="text-center">

                                <p><h3>Enregistrer les licences produites pour la version integrale.</h3></p>
                                <div class="panel-body">
                                    <form  method="POST" autocomplete="off" action="security?action=completVersion">
                                        <fieldset>
                                            <div class="form-group">
                                                <input class="form-control input-lg input-large focused span12"required placeholder="code activation" name="code1" type="text">
                                            </div>
                                            <input class="btn btn-lg btn-primary btn-block span12 saveintegrale" value="Enregistrer" type="submit">
                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>