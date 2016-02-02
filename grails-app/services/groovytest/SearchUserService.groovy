package groovytest

import grails.transaction.Transactional
import groovyTest.User

@Transactional
class SearchUserService {

    def serviceMethod() {

    }

    User searchUser(String search) {

        def user = User.findByUsername(search)

        if (user) {

            println "User founded, name: ${user.name}"
            return user
        }
    }
}
