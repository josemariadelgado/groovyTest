package groovytest

import grails.transaction.Transactional
import groovyTest.User

@Transactional
class SignUpService {

    def serviceMethod() {

    }

    void signUp(String username, String password, String name) {

        def user = new User(username: username, password: password, name: name)
        user.save()
    }
}
