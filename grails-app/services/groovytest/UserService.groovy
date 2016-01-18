package groovytest

import grails.transaction.Transactional

@Transactional
class UserService {

    def serviceMethod() {

    }

    void signUp(String username, String pass, String name, String lastName, String phoneNumber, String address) {

        def newUser = new User(name: name, username: username, pass: pass, lastName: lastName, phoneNumber: phoneNumber,
                address: address)

        newUser.save()

        if (newUser.save()) {

            println "New user saved :)"

        }

    }

    void logIn(User user, String username, String password) {

        user = User.findByUsernameAndPass(username, password)
        if (user) {
            UserController.currentUser = user
            println "Logged in as @${user.username}. ${user.name}"
        }

    }
}
