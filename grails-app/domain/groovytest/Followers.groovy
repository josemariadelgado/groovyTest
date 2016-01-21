package groovytest

class Followers {
    Date createDate
    Date lastModifiedDate

    static belongsTo = [userOne:User , userTwo:User]

    static constraints = {
        userOne()
        userTwo()
        createDate()
        lastModifiedDate()
    }
}
