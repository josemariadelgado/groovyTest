package groovytest

class UserController {
    def scaffold = User
    static int loginFailed = 0
    static int userAlreadyExists = 0
    static int editProfile = 0
    def static currentUser
    static String logInUsername = ""
    def static userSearched


    def UserService

    def index() {

        userAlreadyExists = 0
        logInUsername = ""

        render view: '/user/LogIn'

    }

    def signUp(String username, String password, String name, String lastName, String phoneNumber, String address) {

        if (username == "" || password == "" || name == "" || lastName == "") {
            userAlreadyExists = 2
            render view: "/user/SignUp"
        } else {

            def u = User.findByUsername(username)

            if (u) {
                userAlreadyExists = 1
                println "User already exists"
                render view: "/user/SignUp"

            } else {
                UserService.signUp username, password, name, lastName, phoneNumber, address
                redirect(action: "index")
            }
        }
    }

    def login(User user, String username, String password) {

        if (username == "" || password == "") {

            loginFailed = 1
            render view: "/user/LogIn"

        } else {

            user = User.findByUsernameAndPass(username, password)

            if (user) {
                loginFailed = 0
                currentUser = user
                println "Logged in as @${user.username}. ${user.name}"
                session.user = currentUser
                redirect(controller: 'HomeScreen', action: "index")

            } else {
                loginFailed = 1
                render view: "/user/LogIn"

            }
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



