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
    <body class="fixed-top" onbeforeunload="chargement()" onloadeddata="chargement()">

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
                        <img alt="GIC" src="photo/${sessionScope.societe.getLogo()}" style="height: 40px; width: 160px; margin-top: -10px">
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
                                    <span class="badge badge-warning nombreNotifs">0</span>
                                </a>
                                <ul class="dropdown-menu extended notification" region="${sessionScope.personnel.getService().getSite().getRegion().getNomRegion()}" id="${sessionScope.personnel.getIdPersonnel()}">

                                    <li>
                                        <a href="#">See all messages</a>
                                    </li>

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
                                <a class="dropdown-toggle element" data-placement="bottom" data-toggle="tooltip" href="${sessionScope.lien3}" data-original-title="Envoyer un Mail">
                                    <i class="icon-mail-forward"></i>
                                </a>
                            </li>
                            <!-- END SUPPORT -->
                            <!-- BEGIN USER LOGIN DROPDOWN -->
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">

                                    <span class="icon-user"> ${sessionScope.personnel.getNomPrenom()} </span>
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu extended logout">
                                    <c:if test="${not empty sessionScope.ChangePasseControl or not empty sessionScope.ApparielControl or not empty sessionScope.OperationControl or not empty sessionScope.InfoControl or not empty sessionScope.CommandeCourControl}">
                                        <li><a href="ValiderCommande?vue=profile&action=autre"><i class="icon-user"></i> Mon Profile</a></li>
                                        </c:if>
                                        <c:if test="${not empty sessionScope.DeconnexionControl}">
                                        <li><a href="${sessionScope.DeconnexionControl}"><i class="icon-off"></i> Deconnexion</a></li>
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
                                <a class="" href="ValiderCommande?vue=Accueil&action=autre">
                                    <i class="icon-home"></i>
                                    <span>ACCUEIL</span>
                                </a>
                            </li>


                        <c:if test="${not empty sessionScope.lien78 or not empty sessionScope.lien77 or not empty sessionScope.lien76 or not empty sessionScope.lien80 or not empty sessionScope.lien81 or not empty sessionScope.lien82 or not empty sessionScope.lien83 or not empty sessionScope.commandePerso  or not empty sessionScope.lien1 or not empty sessionScope.lien2}">
                            <li class="sub-menu <c:if test="${vue=='etablirOA' or vue=='autorisation' or vue=='caisse' or vue=='Vos Commandes'or vue=='depenses' or vue=='depensesExterne' or vue=='depensesMission' or vue == 'CommandeClient'or vue=='Commande Personnel' or vue=='Commandes a Traiter'}">active</c:if>">
                                    <a href="javascript:;">
                                        <i class="icon-cogs"></i>
                                        <span>Traitement</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub">
                                    <c:if test="${not empty sessionScope.lien76 or not empty sessionScope.lien80 or not empty sessionScope.lien81 or not empty sessionScope.lien82}">
                                        <c:if test="${not empty sessionScope.lien77 or not empty sessionScope.lien80 or not empty sessionScope.lien81 or not empty sessionScope.lien82}">
                                            <li class="sub-menu <c:if test="${vue=='depensesExterne' }">active</c:if>">
                                                    <a class="" href="depense?vue=depensesExterne&action=depenses&&one=yesisnew=yes">

                                                        <span>Effectuer une depense</span>
                                                    </a>
                                                </li>
                                        </c:if>
                                        <c:if test="${not empty sessionScope.lien1}">
                                            <li class="sub-menu <c:if test="${vue=='Commande Personnel' or vue == 'CommandeClient'}"> active</c:if>">
                                                <a class="" href="${sessionScope.lien1}">

                                                    <span>Consommer article</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:if test="${not empty sessionScope.commandePerso}">
                                            <li class="<c:if test="${vue=='Vos Commandes'}"> active</c:if>">
                                                    <a class="" href="Commande_All_Client?vue=Vos Commandes&action=redirect&magasin=controleur">

                                                        <span>Réceptionner article stocké</span>
                                                    </a>
                                                </li>
                                        </c:if>
                                        <li class="sub-menu <c:if test="${vue=='depensesMission' }">active</c:if>">
                                                <a class="" href="depense?vue=depensesMission&action=depenses&&one=yesisnew=yes">

                                                    <span>Soumettre ordre de Mission</span>
                                                </a>
                                            </li>
                                        <c:if test="${not empty sessionScope.lien79 or not empty sessionScope.lien83}">
                                            <li class="sub-menu <c:if test="${vue=='validerOA'}"> active</c:if>">
                                                    <a class="" href="validerDepense?vue=validerDemande&action=validerDemande">

                                                        <span>Valider engagement de depense</span>
                                                    </a>
                                                </li>
                                        </c:if>
                                        <c:if test="${not empty sessionScope.lien2}">
                                            <li class="sub-menu <c:if test="${vue=='Commandes a Traiter'}"> active</c:if>">
                                                <a class="" href="${sessionScope.lien2}">

                                                    <span>Valider commande M.P</span>
                                                </a>
                                            </li>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${1==2 }">
                                        <c:if test="${not empty sessionScope.lien78 or not empty sessionScope.lien80 or not empty sessionScope.lien81 or not empty sessionScope.lien82}">
                                            <li class="sub-menu <c:if test="${vue=='depenses' }">active</c:if>">
                                                    <a class="" href="depense?vue=depenses&action=depenses&one=yes&isnew=yes">

                                                        <span>Demande d'engagement de depense divers</span>
                                                    </a>
                                                </li>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${not empty sessionScope.lien91}">
                                        <li class="sub-menu <c:if test="${vue=='caisse' }">active</c:if>">
                                                <a class="" href="depense?vue=caisse&action=depenses">

                                                    <span>Gestion Caisse</span>
                                                </a>
                                            </li>
                                    </c:if>
                                    <c:if test="${not empty sessionScope.lien89}">
                                        <li class="sub-menu <c:if test="${vue=='autorisation' }">active</c:if>">
                                                <a class="" href="depense?vue=autorisation&action=depenses">

                                                    <span>autoriser engagement</span>
                                                </a>
                                            </li>
                                    </c:if>
                                    <c:if test="${not empty sessionScope.lien80}">

                                        <li class="sub-menu <c:if test="${vue=='etablirOA' }">active</c:if>">
                                                <a class="" href="depense?vue=etablirOA&action=depenses">

                                                    <span>Etablir OA/OP</span>
                                                </a>
                                            </li>
                                    </c:if>
                                </ul>
                            </li>
                        </c:if>


                        <c:if test="${1==2}">
                            <c:if test="${not empty sessionScope.MouvEMSControl or not empty sessionScope.MouvSMSControl or not empty sessionScope.StatistiqueMS or not empty sessionScope.StockMSControl or not empty sessionScope.ConsGeneralMSControl }">
                                <li class="sub-menu <c:if test="${vue=='Historique MS'}">active</c:if>">
                                        <a href="javascript:;">
                                            <i class="icon-shopping-cart "></i>
                                            <span>Magasin Secondaire</span>
                                            <span class="arrow"></span>
                                        </a>
                                        <ul class="sub">
                                        <c:forEach items="${secondaires}" var="secon">
                                            <li>
                                                <a href="listeproduit?vue=Historique MS&action=rien&niveau=4&id_magasin=${secon.getIdMagasin()}" class=" " >${secon.getNomMagasin()}</a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </li>
                            </c:if>
                            <c:if test="${not empty sessionScope.MouvEMPControl or not empty sessionScope.MouvSMPControl or not empty sessionScope.StatistiqueMP or not empty sessionScope.StockMPControl or not empty sessionScope.ConsGeneralMPControl}">
                                <li class="sub-menu <c:if test="${vue=='Historique MP'}">active</c:if>">
                                        <a href="javascript:;">
                                            <i class="icon-shopping-cart "></i>
                                            <span>Magasin Principal</span>
                                            <span class="arrow"></span>
                                        </a>
                                        <ul class="sub">
                                        <c:forEach items="${principals}" var="secon">
                                            <li>
                                                <a href="ListeProduitMP?vue=Historique MP&action=rien&niveau=4&id_magasinP=${secon.getIdMagasin()}" class=" " >${secon.getNomMagasin()}</a>

                                            </li>
                                        </c:forEach>
                                    </ul>
                                </li>
                            </c:if>
                        </c:if>
                        <c:if test="${not empty sessionScope.reporting   or not empty sessionScope.lien75}">
                            <li class="sub-menu <c:if test="${vue=='statistiques'or   vue == 'reportingDepense'}">active</c:if>">
                                    <a href="javascript:;">
                                        <i class="icon-signal"></i>
                                        <span>Reporting</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub">
                                    <c:if test="${not empty sessionScope.lien75}">
                                        <li class="sub-menu <c:if test="${vue=='reportingDepense'}"> active</c:if>">
                                                <a class="" href="validerDepense?vue=reportingDepense&action=reporting">

                                                    <span>Listing depense</span>
                                                </a>
                                            </li>
                                    </c:if>

                                    <c:if test="${not empty sessionScope.reporting}">
                                        <li class="<c:if test="${vue=='statistiques'}"> active</c:if>">
                                                <a class="" href="parametre?vue=statistiques&action=consommationSociete&niveau=4">

                                                    <span>Listing consommation</span>
                                                </a>
                                            </li>
                                    </c:if>


                                </ul>
                            </li>
                        </c:if>
                        <c:if test="${not empty sessionScope.lien74 or not empty sessionScope.tableauBord or not empty sessionScope.budget or not empty sessionScope.OperationControl}">
                            <li class="sub-menu <c:if test="${vue=='tableauDeBord'or vue == 'rapport' or vue == 'Budget Regional'or vue == 'Vos Etats De Consommations'}">active</c:if>">
                                    <a href="javascript:;">
                                        <i class="icon-dashboard"></i>
                                        <span>Tableau de bord</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub">

                                    <c:if test="${not empty sessionScope.lien74}">
                                        <li class="sub-menu <c:if test="${vue=='tableauDeBord'}"> active</c:if>">
                                                <a class="" href="validerDepense?vue=tableauDeBord&action=tableaubord">

                                                    <span>Depense</span>
                                                </a>
                                            </li>
                                    </c:if>
                                    <c:if test="${not empty sessionScope.tableauBord or not empty sessionScope.OperationControl}">
                                        <li class="<c:if test="${vue=='rapport'}"> active</c:if>">
                                                <a class="" href="tableau_de_Bord?action=allRapport&vue=rapport">

                                                    <span>Consommation</span>
                                                </a>
                                            </li>
                                    </c:if>

                                    <c:if test="${not empty sessionScope.budget}">
                                        <li class="<c:if test="${vue=='Budget Regional'}"> active</c:if>">
                                                <a class="" href="ValiderCommande?action=budgetRegional&vue=Budget Regional">

                                                    <span>Consulter budget par service</span>
                                                </a>
                                            </li>
                                    </c:if>
                                    <c:if test="${not empty sessionScope.OperationControl}">
                                        <li class="<c:if test="${vue=='Vos Etats De Consommations'}"> active</c:if>">
                                                <a class="" href="Commande_All_Client?vue=Vos Etats De Consommations&action=tousa&magasin=controlleur">

                                                    <span>Vos Consommations</span>
                                                </a>
                                            </li>
                                    </c:if>

                                </ul>
                            </li>
                        </c:if>


                        <c:if test="${not empty sessionScope.Ecran}">
                            <li>
                                <a class="" href="<c:url value="lock.jsp"></c:url>">
                                        <i class="icon-screenshot"></i>
                                        <span>Verrouillé L'Écran</span>
                                    </a>
                                </li>
                        </c:if>
                        <c:if test="${1==2}">
                            <c:if test="${not empty sessionScope.lien4 or not empty sessionScope.lien5}">
                                <c:if test="${not empty sessionScope.lien4 }">
                                    <li class="<c:if test="${vue=='Suivi Des Magasins Secondaires'}">active</c:if>">
                                        <a class="" href="<c:url value="ValiderCommande?vue=Suivi Des Magasins Secondaires&action=autre"></c:url>">
                                                <i class="icon-screenshot"></i>
                                                <span>Magasin Secondaire</span>
                                            </a>
                                        </li>
                                </c:if>
                                <c:if test="${not empty sessionScope.lien5}">
                                    <li class="<c:if test="${vue=='Suivi Des Magasins Principaux'}">active</c:if>">
                                        <a class="" href="<c:url value="ValiderCommande?vue=Suivi Des Magasins Principaux&action=autre"></c:url>">
                                                <i class="icon-screenshot"></i>
                                                <span>Magasin Principal</span>
                                            </a>
                                        </li>
                                </c:if>
                            </c:if>
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
                    <c:if test="${vue!='contact' and vue!='about'}">
                        <h3 class="page-title">
                            <c:if test="${vue!='Vos Commandes' and vue!='rapport' and vue!='statistiques' and vue!='Commande Personnel' and vue!='contact' and vue!='about'}"> ${vue}</c:if>
                            <c:if test="${vue=='Vos Commandes'}">Accusé réception articles commandés</c:if>
                            <c:if test="${vue=='rapport'}">Evolution des consommations et budgetaire</c:if>
                            <c:if test="${vue=='statistiques'}">Reporting</c:if>
                            <c:if test="${vue=='Commande Personnel'}">Passer votre commande </c:if>
                            </h3>
                            <ul class="breadcrumb">
                                <li>
                                    <a href="ValiderCommande?vue=Accueil&action=autre"><i class="icon-home"></i> Home</a>
                                    <span class="divider">/</span>
                                </li>
                                <li>
                                    <a href="#">${vue}</a>

                            </li>


                        </ul>
                    </c:if>
                    <!-- END PAGE TITLE & BREADCRUMB-->
                    <c:if test="${vue=='caisse'}">

                        <c:import url="/WEB-INF/common/Caisse.jsp"/>
                    </c:if>
                    <c:if test="${vue=='etablirOA'}">

                        <c:import url="/WEB-INF/common/EtablirOADemande.jsp"/>
                    </c:if>
                    <c:if test="${vue=='autorisation'}">

                        <c:import url="/WEB-INF/common/autorisationOA.jsp"/>
                    </c:if>
                    <c:if test="${vue=='Accueil'}">
                        <c:import url="/WEB-INF/controleurs/Accueil.jsp"/>
                    </c:if>
                    <c:if test="${vue=='depenses' or vue== 'depensesMission' or vue== 'depensesExterne'}">

                        <c:import url="/WEB-INF/common/depenses.jsp"/>
                    </c:if>
                    <c:if test="${vue=='validerDemande'}">

                        <c:import url="/WEB-INF/common/ValiderOA.jsp"/>
                    </c:if>
                    <c:if test="${vue=='reportingDepense'}">

                        <c:import url="/WEB-INF/common/statistiqueDepense.jsp"/>
                    </c:if>
                    <c:if test="${vue=='tableauDeBord'}">

                        <c:import url="/WEB-INF/common/TableauDeBord.jsp"/>
                    </c:if>
                    <c:if test="${vue=='rapport'}">
                        <c:import url="/WEB-INF/controleurs/rapport.jsp"/>
                    </c:if>

                    <c:if test="${vue=='profile'}">

                        <c:import url="/WEB-INF/controleurs/profile.jsp"/>

                    </c:if>

                    <c:if test="${vue=='statistiques'}">
                        <c:import url="/WEB-INF/controleurs/Allstatistiques.jsp"/>
                    </c:if>

                    <c:if test="${vue=='Suivi Des Magasins Secondaires'}">
                        <c:import url="/WEB-INF/controleurs/magasinSecondaire.jsp"/>
                    </c:if>

                    <c:if test="${vue=='Suivi Des Magasins Principaux'}">
                        <c:import url="/WEB-INF/controleurs/magasinPrincipal.jsp"/>
                    </c:if>

                    <c:if test="${vue=='Historique MS'}">
                        <c:import url="/WEB-INF/controleurs/historique_produitMS.jsp"/>
                    </c:if>

                    <c:if test="${vue=='Vos Commandes'}">
                        <c:import url="/WEB-INF/controleurs/SeeCommandePersonnel.jsp"/>
                    </c:if>

                    <c:if test="${vue=='Vos Etats De Consommations'}">
                        <c:import url="/WEB-INF/controleurs/EtatConsoPerso.jsp"/>
                    </c:if>

                    <c:if test="${vue=='Historique MP'}">
                        <c:import url="/WEB-INF/controleurs/historique_produitMP.jsp"/>
                    </c:if>

                    <c:if test="${vue=='Commandes a Traiter'}">

                        <c:import url="/WEB-INF/controleurs/CommandeMPForm.jsp"/>

                    </c:if>

                    <c:if test="${vue=='listePMP'}">

                        <c:import url="/WEB-INF/controleurs/ListeproduitMP.jsp"/>

                    </c:if>

                    <c:if test="${vue=='Budget Regional'}">

                        <c:import url="/WEB-INF/controleurs/budget.jsp"/>

                    </c:if>

                    <c:if test="${vue=='Commande Personnel' or vue == 'CommandeClient'}">

                        <c:import url="/WEB-INF/controleurs/CommandeClient.jsp"/>

                    </c:if>

                    <c:if test="${vue=='Contact'}">

                        <c:import url="/WEB-INF/controleurs/sendmessage.jsp"/>

                    </c:if>

                    <c:if test="${deconnexion=='faut'}">
                        <c:redirect url="login.jsp"/>

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
