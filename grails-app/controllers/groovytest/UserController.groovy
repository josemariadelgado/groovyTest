package groovytest

class UserController {
    def scaffold = User
    static int loginFailed = 0
    static int registerFailed = 0
    static int editProfile = 0
    static String currentUser = ""
    static String username = ""
    static String name = ""
    static String lastName = ""
    static String phoneNumber = ""
    static String address = ""
    static String logInUsername = ""
    def static userSearched

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
        currentUser = null

    }

    def editProfileView() {

        editProfile = 1
        render view: "/user/Profile"
    }

    def editProfile() {

        if (params.username == "" || params.name == "" || params.lastName == "") {

            editProfile = 2
            HomeScreenController.user.name = params.name
            HomeScreenController.user.lastName = params.lastName
            HomeScreenController.user.username = params.username
            HomeScreenController.user.phoneNumber = params.phoneNumber
            HomeScreenController.user.address = params.address
            render view: "/user/Profile"

        } else {

            def u = User.findByUsername(currentUser)
            u.username = params.username
            u.name = params.name
            u.lastName = params.lastName
            u.phoneNumber = params.phoneNumber
            u.address = params.address
            u.save(flush: true)
            currentUser = params.username
            editProfile = 5
            HomeScreenController.user.name = params.name
            HomeScreenController.user.lastName = params.lastName
            HomeScreenController.user.username = params.username
            HomeScreenController.user.phoneNumber = params.phoneNumber
            HomeScreenController.user.address = params.address
            render view: "/user/Profile"

        }

    }

    def changePassword() {

        if (params.password == params.repeatPassword) {

            def u = User.findByUsername(currentUser)
            u.pass = params.password
            u.save(flush: true)
            if (u.save()) {
                editProfile = 4
                render view: "/user/Profile"
            }
        } else {
            editProfile = 3
            render view: "/user/Profile"
        }

    }

    def searchUser() {

        if (session.user) {

            def currentUser = User.findByUsername(currentUser)

            def u = User.findByUsername(params.search)

            if (u && u.username == currentUser.username) {
                println "Yourself"

            } else if (!u) {
                println "User not found :("

            } else if (u) {

                userSearched = User.findByUsername(u.username)
                println "User founded, name: ${userSearched.name}"
                userSearched.username = u.username
                userSearched.name = u.name
                userSearched.lastName = u.lastName
                userSearched.phoneNumber = u.phoneNumber
                userSearched.address = u.address
                render view: "/user/UserProfile"

            }


        } else {
            redirect(uri: "/")

        }
    }

}



