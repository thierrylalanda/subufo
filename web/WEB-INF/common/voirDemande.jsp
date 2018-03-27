<%-- 
    Document   : voirDemande
    Created on : 31 janv. 2018, 15:18:09
    Author     : messi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="voirDemande" class="modal fade hide layout-align-xs-center-center" style="height: 320px;width: 750px" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
    <div class="modal-dialog">

        <div class="modal-content layout-gt-xs-column layout-xs-column">
            <div class="modal-header flex-gt-xs flex-xs" style="background-color: #002752">

                <button type="button" class="close" data-dismiss="modal" style="background-color: red" aria-hidden="true">X</button>
                <h3 class="text-center" style="color: white">Engagement de depense de : {{getdemande.demandeur}}</h3>
            </div>
            <div class="modal-body flex-gt-xs flex-xs">

                <div class="tab-pane" id="pills-tab5">
                    <div class="row-fluid">
                        <div class="span6">
                            <div class="clearfix">
                                <ul class="nav nav-list faq-list">
                                    <li>
                                        <a class="active" href="#"><i class=" icon-info"></i> Description demande</a>
                                    </li>
                                    <li>
                                        <div class=" row-fluid">
                                            <div class=" span3">
                                                <strong class="">Libelle : </strong>
                                            </div>
                                            <div class=" span9">
                                                {{getdemande.libelle}}
                                            </div>
                                        </div> 

                                    </li>
                                    <li class="">
                                        <div class=" row-fluid" ng-if="getdemande.nature_demande">
                                            <div class=" span3">
                                                <strong class="">Nature : </strong>
                                            </div>
                                            <div class=" span9">
                                                {{getdemande.nature_demande}}
                                            </div>

                                        </div>

                                    </li>
                                    <li class="">
                                        <div class=" row-fluid" ng-if="getdemande.imputation">
                                            <div class=" span3" >
                                                <strong class="">Code : </strong>
                                            </div>
                                            <div class=" span9">
                                                {{getdemande.imputation}}
                                            </div>

                                        </div>

                                    </li>
                                    <li class="">
                                        <div class=" row-fluid">
                                            <div class=" span3">
                                                <strong class="">Valideur : </strong>
                                            </div>
                                            <div class=" span9">
                                                {{getdemande.valideur}}
                                            </div>

                                        </div>

                                    </li>
                                    <li class="" ng-if="getdemande.date_echeance">
                                        <div class=" row-fluid">
                                            <div class=" span3">
                                                <strong class="">Echeance : </strong>
                                            </div>
                                            <div class=" span9">
                                                {{getdemande.date_echeance| date:"dd/MM/yyyy"}}
                                            </div>


                                        </div>

                                    </li>

                                    <li class="">
                                        <div class=" row-fluid" ng-if="getdemande.piece_joint">
                                            <div class=" span3">
                                                <strong class="">Piece jointe : </strong>
                                            </div>
                                            <div class=" span9">
                                                <a target="_blank" href="UploadDownloadFileServlet?fileName={{getdemande.piece_joint}}">{{getdemande.piece_joint}}</a> 
                                            </div>


                                        </div>

                                    </li>



                                </ul>
                            </div>
                        </div>

                        <div class="span6">
                            <div class="clearfix">
                                <ul class="nav nav-list faq-list">
                                    <li>
                                        <a class="active" href="#"><i class=" icon-dropbox"></i> details Demande</a>
                                    </li>
                                    <li class="">
                                        <div class=" row-fluid">
                                            <div class=" span4">
                                                <strong class="">statut : </strong>
                                            </div>
                                            <div class=" span8">
                                                {{getdemande.statut}}
                                            </div>


                                        </div>
                                    </li>
                                    <li class="" ng-if="getdemande.raison_rejet">
                                        <div class=" row-fluid">
                                            <div class=" span4">
                                                <strong class="">raison  : </strong>
                                            </div>
                                            <div class=" span8">
                                                {{getdemande.raison_rejet}}
                                            </div>


                                        </div>
                                    </li>
                                    <li class="">
                                        <div class=" row-fluid" ng-if="getdemande.quantite">
                                            <div class=" span4">
                                                <strong class="">Quantite : </strong>
                                            </div>
                                            <div class=" span8">
                                                {{getdemande.quantite| number}}
                                            </div>


                                        </div>
                                    </li>
                                    <li class="">
                                        <div class=" row-fluid" ng-if="getdemande.prix_unitaire">
                                            <div class=" span4">
                                                <strong class="">Prix unitaire : </strong>
                                            </div>
                                            <div class=" span8">
                                                {{getdemande.prix_unitaire| number}} Fcfa
                                            </div>


                                        </div>
                                    </li>
                                    <li class="">
                                        <div class=" row-fluid" ng-if="getdemande.montant">
                                            <div class=" span4">
                                                <strong class="">Montant Ttc : </strong>
                                            </div>
                                            <div class=" span8">
                                                {{getdemande.montant| number}} Fcfa
                                            </div>


                                        </div>
                                    </li>
                                    <li class="">
                                        <div class=" row-fluid">
                                            <div class=" span4">
                                                <strong class="">Description </strong>
                                            </div>
                                            <div class=" span8">
                                                {{getdemande.description}}
                                            </div>


                                        </div>

                                    </li>

                                    </li>

                                </ul>
                            </div>
                        </div>

                        <div class="span6" ng-if="getdemande.lieu">
                            <div class="clearfix">
                                <ul class="nav nav-list faq-list">
                                    <li>
                                        <a class="active" href="#"><i class=" icon-info"></i> Infos Mission</a>
                                    </li>

                                    <li class="">
                                        <div class=" row-fluid">


                                            <div class=" span3">
                                                <strong class="">Destination </strong>
                                            </div>
                                            <div class=" span9">
                                                {{getdemande.lieu}}
                                            </div>


                                        </div>

                                    </li>
                                    <li class="">

                                        <div class=" row-fluid">
                                            <div class=" span3">
                                                <strong class="">Depart: </strong>
                                            </div>
                                            <div class=" span9">
                                                {{getdemande.date_depart| date:"dd/MM/yyyy"}}
                                            </div>


                                        </div>
                                    </li>
                                    <li class="">
                                        <div class=" row-fluid">
                                            <div class=" span3">
                                                <strong class="">Retour: </strong>
                                            </div>
                                            <div class=" span9">
                                                {{getdemande.date_retour| date:"dd/MM/yyyy"}}
                                            </div>


                                        </div>

                                    </li>

                                </ul>
                            </div>
                        </div>



                        <div class="span6" ng-if="getdemande.fournisseur">
                            <div class="clearfix">
                                <ul class="nav nav-list faq-list">
                                    <li>
                                        <a class="active" href="#"><i class=" icon-info"></i> Infos Reglement Facture</a>
                                    </li>
                                    <li class="">
                                        <div class=" row-fluid">
                                            <div class=" span5">
                                                <strong class=""> fournisseur: </strong>
                                            </div>
                                            <div class=" span7">
                                                {{getdemande.fournisseur}}
                                            </div>


                                        </div>
                                    </li>
                                    
                                    <li class="">
                                        <div class=" row-fluid">
                                            <div class=" span5">
                                                <strong class="">cond paiement :</strong>
                                            </div>
                                            <div class=" span7">
                                                {{getdemande.cond_paiment}} Jour(s)
                                            </div>


                                        </div>
                                    </li>
                                    <li class="">
                                        <div class=" row-fluid">
                                            <div class=" span5">
                                                <strong class="">Cond Livraison :</strong>
                                            </div>
                                            <div class=" span7">
                                                {{getdemande.cond_livraison}}
                                            </div>


                                        </div>
                                    </li>
                                    <li class="">
                                        <div class=" row-fluid">
                                            <div class=" span5">
                                                <strong class="">cond Transport :</strong>
                                            </div>
                                            <div class=" span7">
                                                {{getdemande.cond_transport}}
                                            </div>


                                        </div>
                                    </li>
                                    <li class="">
                                        <div class=" row-fluid">
                                            <div class=" span5">
                                                <strong class="">Mode Livraison :</strong>
                                            </div>
                                            <div class=" span7">
                                                {{getdemande.mode_livraison}}
                                            </div>


                                        </div>
                                    </li>

                                </ul>
                            </div>
                        </div>

                    </div>
                </div>



            </div>

        </div>
    </div>
</div>
