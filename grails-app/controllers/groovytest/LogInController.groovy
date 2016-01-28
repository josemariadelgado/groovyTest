package groovytest

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class LogInController {

    def SpringSecurityService

    def index() {

        if (SpringSecurityService.isLoggedIn()) {
            redirect(controller: "Home", action: "index")
        } else {
            render(view: '/user/LogIn')
        }
    }
}

