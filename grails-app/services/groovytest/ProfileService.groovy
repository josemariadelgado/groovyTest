package groovytest

import grails.transaction.Transactional

@Transactional
class ProfileService {

    def serviceMethod() {

    }

    void editProfile(String username, String name, String lastName, String phoneNumber, String address) {

        def user = User.find(UserController.currentUser)
        user.username = username
        user.name = name
        user.lastName = lastName
        user.phoneNumber = phoneNumber
        user.address = address
        user.save(flush: true)

        if (user.save()) {

            println "Changes saved"

        } else {
            "error"
        }

    }

    void changePassword(String password) {

        def user = User.find(UserController.currentUser)
        user.pass = password
        user.save(flush: true)
        if (user.save()) {
            println "New password saved"
        }

    }
}
