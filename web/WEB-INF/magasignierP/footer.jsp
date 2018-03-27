<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Load javascripts at bottom, this will reduce page load time -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="admin/js/jquery-1.8.3.min.js"></script>

<script src="admin/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="js/bootstrap-datepicker.js" type="text/javascript"></script>
<script src="admin/assets/fullcalendar/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
<script type="text/javascript" src="admin/assets/jquery-slimscroll/jquery-ui-1.9.2.custom.min.js"></script>
<script src="admin/assets/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="admin/js/jquery.pulsate.min.js"></script>
<script type="text/javascript" src="admin/assets/gritter/js/jquery.gritter.js"></script>
<script src="js/jquery-ui.js" type="text/javascript"></script>
<script src="admin/js/jQuery.dualListBox-1.3.js" language="javascript" type="text/javascript"></script>
<script src="admin/js/form-component.js"></script>
<script src="admin/js/pulstate.js" type="text/javascript"></script>
<script src="admin/assets/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
<script src="admin/js/jquery.blockui.js"></script>
<script src="admin/js/gritter.js" type="text/javascript"></script>
<!-- ie8 fixes -->
<!--[if lt IE 9]>
<script src="admin/js/excanvas.js"></script>
<script src="admin/js/respond.js"></script>

<![endif]-->
<script type="text/javascript" src="admin/assets/chosen-bootstrap/chosen/chosen.jquery.min.js"></script>
<script type="text/javascript" src="admin/assets/uniform/jquery.uniform.min.js"></script>

<script type="text/javascript" src="admin/assets/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
<script type="text/javascript" src="admin/assets/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
<script type="text/javascript" src="admin/assets/clockface/js/clockface.js"></script>
<script type="text/javascript" src="admin/assets/jquery-tags-input/jquery.tagsinput.min.js"></script>
<script src="admin/assets/fancybox/source/jquery.fancybox.pack.js"></script>

<script type="text/javascript" src="admin/assets/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript" src="admin/assets/data-tables/DT_bootstrap.js"></script>

<script src="js/js/lumino.glyphs.js" type="text/javascript"></script>
<script src="js/js/chart.min.js" type="text/javascript"></script>
<script src="js/js/easypiechart-data.js" type="text/javascript"></script>
<script src="js/js/easypiechart.js" type="text/javascript"></script>

<script src="admin/js/jquery.scrollTo.min.js"></script>

<script src="js/dist/js/bootstrap-multiselect.js" type="text/javascript"></script>

<script src="admin/assets/fancybox/source/jquery.fancybox.pack.js"></script>

<!-- MEGAFOLIO PRO GALLERY JS FILES  -->
<script type="text/javascript" src="admin/assets/metr-folio/js/jquery.metro-gal.plugins.min.js"></script>
<script type="text/javascript" src="admin/assets/metr-folio/js/jquery.metro-gal.megafoliopro.js"></script>

<!--common script for all pages-->
<script src="admin/js/common-scripts.js"></script>
<!--script for this page-->

<script src="admin/js/form-wizard.js"></script>

<script src="js/jquery.dataTables.js" type="text/javascript"></script>
<script src="js/dataTables.responsive.js" type="text/javascript"></script>
<script src="js/dataTables.buttons.js" type="text/javascript"></script>
<script src="js/dataTables.select.js" type="text/javascript"></script>
<script src="js/buttons.colVis.js" type="text/javascript"></script>
<script src="js/jszip.js" type="text/javascript"></script>

<script src="js/buttons.jqueryui.js" type="text/javascript"></script>
<script src="js/buttons.html5.js" type="text/javascript"></script>
<script src="js/buttons.print.js" type="text/javascript"></script>
<script src="js/dataTables.autoFill.js" type="text/javascript"></script>
<script src="js/buttons.flash.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/print.css" type="text/css" media="print" />

<script src="assets/assets_siminta/scripts/tchat.js" type="text/javascript"></script>
<script src="js/myjs/models/Data.js" type="text/javascript"></script>

<script src="js/myjs/controllers/ContollerPersonnels.js" type="text/javascript"></script>
<script src="js/effets.js" type="text/javascript"></script>
<script src="js/ajaxrequette.js" type="text/javascript"></script>

<script src="js/myjs/controllers/impression.js" type="text/javascript"></script>
<script src="js/myjs/controllers/simple_print.js" type="text/javascript"></script>

<script src="js/myjs/controllers/notifications.js" type="text/javascript"></script>

<script src="assets/glDatePicker-2.0/glDatePicker.js" type="text/javascript"></script>
<c:if test="${vue=='Commandes En Cours'}">
    <script src="js/commandeMP.js" type="text/javascript"></script>
</c:if>
<script src="js/produit.js" type="text/javascript"></script>

<script src="admin/pdfmake-master/build/pdfmake.min.js" type="text/javascript"></script>
<script src="admin/pdfmake-master/build/vfs_fonts.js" type="text/javascript"></script>
<script src="admin/pdfmake-master/src/printer.js" type="text/javascript"></script>
<script src="admin/pdfmake-master/examples/tables.js" type="text/javascript"></script>
<c:if test="${vue=='rapport'}">
    <script src="js/myjs/controllers/pesoTable.js" type="text/javascript"></script>
</c:if>
<!-- END JAVASCRIPTS -->
<script src="js/myjs/controllers/simple_print.js" type="text/javascript"></script>
 <c:if test="${vue=='' or vue=='Accueil'}">


<script src="js/myjs/controllers/wb.carousel.min.js" type="text/javascript"></script>
   <script src="js/myjs/controllers/wwb12.min.js" type="text/javascript"></script>
      <script src="js/myjs/controllers/accueil.js" type="text/javascript"></script>
</c:if>
<c:if test="${not empty statistique}">
    <script src="js/myjs/controllers/stat-camanber.js" type="text/javascript"></script>

    <script src="admin/code/highcharts.js"></script>
    <script src="admin/code/highcharts-3d.js"></script>
    <script src="admin/code/modules/exporting.js"></script>

    <script src="js/myjs/controllers/stat-chart.js" type="text/javascript"></script>
</c:if>
<c:if test="${galery = 'ok'}">
    <script type="text/javascript">
        $('.carousel').carousel();
        function getAll() {
            $('#external-events div.external-event').each(function () {

                // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
                // it doesn't need to have a start or end
                var eventObject = {
                    title: $.trim($(this).text()) // use the element's text as the event title
                };
                // store the Event Object in the DOM element so we can get to it later
                $(this).data('eventObject', eventObject);
                // make the event draggable using jQuery UI
                $(this).draggable({
                    zIndex: 999,
                    revert: true, // will cause the event to go back to its
                    revertDuration: 0  //  original position after the drag
                });
            });
        }
        $("#new_work").keypress(function (event) {
            if (event.keyCode === 13) {
                var val = $(this).val();
                $(this).val("");
                $("#external-events").prepend("<div class='external-event label'>" + val + "</div>");
                getAll();
            }

        });
    </script>
</c:if>
<script>
    $('.tags').keypress(function () {
        $.ajax({
            url: "Auto",
            type: "post",
            data: '',
            success: function (data) {
                $(".tags").autocomplete({
                    source: data
                });
            }, error: function (data, status, er) {
                console.log(data + "_" + status + "_" + er);
            }
        });
    });
    $('.tag').keypress(function () {
        $.ajax({
            url: "autocompleteproduit",
            type: "post",
            data: {niveau: 3, categorie: $("#categorie").val()},
            success: function (data) {
                $(".tag").autocomplete({
                    source: data
                });
            }, error: function (data, status, er) {
                console.log(data + "_" + status + "_" + er);
            }
        });
    });
</script>

<c:if test="${galery = 'ok'}">
    <script type="text/javascript">

        jQuery(document).ready(function () {

            var api = jQuery('.metro-gal-container').megafoliopro(
                    {
                        filterChangeAnimation: "pagebottom", // fade, rotate, scale, rotatescale, pagetop, pagebottom,pagemiddle
                        filterChangeSpeed: 400, // Speed of Transition
                        filterChangeRotate: 99, // If you ue scalerotate or rotate you can set the rotation (99 = random !!)
                        filterChangeScale: 0.6, // Scale Animation Endparameter
                        delay: 20,
                        defaultWidth: 980,
                        paddingHorizontal: 10,
                        paddingVertical: 10,
                        layoutarray: [9, 11, 5, 3, 7, 12, 4, 6, 13]		// Defines the Layout Types which can be used in the Gallery. 2-9 or "random". You can define more than one, like {5,2,6,4} where the first items will be orderd in layout 5, the next comming items in layout 2, the next comming items in layout 6 etc... You can use also simple {9} then all item ordered in Layout 9 type.
                    });
            // FANCY BOX ( LIVE BOX) WITH MEDIA SUPPORT
            jQuery(".fancybox").fancybox();
            // THE FILTER FUNCTION
            jQuery('.filter').click(function () {
                jQuery('.filter').each(function () {
                    jQuery(this).removeClass("selected");
                });
                api.megafilter(jQuery(this).data('category'));
                jQuery(this).addClass("selected");
            });
        });</script>
    </c:if>
    <c:if test="${not empty statistique}">
    <script>



        $(document).ready(function () {


            function drawbarchartMP(data) {
                Highcharts.chart('barchar', {
                    chart: {
                        type: 'column',
                        options3d: {
                            enabled: true,
                            alpha: 0.5,
                            beta: 5,
                            depth: 100
                        }
                    },
                    title: {
                        text: 'Stattistiques en entrée'
                    },
                    subtitle: {
                        text: 'du magasin'
                    },
                    plotOptions: {
                        column: {
                            depth: 100
                        }
                    },
                    xAxis: {
                        categories: Highcharts.getOptions().lang.shortMonths
                    },
                    yAxis: {
                        title: {
                            text: "Consommation"
                        }
                    },
                    series: getseries(data)
                });

            }
            function getseries(data) {
                var dataset = new Array();

                for (var i = 0; i < data.length; i++) {
                    var dat = new Array();

                    dat.push(data[i][getKeys(data)[i]][0][0]);
                    dat.push(data[i][getKeys(data)[i]][0][1]);
                    dat.push(data[i][getKeys(data)[i]][0][2]);
                    dat.push(data[i][getKeys(data)[i]][0][3]);
                    dat.push(data[i][getKeys(data)[i]][0][4]);
                    dat.push(data[i][getKeys(data)[i]][0][5]);
                    dat.push(data[i][getKeys(data)[i]][0][6]);
                    dat.push(data[i][getKeys(data)[i]][0][7]);
                    dat.push(data[i][getKeys(data)[i]][0][8]);
                    dat.push(data[i][getKeys(data)[i]][0][9]);
                    dat.push(data[i][getKeys(data)[i]][0][10]);
                    dat.push(data[i][getKeys(data)[i]][0][11]);

                    //putlegende(getKeys(data)[i], randomColor(i));
                    var donnees = {
                        name: getKeys(data)[i],
                        data: dat[0]
                    };

                    dataset.push(donnees);
                }


                return dataset;
            }

            function getKeys(data) {
                var obj = data,
                        keys = new Array();
                if (Object.keys) {
                    keys = Object.keys(obj);
                } else {
                    for (var k in obj) {
                        keys.push(k);
                    }
                }
                return keys;
            }
            function putlegende(text, color) {

                var legende = $(".legende");

                var elt = '<div class="control-group span3 form-group">' +
                        '<label class="control-label"></label>' +
                        '<div class="controls">' +
                        '<label class="badge" style="background-color: ' + color + ';height:22px;color:black">' + text + '</label>' +
                        '</div>' +
                        '</div>';

                legende.append(elt);
            }

            function getDataSetsLine(data) {
                var dataset = new Array();
                //data[0][getKeys(data)[0]][0]  data[i][getKeys(data)[i]][0]

                for (var i = 0; i < data.length; i++) {
                    var dat = new Array();
                    dat.push(data[i][getKeys(data)[i]][1][0]);
                    dat.push(data[i][getKeys(data)[i]][1][1]);
                    dat.push(data[i][getKeys(data)[i]][1][2]);
                    dat.push(data[i][getKeys(data)[i]][1][3]);
                    dat.push(data[i][getKeys(data)[i]][1][4]);
                    dat.push(data[i][getKeys(data)[i]][1][5]);
                    dat.push(data[i][getKeys(data)[i]][1][6]);
                    dat.push(data[i][getKeys(data)[i]][1][7]);
                    dat.push(data[i][getKeys(data)[i]][1][8]);
                    dat.push(data[i][getKeys(data)[i]][1][9]);
                    dat.push(data[i][getKeys(data)[i]][1][10]);
                    dat.push(data[i][getKeys(data)[i]][1][11]);

                    putlegende(getKeys(data)[i], randomColor(i));
                    var donnees = {
                        fillColor: randomColor(i),
                        strokeColor: randomColor(i),
                        pointColor: randomColor(i),
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: randomColor(i),
                        data: dat[0]
                    };
                    //alert(data[i][getKeys(data)[i]][1]);
                    dataset.push(donnees);
                }

                var lineChartData = {
                    labels: ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Decembre'],
                    datasets: dataset

                };
                var canvas = document.createElement("canvas");
                canvas.setAttribute("height", 300);
                canvas.setAttribute("width", 1100);
                canvas.setAttribute("id", "lineMP");
                $(".divlineMP").html(canvas);


                var chart1 = document.getElementById("lineMP").getContext("2d");
                var myLine = new Chart(chart1).Line(lineChartData, {
                    responsive: true
                });
                return dataset;
            }

            function randomColor(i) {
                var colo = ["#edc240", "#afd8f8", "#cb4b4b", "#4da74d", "#9440ed"];
                var j = i % 5;
                var color = ["rgba(48, 164, 255, 1)", "rgba(220,220,220,1)", "rgba(48, 164, 255, 1)", "rgba(48, 164, 255, 1)", "rgba(48, 164, 255, 1)"];
                return colo[j];
            }

            function getDataSetsBar(data) {
                var datasets = new Array(); //data[i][getKeys(data)[i]][1]
                //alert(getElement(data[1][getKeys(data)[1]][1]));
                for (var i = 0; i < data.length; i++) {
                    var dat = new Array();
                    dat.push(data[i][getKeys(data)[i]][0][0]);
                    dat.push(data[i][getKeys(data)[i]][0][1]);
                    dat.push(data[i][getKeys(data)[i]][0][2]);
                    dat.push(data[i][getKeys(data)[i]][0][3]);
                    dat.push(data[i][getKeys(data)[i]][0][4]);
                    dat.push(data[i][getKeys(data)[i]][0][5]);
                    dat.push(data[i][getKeys(data)[i]][0][6]);
                    dat.push(data[i][getKeys(data)[i]][0][7]);
                    dat.push(data[i][getKeys(data)[i]][0][8]);
                    dat.push(data[i][getKeys(data)[i]][0][9]);
                    dat.push(data[i][getKeys(data)[i]][0][10]);
                    dat.push(data[i][getKeys(data)[i]][0][11]);

                    var donnees = {
                        fillColor: randomColor(i),
                        strokeColor: randomColor(i),
                        highlightFill: "rgba(220,220,220,0.75)",
                        highlightStroke: randomColor(i),
                        data: dat[0]
                    };
                    datasets.push(donnees);
                }
                var barChartData = {
                    labels: ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Decembre'],
                    datasets: datasets

                };
                var chart2 = document.getElementById("barMP").getContext("2d");
                var barchar = new Chart(chart2).Bar(barChartData, {
                    responsive: true
                });
                return datasets;
            }



            function viewMP(data) {
                $(".legende").html("");
                getDataSetsLine(data);
                drawbarchartMP(data);
            }
            function getKeys(data) {
                var obj = data,
                        keys = new Array();
                for (var i = 0; i < data.length; i++) {
                    for (var k in obj[i]) {
                        keys.push(k);
                    }

                }
                return keys;
            }



            window.onload = function () {
                var anne = new Date().getFullYear();

                function chargerMP(date) {
                    $(".choix-annee").text(date);


                    // on lance une requête AJAX
                    $.ajax({
                        url: "Statistique",
                        type: 'POST',
                        data: {anneeMP: date},
                        dataType: 'json',
                        success: function (data) {
                            viewMP(data);
                        }
                    });
                    // on relance la fonction
                    // on exécute le chargement toutes les 5 secondes
                }
                function initialize() {
                    $(".choix-annee").text(anne);

                    // on lance une requête AJAX
                    $.ajax({
                        url: "Statistique",
                        type: 'POST',
                        dataType: 'json',
                        success: function (data) {
                            viewMP(data);
                        }
                    });
                    // on relance la fonction
                    // on exécute le chargement toutes les 5 secondes
                }
                initialize();
                $(".search-categom").click(function (e) {
                    e.preventDefault();
                    var annee = $(this).parents("form:first").find(".all-date").val();

                    chargerMP(annee);
                });

            };


        });</script>
    </c:if>

<script type="text/javascript" src="admin/assets/bootstrap-toggle-buttons/static/js/jquery.toggle.buttons.js"></script>

<script type="text/javascript" src="admin/assets/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
<script type="text/javascript" src="admin/assets/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
<script type="text/javascript" src="admin/assets/clockface/js/clockface.js"></script>
<script type="text/javascript" src="admin/assets/jquery-tags-input/jquery.tagsinput.min.js"></script>

<script type="text/javascript" src="admin/assets/bootstrap-daterangepicker/date.js"></script>
<script type="text/javascript" src="admin/assets/bootstrap-daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="admin/assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
<script type="text/javascript" src="admin/assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
<c:import url="/WEB-INF/common/angularFile/angularfile.jsp"/>

<!--script for this page-->
<script src="admin/js/form-component.js"></script>
<!-- END JAVASCRIPTS -->

<script language="javascript" type="text/javascript">

        $('#example-getting-started').multiselect({
            enableFiltering: true,
            maxHeight: 400,
            dropUp: true,
            buttonText: function (options, select) {
                if (options.length === 0) {
                    return 'Aucun Controleur Selectionner ...';
                } else if (options.length > 3) {
                    return 'plus de 3 cotroleur selectionner!';
                } else {
                    var labels = [];
                    options.each(function () {
                        if ($(this).attr('label') !== undefined) {
                            labels.push($(this).attr('label'));
                        } else {
                            labels.push($(this).html());
                        }
                    });
                    return labels.join(', ') + '';
                }
            }

        });
        $('.OneSelect').multiselect({
            enableFiltering: true,
            maxHeight: 200,
            buttonClass: 'btn-primary btn radius',
            buttonWidth: '200px',
            //dropUp: true,
            //selectAllText: true,
            includeSelectAllOption: true,
            enableCaseInsensitiveFiltering: true,
            filterPlaceholder: 'Recherhe',
            buttonText: function (options, select) {
                if (options.length === 0) {
                    return 'Aucune Selection ...';
                } else if (options.length > 3) {
                    return 'plus de 3  selection!';
                } else {
                    var labels = [];
                    options.each(function () {
                        if ($(this).attr('label') !== undefined) {
                            labels.push($(this).attr('label'));
                        } else {
                            labels.push($(this).html());
                        }
                    });
                    return labels.join(', ') + '';
                }
            }

        });
        $('.datepicker').datepicker({
            weekStart: 1,
            color: '{color}',
            buttonImageOnly: true

        });

        $(function () {

            $.configureBoxes();
        });
</script>
<c:if test="${vue=='Accueil'}">

    <script>

        $('.date').glDatePicker();
        var mois = ["Janvier", "Fevrier", "Mars", "Avril", "Mai", "Juin", "Juillet", "Aout", "Septembre", "Octobre", "Novembre", "Decembre"];
        var getspecialDay = function () {
            var response = new Array();
            $.post(
                    "agenda",
                    {action: "get_special_event", idPersonnel: sessionStorage.getItem("iduser")},
                    function (data) {

                        console.log(data);
                        if (data.length === 0) {

                            drawCalendar(response);
                        } else {

                            for (var i = 0; i < data.length; i++) {
                                var result = {date: new Date(parseInt(data[i][0]), parseInt(data[i][1]) - 1, parseInt(data[i][2])), data: {message: data[i][3]}, repeatMonth: false};
                                response.push(result);
                            }

                            //console.log(response);
                            drawCalendar(response);

                        }
                    },
                    "json"
                    );

            //alert("vous avez des ");
            return response;

        };

        getspecialDay();
        //affichage du calendrier;
        function drawCalendar(daySpecial) {

            $('#exempletest').glDatePicker(
                    {showAlways: true,
                        cssName: 'darkneon',
                        selectedDate: new Date(),
                        zIndex: 0,
                        specialDates: daySpecial,
                        onClick: function (target, cell, date, data) {
                            target.val(date.getFullYear() + ' - ' +
                                    (date.getMonth() + 1) + ' - ' +
                                    date.getDate());
                            if (data !== null) {
                                alert(data.message + '\n le ' + date.getDate() + " " + mois[(date.getMonth())] + " " + date.getFullYear());
                            }
                            $('.date').val(date.getDate() + '/ ' +
                                    (date.getMonth() + 1) + ' /' +
                                    date.getFullYear());
                        }});
        }
    </script>
</c:if>
<c:if test="${vue == 'agenda'}">

    <script type="text/javascript">
        function getAll() {
            $('#external-events div.external-event').each(function () {

                // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
                // it doesn't need to have a start or end
                var eventObject = {
                    title: $.trim($(this).text()) // use the element's text as the event title
                };

                // store the Event Object in the DOM element so we can get to it later
                $(this).data('eventObject', eventObject);

                // make the event draggable using jQuery UI
                $(this).draggable({
                    zIndex: 999,
                    revert: true, // will cause the event to go back to its
                    revertDuration: 0  //  original position after the drag
                });

            });

        }
        $("#new_work").keypress(function (event) {
            if (event.keyCode === 13) {
                var val = $(this).val();
                $(this).val("");
                $("#external-events").prepend("<div class='external-event label'>" + val + "</div>");
                getAll();
            }

        });
    </script>
    <script src="admin/js/external-dragging-calendar.js" type="text/javascript"></script>

</c:if>

<script src="admin/converse/js/converse.js"></script>
<!-- Load javascripts at bottom, this will reduce page load time -->
<script src="admin/converse/js/inizialiseconverse.js" type="text/javascript"></script>