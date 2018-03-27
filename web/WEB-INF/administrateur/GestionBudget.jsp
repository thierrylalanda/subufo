
<%--
    Document   : Listeproduit
    Created on : 19 nov. 2016, 15:53:48
    Author     : messi
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<input type="checkbox" class="menu-trigger hide">
<ul class="menu hide" role="menu" style="margin-top: 50px">
    <li class="start">
        <a href="#">
            <svg preserveAspectRatio="xMidYMid meet" focusable="false" viewBox="-5 -5 34 34">
            <g><path d="M3 18h18v-2H3v2zm0-5h18v-2H3v2zm0-7v2h18V6H3z" fill="white"></path></g>
            </svg>
        </a>
    </li>
    <c:if test="${not empty sessionScope.lien59 or sessionScope.GeneralAdministrateur == 'OK' or not empty sessionScope.lien73}">
        <li >
            <a class=" list <c:if test="${vue=='budget achat' or vue=='nature'}">active</c:if>" ><i class="icon-money"></i> Frais non stockés</a>
                <ul class="">
                <c:if test="${sessionScope.GeneralAdministrateur == 'OK' or not empty sessionScope.lien73}">
                    <li><a class="<c:if test="${vue=='nature'}">active</c:if>" href="personnel?vue=nature&action=allbudget">Nature </a></li>
                    </c:if>
                    <c:if test="${sessionScope.GeneralAdministrateur == 'OK' or not empty sessionScope.lien73}">
                    <li><a class="<c:if test="${vue=='budget achat'}">active</c:if>" href="personnel?vue=budget achat&action=allbudget">Affectation budget</a></li>
                    </c:if>
            </ul>
        </li>
    </c:if>
    <c:if test="${sessionScope.GeneralAdministrateur == 'OK' or not empty sessionScope.lien72 or not empty sessionScope.lien71  or sessionScope.GeneralAdministrateur == 'OK' or not empty sessionScope.lien73}">

        <li class=""><a class="list <c:if test="${vue=='budget' or vue=='articles' or vue=='Categories Produits'}">active</c:if>" href="#"><i class="icon-money"></i> Frais stockés</a>
                <ul class="">
                <c:if test="${sessionScope.GeneralAdministrateur == 'OK' or not empty sessionScope.lien72}">
                    <li><a class="<c:if test="${vue=='Categories Produits'}">active</c:if>" href="personnel?vue=Categories Produits&action=allfour">Categories Produits</a></li>
                    </c:if>
                    <c:if test="${sessionScope.GeneralAdministrateur == 'OK' or not empty sessionScope.lien71}">
                    <li><a class="<c:if test="${vue=='articles'}">active</c:if>" href="parametre?vue=articles&action=redirect">Articles</a></li>
                    </c:if>
                    <c:if test="${sessionScope.GeneralAdministrateur == 'OK' or not empty sessionScope.lien73}">
                    <li><a class="<c:if test="${vue=='budget'}">active</c:if>" href="personnel?vue=budget&action=allbudget">Affectation Budget</a></li>
                    </c:if>
            </ul>
        </li>
    </c:if>
</ul>
<div class="overlay"></div>
<div class="row-fluid ">
    <nav>

        <ul class="nav-main" id="navigation">
            <c:if test="${vue=='nature' or vue=='budget achat'}">


                <c:if test="${not empty sessionScope.lien59 or sessionScope.GeneralAdministrateur == 'OK' or not empty sessionScope.lien73}">

                    <c:if test="${sessionScope.GeneralAdministrateur == 'OK' or not empty sessionScope.lien73}">
                        <li class="<c:if test="${vue=='nature'}">selected</c:if> <c:if test="${vue=='budget' or vue=='articles' or vue=='Categories Produits'}">hide</c:if>"><a class=" " href="personnel?vue=nature&action=allbudget" ><i class="icon-money"></i> Nature</a></li>
                        </c:if>
                        <c:if test="${sessionScope.GeneralAdministrateur == 'OK' or not empty sessionScope.lien73}">
                        <li class="<c:if test="${vue=='budget achat'}">selected</c:if> <c:if test="${vue=='budget' or vue=='articles' or vue=='Categories Produits'}">hide</c:if>"><a class="" href="personnel?vue=budget achat&action=allbudget" ><i class="icon-money"></i> Affectation budget</a></li>
                        </c:if>
                    </c:if>
                </c:if>

            <c:if test="${sessionScope.GeneralAdministrateur == 'OK' or not empty sessionScope.lien72 or not empty sessionScope.lien71  or sessionScope.GeneralAdministrateur == 'OK' or not empty sessionScope.lien73}">
                <c:if test="${sessionScope.GeneralAdministrateur == 'OK' or not empty sessionScope.lien72}">
                    <li  class="<c:if test="${vue=='Categories Produits'}">selected</c:if> <c:if test="${vue=='nature' or vue=='budget achat'}">hidden</c:if>"><a href="personnel?vue=Categories Produits&action=allfour">Categories Produits</a></li>
                    </c:if>
                    <c:if test="${sessionScope.GeneralAdministrateur == 'OK' or not empty sessionScope.lien71}">
                    <li class="<c:if test="${vue=='articles'}">selected</c:if> <c:if test="${vue=='nature' or vue=='budget achat'}">hidden</c:if>"><a href="parametre?vue=articles&action=redirect">Articles</a></li>
                    </c:if>
                    <c:if test="${sessionScope.GeneralAdministrateur == 'OK' or not empty sessionScope.lien73}">
                    <li class="<c:if test="${vue=='budget'}">selected</c:if> <c:if test="${vue=='nature' or vue=='budget achat'}">hidden</c:if>"><a href="personnel?vue=budget&action=allbudget">Affectation Budget</a></li>
                    </c:if>
                </c:if>

        </ul>



    </nav>
</div>
<div class="space20"></div>


<c:if test="${vue=='nature'}">
    <c:import url="/WEB-INF/administrateur/NatureBudget.jsp"/>
</c:if>
<c:if test="${vue=='budget achat'}">
    <c:import url="/WEB-INF/administrateur/BudgetAchat.jsp"/>
</c:if>
<c:if test="${vue=='Categories Produits'}">
    <c:import url="/WEB-INF/administrateur/AddCategorieProduit.jsp"/>
</c:if>
<c:if test="${vue=='articles'}">
    <c:import url="/WEB-INF/administrateur/articles.jsp"/>
</c:if>
<c:if test="${vue=='budget'}">
    <c:import url="/WEB-INF/administrateur/budget.jsp"/>
</c:if>