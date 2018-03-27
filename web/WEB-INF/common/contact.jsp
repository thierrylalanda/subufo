<%-- 
    Document   : contact
    Created on : 31 oct. 2017, 11:11:29
    Author     : Administrateur
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h3 class="page-title">
   Contacter 
</h3>
<ul class="breadcrumb">
    <li>
        <a href=""><i class="icon-home"></i> Home</a>
        <span class="divider">/</span>
    </li>
    <li>
        <i class="icon-phone"></i>
        <a href="#">${vue}</a>

    </li>

   
</ul>
<br><br>
<div id="wb_contact" class="row-fluid">
    <div id="contact">
        <div class="row">
            <div class="col-1">
                <form method="post" action="SendMessage?action=nousContacter&vue=${requestScope.vue}&woh=${requestScope.woh}">
                <div id="wb_Text2">
                    <span style="color:#FFFFFF;font-family:Arial;font-size:24px;"><strong><i class="icon-phone"></i> NOUS CONTACTER<br></strong></span><span style="color:#FFFFFF;font-family:Arial;font-size:17px;">
                        <em>Laisser votre message vous serrez répondu dans les heures suivantes.Pour nous signaler un bug, merci de préciser l'adresse URL où vous avez rencontré ce souci ainsi que si vous étiez identifié(e) ou non.Nous ne répondons pas aux questions techniques, pour cela utilisez notre guide d'utilisation qui vous a été fourni. </em></span>
                </div>
                <div id="wb_LayoutGrid4">
                    <div id="LayoutGrid4">
                        <div class="row">
                            <div class="col-1">
                                <input type="text" id="Editbox1" style="display:block;width:100%;height:38px;line-height:38px;z-index:1;" name="nom" value="" spellcheck="false" placeholder="votre nom complet*" required>
                                <input type="email" id="Editbox2" style="display:block;width:100%;height:38px;line-height:38px;z-index:2;" name="email" value="" spellcheck="false" placeholder="votre email*" required>
                                <input type="text" id="Editbox3" style="display:block;width:100%;height:38px;line-height:38px;z-index:3;" name="phone" value="" spellcheck="false" placeholder="votre numero telephone" required>
                            </div>
                            <div class="col-2">
                                <textarea name="message" id="TextArea1" style="display:block;width:100%;height:136px;z-index:4;" rows="7" cols="69" spellcheck="false" placeholder="votre message" required></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="submit" id="Button1" name="" value="ENVOYER LE MESSAGE" style="display:block;   float: left;
                       width:100%;height:34px;z-index:7;">
                </form>
            </div>
        </div>
    </div>
</div>