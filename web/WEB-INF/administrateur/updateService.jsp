<%-- 
    Document   : updateService
    Created on : 11 août 2017, 10:23:59
    Author     : Administrateur
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form action="admin?action=editeService&idservice=${service.getIdService()}&edite=edition&vue=settingservice" method="post">
    <div class="row-fluid layout-gt-xs-row layout-xs-column">
        <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
            <label class="control-label">Region</label>
            <div class="controls ">
                <select name="region" class="form-control span12" id="region_service">
                    <c:forEach items="${regions}" var="region">
                        <c:if test="${region.getIdRegion()==service.getSite().getRegion().getNomRegion()}">
                            <option value="${region.getIdRegion()}" class="" selected>${region.getNomRegion()}</option>
                        </c:if>
                        <c:if test="${region.getIdRegion()!= service.getSite().getRegion().getNomRegion()}">
                            <option value="${region.getIdRegion()}" class="" >${region.getNomRegion()}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
            <label class="control-label">Direction</label>
            <div class="controls ">
                <select name="direction" class="form-control span12" id="">
                    <c:forEach items="${directions}" var="dir">
                        <c:if test="${dir.getIdDirection()==service.getDirection().getIdDirection()}">
                            <option value="${dir.getIdDirection()}" class="direction" selected>${dir.getNomDirection()}</option>
                        </c:if>
                        <c:if test="${dir.getIdDirection()!= service.getDirection().getIdDirection()}">
                            <option value="${dir.getIdDirection()}" class="direction" >${dir.getNomDirection()}</option>
                        </c:if>


                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
            <label class="control-label">Site</label>
            <div class="controls ">
                <select name="site" class="form-control  span12" id="site_service">
                    <option value="${service.getSite().getIdSite()}" class="direction">${service.getSite().getNomSite()}</option>
                </select>
            </div>
        </div>

        <div class="control-group form-group span2 flex-gt-xs-15 flex-xs">
            <label class="control-label">Nom Du Service</label>
            <div class="controls ">
                <input type="text" class=" form-control span12"value="${service.getNomService()}" name="newval" required placeholder="Nouveau Nom Du Service"/>
            </div>
        </div>
        <div class="span2 flex-gt-xs-10 flex-xs">
            <div class="control-group ">
                <button type="submit" class="btn btn-success " style="margin-top: 25px" >Enregistrer</button>
            </div>
        </div>
    </div>

</form>