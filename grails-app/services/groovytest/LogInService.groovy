package groovytest

import grails.transaction.Transactional

@Transactional
class LogInService {

    def logIn() {
        User user = User.findByUsernameAndPass(LogInController.params.username, LogInController.params.password);
        if(!user) {
            render "fail 404"
        } else {
            render "Login Succes! :)"
        }
    }
}
