<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <c:import url="Header.jsp"/>



        <link rel="icon" href="images/gci.png" >


    </head>
    <!-- END HEAD -->
    <!-- BEGIN BODY -->
    <body class="fixed-top">

        <div id="header" class="navbar navbar-inverse navbar-fixed-top">
            <!-- BEGIN TOP NAVIGATION BAR -->
            <div class="navbar-inner">
                <div class="container-fluid">
                    <!--BEGIN SIDEBAR TOGGLE-->
                    <div class="sidebar-toggle-box hidden-phone">
                        <div class="icon-reorder tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
                    </div>
                    <!--END SIDEBAR TOGGLE-->
                    <!-- BEGIN LOGO -->
                    <a class="brand" href="#" >
                        <img alt="Brasseries Du Cameroun" src="photo/${sessionScope.societe.getLogo()}" style="height: 40px; width: 160px; margin-top: -10px">
                    </a>
                    <!-- END LOGO -->
                    <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                    <a class="btn btn-navbar collapsed" id="main_menu_trigger" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="arrow"></span>
                    </a>
                    <!-- END RESPONSIVE MENU TOGGLER -->
                    <div id="top_menu" class="nav notify-row">
                        <!-- BEGIN NOTIFICATION -->
                        <ul class="nav top-menu">
                            <!-- BEGIN SETTINGS -->
                            <!-- END SETTINGS -->
                            <!-- BEGIN INBOX DROPDOWN -->
                            <li class="dropdown" id="header_inbox_bar">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="icon-envelope-alt"></i>
                                    <span class="badge badge-important">0</span>
                                </a>
                                <ul class="dropdown-menu extended inbox">
                                    <li>
                                        <p>You have 5 new messages</p>
                                    </li>
                                    <li>
                                        <a href="#">See all messages</a>
                                    </li>
                                </ul>
                            </li>
                            <!-- END INBOX DROPDOWN -->
                            <!-- BEGIN NOTIFICATION DROPDOWN -->
                            <li class="dropdown" id="header_notification_bar">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">

                                    <i class="icon-bell-alt"></i>
                                    <span class="badge badge-warning nombreNotifs"></span>
                                </a>
                                <ul class="dropdown-menu extended notification"region="${sessionScope.personnel.getService().getSite().getRegion().getNomRegion()}" id="${sessionScope.personnel.getIdPersonnel()}">



                                </ul>
                            </li>
                            <!-- END NOTIFICATION DROPDOWN -->
                        </ul>
                    </div>
                    <!-- END  NOTIFICATION -->
                    <div class="top-nav ">
                        <ul class="nav pull-right top-menu" >
                            <!-- BEGIN SUPPORT -->
                            <li class="dropdown mtop5">

                                <a class="dropdown-toggle element" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="Chat">
                                    <i class="icon-comments-alt"></i>
                                </a>
                            </li>
                            <li class="dropdown mtop5">
                                <a class="dropdown-toggle element" data-placement="bottom" data-toggle="tooltip" href="${sessionScope.lien13}" data-original-title="envoyer un Mail">
                                    <i class="icon-mail-forward"></i>
                                </a>
                            </li>
                            <!-- END SUPPORT -->
                            <!-- BEGIN USER LOGIN DROPDOWN -->
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">

                                    <span class="icon-user username"> ${sessionScope.personnel.getNomPrenom()} </span>
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu extended logout">
                                    <c:if test="${not empty sessionScope.ChangePasseMP or not empty sessionScope.ApparielMP or not empty sessionScope.OperationMP or not empty sessionScope.InfoMP or not empty sessionScope.CommandeCourMP}">
                                        <li><a href="commandeSimple?action=editpersonnel&vue=profile"><i class="icon-user"></i> Mon Profile</a></li>
                                        </c:if>
                                        <c:if test="${not empty sessionScope.DeconnexionMP}">
                                        <li><a href="authentification?action=faut"><i class="icon-off"></i> Deconnexion</a></li>
                                        </c:if>
                                </ul>
                            </li>
                            <a class="brand" href="#" >
                                <img alt="GCI" src="images/gci.png" style="height: 40px; width: 160px; margin-top: -16px;margin-left: 10px">
                            </a><!-- END USER LOGIN DROPDOWN -->
                        </ul>
                        <!-- END TOP NAVIGATION MENU -->
                    </div>

                </div>
            </div>
            <!-- END TOP NAVIGATION BAR -->
        </div>
        <!-- END HEADER -->
        <!-- BEGIN CONTAINER -->
        <div id="container" class="row-fluid">
            <!-- BEGIN SIDEBAR -->
            <div class="sidebar-scroll">
                <div id="sidebar" class="nav-collapse collapse">

                    <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
                    <div class="navbar-inverse">
                        <form class="navbar-search visible-phone">
                            <input type="text" class="search-query" placeholder="Search" />
                        </form>
                    </div>


                    <!-- END RESPONSIVE QUICK SEARCH FORM -->
                    <!-- BEGIN SIDEBAR MENU -->
                    <ul class="sidebar-menu">
                        <li class="sub-menu <c:if test="${vue=='Accueil'}"> active</c:if>">
                                <a class="" href="StatistiqueMP?vue=Accueil&action=autre">
                                    <i class="icon-home"></i>
                                    <span>ACCUEIL</span>
                                </a>
                            </li>



                            <li class="sub-menu <c:if test="${vue=='etablirOA' or vue=='autorisation' or vue=='caisse' or vue=='Commandes En Cours'or vue=='depenses' or vue=='depensesExterne' or vue=='depensesMission' or vue=='Suivi Transfert' or vue=='Traitement Commande' or vue=='Bordereau' or vue=='Commande Interne'or vue=='Etat Traitement Commandes Passés' or vue=='Commande' or vue == 'CommandeTraiter' or vue == 'Historique Commande'}"> active</c:if>">
                                <a href="javascript:;" class="">
                                    <i class="icon-cogs"></i>
                                    <span>Traitement</span>
                                    <span class="arrow"></span>
                                </a>
                                <ul class="sub">
                                <c:if test="${1==2}">
                                    <c:if test="${not empty sessionScope.lien78 or not empty sessionScope.lien80 or not empty sessionScope.lien81 or not empty sessionScope.lien82}">
                                        <li class="sub-menu <c:if test="${vue=='depenses' }">active</c:if>">
                                                <a class="" href="depense?vue=depenses&action=depenses&one=yes&isnew=yes">

                                                    <span>Demande engagement dépense non stockés</span>
                                                </a>
                                            </li>
                                    </c:if>
                                </c:if>
                                <c:if test="${not empty sessionScope.lien6}">
                                    <li class="sub-menu  <c:if test="${vue=='Commande Interne'}"> active</c:if>"><a class="" href="passerCommande?vue=Commande Interne&action=init"><span>Consommer article</span> </a></li>
                                    </c:if>
                                    <c:if test="${not empty sessionScope.lien76 or not empty sessionScope.lien80 or not empty sessionScope.lien81 or not empty sessionScope.lien82}">
                                    <li class="sub-menu <c:if test="${vue=='depensesMission' }">active</c:if>">
                                            <a class="" href="depense?vue=depensesMission&action=depenses&one=yes&isnew=yes">

                                                <span>Soumettre ordre de Mission</span>
                                            </a>
                                        </li>
                                </c:if>
                                <c:if test="${not empty sessionScope.lien77 or not empty sessionScope.lien80 or not empty sessionScope.lien81 or not empty sessionScope.lien82}">
                                    <li class="sub-menu <c:if test="${vue=='depensesExterne' }">active</c:if>">
                                            <a class="" href="depense?vue=depensesExterne&action=depenses&one=yes&isnew=yes">

                                                <span>Effectuer une depense </span>
                                            </a>
                                        </li>
                                </c:if>
                                <c:if test="${not empty sessionScope.CommandeTraiterMP or not empty sessionScope.CommandeRecepMP or not empty sessionScope.CommandeNonRecepMP or not empty sessionScope.PasserCommandeMP or not empty sessionScope.CommandeNonRecepMP or not empty sessionScope.lien7 }">
                                    <li class=" <c:if test="${vue=='Commande' or vue=='Commandes En Cours' or vue=='Bordereau' or vue=='CommandeTraiter' or vue=='Etat Traitement Commandes Passés' or vue=='Historique Commande'}"> active</c:if>"><a class="" href="passerCommande?vue=Commande&action=init">Commande fournisseur</a></li>
                                    </c:if>
                                  
                                    <c:if test="${not empty sessionScope.lien5 or not empty sessionScope.lien11}">
                                    <li class=" <c:if test="${vue=='Traitement Commande' or vue=='Suivi Transfert'}"> active</c:if>"><a class="" href="${sessionScope.lien5}">magasin secondaire</a></li>
                                    </c:if>
   
                                    <c:if test="${not empty sessionScope.lien79 or not empty sessionScope.lien83}">
                                        <c:if test="${1==2 }">
                                        <li class="sub-menu <c:if test="${vue=='validerOA'}">active</c:if>">
                                                <a class="" href="validerDepense?vue=validerDemande&action=validerDemande">

                                                    <span>Valider engagement de depense</span>
                                                </a>
                                            </li>
                                    </c:if>
                                </c:if>
                                <c:if test="${not empty sessionScope.lien91}">
                                    <li class="sub-menu <c:if test="${vue=='autorisation' }">active</c:if>">
                                            <a class="" href="depense?vue=caisse&action=depenses">

                                                <span>Caisse</span>
                                            </a>
                                        </li>
                                </c:if>
                                <c:if test="${not empty sessionScope.lien89}">
                                    <li class="sub-menu <c:if test="${vue=='autorisation' }">active</c:if>">
                                            <a class="" href="depense?vue=autorisation&action=depenses">

                                                <span>autoriser un engagement</span>
                                            </a>
                                        </li>
                                </c:if>
                                <c:if test="${not empty sessionScope.lien80}">

                                    <li class="sub-menu <c:if test="${vue=='etablirOA' }">active</c:if>">
                                            <a class="" href="depense?vue=etablirOA&action=depenses">

                                                <span>Etablir OA</span>
                                            </a>
                                        </li>
                                </c:if>

                            </ul>
                        </li>

                        <li class="sub-menu <c:if test="${vue=='Etat de Stock' or vue=='Etat de consommation'}"> active</c:if>">
                                <a href="javascript:;" class="">
                                    <i class="icon-book"></i>
                                    <span>Etat stock magasin</span>
                                    <span class="arrow"></span>
                                </a>
                                <ul class="sub">
                                <c:if test="${not empty sessionScope.lien8}">
                                    <li class=" <c:if test="${vue=='Etat de Stock'}"> active</c:if>"><a class="" href="${sessionScope.lien8}">Stock magasin</a></li>
                                    </c:if>
                                    <c:if test="${not empty sessionScope.lien10}">
                                    <li class=" <c:if test="${vue=='Etat de consommation'}"> active</c:if>"><a class="" href="${sessionScope.lien10}">Etat des sorties</a></li>
                                    </c:if>
                                <!--  <li><a class="" href="passerCommande?vue=Commande&action=consulterCommandeMP_OK">COMMANDES OK</a></li>  -->

                            </ul>
                        </li>

                        <li class="sub-menu <c:if test="${vue=='Inventaire' or vue=='Mouvement Produits' or vue=='Historique inventaire' }"> active</c:if>">
                                <a href="javascript:;" class="">
                                    <i class="icon-tasks"></i>
                                    <span>Inventaire</span>
                                    <span class="arrow"></span>
                                </a>
                                <ul class="sub">
                                <c:if test="${not empty sessionScope.lien1}">
                                    <li class=" <c:if test="${vue=='Inventaire'}"> active</c:if>"><a class="" href="${sessionScope.lien1}">Effectuer inventaire</a></li>
                                    </c:if>
                                    <c:if test="${not empty sessionScope.lien2}">
                                    <li class=" <c:if test="${vue=='Historique inventaire'}"> active</c:if>"><a class="" href="${sessionScope.lien2}">Historique inventaire</a></li>
                                    </c:if>
                                    <c:if test="${not empty sessionScope.MouvEntrerMP or not empty sessionScope.MouvSortiMP}">
                                    <li class=" <c:if test="${vue=='Mouvement Produits'}"> active</c:if>"><a class="" href="ListeProduitMP?vue=Mouvement Produits&action=all_produit">Etat inventaire d'un article</a></li>
                                    </c:if>
                            </ul>
                        </li>
                        <c:if test="${not empty sessionScope.StatistiqueEntrerMP or not empty sessionScope.StatistiqueSortiMP}">

                            <li class="sub-menu <c:if test="${vue=='reportingDepense'or vue == 'rapport'}">active</c:if>">
                                    <a href="javascript:;">
                                        <i class="icon-signal"></i>
                                        <span>Reporting</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub">


                                        <li class="sub-menu <c:if test="${vue=='reportingDepense'}"> active</c:if>">
                                            <a class="" href="validerDepense?vue=reportingDepense&action=reporting">

                                                <span>Listing Depense</span>
                                            </a>
                                        </li>
                                        <li class="sub-menu <c:if test="${vue=='rapport'}"> active</c:if>">
                                        <a class="" href="RedirectionVue?&vue=rapport&id_magasinP=${sessionScope.id_magasinP}&niveau=3">

                                            <span>Listing consommation</span>
                                        </a>
                                    </li>

                                </ul>
                            </li>
                        </c:if>
                        <c:if test="${not empty sessionScope.StatistiqueEntrerMP or not empty sessionScope.StatistiqueSortiMP}">
                            <li class="sub-menu <c:if test="${vue=='Statistique'or vue == 'tableauDeBord'}">active</c:if>">
                                    <a href="javascript:;">
                                        <i class="icon-dashboard"></i>
                                        <span>Tableau de bord</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub">
                                        <li class="sub-menu <c:if test="${vue=='tableauDeBord'}"> active</c:if>">
                                            <a class="" href="validerDepense?vue=tableauDeBord&action=tableaubord">

                                                <span>Depense</span>
                                            </a>
                                        </li>
                                    <c:if test="${not empty sessionScope.StatistiqueEntrerMP or not empty sessionScope.StatistiqueSortiMP}">
                                        <li class="sub-menu <c:if test="${vue=='Statistique'}"> active</c:if>">
                                                <a class="" href="StatistiqueMP?vue=Statistique&action=state">

                                                    <span>consommation</span>
                                                </a>
                                            </li>
                                    </c:if>





                                </ul>
                            </li>
                        </c:if>
                        <c:if test="${not empty sessionScope.EcranMP}">
                            <li>
                                <a class="" href="<c:url value="lock.jsp"></c:url>">
                                        <i class="icon-screenshot"></i>
                                        <span>Verrouillé L'Écran</span>
                                    </a>
                                </li>
                        </c:if>
                    </ul>

                    <!-- END SIDEBAR MENU -->
                </div>
            </div>
            <!-- END SIDEBAR -->
            <!-- BEGIN PAGE -->
            <div id="main-content">
                <!-- BEGIN PAGE CONTAINER-->
                <div class="container-fluid">
                    <!-- BEGIN THEME CUSTOMIZER-->

                    <!-- END THEME CUSTOMIZER-->
                    <!-- BEGIN PAGE TITLE & BREADCRUMB-->

                    <!-- END PAGE TITLE & BREADCRUMB-->
                    <c:if test="${not empty sessionScope.lien9}">

                        <c:if test="${sessionScope.etat == 'danger'}">

                            <div class="hidden-phone theme-change">
                                <span class="settings">
                                    <a  href="${sessionScope.lien9}" class="btn btn-danger popovers"   data-trigger="hover" data-placement="bottom" data-content="passer une commande pour le magasin" data-original-title="stock critique" id="pulsate-regular">alert <c:out value="${sessionScope.tail}"/>  produit(s) critique(s) en stock </a>

                                </span>

                            </div>
                            <div class="space20"></div>
                        </c:if>

                        <c:if test="${sessionScope.etat1 == 'warning'}">

                            <div class="hidden-phone theme-change">
                                <span class="settings">
                                    <a  href="${sessionScope.lien9}" class="btn btn-warning popovers"   data-trigger="hover" data-placement="bottom" data-content="passer une commande pour le magasin" data-original-title="stock critique" id="pulsate-regular">alert <c:out value="${sessionScope.taill}"/>  produit(s) critique(s) en stock </a>

                                </span>

                            </div>
                            <div class="space20"></div>
                        </c:if>

                    </c:if>

                    <c:if test="${vue=='rapport'}">
                        <c:import url="/WEB-INF/magasignierP/Allstatistiques.jsp"/>
                    </c:if>
                    <c:if test="${vue=='Accueil'}">
                        <c:import url="Accueil.jsp"/>
                    </c:if>
                    <c:if test="${vue=='caisse'}">
                        <div class="space20"></div>
                        <h3 class="page-title">
                            ${vue}
                        </h3>
                        <ul class="breadcrumb">
                            <li>
                                <a href="RedirectionVue?vue=Accueil"><i class="icon-home"></i> Home</a>
                                <span class="divider">/</span>
                            </li>
                            <li>
                                <a href="#">Gestion de la caisse</a>

                            </li>

                            <li class="pull-right search-wrap">
                                <form action="search_result.html" class="hidden-phone">
                                    <div class="input-append search-input-area">
                                        <input class="" id="appendedInputButton" type="text">
                                        <button class="btn" type="button"><i class="icon-search"></i> </button>
                                    </div>
                                </form>
                            </li>
                        </ul>
                        <c:import url="/WEB-INF/common/Caisse.jsp"/>
                    </c:if>
                    <c:if test="${vue=='depenses' or vue== 'depensesMission' or vue== 'depensesExterne'}">
                        <h3 class="page-title">
                            ${vue}
                        </h3>
                        <ul class="breadcrumb">
                            <li>
                                <a href="StatistiqueMP?vue=Accueil&action=autre"><i class="icon-home"></i> Home</a>
                                <span class="divider">/</span>
                            </li>
                            <li>
                                <a href="#">Engagement de depense</a>

                            </li>

                            <li class="pull-right search-wrap">
                                <form action="" class="hidden-phone">
                                    <div class="input-append search-input-area">
                                        <input class="" id="appendedInputButton" type="text">
                                        <button class="btn" type="button"><i class="icon-search"></i> </button>
                                    </div>
                                </form>
                            </li>
                        </ul>
                        <c:import url="/WEB-INF/common/depenses.jsp"/>
                    </c:if>
                    <c:if test="${vue=='validerDemande'}">

                        <c:import url="/WEB-INF/common/ValiderOA.jsp"/>
                    </c:if>
                    <c:if test="${vue=='etablirOA'}">
                        <h3 class="page-title">
                            ${vue}
                        </h3>
                        <ul class="breadcrumb">
                            <li>

                                <a href="admin?vue=accueil&action=getAll"><i class="icon-home"></i> Home</a>
                                <span class="divider">/</span>
                            </li>
                            <li>
                                <a href="#"><i class="icon-group"></i> Etablir OA</a>

                            </li>

                            <li class="pull-right search-wrap">
                                <form action="search_result.html" class="hidden-phone">
                                    <div class="input-append search-input-area">
                                        <input class="" id="appendedInputButton" type="text">
                                        <button class="btn" type="button"><i class="icon-search"></i> </button>
                                    </div>
                                </form>
                            </li>
                        </ul>
                        <c:import url="/WEB-INF/common/EtablirOADemande.jsp"/>
                    </c:if>
                    <c:if test="${vue=='autorisation'}">
                        <h3 class="page-title">
                            ${vue}
                        </h3>
                        <ul class="breadcrumb">
                            <li>

                                <a href="admin?vue=accueil&action=getAll"><i class="icon-home"></i> Home</a>
                                <span class="divider">/</span>
                            </li>
                            <li>
                                <a href="#"><i class="icon-group"></i> Valider demande</a>

                            </li>

                            <li class="pull-right search-wrap">
                                <form action="search_result.html" class="hidden-phone">
                                    <div class="input-append search-input-area">
                                        <input class="" id="appendedInputButton" type="text">
                                        <button class="btn" type="button"><i class="icon-search"></i> </button>
                                    </div>
                                </form>
                            </li>
                        </ul>
                        <c:import url="/WEB-INF/common/autorisationOA.jsp"/>
                    </c:if>
                    <c:if test="${vue=='reportingDepense'}">
                        <h3 class="page-title">
                            ${vue}
                        </h3>
                        <ul class="breadcrumb">
                            <li>
                                <a href="StatistiqueMP?vue=Accueil&action=autre"><i class="icon-home"></i> Home</a>
                                <span class="divider">/</span>
                            </li>
                            <li>
                                <a href="#">Valider demande</a>

                            </li>

                            <li class="pull-right search-wrap">
                                <form action="" class="hidden-phone">
                                    <div class="input-append search-input-area">
                                        <input class="" id="appendedInputButton" type="text">
                                        <button class="btn" type="button"><i class="icon-search"></i> </button>
                                    </div>
                                </form>
                            </li>
                        </ul>
                        <c:import url="/WEB-INF/common/statistiqueDepense.jsp"/>
                    </c:if>
                    <c:if test="${vue=='tableauDeBord'}">

                        <c:import url="/WEB-INF/common/TableauDeBord.jsp"/>
                    </c:if>
                    <c:if test="${vue=='Inventaire'}">

                        <c:import url="/WEB-INF/magasignierP/UpdateProduitsMP.jsp"/>

                    </c:if>

                    <c:if test="${vue=='profile'}">

                        <c:import url="/WEB-INF/magasignierP/profile.jsp"/>

                    </c:if>

                    <c:if test="${vue=='Mouvement Produits'}">

                        <c:import url="/WEB-INF/magasignierP/historique_produit.jsp"/>

                    </c:if>

                    <c:if test="${vue=='Ajouter Un Stock'}">
                        <c:import url="/WEB-INF/magasignierP/addStockMagP.jsp"/>
                    </c:if>

                   

                    <c:if test="${vue=='Historique inventaire'}">

                        <c:import url="/WEB-INF/magasignierP/HistoriqueInventaireMP.jsp"/>

                    </c:if>

                    <c:if test="${vue=='Traitement Commande' or vue=='Suivi Transfert'}">

                        <c:import url="/WEB-INF/magasignierP/ShowCommandeMS.jsp"/>

                    </c:if>

                    <c:if test="${vue=='Commande'  or vue=='Commandes En Cours' or vue=='Bordereau' or vue=='CommandeTraiter' or vue=='Etat Traitement Commandes Passés' or vue=='Historique Commande'}">

                        <c:import url="/WEB-INF/magasignierP/CommandeMPForm.jsp"/>

                    </c:if>
                  
                 
                    <c:if test="${vue=='Statistique'}">

                        <c:import url="/WEB-INF/magasignierP/statistiqueMP.jsp"/>

                    </c:if>
                    <c:if test="${vue=='Etat de Stock'}">

                        <c:import url="/WEB-INF/magasignierP/ListeproduitMP.jsp"/>

                    </c:if>
                  

                    

                    <c:if test="${vue=='showBordereauMP'}">

                        <c:import url="/WEB-INF/magasignierP/showBordereauMP.jsp"/>

                    </c:if>

                    <c:if test="${vue=='Etat de consommation'}">

                        <c:import url="/WEB-INF/magasignierP/EtatPeriodiqueMP.jsp"/>

                    </c:if>
                    <c:if test="${vue=='alertProduit'}">

                        <c:import url="/WEB-INF/magasignierP/alertProduitMP.jsp"/>

                    </c:if>
                    <c:if test="${deconnexion=='faut'}">
                        <c:redirect url="login.jsp"/>
                    </c:if>

                    <c:if test="${vue=='Commande Interne'}">

                        <c:import url="/WEB-INF/magasignierP/CommandeClient.jsp"/>

                    </c:if>

                    <c:if test="${vue=='Contact'}">
                        <c:import url="/WEB-INF/magasignierP/sendmessage.jsp"/>
                    </c:if>
                    <c:if test="${vue=='notification'}">
                        <c:import url="/WEB-INF/common/notifications.jsp"/>
                    </c:if>
                    <c:if test="${vue=='agenda'}">
                        <c:import url="/WEB-INF/common/agendaOder.jsp"/>
                    </c:if>

                    <c:if test="${vue=='contact'}">
                        <c:import url="/WEB-INF/common/contact.jsp"/>
                    </c:if>
                    <c:if test="${vue=='about'}">
                        <c:import url="/WEB-INF/common/about.jsp"/>
                    </c:if>

                </div>


            </div>

            <!-- END PAGE CONTENT-->
        </div>
        <!-- END PAGE CONTAINER-->


        <!-- END CONTAINER -->

        <!-- BEGIN FOOTER -->
        <div class="row-fluid">
            <c:import url="/WEB-INF/common/foot.jsp"/>
        </div>
        <!-- END FOOTER -->
        <c:import url="footer.jsp"/>

    </body>
    <!-- END BODY -->
</html>