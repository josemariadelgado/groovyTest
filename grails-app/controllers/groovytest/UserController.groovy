
package groovytest

class UserController {
    def scaffold = User
    static int loginFailed = 0
    static int userAlreadyExists = 0
    static User currentUser
    static String logInUsername = ""

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

    def login(String username, String password) {

        if (username == "" || password == "") {

            loginFailed = 1
            render view: "/user/LogIn"

        } else {

            def user = UserService.logIn(username, password)

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

    def searchUser(String search) {

        if (session.user) {

            def searchedUser = UserService.searchUser search

            if (searchedUser) {

                render (view: '/user/UserProfile', model: [searchedUser: searchedUser, user: currentUser])

            } else {
                println "User not found"
            }

        } else {
            redirect(uri: "/")

        }
    }

}



