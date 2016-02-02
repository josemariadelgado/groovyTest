package groovytest

import grails.transaction.Transactional
import groovyTest.User

@Transactional
class FollowUserService {

    def serviceMethod() {

    }

    def followUser(User userOne, User userTwo) {

        def follow = new Followers(userOne: userOne, userTwo: userTwo, createDate: new Date())
        follow.save()

        userOne.following += 1
        userOne.save(flush: true)
        userTwo.followers += 1
        userTwo.save(flush: true)
    }

    def unfollowUser(User userOne, User userTwo) {

        def unfollow = Followers.findByUserOneAndUserTwo(userOne, userTwo)
        unfollow.delete(flush: true)

        if (!unfollow.delete()) {
            println "not deleted"
        }

        userOne.following -= 1
        userOne.save(flush: true)
        userTwo.followers -= 1
        userTwo.save(flush: true)

    }
}
