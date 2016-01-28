package groovytest

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class HomeController {

    def SpringSecurityService

    def index() {

        if (SpringSecurityService.isLoggedIn()) {
            def user = SpringSecurityService.getCurrentUser()
            render(view: "/home/Home", model: [user: user])
        } else {
            redirect(uri: "/login")
        }
    }
}
