package groovytest

class UserController {
    def scaffold = User
    static int loginFailed = 0
    static int registerFailed = 0
    static String currentUser = ""
    static String username = ""
    static String name = ""
    static String lastName = ""
    static String phoneNumber = ""
    static String address = ""
    static String logInUsername = ""

    def index() {

        username = ""
        name = ""
        lastName = ""
        phoneNumber = ""
        address = ""
        registerFailed = 0
        logInUsername = ""

        render view: '/user/LogIn'

    }

    def signUp() {

        username = params.username
        name = params.name
        lastName = params.lastName
        phoneNumber = params.phoneNumber
        address = params.address


        if (request.method == 'POST') {

            def u = User.findByUsername(params.username)

            if (u) {
                println "User already exists"
                registerFailed = 1
                username = ""
                render view: "/user/SignUp"
            } else {

                    def user = new User(username: params.username, name: params.name, pass: params.password,
                            lastName: params.lastName)

                    user.save()

                    if (user.save()) {

                        println "User registered. Username:${user.username}"
                        username = ""
                        name = ""
                        lastName = ""
                        phoneNumber = ""
                        address = ""
                        registerFailed = 0
                        redirect(action: "index")
                    } else {
                        user.errors.allErrors.each { println it.defaultMessage }
                    }
            }
        }
    }

    def login() {

        logInUsername = params.username

        if (request.method == 'POST') {
            def u = User.findByUsernameAndPass(params.username, params.password)
            if (u) {
                session.user = u
                redirect(controller:'HomeScreen')
                println "logged in"
                loginFailed = 0
                currentUser = params.username
                logInUsername = ""
            } else {
                loginFailed = 1
                redirect(action: "index")
            }
        } else if (session.user) {
            redirect(controller:'HomeScreen')
        }
    }

    def logout() {
        session.invalidate()
        loginFailed = 0
        redirect(action: 'index')

    }

}



