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

    User logIn(String username, String password) {

        def user = User.findByUsernameAndPass(username, password)

        if (user) {
            return user

        } else {
            println "Log in failed"

        }

    }

    User searchUser(String search) {

        def currentUser = User.find(UserController.currentUser)

        def u = User.findByUsername(search)

        if (u && u.username == currentUser.username) {
            println "Yourself"

        } else if (!u) {
            println "User not found :("

        } else if (u) {

            println "User founded, name: ${u.name}"
            return u

        }

    }

}
