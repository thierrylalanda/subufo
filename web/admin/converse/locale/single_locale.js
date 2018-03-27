/*
 * This file specifies a single language dependency (for English).
 *
 * Translations take up a lot of space and you are therefore advised to remove
 * from here any languages that you don't need.
 */

(function (root, factory) {
    require.config({
        paths: {
            "fr": "locale/fr/LC_MESSAGES/fr"
        }
    });

    define("locales", [
        'fr'
    ], function (fr) {
        root.locales = {};
        root.locales.fr = fr;
    });
})(this);
