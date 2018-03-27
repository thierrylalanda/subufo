/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$.ajax({
    url: "security",
    data: {action: "premierefois"},
    type: "POST",
    dataType: 'text',
    success: function (data) {
        if (data === "oui") {
            $("#registers").modal("show");

        } else {

            $.ajax({
                url: "security",
                data: {action: "have_complet_version"},
                type: "POST",
                dataType: 'text',
                success: function (data) {
                    if (data === "non") {
                        $.ajax({
                            url: "security",
                            data: {action: "verifie_essai"},
                            type: "POST",
                            dataType: 'text',
                            success: function (data) {
                                if (data === "oui") {
                                    $(".demoversion").addClass("disabled");

                                    $("#registers").modal("show");
                                    $(".integraleversion").trigger("click");
                                    $(".counter").html("<h4>votre version d'essai a expirée vueillez entrer le code d'activation</h4>");
                                }
                            }
                        });
                    }
                }
            });

        }
    }
});


$(".integraleversion").click(function () {
    $(".counter").html("");
    $(".bydemo").slideUp("slow");
    $(".bylicence").slideDown("slow");
});

$(".demoversion").click(function () {
    if (!$(this).hasClass("disabled")) {
        $(".counter").html("");
        $(".bylicence").slideUp("slow");
        $(".bydemo").slideDown("slow");
    }
});
var count = 5;
function counter() {
    count -= 1;
    if (count === -1) {
        document.location = "authentification?action=faut";
        $("#registers").modal("hide");
    }
    $(".counter").html("votre enregistrement a été un succèe patienter dans " + count + " secondes");
    setTimeout(function () {
        counter();
    }, 1000);

}
$(".savedemo").click(function (e) {
    e.preventDefault();

    var vide = false;
    var form = $(this).parents("form:first");
    $.each($(form).find("input[type=text]"), function () {
        if ($(this).val() === "") {
            $(this).css({
                borderColor: 'red',
                color: 'red'
            });
            vide = true;
        }
    });

    if (!vide) {

        $.ajax({
            url: form.attr("action"),
            data: $(form).serialize(),
            type: $(form).attr("method"),
            dataType: 'text',
            success: function (data) {
                if (data === "ok") {
                    counter();
                } else {
                    $(".counter").html("code incorrecte veuillez saisir a nouveau");
                }
            }
        });

    }
});

$(".saveintegrale").click(function (e) {
    e.preventDefault();
    var vide = false;
    var form = $(this).parents("form:first");
    $.each($(form).find("input[type=text]"), function () {
        if ($(this).val() === "") {
            $(this).css({
                borderColor: 'red',
                color: 'red'
            });
            vide = true;
        }
    });

    if (!vide) {

        $.ajax({
            url: form.attr("action"),
            data: $(form).serialize(),
            type: $(form).attr("method"),
            dataType: 'text',
            success: function (data) {
                if (data === "yes") {
                    counter();
                } else {
                    $(".counter").html("code d'activation incorrecte");

                }

            }
        });
    }
});

