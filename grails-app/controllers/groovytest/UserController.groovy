
package groovytest

import grails.plugin.springsecurity.annotation.Secured
import groovyTest.User

@Secured(['permitAll'])
class UserController {
    def scaffold = User

    def SpringSecurityService
    def UserService

    def index() {

    }


    def followUser() {

        def follow = new Followers(userOne: currentUser, userTwo: userSearched, createDate: new Date())
        follow.save()

        def u = User.find(currentUser)
        u.following += 1
        u.save(flush: true)

        def u2 = User.find(userSearched)
        u2.followers += 1
        u2.save(flush: true)

        currentUser = u

        render "Ahora sigues a @${u2.username}"

        if (follow.save()) {

           println "You are now following @${userSearched.username}"
        } else {
            println "error"
        }
    }
}



