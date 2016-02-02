package groovytest

import grails.plugin.springsecurity.annotation.Secured
import groovyTest.User

@Secured(['permitAll'])
class FollowUserController {

    def SpringSecurityService
    def FollowUserService

    def index() {}

    def followUser(User userOne, User userTwo) {

        userOne = SpringSecurityService.getCurrentUser()
        userTwo = User.find(SearchUserController.searchedUser)

        def following = Followers.findByUserOneAndUserTwo(userOne, userTwo)

        if (!following) {
            FollowUserService.followUser userOne, userTwo
            render "Success"
        } else {
            render "Currently following"
        }
    }

    def unfollowUser(User userOne, User userTwo) {

        userOne = SpringSecurityService.getCurrentUser()
        userTwo = User.find(SearchUserController.searchedUser)

        def following = Followers.findByUserOneAndUserTwo(userOne, userTwo)

        if (following) {

            FollowUserService.unfollowUser userOne, userTwo
            render "Success"

        }
    }
}
