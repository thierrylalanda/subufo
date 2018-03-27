/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {

    function getKeys(data) {
        var obj = data[0];
        var keys = new Array();
        if (Object.keys) {
            keys = Object.keys(obj);
        } else {
            for (var k in obj) {
                keys.push(k);
            }
        }

        return keys;
    }
    function getwidth(data) {
        var obj = data[0];
        var keys = new Array();
        for (var k in obj) {
            keys.push("star");
        }

        return keys;
    }

    function getDate() {
        var date = new Date();
        var jour = date.getDate();
        var mois = (date.getMonth() + 1);
        if ((date.getDate() + 1) < 10) {
            jour = "0" + date.getDate();
        }

        if ((date.getMonth() + 1) < 10) {
            mois = "0" + (date.getMonth() + 1);
        }
        return jour + "/" + mois + "/" + date.getFullYear() + "  " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
    }
    function _getTitle() {
        var response = "par " + $(".li-table.active").find("a").text();
        if ($(".li-table.active").find("a").text() === "") {
            response = "du magasin ";
        }
        return response;
    }
    _getTitle();
    function getContent(donnee) {
        var content = new Array();
        content.push({
            style: 'headertable',
            table: {
                widths: ["*", "auto", "*"],
                body: [
                    [
                        {
                            // if you specify width, image will scale proportionally
                            image: testImageDataUrl,
                            width: 70,
                            height: 70,
                            style: 'img'

                        }, [
                            {text: "REGION " + $(".notification").attr("region"), style: 'header_center_top'},
                            {text: societeDataUrl, style: 'header_center_bottom'}],
                        {text: "", style: 'subheader'}
                    ]
                ]
            },
            layout: {
                hLineWidth: function (i, node) {
                    return (i === 0 || i === node.table.body.length) ? 2 : 1;
                },
                vLineWidth: function (i, node) {
                    return (i === 0 || i === node.table.widths.length) ? 2 : 1;
                },
                hLineColor: function (i, node) {
                    return (i === 0 || i === node.table.body.length) ? 'black' : 'white';
                },
                vLineColor: function (i, node) {
                    return (i === 0 || i === node.table.widths.length) ? 'black' : 'white';
                }
            }
        });
        content.push({text: 'Journal de consommation periodique ' + _getTitle(), style: 'title'});
        content.push({text: 'periode ' + parseDate(periode), style: 'subtitle'});
        if (this.alldata.length !== 0) {
            totalglobal = 0;
            for (var j = 0; j < this.alldata.length; j++) {
                this.table = getBody(this.alldata[j].data);
                content.push({text: this.alldata[j].legende, fontSize: 10, bold: true, margin: [0, 15, 0, 3]});
                content.push({
                    style: 'tableExample',
                    table: {
                        widths: this.table.widht,
                        body: this.table.body
                    },
                    layout: {
                        hLineWidth: function (i, node) {
                            return (i === 0 || i === node.table.body.length) ? 2 : 1;
                        },
                        vLineWidth: function (i, node) {
                            return (i === 0 || i === node.table.widths.length) ? 2 : 1;
                        },
                        hLineColor: function (i, node) {
                            return (i === 0 || i === node.table.body.length) ? 'white' : 'white';
                        },
                        vLineColor: function (i, node) {
                            return (i === 0 || i === node.table.widths.length) ? 'white' : 'white';
                        },
                        // paddingLeft: function(i, node) { return 4; },
                        // paddingRight: function(i, node) { return 4; },
                        // paddingTop: function(i, node) { return 2; },
                        // paddingBottom: function(i, node) { return 2; },
                        // fillColor: function (i, node) { return null; }
                        fillColor: function (i, node) {
                            return (i === 0) ? '#4A8BC2' : (i % 2 === 0 && i !== 0) ? '#CCCCCC' : null;
                        }
                    }
                });
                content.push({
                    style: 'tableFooter',
                    table: {
                        widths: ["auto", 'auto'],
                        body: [[{text: 'Total', style: ''},
                                {text: this.table.total + ' FCFA', style: ''}]]
                    },
                    layout: {
                        hLineWidth: function (i, node) {
                            return (i === 0 || i === node.table.body.length) ? 2 : 1;
                        },
                        vLineWidth: function (i, node) {
                            return (i === 0 || i === node.table.widths.length) ? 2 : 1;
                        },
                        hLineColor: function (i, node) {
                            return (i === 0 || i === node.table.body.length) ? 'white' : 'white';
                        },
                        vLineColor: function (i, node) {
                            return (i === 0 || i === node.table.widths.length) ? 'white' : 'white';
                        },
                        // paddingLeft: function(i, node) { return 4; },
                        // paddingRight: function(i, node) { return 4; },
                        // paddingTop: function(i, node) { return 2; },
                        // paddingBottom: function(i, node) { return 2; },
                        // fillColor: function (i, node) { return null; }
                        fillColor: function (i, node) {
                            return (i === 0) ? '#e5bc64' : null;
                        }
                    }
                });
            }
            content.push({text: "Total Global: " + formatNumber(totalglobal) + " FCFA", fontSize: 12, bold: true, margin: [0, 5, 0, 3]});
        }
        return content;
    }
    var totalglobal = 0;
    function getBody(data) {
        var body = new Array();
        var cles = getKeys(data);
        var _header = new Array();
        for (var k = 0; k < cles.length; k++) {
            _header.push({text: cles[k], style: 'tableHeader'});
        }

        body.push(_header);
        var total = 0;
        for (var i = 0; i < data.length; i++) {

            var _content = new Array();
            for (var j = 0; j < cles.length; j++) {
                if (cles[j] === "P.T") {
                    total += parseInt(data[i]["P.T"]);

                }

                _content.push({text: data[i][cles[j]], style: 'tableContent'});
            }


            body.push(_content);
        }
        totalglobal += total;
        return {body: body, widht: getwidth(data), total: formatNumber(total)};
    }

    var global = 0;
    // pour formaté un nombre
    function formatNumber(number) {
        var formated = " ";
        var format = number.toString();
        var count = 0;
        for (var i = format.length - 1; i >= 0; i--) {
            if (count % 3 === 0) {
                formated = format[i] + " " + formated;

            } else {
                formated = format[i] + formated;
            }
            count++;
        }
        return formated;
    }
    function drawTable() {


        $(".all-table").html("");
        $(".all-table").hide();
        global = 0;
        for (var i = 0; i < this.alldata.length; i++) {

            var table = document.createElement("table");
            var thead = document.createElement("thead");
            var tbody = document.createElement("tbody");
            var tfoot = document.createElement("tfoot");
            var caption = document.createElement("caption");
            table.setAttribute("class", "table table-hover table-responsive table-bordered table-rapport rapport");
            caption.innerHTML = this.alldata[i].legende;
            var head = getKeys(this.alldata[i].data);
            table.appendChild(caption);
            var trh = document.createElement("tr");
            //boucle pour l'en-tete
            for (var j = 0; j < head.length; j++) {
                var th = document.createElement("th");
                th.innerHTML = head[j];
                trh.appendChild(th);
            }
            thead.appendChild(trh);
            table.appendChild(thead);

            var total = 0;
            //boucle pour charger le body
            for (var k = 0; k < this.alldata[i].data.length; k++) {
                var trb = document.createElement("tr");
                //boucle pour une ligne du body
                for (var l = 0; l < head.length; l++) {
                    var td = document.createElement("td");
                    if (head[l] === "P.T") {
                        total += parseInt(this.alldata[i].data[k]["P.T"]);
                        td.innerHTML = formatNumber(this.alldata[i].data[k][head[l]]);
                    } else if (head[l] === "PU") {
                        td.innerHTML = formatNumber(this.alldata[i].data[k][head[l]]);

                    } else {
                        td.innerHTML = this.alldata[i].data[k][head[l]];
                    }

                    trb.appendChild(td);
                }
                tbody.appendChild(trb);
            }
            global += total;
            var trf = document.createElement("tr");
            var thf = document.createElement("td");
            thf.innerHTML = "Total";
            thf.setAttribute("colspan", head.length - 1);
            var tht = document.createElement("td");
            tht.innerHTML = formatNumber(total) + " FCFA";
            trf.appendChild(thf);
            trf.appendChild(tht);
            tfoot.appendChild(trf);

            table.appendChild(tbody);
            table.appendChild(tfoot);
            ToPrint(table);
            thead.setAttribute("style", {"font-weight": "bold", "font-size": 40});
            $(".all-table").append(table);
            $(".all-table").append("<br>");
            $(".all-table").append("<br>");
        }
        $(".all-table").append("<strong>Total Global:" + formatNumber(global) + " FCFA</strong>");
        $(".all-table").show();
        setTimeout(function () {

            //$("#lalanda").addClass(""); 
            $(".rapport").css({"margin-bottom": "70px"});

            $(".rapport").find("caption").css({"border": " 5px black", fontSize: 20});
            $(".rapport").find("tbody").find("tr:odd").css({backgroundColor: "#CCCCCC"});
            $(".rapport").find("tfoot").find("tr").css({backgroundColor: "#e5bc64", "font-weight": "bold", fontSize: 12});
            $(".rapport").find("thead").find("tr").css({backgroundColor: "#4A8BC2", "font-weight": "bold", fontSize: 12, "color": "black"});
        }, 5);
    }


    var title = " de la Region ";
    var title_header;
    var categorie;
    var periode;
    var societe;
    var testImageDataUrl;
    var societeDataUrl;
    setTimeout(function () {
        $.ajax({
            url: "impression",
            data: {action: "bordereauP"},
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                societe = data;
                testImageDataUrl = 'data:image/png;base64,' + data[0];
                societeDataUrl = data[1];
                
            }
        });
    }, 10);
    var testImageDataUrl;
    function printPdf(data) {
        var docDefinition;
        if (this.alldata.length !== 0) {


            docDefinition = {
                info: {
                    title: 'SUBUFO DOCUMENT',
                    author: 'T2M software solution',
                    subject: 'subject of document',
                    keywords: 'keywords for document'
                },
                pageMargins: [20, 30, 20, 30],
                pageSize: 'A4',
                footer: function (currentPage, pageCount) {
                    var tfoo = {
                        columns: [
                            {text: "" + getDate(), alignment: 'left', style: 'footerleft'},
                            {text: "GIC", alignment: 'center', style: 'footercenter'},
                            {text: currentPage.toString() + ' / ' + pageCount, alignment: 'right', style: 'footer'}


                        ]};
                    return tfoo;
                },
                content: getContent(data),
                styles: {
                    img: {
                        margin: [0, 0, 0, 0]
                    },
                    header_center_top: {
                        fontSize: 12,
                        bold: true,
                        margin: [35, 5, 0, 10],
                        alignment: 'center'
                    },
                    header_center_bottom: {
                        bold: false,
                        margin: [0, 0, 0, 0]
                    },
                    subheader: {
                        fontSize: 12,
                        bold: true,
                        margin: [80, 0, 0, 0]
                    },
                    headertable: {
                        margin: [0, -15, 0, 3]
                    },
                    title: {
                        fontSize: 12,
                        bold: true,
                        margin: [140, 8, 0, 0]
                    },
                    subtitle: {
                        fontSize: 10,
                        bold: false,
                        margin: [170, 10, 0, 5]
                    },
                    tableExample: {
                        margin: [0, 5, 0, 0]
                    },
                    tableHeader: {
                        bold: true,
                        fontSize: 10


                    },
                    tableFooter: {
                        bold: true,
                        fontSize: 12,
                        margin: [0, 7, 0, 10]


                    },
                    tableContent: {
                        bold: false,
                        fontSize: 9,
                        margin: [0, 0, 0, 0]


                    },
                    footer: {
                        bold: true,
                        fontSize: 8,
                        margin: [0, 0, 20, 0]


                    },
                    footerleft: {
                        bold: true,
                        fontSize: 8,
                        margin: [20, 0, 0, 0]


                    },
                    footercenter: {
                        bold: true,
                        fontSize: 8,
                        margin: [0, 0, 0, 0]



                    }
                },
                defaultStyle: {
                    // alignment: 'justify'
                }
            };
        } else {
            docDefinition = {
                info: {
                    title: 'GIC DOCUMENT',
                    author: 'john doe',
                    subject: 'subject of document',
                    keywords: 'keywords for document'
                },
                pageMargins: [20, 30, 20, 30],
                pageSize: 'A4',
                footer: function (currentPage, pageCount) {
                    var tfoo = {
                        columns: [
                            {text: "" + getDate(), alignment: 'left', style: 'footerleft'},
                            {text: "GIC ", alignment: 'center', style: 'footercenter'},
                            {text: currentPage.toString() + ' / ' + pageCount, alignment: 'right', style: 'footer'}


                        ]};
                    return tfoo;
                },
                watermark: {text: "aucune consommation", color: "blue", opacity: 0.3, bold: true},
                content: getContent(data),
                styles: {
                    img: {
                        margin: [0, -20, 0, -9]
                    },
                    header: {
                        fontSize: 9,
                        bold: true,
                        margin: [170, 40, 0, -9]
                    },
                    subheader: {
                        fontSize: 12,
                        bold: true,
                        margin: [440, -60, 0, 0]
                    },
                    title: {
                        fontSize: 12,
                        bold: true,
                        margin: [40, 20, 0, 5]
                    },
                    subtitle: {
                        fontSize: 10,
                        bold: false,
                        margin: [140, 10, 0, 5]
                    },
                    tableExample: {
                        width: "100%",
                        margin: [0, 5, -70, 15]
                    },
                    tableHeader: {
                        bold: true,
                        fontSize: 12


                    },
                    tableFooter: {
                        bold: true,
                        fontSize: 12,
                        margin: [0, 3, 0, 7]


                    },
                    tableContent: {
                        bold: false,
                        fontSize: 9


                    },
                    footer: {
                        bold: true,
                        fontSize: 8,
                        margin: [0, 0, 20, 0]


                    },
                    footerleft: {
                        bold: true,
                        fontSize: 8,
                        margin: [20, 0, 0, 0]


                    },
                    footercenter: {
                        bold: true,
                        fontSize: 8,
                        margin: [0, 0, 0, 0]



                    }
                },
                defaultStyle: {
                    alignment: 'justify'
                }
            };
        }
        pdfMake.createPdf(docDefinition).open();
    }
    $(".print-pdf").hide();
    $(".print-pdf").click(function () {

        printPdf(this.alldata);
    });

    function getMulti(serveur, param, name, form) {
        $.post(
                serveur,
                param,
                function (data) {

                    $(".all_select").html("");
                    form.find(".ff").html("");
                    var k;
                    var select = document.createElement("select");
                    select.setAttribute("class", "input-lg site_service all_select");
                    select.setAttribute("name", name);
                    for (k = 0; k < data.length; k++) {
                        var option = document.createElement("option");
                        option.setAttribute("value", data[k][0]);
                        option.innerHTML = data[k][1];
                        select.appendChild(option);
                    }
                    form.find(".ff").html(select);
                    $(".all_select").attr('multiple', "multiple");
                    //  $(".example").multiselect();
                    //  $(".example").multiselect('rebuild');
                    $('.all_select').multiselect({
                        enableFiltering: true,
                        maxHeight: 200,
                        buttonClass: 'btn-primary btn',
                        buttonWidth: '150px',
                        selectAllText: "Tous",
                        includeSelectAllOption: true,
                        enableCaseInsensitiveFiltering: true,
                        filterPlaceholder: 'Recherhe',
                        // selectAllValue: 'multiselect-all',
                        // selectedClass: null,
                        // dropRight: true,
                        //dropUp: true,
                        buttonText: function (options, select) {
                            if (options.length === 0) {
                                return 'Aucune  Selection ...';
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

                },
                "json"
                );
    }
//obtenir tous les sites de la region
    $(".region_service").click(function (e) {
        e.preventDefault();
        $(".personnels").html("");
        $(".service").html("");
        var region = $(this).val();
        $("#liness").hide();
        var formoption = $(this).parents("form:first");
        var param = {action: "getSites", vue: "vue", region: region};
        if ($(this).hasClass("for_end")) {
            getMulti("admin", param, "site", formoption);
        } else {

            getMany("admin", param, ".site_service");
        }

    });
    $(".region_magp").click(function (e) {
        e.preventDefault();
        var region = $(this).val();
        $("#liness").hide();
        var formoption = $(this).parents("form:first");
        var param = {action: "getRole", vue: "vue", idAffectation: 3, region: region};
        if ($(this).hasClass("for_end")) {
            getMulti("admin", param, "id_magasinP", formoption);
        } else {

            getMany("admin", param, ".magasinP");
        }

    });
    $(".region_mags").click(function (e) {
        e.preventDefault();
        var region = $(this).val();
        $("#liness").hide();
        var param = {action: "getRole", vue: "vue", idAffectation: 2, region: region};
        var formoption = $(this).parents("form:first");
        if ($(this).hasClass("for_end")) {
            getMulti("admin", param, "id_magasin", formoption);
        } else {

            getMany("admin", param, ".magasin");
        }

    });
    $(".site_service").click(function (e) {

        e.preventDefault();
        $(".personnels").html("");
        var site = $(this).val();
        // $("#liness").hide();
        var param = {action: "getServiceBySite", vue: "vue", site: site};
        var formoption = $(this).parents("form:first");
        if ($(this).hasClass("for_end")) {
            getMulti("admin", param, "service", formoption);
        } else {

            getMany("admin", param, ".service");
        }

    });
    $(".service").click(function (e) {

        e.preventDefault();
        var service = $(this).val();
        $("#liness").hide();
        var param = {action: "getPersonnelsByService", vue: "vue", service: service};
        var formoption = $(this).parents("form:first");
        if ($(this).hasClass("for_end")) {
            getMulti("admin", param, "personnel", formoption);
        } else {

            getMany("admin", param, ".personnels");
        }

    });
    //pour obtenir les Directions
    $(".region").click(function (e) {

        e.preventDefault();
        var region = $(this).val();
        $("#liness").hide();
        var formoption = $(this).parents("form:first");
        var param = {action: "getDirectionByRegion", vue: "vue", region: region};
        if ($(this).hasClass("for_end")) {
            getMulti("admin", param, "direction", formoption);
        } else {

            getMany("admin", param, ".direction");
        }

    });

    $(".region_direction").click(function (e) {

        e.preventDefault();
        var region = $(this).val();
        $("#liness").hide();
        var formoption = $(this).parents("form:first");
        var param = {action: "getDirectionByRegion", vue: "vue", region: region};
        if ($(this).hasClass("for_end")) {

            getMulti("admin", param, "direction", formoption);
        } else {

            getMany("admin", param, ".direction_service");
        }

    });
    $(".direction_service").click(function (e) {

        e.preventDefault();
        var direction = $(this).val();
        $("#liness").hide();
        var formoption = $(this).parents("form:first");
        var param = {action: "getServices", vue: "vue", direction: direction};
        if ($(this).hasClass("for_end")) {

            getMulti("admin", param, "service", formoption);
        } else {

            getMany("admin", param, ".service");
        }

    });

    $(".region_direction_cc").click(function (e) {

        e.preventDefault();
        var region = $(this).val();
        $("#liness").hide();
        var formoption = $(this).parents("form:first");
        var param = {action: "getDirectionByRegion", vue: "vue", region: region};
        if ($(this).hasClass("for_end")) {

            getMulti("admin", param, "direction", formoption);
        } else {

            getMany("admin", param, ".direction_centre_cout");
        }

    });
    $(".direction_centre_cout").click(function (e) {

        e.preventDefault();
        var direction = $(this).val();
        $("#liness").hide();
        var formoption = $(this).parents("form:first");
        var param = {action: "getCentreCout", vue: "vue", direction: direction};
        if ($(this).hasClass("for_end")) {

            getMulti("admin", param, "centre_cout", formoption);
        } else {

            getMany("admin", param, ".centre_cout");
        }

    });

    $(".region_direction_stat").click(function (e) {

        e.preventDefault();
        var region = $(this).val();
        if ($(".niveau_personnel").text() !== "1" || $(".niveau_personnel").text() !== "2" || $(".niveau_personnel").text() !== "3") {
       
        $(".service_stat").html("");
        $("#liness").hide();
    }
        var formoption = $(this).parents("form:first");
        var param = {action: "getDirectionByRegion", vue: "vue", region: region};
        if ($(this).hasClass("for_end")) {

            getMulti("admin", param, "direction", formoption);
        } else {

            getMany("admin", param, ".direction_service_stat");
        }

    });
    $(".direction_service_stat").click(function (e) {

        e.preventDefault();
        var direction = $(this).val();
        if ($(".niveau_personnel").text() !== "1" || $(".niveau_personnel").text() !== "2" || $(".niveau_personnel").text() !== "3") {


            $("#liness").hide();
            $(".personnels").html("");
        }
        var formoption = $(this).parents("form:first");
        var param = {action: "getServices", vue: "vue", direction: direction};
        if ($(this).hasClass("for_end")) {

            getMulti("admin", param, "service", formoption);
        } else {

            getMany("admin", param, ".service_stat");
        }

    });
    
    $(".direction_service_stat").click(function (e) {

        e.preventDefault();
        var direction = $(this).val();
        if ($(".niveau_personnel").text() !== "1" || $(".niveau_personnel").text() !== "2" || $(".niveau_personnel").text() !== "3") {


            $("#liness").hide();
            $(".personnels").html("");
        }
        var formoption = $(this).parents("form:first");
        var param = {action: "getServices", vue: "vue", direction: direction};
        if ($(this).hasClass("for_end")) {

            getMulti("admin", param, "service", formoption);
        } else {

            getMany("admin", param, ".service_stat_perso");
        }

    });
    
    $(".service_stat").click(function (e) {

        e.preventDefault();
        var service = $(this).val();
        var param = {action: "getPersonnelsByService", vue: "vue", service: service};
        var formoption = $(this).parents("form:first");
        //$("#liness").hide();
        if ($(this).hasClass("for_end")) {
            getMulti("admin", param, "personnel", formoption);
        } else {

            getMany("admin", param, ".personnels");
        }

    });
    $(".service_stat_perso").click(function (e) {

        e.preventDefault();
        var service = $(this).val();
        var param = {action: "getPersonnelsByService", vue: "vue", service: service};
        var formoption = $(this).parents("form:first");
        //$("#liness").hide();
        if ($(this).hasClass("for_end")) {
            getMulti("admin", param, "personnel", formoption);
        } else {

            getMany("admin", param, ".personnels");
        }

    });
    var datable;
    var cat;
    $(".li-table").click(function (e) {
        e.preventDefault();
        title = "";
        header_top = (this).find("a").text();
        $(".rapport").html("");
        $(".compare-service").html("");
        if ($(this).children("a").html() === "Region") {
            title = " de la Region ";
        } else if ($(this).children("a").html() === "Site") {
            title = " du Site ";
        } else if ($(this).children("a").html() === "Service") {
            title = " du Service ";
        } else if ($(this).children("a").html() === "Direction") {
            title = " de la Direction ";
        } else if ($(this).children("a").html() === "Personnel") {
            title = " du Personnel ";
        } else if ($(this).children("a").html() === "Magasin Principal") {
            title = " du Magasin Principal ";
        } else if ($(this).children("a").html() === "Magasin Secondaire") {
            title = " du Magasin Secondaire ";
        } else {
            title = " de la Region ";
        }
        $(".print-pdf").hide();
        cat = $(this).children("a").text();

        $(".stat-perso").html("");
        if ($(".table-rapport").hasClass("perso")) {
            $(".table-rapport tfoot").html("");
            //datable.DataTable();
            $(".table-rapport").removeCLass("perso");
        }

        $(".all-table").html("");
        $(".compare-service").html("");
        $(".table-rapport").removeCLass("rapport");



    });
    function parseDate(date) {
        var dat = new Array();
        dat = date.split("-");
        return " du " + dat[0] + " au " + dat[1];
    }

    function savedata(data) {
        this.alldata = data;
        drawTable();
        //alert(alldata[0].data);
    }
    function ToPrint($id) {
        var region;
        var titre;
        $($id).find("thead").css({"font-size": "30px", "color": "black", "font-weight": "bold"});
        $($id).find("tfoot").css({"font-size": "10px", "color": "black", "font-style": "oblique", "font-weight": "bold"});
        if ($(".notification").attr("region") === "") {
            region = " ";
        } else {

            region = " REGION " + $(".notification").attr("region");
        }


        titre = $($id).find("caption").text();
        var titreT = $(".page-title").text();
        var header = '<div class="header_top" style="border:2px solid black;padding:5px;margin-bottom:5px">' +
                '<span style="text-align:left">' +
                '<img src="data:image/png;base64,' + societe[0] + '" style=" left:0;padding-right:10px;height:70px" />' +
                '</span>' +
                // '<div class="region pull-right" style="margin-right:5px;margin-top:10px;"><i>GIC</i></div>' +
                '<h3 class="header_title_top" style="text-align:center;padding-right:10px;font-size:0.7em"> ' + region + '</h3><br>' +
                '<h3 class="header_title" style="text-align:center;padding-right:10px;font-size:0.7em"> ' + societe[1] + '</h3>' +
                '</div><br>' +
                '<strong style="text-align:center;padding-right:10px;font-size:0.7em"> Consommation Periodique ' + titre + '</strong>' +
                '<br>' +
                '<h3 style="text-align:center;padding-right:10px;font-size:0.5em"> periode ' + parseDate(periode) + '</h3>';

        '</div>';

        setTimeout(function () {



            datable = $($id).DataTable({
                dom: "Bfrtip",
                responsive: true,
                autoFill: true,
                // info: true,
                //  scrollY: 250,
                //paging: false,
                // stateSave: true,
                header: true,
                lengthChange: true,
                //keys: true,
                //select: true,
                lengthMenu: [
                    [10, 25, 50, -1],
                    ['10 lignes', '25 lignes', '50 lignes', 'Tous']

                ],
                //  stateSave: true,
                buttons: [
                    // 'columnsToggle',
                    {
                        extend: 'colvis',
                        collectionLayout: ' three-column ',
                        text: 'Colonnes',
                        postfixButtons: ['colvisRestore'],
                        columns: ':visible'
                    },
                    {
                        extend: 'colvisGroup',
                        text: 'Montrer Tous',
                        show: ':hidden'
                    },
                    'pageLength',
                    {
                        extend: 'collection',
                        text: 'Exporter',
                        autoClose: true,
                        buttons: [
                            'copy',
                            {
                                extend: 'excel',
                                title: 'Data export',
                                extension: '.xls',
                                // text: '<i class="fa fa-file-excel-o"></i>', 
                                titleAttr: 'Excel',
                                exportOptions: {
                                    columns: ' :visible'
                                },
                                columnDefs: [{targets: -1,
                                        visible: false}]
                            },
                            'csv',
                            {
                                extend: 'pdfHtml5',
                                message: function () {
                                    return "";
                                },
                                title: titre,
                                //text: '<i class="fa fa-file-pdf-o icon icon-print"></i>',
                                titleAttr: 'PDF',
                                orientation: 'portrait',
                                pageSize: 'A4',
                                download: 'open',
                                customize: function (doc) {



                                    doc.content.splice(0, 0, {
                                        margin: [0, -20, 0, 0],
                                        alignment: 'left',
                                        image: 'data:image/png;base64,' + societe[0] + ' style=" left:0;padding-right:10px;height:20px"'
                                    });
                                    doc.content.splice(0, 0, {
                                        margin: [40, 0, 0, 0],
                                        alignment: 'center',
                                        text: "" + societe[1]

                                    });
                                    doc.content.splice(0, 0, {
                                        margin: [0, -10, 0, 0],
                                        alignment: 'right',
                                        text: "" + region

                                    });
                                },
                                exportOptions: {
                                    columns: ' :visible'
                                },
                                columnDefs: [{targets: -1,
                                        visible: false}]
                            }

                        ]
                    }, {
                        extend: 'print',
                        text: 'Imprimer',
                        titleAttr: 'Imprimertout',
                        message: '',
                        autoPrint: true,
                        title: function () {
                            return " ";
                        },
                        //footer: true,
                        customize: function (win) {
                            $(win.document.body).addClass('display').css('font-size', '1.2em').prepend(header);
                            $(win.document.body).find('h3').css('text-align', 'center');
                            $(win.document.body).find('tbody').css({'font-size': '0.7em', "text-align": "center", "padding-top": "0px"});
                            $(win.document.body).find('tbody tr td,tr th').css({'font-size': '0.7em', "padding-top": "0px", "padding-bottom": "0px"});
                            $(win.document.body).find('thead').css({'font-size': '0.8em', "text-align": "center"});
                            $(win.document.body).find('div.region').css('text-align', 'right');
                            $(win.document.body).addClass('display').css('font-size', '1.2em').append("<br> Total: " + $($id).find("tfoot").find("td:last").text());
                            $(win.document.body).find('strong').css({'text-align': 'center', 'margin-left': '220px'});
                            $(win.document.body).find('.header_top').css('height', '70px');
                            $(win.document.body).find('.header_title_top').css('margin-top', '-60px');
                            $(win.document.body).find('.header_title').css('margin-top', '-40px');
                            $(win.document.body).find('tbody').css({'font-size': '0.7em', "text-align": "center", "padding-top": "0px"});
                            $(win.document.body).find('tbody tr td,tr th').css({'font-size': '0.7em', "padding-top": "0px", "padding-bottom": "0px"});
                            $(win.document.body).find('thead').css({'font-size': '0.8em', "text-align": "center"});
                            $(win.document.body).find('thead tr').css({'background-color': '#4A8BC2', "text-align": "center"});
                            $(win.document.body).find('div.region').css('text-align', 'right');
                            $(win.document.body).find('tbody tr:odd').css({'background-color': '#CCCCC', "text-align": "center"});
                        },
                        exportOptions: {
                            columns: ' :visible'

                        },
                        columnDefs: [{targets: -1,
                                visible: false}]


                    }

                ],
                language: {
                    buttons: {
                        copyTitle: 'Ajouté au presse-papiers',
                        copyKeys: 'Appuyez sur <i>ctrl</i> ou <i>\u2318</i> + <i>C</i> pour copier les données du tableau à votre presse-papiers. <br><br>Pour annuler, cliquez sur ce message ou appuyez sur Echap.',
                        copySuccess: {
                            _: '%d lignes copiées',
                            1: '1 ligne copiée',
                            pageLength: 'montrer'
                        }
                    },
                    processing: "Traitement en cours...",
                    search: "Rechercher&nbsp;:",
                    lengthMenu: "Afficher _MENU_ &eacute;l&eacute;ments",
                    info: "Affichage de l'&eacute;lement _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
                    infoEmpty: "Affichage de l'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
                    infoFiltered: "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
                    infoPostFix: "",
                    loadingRecords: "Chargement en cours...",
                    zeroRecords: "Aucun &eacute;l&eacute;ment &agrave; afficher",
                    emptyTable: "Aucune donnée disponible dans le tableau",
                    paginate: {
                        first: "Premier",
                        previous: "Pr&eacute;c&eacute;dent",
                        next: "Suivant",
                        last: "Dernier"
                    },
                    aria: {
                        sortAscending: ": activer pour trier la colonne par ordre croissant",
                        sortDescending: ": activer pour trier la colonne par ordre décroissant"
                    }
                }
            });
            datable.$('tr').css('font-size', '12px');
        }, 10);
    }
    $(".search-catego").click(function (e) {
        e.preventDefault();
        $(".table-rapport").removeClass("hidden");
        if ($(".table-rapport").hasClass("persos")) {
            $(".table-rapport").removeCLass("persos");
        }



        var form = $(this).parents("form:first");
        this.action = form.attr("action");
        //alert($(this).parent("form").find(".reservation").val());
        var date = form.find(".reservation").val();
        periode = form.find(".reservation").val();
        var select = form.find("select:last").find("option:selected").text();
        categorie = form.find("[name=categorie]").find("option:selected").text();
        if (form.hasClass("non-region")) {

            form.attr("action", form.attr("action") + "&id_magasin=" + form.attr("id_magasin"));
            title = " du Magasin " + $("#nom_magasin").html();
        }

        if (form.hasClass("non-regionp")) {

            form.attr("action", form.attr("action") + "&id_magasinP=" + form.attr("id_magasinP"));
            title = " du Magasin " + $("#nom_magasin").html();
        }
        title_header = title + select;
        var title_end = " " + form.find("select:last").find("option:selected").text();
        var vide = false;
        $.each(form.find(".reservation"), function () {
            if ($(this).val() === "") {
                $(this).css({
                    borderColor: 'red',
                    color: 'red'
                });
                vide = true;
            } else {
                $(this).css({
                    borderColor: '',
                    color: ''
                });
            }
        });
        if (!vide) {

            if (form.find("[name=choix]:checked").val() === "tous") {
                form.attr("action", $(this).attr("name"));
                $.ajax({
                    url: form.attr("action"),
                    data: form.serialize(),
                    type: 'POST',
                    dataType: 'json',
                    success: function (data) {
                        //alert(data);
                        $(".table-rapport").hide();
                        console.log(data);
                        savedata(data);
                    }

                });
                form.attr("action", this.action);
                $(".print-pdf").slideDown(1233);
            } else {

                form.submit();
            }
        } else {
            alert("error");
        }

    });
    var region;
    var titre;
    if ($(".notification").attr("region") === "") {
        region = " ";
    } else {

        region = " region " + $(".notification").attr("region");
    }

    if ($(".perso").attr("titre") === undefined) {
        titre = " ";
    } else {

        titre = $(".perso").attr("titre") + $(".li-cat.active").find("a").text();
    }


    var titreT = $(".page-title").text();
    setTimeout(function () {


        $.ajax({
            url: "impression",
            data: {action: "bordereauP"},
            type: 'POST',
            dataType: 'json',
            success: function (data) {


                $('.perso').DataTable({
                    dom: "Bfrtip",
                    responsive: true,
                    autoFill: true,
                    // info: true,
                    //  scrollY: 250,
                    //paging: false,
                    // stateSave: true,
                    header: true,

                    lengthChange: true,
                    //keys: true,
                    //select: true,
                    lengthMenu: [
                        [10, 25, 50, -1],
                        ['10 lignes', '25 lignes', '50 lignes', 'Tous']

                    ],
                    //  stateSave: true,
                    buttons: [
                        // 'columnsToggle',
                        {
                            extend: 'colvis',
                            collectionLayout: ' three-column ',
                            text: 'Colonnes',
                            postfixButtons: ['colvisRestore'],
                            columns: ':visible'
                        },
                        {
                            extend: 'colvisGroup',
                            text: 'Montrer Tous',
                            show: ':hidden'
                        },
                        'pageLength',
                        {
                            extend: 'collection',
                            text: 'Exporter',
                            autoClose: true,
                            buttons: [
                                'copy',
                                {
                                    extend: 'excel',
                                    title: 'Data export',
                                    extension: '.xls',
                                    // text: '<i class="fa fa-file-excel-o"></i>', 
                                    titleAttr: 'Excel',
                                    exportOptions: {
                                        columns: ' :visible'
                                    },
                                    columnDefs: [{targets: -1,
                                            visible: false}]
                                },
                                'csv',
                                {
                                    extend: 'pdfHtml5',
                                    message: function () {
                                        return "";
                                    },
                                    title: titre,
                                    //text: '<i class="fa fa-file-pdf-o icon icon-print"></i>',
                                    titleAttr: 'PDF',
                                    orientation: 'portrait',
                                    pageSize: 'A4',
                                    download: 'open',
                                    customize: function (doc) {



                                        doc.content.splice(0, 0, {
                                            margin: [0, -20, 0, 0],
                                            alignment: 'left',
                                            image: 'data:image/png;base64,' + testImageDataUrl + ' style=" left:0;padding-right:10px;height:20px"'
                                        });
                                        doc.content.splice(0, 0, {
                                            margin: [40, 0, 0, 0],
                                            alignment: 'center',
                                            text: "" + societeDataUrl

                                        });
                                        doc.content.splice(0, 0, {
                                            margin: [0, -10, 0, 0],
                                            alignment: 'right',
                                            text: "" + region

                                        });
                                    },
                                    exportOptions: {
                                        columns: ' :visible'
                                    },
                                    columnDefs: [{targets: -1,
                                            visible: false}]
                                }

                            ]
                        }, {
                            extend: 'print',
                            text: 'Imprimer',
                            titleAttr: 'Tout Imprimer',
                            message: '',
                            class: "printbtn",
                            autoPrint: true,
                            title: function () {
                                return " ";
                            },
                            footer: true,
                            customize: function (win) {
                                var header = '<div class="header_top" style="border:2px solid black;padding:5px;margin-bottom:5px">' +
                                        '<span style="text-align:left">' +
                                        '<img src="data:image/png;base64,' + data[0] + '" style=" left:0;padding-right:10px;height:70px" />' +
                                        '</span>' +
                                        '<h3 class="header_title_top" style="text-align:center;padding-right:10px;font-size:0.7em"> ' + region + '</h3><br>' +
                                        '<h3 class="header_title" style="text-align:center;padding-right:10px;font-size:0.7em"> ' + data[1] + '</h3>' +
                                        '</div><br>' +
                                        '<h3 style="text-align:center;padding-right:10px;font-size:0.7em"> Journal de consommation des articles sur une periode</h3>';
                                '</div>';


                                $(win.document.body).addClass('display').css('font-size', '1.2em').prepend(header);
                                $(win.document.body).find('h3').css('text-align', 'center');
                                $(win.document.body).find('tbody').css({'font-size': '0.7em', "text-align": "center", "padding-top": "0px"});
                                $(win.document.body).find('tbody tr td,tr th').css({'font-size': '0.7em', "padding-top": "0px", "padding-bottom": "0px"});
                                $(win.document.body).find('thead').css({'font-size': '0.8em', "text-align": "center"});
                                $(win.document.body).find('div.region').css('text-align', 'right');

                                $(win.document.body).find('h3').css('text-align', 'center');
                                $(win.document.body).find('.header_top').css('height', '70px');
                                $(win.document.body).find('.header_title').css('margin-top', '-40px');
                                $(win.document.body).find('.header_title_top').css('margin-top', '-60px');
                                $(win.document.body).find('tbody').css({'font-size': '0.7em', "text-align": "center", "padding-top": "0px"});
                                $(win.document.body).find('tbody tr td,tr th').css({'font-size': '0.7em', "padding-top": "0px", "padding-bottom": "0px"});
                                $(win.document.body).find('thead').css({'font-size': '0.8em', "text-align": "center"});
                                $(win.document.body).find('div.region').css('text-align', 'right');




                            },
                            exportOptions: {
                                columns: ' :visible'

                            },
                            columnDefs: [{targets: -1,
                                    visible: false}]


                        }

                    ],
                    language: {
                        buttons: {
                            copyTitle: 'Ajouté au presse-papiers',
                            copyKeys: 'Appuyez sur <i>ctrl</i> ou <i>\u2318</i> + <i>C</i> pour copier les données du tableau à votre presse-papiers. <br><br>Pour annuler, cliquez sur ce message ou appuyez sur Echap.',
                            copySuccess: {
                                _: '%d lignes copiées',
                                1: '1 ligne copiée',
                                pageLength: 'montrer'
                            }
                        },
                        processing: "Traitement en cours...",
                        search: "Rechercher&nbsp;:",
                        lengthMenu: "Afficher _MENU_ &eacute;l&eacute;ments",
                        info: "Affichage de l'&eacute;lement _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
                        infoEmpty: "Affichage de l'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
                        infoFiltered: "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
                        infoPostFix: "",
                        loadingRecords: "Chargement en cours...",
                        zeroRecords: "Aucun &eacute;l&eacute;ment &agrave; afficher",
                        emptyTable: "Aucune donnée disponible dans le tableau",
                        paginate: {
                            first: "Premier",
                            previous: "Pr&eacute;c&eacute;dent",
                            next: "Suivant",
                            last: "Dernier"
                        },
                        aria: {
                            sortAscending: ": activer pour trier la colonne par ordre croissant",
                            sortDescending: ": activer pour trier la colonne par ordre décroissant"
                        }
                    }
                });
            }
        });

    }, 40);
});