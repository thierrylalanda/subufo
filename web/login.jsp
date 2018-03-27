
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="fr"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title>Login</title>
        <link rel="icon" href="images/gci.png" >
        <META http-equiv="refresh" content="<%= session.getMaxInactiveInterval()%>; url=/subufo/login.jsp"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <link href="admin/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link href="admin/assets/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
        <link href="admin/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link href="admin/css/style.css" rel="stylesheet" />
        <link href="admin/css/style-responsive.css" rel="stylesheet" />
        <link href="admin/css/style-default.css" rel="stylesheet" id="style_color" />
        <link href="angularFrontend/libs/material.css" rel="stylesheet" type="text/css"/>
        <script src="admin/js/jquery-1.8.3.min.js" type="text/javascript"></script>
    </head>
    <!-- END HEAD -->
    <!-- BEGIN BODY -->
    <body class="lock" >

        <div class="lock-header layout-xs-column">

            <!-- BEGIN LOGO -->
            <a class="center" id="logo flex-xs">
                <img class="center img-logo" alt="GIC" src="images/gci.png" style="height: 120px; width: 350px;border-radius: 25px;margin-right: 0px">

            </a>
            <!-- END LOGO -->


        </div>

        <div class="login-wrap layout-xs-column">

            <div class="metro single-size red flex-xs single" >

                <img class="center " style="height: 150px; width: 150px; margin-bottom: -5px;margin-top: 0px" alt="logo de L'entreprise lageur:105 hauteur:109" src="photo/logo.png">

            </div>

            <form id="loginForm" class="flex-xs layout-xs-column"method="POST" action="authentification" autocomplete="off" novalidate="novalidate">
                <div class="metro double-size green flex-xs-100 double">

                    <div class="input-append lock-input">

                        <input type="text" class="" placeholder="nom utilisateur"  value="" name="user" required>
                    </div>

                </div>
                <div class="metro double-size red flex-xs double">

                    <div class="input-append lock-input">

                        <input type="password" class="" placeholder="mot de passe" value="" name="password" required>
                    </div>

                </div>
                <div class="metro single-size yellow login flex-xs single" >

                    <button type="submit" class="btn login-btn">
                        Login
                        <i class=" icon-long-arrow-right"></i>
                    </button>

                </div>
            </form>

            <div class="metro double-size hide-xs">
                <img src="image/img3.jpg" style="height: 150px;width: 100%" class="img-responsive img-rounded" />
            </div>
            <div class="metro single-size deep-red hide-xs">
                <img src="image/img4.jpg" style="height: 150px;width: 100%" class="img-responsive img-rounded" />
            </div>
            <c:if test="${empty message and empty show}">
                <div class="metro double-size blue hide-xs">
                    <img src="image/img5.jpg" style="height: 150px;width: 100%" class="img-responsive img-rounded" />
                </div>
            </c:if>
            <c:if test="${not empty message}">
                <div class="metro double-size red double flex-xs">
                    <a href="#" class="social-link">
                        <i class="icon-eye-open"></i>
                        <span>${message.getMessage()}</span>
                    </a>
                </div>
            </c:if>
            <c:if test="${not empty show}">
                <div class="metro double-size green double flex-xs">
                    <a href="#" class="social-link">
                        <i class="icon-info-sign"style="margin-top: -20px;"></i>
                        <span>Voici Vos Identifiants</span>
                        <p class="text-danger" style="color: red">User Name: ${personnel.getLoginList().getUsername()}</p>
                        <p class="text-capitalize text-danger"style="color: red;">PassWord: ${personnel.getLoginList().getPassword()}</p>
                    </a>
                </div>
            </c:if>

            <div class="metro single-size purple hide-xs">
                <img src="image/img2.jpg" style="height: 150px;width: 100%" class="img-responsive img-rounded" />
            </div>
            <div class="login-footer">

                <div class="remember-hint pull-left">
                    <input type="checkbox" id="">Souviens-toi de moi
                </div>
                <div class="forgot-hint pull-right">
                    <a id="forget-password" class="" href=""data-target="#pwdModal" data-toggle="modal"> Password Oublier ?</a>
                </div>
            </div>
        </div>

        <div id="pwdModal" class="modal fade" tabindex="-1" role="dialog" data-backdrop="false" data-keyboard="false" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h1 class="text-center">Quel est mon mot de passe?</h1>
                    </div>
                    <div class="modal-body">
                        <div class="row-fluid">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="text-center">

                                        <p>Si vous avez oublié votre mot de passe, vous pouvez le réinitialiser ici.</p>
                                        <div class="panel-body">
                                            <form  method="POST" autocomplete="off" action="Json">
                                                <fieldset>
                                                    <div class="form-group">
                                                        <input class="form-control input-lg input-large focused span12"required placeholder="Registration number" name="matricule" type="text">
                                                        <input class="form-control input-lg input-large focused span12"required placeholder="E-mail Address" name="email" type="email">
                                                    </div>
                                                    <input class="btn btn-lg btn-primary btn-block span12" value="Envoyer mon mot de passe" type="submit">
                                                </fieldset>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row-fluid">
                            <button class="btn " data-dismiss="modal" aria-hidden="true">Fermer</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <c:if test="${1 == 1}">
            <c:import url="/register.jsp"/>
            <c:import url="/jsJSP.jsp"/>
            <script>
                if ($(document).width() < 600) {

                    $(".single").removeClass("single-size");
                    $(".double").removeClass("double-size");
                }else{
                    $(".img-logo").css('margin-bottom' ,'-50px');
                }
                $(window).resize(function () {
                    if ($(document).width() < 600) {

                        $(".single").removeClass("single-size");
                        $(".double").removeClass("double-size");
                        $(".img-logo").css('margin-bottom' ,'0px');
                    } else {
                        $(".single").addClass("single-size");
                        $(".double").addClass("double-size");
                        $(".img-logo").css('margin-bottom' ,'-50px');
                    }
                });

            </script>
        </c:if>
    </body>
    <!-- END BODY -->
</html>
