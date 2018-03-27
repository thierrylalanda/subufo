<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="widget">
    <div class="widget-title">
        <h4><i class="icon-reorder"></i>Sorti Pour Personnel</h4>
        <span class="tools">
            <a href="javascript:;" class="icon-chevron-down"></a>
        </span>
    </div>
    <div class="widget-body">
        <div class="bs-docs-example">
            <form class=" " method="post" action="commande_client?vue=${vue}&action=show">
                <div class="row-fluid layout-gt-xs-row layout-xs-column">
                    <div class="control-group flex-gt-xs-50 flex-xs">
                        <label class="control-label">Rechercher</label>
                        <div class="controls">
                            <input type="text" class="form-control tags span12" name="client" placeholder="Entrer le Nom Du Personnel Ici" required>
                            </div>
                       
                    </div> 
                    <div class="control-group flex-gt-xs-20 flex-xs">
                        <button type="submit" style="margin-top: 25px" class="btn span12">Recherche</button>
                    </div>
                    
                </div>
            </form>
            <c:if test="${not empty messag}">
                <div class="alert alert-block alert-danger error_message hidden" style="">

                    <h4>Erreur !</h4>
                    <c:out value="Erreur: ${messag.getMessage()}"/> !

                </div>
            </c:if>
            <c:if test="${not empty unlock}">
                <div class="row-fluid responsive">
                    <form method="post" action="commande_client?vue=${vue}&action=ajouter&interne=no&niveau=${sessionScope.niveau}" class="form-inline" id="commandeClit">

                        <div class="form-group responsive">
                            <div class="row-fluid layout-gt-xs-row layout-xs-column">
                                <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                    <label class="control-label"> Utilisateur!</label>
                                    <div class="controls ">
                                        <input type="text" id="client" style=""required name="client" value="${nom_client}" class="span12 input-sm form-control tags " placeholder="Nom du Client" <c:if test="${edit=='ok'}" ><c:out value="disabled"></c:out> </c:if>/>

                                            </div>
                                        </div>

                                        <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                            <label class="control-label"> Categorie</label>
                                            <div class="controls ">
                                                <select class="form-control span12" id="categorietoarticles" required name="categorie">
                                                    <option value="${categos.getIdCategorie()}" selected>${categos.getNomCategorie()}</option>
                                            <c:forEach items="${sessionScope.categoriee}" var="cc">
                                                <option value="${cc.getIdCategorie()}">${cc.getNomCategorie()}</option>
                                            </c:forEach>

                                        </select>
                                    </div>
                                </div>
                                <div class="control-group span2 flex-gt-xs-15 flex-xs" >
                                    <label class="control-label"> Article</label>
                                    <div class="controls ff" id="">
                                        <select class="form-control exampleSelect span12" id="articlesCateorie" required name="designation"style="margin-left: 0px">

                                        </select>
                                    </div>
                                </div>


                                <div class="control-group span2 flex-gt-xs-10 flex-xs">
                                    <label class="control-label"> Quantite</label>
                                    <div class="controls ">
                                        <input type="number" id="quantite" class=" form-control span12 "  placeholder="Quantite" required name="quantite" />

                                    </div>
                                </div>
                                <div class="control-group span2 flex-gt-xs-15 flex-xs">
                                    <label class="control-label"> Vos Appariels</label>
                                    <div class="controls ">
                                        <select  class=" form-control span12" name="appariel" placeholder="Vos Appareils" required>
                                            <c:forEach items="${personnel.getApparielList()}" var="cc">
                                                <c:if test="${cc.getNumeroSerie() != '000000'}">
                                                    <option >${cc.getNumeroParck()}</option>
                                                </c:if>
                                                <c:if test="${cc.getNumeroSerie() == '000000'}">
                                                    <option value="${cc.getNumeroParck()}">Pour moi même</option>
                                                </c:if>
                                            </c:forEach>

                                        </select>
                                    </div>
                                </div>
                                <div class="control-group span2 flex-gt-xs-5 flex-xs">
                                    <div class="controls ">
                                        <button type="submit" class="btn btn-success  btn-primary span12"style="margin-top: 25px;" ><span class="icon icon-shopping-cart"></span></button>

                                    </div>
                                </div>
                            </div>


                        </div>

                    </form>
                </div>

                <hr>
                <div class="row-fluid responsive">
                    <table class="table table-hover table-responsive table-bordered simple_print" cellspacing="0" width="100%">
                        <thead class="text-primary">
                            <tr>
                                <th>CATEGORIE</th>
                                <th>CODE</th>
                                <th>DESIGNATION</th>
                                <th>QUANTITE</th>
                                <th class="hidden">QUANTITE</th>
                                <th>PRIX UNITAIRE</th>
                                <th>PRIX TOTAL</th>
                                <th>APPARIEL</th>

                            </tr>
                        </thead>
                        <tbody id="tbody">
                            <c:forEach items="${listeoperation}" var="list">
                                <tr class="produits">

                                    <td class="categories col-lg-3" ><c:out value="${list.getCategorie()}"/></td>
                                    <td class="code"><c:out value="${list.getCodeProduit()}"/></td>
                                    <td class="designation"><c:out value="${list.getDesignation()}"/></td>
                                    <td class="qteu"><f:formatNumber value="${list.getQuantite()}" type="NUMBER"/></td>
                                    <td class="qteuc hidden"><input class="newvalcc" type='text' id='qteu'  /></td>
                                    <td class="pu"><f:formatNumber value="${list.getPrix()}" type="CURRENCY"/></td>
                                    <td class="pt"><f:formatNumber value="${list.getPrixTotal()}"type="CURRENCY" currencySymbol="FCFA"/></td>
                                    <c:if test="${not empty list.getAppariel()}">
                                        <td class="app"><c:out value="${list.getAppariel()}"/></td>
                                    </c:if>

                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                </div>
                <hr>
                <div class="row-fluid layout-gt-xs-row layout-xs-column">
                    <button  class="btn btn-success save flex-gt-xs-15 flex-xs" style="border-radius: 5px"><i class="icon-save"></i> Enregistrer</button>

                    <button  class="btn btn-danger flex-gt-xs-15 flex-xs" style="border-radius: 5px" id="deleteOneCMS"><i class="icon-remove-sign"></i> Supprimer</button>

                </div>

            </c:if>
            <c:if test="${not empty commandesEncour}">
                <h2><i class="icon-shopping-cart"></i> Vos Commandes Non Réceptionnés</h2>
                <div class="widget">
                    <div class="widget-title">
                        <h4><i class="icon-reorder"></i>Vos Commandes Non Réceptionnés</h4>
                        <span class="tools">
                            <a href="javascript:;" class="icon-chevron-down"></a>

                        </span>
                    </div>
                    <div class="widget-body">
                        <div class="bs-docs-example">
                            <table class="table table-hover table-responsive table-bordered simpletable"cellspacing="0" width="100%" >
                                <thead class="text-primary">
                                    <tr>
                                        <th>DESIGNATION</th>
                                        <th>QUANTITE</th>
                                        <th>APPARIEL</th>
                                        <th>DATE</th>
                                        <th>Etat</th>
                                    </tr>
                                </thead>
                                <tbody id="tbody">
                                    <c:set var="perso" value="${0}"></c:set>
                                    <c:forEach items="${commandesEncour}" var="list">
                                        <tr class="produits">
                                            <td class="designation"><c:out value="${list.getDesignations()}"/></td>
                                            <td class="qteu"><f:formatNumber value="${list.getQuantite()}" type="NUMBER"/></td>
                                            <td class="app"><c:out value="${list.getCodeAppareil().getNumeroParck()}"/></td>
                                            <td class="date"><f:formatDate value="${list.getDate()}" type="BOTH" dateStyle="MEDIUM" timeStyle="MEDIUM"/></td>
                                            <td class="app"><c:out value="${list.getEtatCommande()}"/></td>
                                        </tr>
                                        <c:set var="perso" value="${list.getIdPersonnel().getIdPersonnel()}"></c:set>
                                    </c:forEach>

                                </tbody>
                            </table>
                            <hr>

                            <a href="Commande_All_Client?vue=${vue}&action=ApprobationCommandePersonnel&magasin=MS&personnel=${perso}">  <button type="button" class="btn btn-success  btn-primary " ><i class="icon-user"></i> Oui J'ais récupéré ces Articles</button></a>

                        </div>
                        <div class="space20"></div>
                    </div>
                </div>
            </c:if>
            <hr>
            <c:if test="${not empty message.getMessage()}">
                <div class="alert alert-danger span12 text-center error_message hidden "><strong><c:out value="${message.getMessage()}"/></strong></div>
                    </c:if>
            <div class="space20"></div>
            <div class="space20"></div>
        </div>
    </div>
</div>

