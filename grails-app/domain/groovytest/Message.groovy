package groovytest

import groovyTest.User


class Message {
    String text

    static belongsTo = [user: User]

    static constraints = {
    }
}
