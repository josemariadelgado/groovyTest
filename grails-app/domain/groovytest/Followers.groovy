package groovytest

import groovyTest.User


class Followers {
    Date createDate

    static belongsTo = [userOne:User , userTwo:User]

    static constraints = {

    }
}
