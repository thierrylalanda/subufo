/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

(function () {

    var app = angular.module('depense', ["ngRoute", "ngMaterial", 'ngAnimate', 'toaster']);
    function parseDate(date) {
        var dat = new Array();
        dat = date.split("-");
        return " du " + dat[0] + " au " + dat[1];
    }
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
    function getwidth(data) {
        var obj = data[0];
        var keys = new Array();
        for (var k in obj) {
            keys.push("star");
        }

        return keys;
    }

    function getDateLong(date) {
        var date = new Date(date);
        var jour = date.getDate();
        var mois = (date.getMonth() + 1);
        var min = date.getMinutes();
        var sec = date.getSeconds();
        if ((date.getDate() + 1) < 10) {
            jour = "0" + date.getDate();
        }

        if ((date.getMonth() + 1) < 10) {
            mois = "0" + (date.getMonth() + 1);
        }

        if (min < 10) {
            min = "0" + min;
        }
        if (sec < 10) {
            sec = "0" + sec;
        }
        return jour + "/" + mois + "/" + date.getFullYear();
    }
    function getDate() {
        var date = new Date();
        var jour = date.getDate();
        var mois = (date.getMonth() + 1);
        var min = date.getMinutes();
        var sec = date.getSeconds();
        if ((date.getDate() + 1) < 10) {
            jour = "0" + date.getDate();
        }

        if ((date.getMonth() + 1) < 10) {
            mois = "0" + (date.getMonth() + 1);
        }

        if (min < 10) {
            min = "0" + min;
        }
        if (sec < 10) {
            sec = "0" + sec;
        }
        return jour + "/" + mois + "/" + date.getFullYear() + "  " + date.getHours() + ":" + min + ":" + sec;
    }

    function getContent(data, etat) {
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
        if (etat === 1) {
            content.push({text: '\n\n ORDRE ACHAT ', alignment: 'center'});
        } else if (etat === 3) {
            content.push({text: '\n\n ORDRE DE MISSION \n ', alignment: 'center'});
            content.push({text: data.demandeur + "\n\n", alignment: 'center', style: 'center'});
        } else if (etat === 2) {
            content.push({text: '\n\n ORDRE D\'ENGAGEMENT DE DEPENSE \n ', style: 'title'});

        }
        if (etat === 0) {
            content.push({text: data.demandeur + "\n\n", style: 'subtitle1'});
        }

        if (etat === 1) {
            content.push({
                table: {
                    widths: ["*", "auto", "*", "*", "auto"],
                    body: [
                        [
                            {text: "Date édition"},
                            {text: "Notre référence"},
                            {text: "Date"},
                            {text: "N°"},
                            {text: "Fournisseur"}
                        ],
                        [
                            {text: getDateLong(data.date_demande)},
                            {text: data.demandeur},
                            {text: getDateLong(data.date_demande)},
                            {text: data.id_demande},
                            {text: data.fournisseur}
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
                        return (i === 0 || i === node.table.body.length) ? 'black' : 'black';
                    },
                    vLineColor: function (i, node) {
                        return (i === 0 || i === node.table.widths.length) ? 'black' : 'black';
                    }
                }
            });
            content.push({text: '\n\n'});
            content.push({
                table: {
                    widths: ["*", "*", "*", "*"],
                    body: [
                        [
                            {text: "Cond.paiement"},
                            {text: "Cond. transport "},
                            {text: "Mode livraison"},
                            {text: "Cond. livraison"}
                        ],
                        [
                            {text: data.cond_paiment + " jour(s)"},
                            {text: data.cond_transport},
                            {text: data.mode_livraison},
                            {text: data.cond_livraison}
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
                        return (i === 0 || i === node.table.body.length) ? 'black' : 'black';
                    },
                    vLineColor: function (i, node) {
                        return (i === 0 || i === node.table.widths.length) ? 'black' : 'black';
                    }
                }
            });
            content.push({text: '\n\n\n\n'});
        } else if (etat === 0 || etat === 2) {
            content.push({
                style: 'headertable',
                table: {
                    widths: ["*", "auto", "*", "*"],
                    body: [
                        [
                            {text: "N° "},
                            {text: "Objet"},
                            {text: "date"},
                            {text: "echeance"}

                        ],
                        [
                            {text: data.id_demande},
                            {text: data.libelle},
                            {text: getDateLong(data.date_demande)},
                            {text: getDateLong(data.date_echeance)}
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
                        return (i === 0 || i === node.table.body.length) ? 'black' : 'black';
                    },
                    vLineColor: function (i, node) {
                        return (i === 0 || i === node.table.widths.length) ? 'black' : 'black';
                    }
                }
            });
            content.push({text: '\n\n\n'});
        }
        if (etat === 2) {
            content.push({
                style: 'headertable',
                table: {
                    widths: ["*", "auto", "*", "*"],
                    body: [
                        [
                            {text: "Demandeur"},
                            {text: "destination"},
                            {text: "depart"},
                            {text: "retour"}

                        ],
                        [
                            {text: data.demandeur},
                            {text: data.lieu},
                            {text: getDateLong(data.date_depart)},
                            {text: getDateLong(data.date_retour)}
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
                        return (i === 0 || i === node.table.body.length) ? 'black' : 'black';
                    },
                    vLineColor: function (i, node) {
                        return (i === 0 || i === node.table.widths.length) ? 'black' : 'black';
                    }
                }
            });
            content.push({text: '\n\n\n'});
        }


        if (etat === 3) {
            content.push({
                style: 'headertable',
                table: {
                    widths: ["auto", "35%", "auto", "auto", "*", "*"],
                    body: [
                        [
                            {
                                text: "Libelle", style: 'tableHeader'

                            },
                            {
                                text: "Description", style: 'tableHeader'

                            }, {
                                text: "Lieu", style: 'tableHeader'

                            },
                            {
                                text: "Depart", style: 'tableHeader'

                            },
                            {
                                text: "Retour", style: 'tableHeader'

                            },
                            {
                                text: "vehicule", style: 'tableHeader'

                            }
                        ],
                        [
                            {text: data.libelle, style: 'tableExample'},
                            {text: data.description, style: 'tableExample'},
                            {text: data.lieu, style: 'tableExample'},
                            {text: getDateLong(data.date_depart) + "\n\n\n\n\n\n\n\n\n\n\n", style: 'tableExample'},
                            {text: getDateLong(data.date_retour), style: 'tableExample'},
                            {text: "Transport public", style: 'tableExample'}
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
                        return (i === 0 || i === node.table.body.length) ? 'black' : 'black';
                    },
                    vLineColor: function (i, node) {
                        return (i === 0 || i === node.table.widths.length) ? 'black' : 'black';
                    }
                }
            });
            content.push({text: '\n\n\n'});
            content.push({
                style: 'headerVisa',
                table: {
                    widths: ["*", "*", "*"],
                    body: [
                        [
                            {
                                text: "Personne autorisée", style: 'tableVisa', decoration: 'underline'

                            }, {
                                text: ''

                            },
                            {
                                text: "Donneur d'ordre", style: 'tableVisa', decoration: 'underline'

                            }
                        ],
                        [
                            {
                                text: "", style: 'tableVisa'

                            }, {
                                text: "", style: 'tableVisa'

                            },
                            {
                                text: " ", style: 'tableVisa'

                            }
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
                        return (i === 0 || i === node.table.body.length) ? 'white' : 'white';
                    },
                    vLineColor: function (i, node) {
                        return (i === 0 || i === node.table.widths.length) ? 'white' : 'white';
                    }
                }
            });
        }
        if (etat !== 3) {
            content.push({
                style: 'headertable',
                table: {
                    widths: ["auto", "auto", "35%", "auto", "*", "*"],
                    body: [
                        [
                            {
                                text: "Code imputation", style: 'tableHeader'

                            },
                            {
                                text: "Nature", style: 'tableHeader'

                            }, {
                                text: "Description", style: 'tableHeader'

                            },
                            {
                                text: "Quantite", style: 'tableHeader'

                            },
                            {
                                text: "Prix unitaire", style: 'tableHeader'

                            },
                            {
                                text: "Prix Total", style: 'tableHeader'

                            }
                        ],
                        [
                            {text: data.code_imputation, style: 'tableExample'},
                            {text: data.nature_demande, style: 'tableExample'},
                            {text: data.description, style: 'tableExample'},
                            {text: formatNumber(data.quantite) + "\n\n\n\n\n\n\n\n\n\n\n", style: 'tableExample'},
                            {text: formatNumber(data.prix_unitaire), style: 'tableExample'},
                            {text: formatNumber(data.montant), style: 'tableExample'}
                        ],
                        [
                            {colSpan: 6, text: "Montant Net à Payer : " + formatNumber(data.montant) + " Fcfa", alignment: 'center'}
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
                        return (i === 0 || i === node.table.body.length) ? 'black' : 'black';
                    },
                    vLineColor: function (i, node) {
                        return (i === 0 || i === node.table.widths.length) ? 'black' : 'black';
                    }
                }
            });
            content.push({
                style: 'headerVisa',
                table: {
                    widths: ["*", "*", "*"],
                    body: [
                        [
                            {
                                text: "controle de Gestion", style: 'tableVisa', decoration: 'underline'

                            }, {
                                text: 'OA RECEPTIONNER', color: 'red', opacity: 0.3, bold: true, italics: false, fontSize: 12, decoration: 'underline', background: '#cccccc'

                            },
                            {
                                text: "Donneur d'ordre", style: 'tableVisa', decoration: 'underline'

                            }
                        ],
                        [
                            {
                                text: "", style: 'tableVisa'

                            }, {
                                text: "", style: 'tableVisa'

                            },
                            {
                                text: " ", style: 'tableVisa'

                            }
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
                        return (i === 0 || i === node.table.body.length) ? 'white' : 'white';
                    },
                    vLineColor: function (i, node) {
                        return (i === 0 || i === node.table.widths.length) ? 'white' : 'white';
                    }
                }
            });
        }
        content.push({text: '\n\n\n\n'});
        if (etat === 0 || etat === 2) {
            content.push({
                table: {
                    widths: ["*", "*", "*", "*"],
                    body: [
                        [
                            {text: "B.P.F --> " + formatNumber(data.montant) + " TTC XAF", colSpan: 4, alignment: 'right', decoration: 'underline', decorationColor: 'blue'}
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
                        return (i === 0 || i === node.table.body.length) ? 'black' : 'black';
                    },
                    vLineColor: function (i, node) {
                        return (i === 0 || i === node.table.widths.length) ? 'black' : 'black';
                    }
                }
            });
            content.push({
                table: {
                    widths: ["*", "*", "*", "*"],
                    body: [
                        [
                            {text: "Signature Emetteur \n\n\n\n\n\n\n\n", style: 'tableVisa', decoration: 'underline'},
                            {text: "personne autorisée ", style: 'tableVisa', decoration: 'underline'},
                            {text: "Signature partie prenante ", style: 'tableVisa', decoration: 'underline'},
                            {text: "Signature Caisse", style: 'tableVisa', decoration: 'underline'}
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
                        return (i === 0 || i === node.table.body.length) ? 'black' : 'black';
                    },
                    vLineColor: function (i, node) {
                        return (i === 0 || i === node.table.widths.length) ? 'black' : 'black';
                    }
                }
            });
        }

        return content;
    }
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
                // console.log(data);
            }
        });
    }, 10);
    var testImageDataUrl;
    function printPdf(data, etat) {
        var docDefinition;

        docDefinition = {
            info: {
                title: 'SUBUFO DOCUMENT',
                author: 'T2M software solution',
                subject: 'Engagement de depense',
                keywords: 'Depense'
            },
            pageMargins: [20, 30, 20, 30],
            pageSize: 'A4',
            footer: function (currentPage, pageCount) {
                var tfoo = {
                    columns: [
                        {text: "" + getDate(), alignment: 'left', style: 'footerleft'},
                        {text: "MAKE BY T2M software solution", alignment: 'center', style: 'footercenter'},
                        {text: currentPage.toString() + ' / ' + pageCount, alignment: 'right', style: 'footer'}


                    ]};
                return tfoo;
            },
            content: getContent(data, etat),
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
                header: {
                    fontSize: 12,
                    bold: true,
                    margin: [0, 20, 0, 25],
                    alignment: 'left'
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
                subtitle1: {
                    fontSize: 10,
                    bold: false,
                    margin: [170, 0, 0, 5]
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



                },
                tableVisa: {
                    bold: true,
                    fontSize: 8,
                    margin: [0, 10, 0, 0]

                },
                headerVisa: {
                    bold: true,
                    fontSize: 10,
                    margin: [0, 20, 0, 0]

                }
            },
            defaultStyle: {
                // alignment: 'justify'
            }
        };

        pdfMake.createPdf(docDefinition).open();
    }

    function printController($scope, $http) {
        $scope.donneess = {};
        $scope.toPrintPdf = function (id, etat) {

            $http({url: "depense?action=impression&vue=rien&id_depense=" + id, method: 'get', params: {}})
                    .success(function (response) {
                        console.log(response[0]);
                        $scope.donneess = response[0];

                    }).error(function (error) {});

            setTimeout(function () {
                printPdf($scope.donneess, etat);
            }, 200);

        };

    }

    app.controller("printPdfController", ["$scope", "$http", printController]);


}());

