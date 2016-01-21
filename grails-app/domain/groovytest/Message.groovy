package groovytest

class Message {
    String text

    static belongsTo = [user: User]

    static constraints = {
    }
}
