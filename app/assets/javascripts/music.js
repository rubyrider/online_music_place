//= require angular
//= require restangular
//= require angular-route
//= require angular-sanitize
//= require angular-rails-templates
//= require momentjs

//= require ./music_apps/app
//= require_tree ./music_apps/templates
//= require_tree ./music_apps/utils
//= require_tree ./music_apps/directives
//= require_tree ./music_apps/models
//= require_tree ./music_apps/services
//= require_tree ./music_apps/controllers


(function() {
    try {
        var $_console$$ = console;
        Object.defineProperty(window, "console", {
            get: function() {
                if ($_console$$._commandLineAPI)
                    throw "Sorry, for security reasons, the script console is deactivated on netflix.com";
                return $_console$$
            },
            set: function($val$$) {
                $_console$$ = $val$$
            }
        })
    } catch ($ignore$$) {
    }
})();