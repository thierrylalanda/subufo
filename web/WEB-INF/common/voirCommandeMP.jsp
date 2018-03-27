<%-- 
    Document   : voirCommandeMP
    Created on : 16 févr. 2018, 14:08:59
    Author     : lalanda
--%>
<%-- 
    Document   : etablirOA
    Created on : 15 févr. 2018, 11:07:42
    Author     : lalanda
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="voircommandeMP" class="modal fade hide layout-align-xs-center-center flex-gt-xs flex-xs modal-lg" style="height: 320px;width: 750px" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
    <div class="modal-dialog flex-gt-xs flex-xs">

        <div class="modal-content modal-lg layout-gt-xs-column layout-xs-column">
            <div class="modal-header flex-gt-xs flex-xs" style="background-color: #002752">

                <button type="button" class="close" data-dismiss="modal" style="background-color: red" aria-hidden="true">X</button>

                <h3 class="text-center" style="color: white">Commande  du Magasin  : {{getCommande.magasin}}</h3>
            </div>
            <div class="modal-body flex-gt-xs flex-xs">

                <div class="tab-pane" id="pills-tab5">
                    <div class="row-fluid">

                        <div class="span12">
                            <div class="clearfix">
                                <ul class="nav nav-list faq-list">
                                    <li>
                                        <a class="active" href="#"><i class=" icon-dropbox"></i> Commande passée au fournisseur : {{getCommande.fournisseur}} </a>
                                    </li>

                                    <li>

                                        <table class="table table-bordered table-hover table-striped"  cellspacing="0" width="100%">
                                            <thead>
                                                <tr >
                                                    <th>Categorie</th>
                                                    <th>Article</th>
                                                    <th>Quantite</th>
                                                    <th>Prix unitaire</th>
                                                    <th>Total</th>
                                                    <th>commandé le</th>
                                                </tr>
                                            </thead>
                                            <tbody>





                                                <tr class="produit" ng-repeat="com in getCommande.data">


                                                    <td >{{com.type}}</td>
                                                    <td >{{com.code}}</td>
                                                    <td >{{com.quantite | number}}</td>
                                                    <td >{{com.prix | number}}</td>
                                                    <td >{{com.montant | number}}</td>
                                                    <td >{{com.dateCommande | date}}</td>
                                                </tr>



                                            </tbody>
                                        </table>
                                    </li>
                                    <br>
                                    <li>
                                        Total Global de la commande: {{getCommande.total | number}}
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
