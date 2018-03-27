/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $.ajax({
        url: "impression",
        data: {action: "bordereauP"},
        type: 'POST',
        dataType: 'json',
        success: function (data) {
            console.log(data);
            Simple_impression(data);

        }
    });

    function getDate() {
        var date = new Date();
        var jour = date.getDate();
        var mois = (date.getMonth() + 1);
        if (date.getDate() < 10) {
            jour = "0" + date.getDate();
        }

        if (date.getMonth()+1 < 10) {
            mois = "0" + (date.getMonth() + 1);
        }
        return jour + "/" + mois + "/" + date.getFullYear();
    }
    function Simple_impression(data) {
        var region;
        var titre;
        if ($(".notification").attr("region") === "") {
            region = " ";

        } else {

            region = "REGION " + $(".notification").attr("region");

        }



        titre = $(".page-title").html();



        var header_bordereau = '<div class="header_top" style="border:2px solid black;padding:5px;margin-bottom:15px;height:80px">' +
                '<span style="text-align:left">' +
                '<img src="data:image/png;base64,' + data[0] + '" style=" left:0;padding-right:10px;height:70px" />' +
                '</span>' +
           
                '<h3 class="header_title_top" style="text-align:center;padding-right:10px;font-size:0.7em"> <strong>' + region + '</strong></h3><br>' +
                '<h3 class="header_title" style="text-align:center;padding-right:10px;font-size:0.7em"> ' + data[1] + '</h3>' +
                '</div>';



        var bordereau2 = '<div class="bordereau" style="padding:2px;margin-bottom:5px">' +
                '<span class="titre_bordereau" style="text-align:center">' +
                '<strong>BON DE SORTIE POUR CONSOMMATION </strong>' +
                '</span><br>' +
                '<div class="row-fluid">' +
                '<div class="span6">' +
                '<p><strong>Date expedition: </strong>  ' + getDate() +
                '</p>' +
                '<p><strong>Personnel: </strong>  ' + $(".name_user").text() +
                '</p>' +
                '<p><strong>Region: </strong>  ' +  $(".notification").attr("region") +
                '</p>' +
                '<p><strong>Service: </strong>  ' + $(".service_user").text() +
                '</p>' +
                '</div>' +
                '<div class="span6 ">' +
                '<p><strong>magasin: </strong>  ' + $(".nom_magasin").text() +
                '</p>' +
                '<p><strong>Magasignier: </strong>  ' + $(".username").text() +
                '</p>' +
                '<p><strong>Site: </strong>  ' + $(".site_user").text() +
                '</p>' +
                '</div>' +
                '</div>' +
                // '<h3 style="text-align:center;padding-right:10px;font-size:0.7em"> Liste Des Commandes</h3>' +
                '</div><hr>';

        var signature = '<br><br><div class="row-fluid">' +
                '<div class="span6 " style="text-align:center;font-size:0.5em">' +
                '<p><span class="center">' + $(".name_user").text() + '</span>' +
                '</div>' +
                '<div class="span6 " style="text-align:center;font-size:0.5em">' +
                '<p><span class="center">' + $(".username").text() + '</span>' +
                '</div>' +
                '</div>';

        var total = '<label style="font-size:0.7em">total: ' + $(".total_commande").text() + '</label><br>';
        var datable2 = $('.bordereauPersonnel').DataTable({
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
                                    image: 'data:image/png;base64,' + data[0] + ' style=" left:0;padding-right:10px;height:20px"'
                                });
                                doc.content.splice(0, 0, {
                                    margin: [40, 0, 0, 0],
                                    alignment: 'center',
                                    text: "" + data[1]

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
                    titleAttr: 'Imprimer',
                    message: '',
                    autoPrint: true,
                    title: function () {
                        return " ";
                    },
                    //footer: true,
                    customize: function (win) {
                        $(win.document.body).addClass('display').css('font-size', '1.2em').prepend(bordereau2).prepend(header_bordereau);
                        $(win.document.body).find('h3').css('text-align', 'center');
                        $(win.document.body).append(total);
                        $(win.document.body).append(signature);
                        $(win.document.body).find('.row-fluid').css({"width": "100%"});
                        $(win.document.body).find('.span6').css({"width": "48.717948717948715%", "display": "block", "float": "left"});


                        $(win.document.body).find('.header_top').css('height', '80px');
                        $(win.document.body).find('.header_title').css('margin-top', '-40px');
                        $(win.document.body).find('.header_title_top').css('margin-top', '-60px');
                        $(win.document.body).find('.bordereau').css({'font-size': '0.7em', "padding-top": "0px"});
                        $(win.document.body).find('.titre_bordereau').css({'text-align': 'center', 'margin-left': "250px"});
                        $(win.document.body).find('.date_validation').css({'text-align': 'center', 'margin-left': "270px"});
                        $(win.document.body).find('span.second').css({'text-align': 'right', 'margin-left': "230px"});
                        $(win.document.body).find('span.second_r').css({'text-align': 'right', 'margin-left': "202px"});
                        $(win.document.body).find('span.second_s').css({'text-align': 'right', 'margin-left': "248px", "position": "auto", "z-index": "110"});
                        $(win.document.body).find('span.second_c').css({'text-align': 'right', 'margin-left': "200px"});
                        $(win.document.body).find('span.second_d').css({'text-align': 'right', 'margin-left': "170px"});

                        $(win.document.body).find('tbody').css({'font-size': '0.7em', "text-align": "center", "padding-top": "0px"});
                        $(win.document.body).find('tbody tr td,tr th').css({'font-size': '0.7em', "padding-top": "0px", "padding-bottom": "0px"});
                        $(win.document.body).find('thead').css({'font-size': '0.8em', "text-align": "center"});
                        $(win.document.body).find('div.region').css('text-align', 'right');
                        // $(win.document.body).addClass('display').css('font-size', '1.2em').append(tfoot);
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

        datable2.$('tr').css('font-size', '12px');

    }

});
