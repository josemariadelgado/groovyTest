package groovytest

import grails.plugin.springsecurity.annotation.Secured
import groovyTest.User

@Secured(['permitAll'])
class SearchUserController {

    def SpringSecurityService
    def SearchUserService
    static User searchedUser

    def index() {

        if (SpringSecurityService.isLoggedIn()) {

            def currentUser = SpringSecurityService.getCurrentUser()
            def following = Followers.findByUserOneAndUserTwo(currentUser, searchedUser)
            render(view: '/searchUser', model: [searchedUser: searchedUser, user: currentUser, following: following])

        } else {
            redirect(uri: "/")
        }

    }

    def searchUser(String search) {

        if (SpringSecurityService.isLoggedIn()) {

            def currentUser = SpringSecurityService.getCurrentUser()

            if (currentUser.username == search) {
                render "Searched yourself"

            } else if (search == "") {
                render "Blank field"

            } else {

                def searchedUser = SearchUserService.searchUser search

                if (searchedUser) {

                    this.searchedUser = searchedUser
                    render "User founded"

                } else {
                    render "User not found"
                }
            }

        } else {
            redirect(uri: "/")

        }
    }

    static def getSearchedUser() {
        return searchedUser
    }
}
