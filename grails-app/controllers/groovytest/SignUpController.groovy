package groovytest

import grails.plugin.springsecurity.annotation.Secured
import groovyTest.User

@Secured(['permitAll'])
class SignUpController {

    def SignUpService

    def index() {
        render(view: "/SignUp")
    }

    def signUp(String username, String password, String name) {

        if (username == "" || password == "" || name == "") {
            render "Empty fields"

        } else {

            def user = User.findByUsername(username)

            if (user) {
                render "User already exists"

            } else {
                SignUpService.signUp username, password, name
                render "User saved"
            }
        }
    }
}
