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
    function getAllOP(op) {
        //[ [{text:}] ,[{text:}]]
        var centrecout = new Array();
        var quantite = new Array();
        var prix_unitaire = new Array();
        var prix_total = new Array();
        for(var i=0; i< op.length; i++){
            centrecout.push([{'text':op[i].centrecout}]);
            quantite.push([{'text':op[i].quantite}]);
            prix_unitaire.push([{'text':op[i].prix_unitaire}]);
            prix_total.push([{'text':op[i].montant}]);
        }
        return {
            centrecout:centrecout,
            quantite:quantite,
            prix_unitaire: prix_unitaire,
            prix_total: prix_total,
            layout_blanc:{
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
        };
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
        } else if (etat === 2 || etat === 4) {
            content.push({text: '\n ORDRE D\'ENGAGEMENT DE DEPENSE \n ', style: 'title'});

        }
        if (etat === 0) {
            content.push({text: data.demandeur + "\n", style: 'subtitle1'});
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
        } else if (etat === 0 || etat === 2 || etat === 4) {
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
            content.push({text: '\n\n'});
        }
        if (etat === 2 || etat === 4) {
            content.push({
                style: 'headertable',
                table: {
                    widths: ["*", "auto", "*", "*", "*", "*"],
                    body: [
                        [
                            {text: "Demandeur"},
                            {text: "destination"},
                            {text: "depart"},
                            {text: "retour"},
                            {text: "Transport"},
                            {text: "loger"}

                        ],
                        [
                            {text: data.demandeur},
                            {text: data.lieu},
                            {text: getDateLong(data.date_depart)},
                            {text: getDateLong(data.date_retour)},
                            {text: data.vehicule},
                            {text: data.loger}
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
        }


        if (etat === 3) {
            content.push({
                style: 'headertable',
                table: {
                    widths: ["auto", "35%", "auto", "auto", "*", "*", "auto"],
                    body: [
                        [
                            {
                                text: "Libelle", style: 'tableHeader', bold: true

                            },
                            {
                                text: "Description", style: 'tableHeader', bold: true

                            }, {
                                text: "Lieu", style: 'tableHeader', bold: true

                            },
                            {
                                text: "Depart", style: 'tableHeader', bold: true

                            },
                            {
                                text: "Retour", style: 'tableHeader', bold: true

                            },
                            {
                                text: "vehicule", style: 'tableHeader', bold: true

                            },
                            {
                                text: "loger", style: 'tableHeader', bold: true

                            }
                        ],
                        [
                            {text: data.libelle, style: 'tableExample'},
                            {text: data.description + (new Date(data.date_retour).getTime() - new Date(data.date_depart).getTime()) / (24 * 60 * 60 * 1000) + " jour(s)", style: 'tableExample'},
                            {text: data.lieu, style: 'tableExample'},
                            {text: getDateLong(data.date_depart) + "\n\n\n\n\n\n\n\n\n\n\n", style: 'tableExample'},
                            {text: getDateLong(data.date_retour), style: 'tableExample'},
                            {text: data.vehicule, style: 'tableExample'},
                            {text: data.loger, style: 'tableExample'}
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
                                // if you specify width, image will scale proportionally
                                image: 'data:image/png;base64,' + data.signature[0].signature,
                                width: 90,
                                height: 90,
                                style: 'img'

                            }, {
                                text: "", style: 'tableVisa'

                            },
                            {
                                // if you specify width, image will scale proportionally
                                image: 'data:image/png;base64,' + data.signature[data.signature.length - 1].signature,
                                width: 90,
                                height: 90,
                                style: 'img'

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
                    widths: ["20%", "35%", "auto", "*", "*"],
                    body: [
                        [
                            {
                                text: "Code imputation", style: 'tableHeader'

                            },
                            {
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
                            //{text: data.code_imputation, style: 'tableExample'},
                            {table: {
                                    widths: ["*"],
                                    body: getAllOP(data.op).centrecout
                                },
                                layout: getAllOP(data.op).layout_blanc

                            },
                            {text: data.description + "\n\n\n\n\n\n\n", style: 'tableExample'},
                            {
                                table: {
                                    widths: ["*"],
                                    body: getAllOP(data.op).quantite
                                },
                                layout: getAllOP(data.op).layout_blanc
                            },
                            {
                                table: {
                                    widths: ["*"],
                                    body: getAllOP(data.op).prix_unitaire
                                },
                                layout:getAllOP(data.op).layout_blanc
                            },
                            {
                                table: {
                                    widths: ["*"],
                                    body: getAllOP(data.op).prix_total
                                },
                                layout: getAllOP(data.op).layout_blanc
                            }
                        ],
                        [
                            {colSpan: 5, text: "Montant Net à Payer : " + formatNumber(data.montant) + " Fcfa", alignment: 'center'}
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
            if (etat === 1) {
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
                                    // if you specify width, image will scale proportionally
                                    image: 'data:image/png;base64,' + data.signature[1 ].signature,
                                    width: 90,
                                    height: 90,
                                    style: 'img'

                                }, {
                                    text: "", style: 'tableVisa'

                                },
                                {
                                    // if you specify width, image will scale proportionally
                                    image: 'data:image/png;base64,' + data.signature[0].signature,
                                    width: 90,
                                    height: 90,
                                    style: 'img'

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
            } else {

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
                                    // if you specify width, image will scale proportionally
                                    image: 'data:image/png;base64,' + data.signature[data.signature.length - 2].signature,
                                    width: 90,
                                    height: 90,
                                    style: 'img'

                                }, {
                                    text: "", style: 'tableVisa'

                                },
                                {
                                    // if you specify width, image will scale proportionally
                                    image: 'data:image/png;base64,' + data.signature[data.signature.length - 3 ].signature,
                                    width: 90,
                                    height: 90,
                                    style: 'img'

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

        }
        content.push({text: '\n\n'});
        if (etat === 0 || etat === 2 || etat === 4) {
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
            if (etat === 2) {
                content.push({
                    table: {
                        widths: ["*", "*", "*"],
                        body: [
                            [
                                {text: "personne autorisée", style: 'tableVisa', decoration: 'underline', alignment: 'center'},
                                {text: "Signature partie prenante ", style: 'tableVisa', decoration: 'underline', alignment: 'center'},
                                {text: "Signature Caisse", style: 'tableVisa', decoration: 'underline', alignment: 'center'}
                            ],
                            [
                                {
                                    // if you specify width, image will scale proportionally
                                    image: 'data:image/png;base64,' + data.signature[0].signature,
                                    width: 90,
                                    height: 90,
                                    style: 'img',
                                    alignment: 'center'

                                },
                                {text: "", style: 'tableVisa', decoration: 'underline', alignment: 'center'},
                                {
                                    // if you specify width, image will scale proportionally
                                    image: 'data:image/png;base64,' + data.signature[data.signature.length - 1].signature,
                                    width: 90,
                                    height: 90,
                                    style: 'img',
                                    alignment: 'center'

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
                            return (i === 0 || i === node.table.body.length) ? 'black' : 'black';
                        },
                        vLineColor: function (i, node) {
                            return (i === 0 || i === node.table.widths.length) ? 'black' : 'black';
                        }
                    }
                });
            } else {
                content.push({
                    table: {
                        widths: ["*", "*", "*"],
                        body: [
                            [
                                {text: "personne autorisée", style: 'tableVisa', decoration: 'underline', alignment: 'center'},
                                {text: "Signature partie prenante ", style: 'tableVisa', decoration: 'underline', alignment: 'center'},
                                {text: "Signature Caisse", style: 'tableVisa', decoration: 'underline', alignment: 'center'}
                            ],
                            [
                                {
                                    // if you specify width, image will scale proportionally
                                    image: 'data:image/png;base64,' + data.signature[0].signature,
                                    width: 70,
                                    height: 70,
                                    style: 'img',
                                    alignment: 'center'

                                },
                                {text: "", style: 'tableVisa', decoration: 'underline', alignment: 'center'},
                                {text: "", style: 'tableVisa', decoration: 'underline', alignment: 'center'}
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
                    margin: [0, 5, 0, 0],
                    bold: false
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
            }, 500);

        };

    }

    function demandeController($scope, $http, fileUpload) {
        //calculer la difference entre deux date 
        //  {{(Date().parse(facturePrestation.arriver) - Date().parse(facturePrestation.depart)) / (24 * 3600 * 1000)}}
        $('.cat').multiselect({
            enableFiltering: true,
            maxHeight: 200,
            buttonClass: 'btn-primary btn',
            buttonWidth: '150px',
            selectAllText: '<strong class="allll">Tous</strong>',
            enableHTML: true,
            includeSelectAllOption: true,
            enableCaseInsensitiveFiltering: true,
            filterPlaceholder: 'Recherhe',
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
        // gerer le formulaire d'ajout des OA
        function DemandeForm() {
            return {region: new Object(),
                service: new Object(),
                centre_cout: new Object(),
                budget: new Object(),
                quantite: 0,
                montant: 0};
        }

        $scope.idDemande = 0;
        $scope.getdemande = {};
        $scope.facturePrestation = {};
        $scope.demandeOA = {};
        $scope.demandeOAForm = new DemandeForm();
        $scope.allOA = new Array();
        $scope.index = 0;
        $scope.update = false;
        $scope.services = new Array();
        $scope.centres = new Array();
        $scope.budgets = new Array();
        $scope.getCommande = {};
        $scope.BudgetCC = new Array();
        var control="";

//afficher la modal pour etablir un OA
        $scope.showOA = function (id,controle) {
            $scope.idDemande = id;
            $scope.allOA = [];
            $scope.update = false;
            if(controle){
                control=controle;
            }
            $http.get("depense?action=getDemande&vue=rien&id_depense=" + id).then(function (response) {

                $scope.getdemande = response.data[0];

            }, function (error) {
                $.gritter.add({
                    title: '',
                    text: "error",
                    sticky: false
                });
            });




            $("#etablirOA").modal("show");
        };

        // ajouter un code d'imputation a une demande
        $scope.addToOA = function (demande) {

            if ((demande.budget !== "" && demande.budget !== undefined) && (demande.quantite !== "" && demande.quantite !== undefined) && (demande.prix_unitaire !== "" && demande.prix_unitaire !== undefined)) {
                demande.idOA = $scope.allOA.length;
                var data = new Object();
                var cc = new Object();
                data = demande;
                cc = JSON.parse(demande.centrecout);
                console.log(JSON.parse(demande.centrecout));
                data.centrecout = cc.id;
                $http({url: "depense?action=etablirOP&vue=rien&actionOA=new", method: 'get', params: data}).then(function (response) {

                    if (response.data[0].succes) {
                        $.gritter.add({
                            title: '',
                            text: response.data[0].succes,
                            sticky: false
                        });
                        $scope.allOA.push({
                            region: demande.region,
                            service: demande.service,
                            centrecout: cc,
                            budget: demande.budget,
                            quantite: demande.quantite,
                            prix_unitaire: demande.prix_unitaire,
                            montant: demande.montant
                        });
                    }



                }, function (error) {
                    $.gritter.add({
                        title: '',
                        text: "erreur lors de l'enregistrement veuillez essayer a nouveau",
                        sticky: false
                    });


                });


                $scope.demandeOA = {};
            }

        };
        //supprimer une ligne du tableau des OA
        $scope.deleteOA = function (index) {
            $http({url: "depense?action=etablirOP&vue=rien&actionOA=editeOA&idOA=" + index, method: 'get', params: {}}).then(function (response) {
                if (response.data[0].succes) {

                    $scope.allOA.splice(index, 1);
                }



            }, function (error) {
                $.gritter.add({
                    title: '',
                    text: "erreur lors de l'enregistrement veuillez essayer a nouveau",
                    sticky: false
                });


            });
            $scope.allOA.splice(index, 1);
        };

        //editer un OA
        $scope.editeOA = function (index) {
            $scope.demandeOA = $scope.allOA[index];
            $scope.demandeOA.region = $scope.allOA[index].region;
            $scope.demandeOA.service = $scope.allOA[index].service;
            $scope.demandeOA.centrecout = $scope.allOA[index].centrecout;
            $scope.demandeOA.budget = $scope.allOA[index].budget;
            $scope.demandeOA.quantite = $scope.allOA[index].quantite;
            $scope.demandeOA.prix_unitaire = $scope.allOA[index].prix_unitaire;
            $scope.demandeOA.montant = $scope.allOA[index].montant;
            $scope.index = index;
            $scope.update = true;
            console.log($scope.demandeOA);
        };

        $scope.updateOA = function (demande) {
            if ((demande.budget !== "" && demande.budget !== undefined) && (demande.quantite !== "" && demande.quantite !== undefined) && (demande.prix_unitaire !== "" && demande.prix_unitaire !== undefined)) {
                demande.idOA = $scope.index;
                var data = new Object();
                var cc = new Object();
                data = demande;
                cc = demande.centrecout;
                data.centrecout = cc.id;
                $http({url: "depense?action=etablirOP&vue=rien&actionOA=editeOA", method: 'get', params: data}).then(function (response) {
                    if (response.data[0].succes) {
                        $scope.allOA[$scope.index].region = demande.region;
                        $scope.allOA[$scope.index].service = demande.service;
                        $scope.allOA[$scope.index].centrecout = cc;
                        $scope.allOA[$scope.index].budget = demande.budget;
                        $scope.allOA[$scope.index].quantite = demande.quantite;
                        $scope.allOA[$scope.index].prix_unitaire = demande.prix_unitaire;
                        $scope.allOA[$scope.index].montant = demande.montant;
                        $scope.demandeOA = {};
                        $scope.update = false;
                    }



                }, function (error) {
                    $.gritter.add({
                        title: '',
                        text: "erreur lors de l'enregistrement veuillez essayer a nouveau",
                        sticky: false
                    });


                });
                $scope.demandeOA = {};

            }

        };
        //annuler l'etablissement d'un OA
        $scope.annulerOA = function () {
            $http({url: "depense?action=etablirOP&vue=rien&actionOA=annulerOA", method: 'get', params: {}}).then(function (response) {
                if (response.data[0].succes) {

                }



            }, function (error) {
                $.gritter.add({
                    title: '',
                    text: "erreur ",
                    sticky: false
                });


            });
            $scope.demandeOA = {};
            $("#etablirOA").modal("hide");

        };

        //enregistrer totalement un OA
        $scope.saveOA = function (demande, id_demande, id_controleur) {
            console.log(demande);
            var url="";
            if(control!==""){
                url="depense?action=etablirOP&vue=rien&actionOA=saveOA&id_depense=" + id_demande + "&controleur=" + id_controleur+"&"+control+"=true";
            }else{
                url="depense?action=etablirOP&vue=rien&actionOA=saveOA&id_depense=" + id_demande + "&controleur=" + id_controleur;
            }
            $http({url: url, method: 'get', params: {}}).then(function (response) {


                var ob = location.href.split("?");
                var param = ob[1].split("&");
                var vue = param[0].split("=")[1];
                var isnew = param[param.length - 1].split("=")[1];
                var url = "depense?vue=" + vue + "&action=depenses&" + "isnew=no";

                if (response.data[0].succes) {
                    $.gritter.add({
                        title: '',
                        text: response.data[0].succes,
                        sticky: false
                    });
                    $("#etablirOA").modal("hide");
                    setTimeout(function () {
                        //location.reload();
                        if(control!==""){
                            location.reload();
                        }else{
                            document.location = "depense?vue=etablirOA&action=depenses";
                        }
                        
                    }, 1000);
                }


            }, function (error) {
                $.gritter.add({
                    title: '',
                    text: "erreur ",
                    sticky: false
                });


            });



        };

        //voir la commande du magasin principal
        $scope.showCommande = function (id, idMag) {
            $scope.idDemande = id;
            $http.get("validerDepense?action=showCommandeMP&vue=rien&idMP=" + idMag).then(function (response) {

                $scope.getCommande = response.data[0];

            }, function (error) {
                $.gritter.add({
                    title: '',
                    text: "error",
                    sticky: false
                });
            });
            $("#voircommandeMP").modal("show");
        };
        //pour voir simplement une demande
        $scope.showDemande = function (id) {
            $scope.idDemande = id;

            $http.get("depense?action=getDemande&vue=rien&id_depense=" + id).then(function (response) {

                $scope.getdemande = response.data[0];

            }, function (error) {
                $.gritter.add({
                    title: '',
                    text: "error",
                    sticky: false
                });
            });
            $("#voirDemande").modal("show");
        };

        $scope.ShowBudgetCC = function (centre_cout) {

            $http.get("depense?action=showCentreCout&vue=rien&centrecout=" + centre_cout).then(function (response) {

                $scope.BudgetCC = response.data;

            }, function (error) {
                $.gritter.add({
                    title: '',
                    text: "error",
                    sticky: false
                });
            });
            $("#voirBudgetCC").modal("show");
        };
        //enregistrer l'edition d'une demande
        $scope.saveEditeDemande = function (demande) {
            // $scope.idDemande = demande.id_demande;
            $.ajax({
                url: "depense?action=editedepense&vue=rien&id_depense=" + $scope.idDemande,
                data: demande,
                type: "POST",
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    $.gritter.add({
                        title: '',
                        text: data[0],
                        sticky: false
                    });
                    $("#editeDemande").modal("hide");

                },
                error: function (error) {}
            });
            /*  $http({url: "depense?action=editedepense&vue=rien&id_depense=" + $scope.idDemande, data: demande, method: 'post'})
             .success(function (response) {
             alert("ok");
             $.gritter.add({
             title: '',
             text: response[0],
             sticky: false
             });
             setTimeout(function () {
             $("#editeDemande").modal("hide");
             // document.location = url;
             }, 1000);
             
             })
             .error(function (error) {
             alert("error");
             $.gritter.add({
             title: '',
             text: "error",
             sticky: false
             });
             $("#editeDemande").modal("hide");
             });*/
        };


        $scope.editeDemande = function (id) {
            $scope.idDemande = id;

            $http.get("depense?action=getDemande&vue=rien&id_depense=" + id).then(function (response) {

                $scope.getdemande = response.data[0];


            }, function (error) {
                $.gritter.add({
                    title: '',
                    text: "error",
                    sticky: false
                });
            });
            $("#editeDemande").modal("show");
        };

        $scope.deleteDemande = function (id) {
            $scope.idDemande = id;

            var ob = location.href.split("?");
            var param = ob[1].split("&");
            var vue = param[0].split("=")[1];
            var isnew = param[param.length - 1].split("=")[1];
            var url = "depense?vue=" + vue + "&action=depenses&" + "isnew=no";
            //if (isnew === "yes#") {
            // http://messi:8080/subufo/depense?vue=depenses&action=depense&isnew=no
            // url = "depense?vue=" + vue + "&action=depenses&one=yes&&" + "isnew=no";
            // } else {
            //      url = "depense?vue=" + vue + "&action=depenses&one=yes&&" + "isnew=no";
            //  }
            if (confirm("voulez-vous reellement supprimer cette demande?")) {
                $http.get('depense?action=deletedepense&vue=depenses&id_depense=' + $scope.idDemande)
                        .success(function (data) {
                            $.gritter.add({
                                title: '',
                                text: 'demande supprimer avec success',
                                sticky: false
                            });
                            setTimeout(function () {
                                //console.log(location.pathname);
                                document.location = url;
                                //location.reload();
                            }, 1000);
                        })
                        .error(function (error) {
                            $.gritter.add({
                                title: '',
                                text: "error",
                                sticky: false
                            });
                        });


            }
        };

        $scope.Search = function (idRegion) {
            $http({url: "validerDepense?action=getAllByRegion&vue=vue", method: 'get', params: {id_region: idRegion}}).then(function (response) {
                $scope.services = response.data;

            }, function (error) {
                console.log("erreur de communication avec le serveur");
            });


        };

        $scope.SearchCentre = function (idService) {
            $http({url: "validerDepense?action=getAllByService&vue=vue", method: 'get', params: {id_service: idService}}).then(function (response) {

                $scope.centres = response.data;

            }, function (error) {
                console.log("erreur de communication avec le serveur");
            });


        };

        $scope.SearchBudget = function (centre) {

            $http({url: "validerDepense?action=getAllByCentre&vue=vue", method: 'get', params: {id_centre: JSON.parse(centre).id}}).then(function (response) {

                $scope.budgets = response.data;

            }, function (error) {
                console.log("erreur de communication avec le serveur");
            });


        };

        function inExtension(name) {
            var extensionsPermise = ["pdf", "png", "jpeg", "jpg", "doc", "xsl"];
            var extensions = name.split(".");
            var ok = false;
            var ext = extensions[extensions.length - 1];

            for (var i = 0; i <= extensionsPermise.length; i++) {

                if (extensionsPermise[i] === ext.toLowerCase()) {

                    ok = true;
                }
            }
            return ok;
        }
        //chargement du fichier
        $scope.uploadFile = function () {
            var file = $scope.myFile;

            // console.log('file is ');
            // console.dir(file);
            //console.log(file.type);
            var uploadUrl = "UploadDownloadFileServlet";
            if (file) {
                // la taille maximale d'un fichier doit etre de 5 Mo ie 5*1000*1000 octets
                if (file.size < 5 * 1000 * 1000) {
                    //le nom du fichier de doit pas etre plus de 15 caracteres 
                    if (file.name.length < 50) {
                        //le type de fichier permis

                        if (inExtension(file.name)) {
                            fileUpload.uploadFileToUrl(file, uploadUrl);
                        } else {
                            $.gritter.add({
                                title: '',
                                text: "type de fichier incorrecte",
                                sticky: false
                            });
                        }

                    } else {
                        $.gritter.add({
                            title: '',
                            text: "nom du fichier incorrecte",
                            sticky: false
                        });
                    }

                } else {
                    $.gritter.add({
                        title: '',
                        text: "fichier volumineux",
                        sticky: false
                    });
                }

            }
        };


    }

    app.directive('fileModel', ['$parse', function ($parse) {
            return {
                restrict: 'A',
                link: function (scope, element, attrs) {
                    var model = $parse(attrs.fileModel);
                    var modelSetter = model.assign;

                    element.bind('change', function () {
                        scope.$apply(function () {
                            modelSetter(scope, element[0].files[0]);
                        });
                    });
                }
            };
        }]);

    app.service('fileUpload', ['$http', function ($http) {
            this.uploadFileToUrl = function (file, uploadUrl) {
                var fd = new FormData();
                fd.append('file', file);

                $http.post(uploadUrl, fd, {
                    transformRequest: angular.identity,
                    headers: {'Content-Type': undefined}
                })

                        .success(function (response) {
                            $.gritter.add({
                                title: '',
                                text: "fichier chargé avec success",
                                sticky: false
                            });
                        })

                        .error(function (error) {
                            console.log(error);
                        });
            };
        }]);


    app.controller("printController", ["$scope", "$http", printController])
            .controller("demandeController", ["$scope", "$http", 'fileUpload', demandeController]);


}());

