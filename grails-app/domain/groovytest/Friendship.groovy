package groovytest

class Friendship {
    Boolean confirmed
    Date createDate
    Date lastModifiedDate

    static belongsTo = [userOne:User , userTwo:User]

    static constraints = {
        userOne()
        userTwo()
        confirmed()
        createDate()
        lastModifiedDate()
    }
}
