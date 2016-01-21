
package groovytest

class UserController {
    def scaffold = User
    static int loginFailed = 0
    static int userAlreadyExists = 0
    static User currentUser
    static User userSearched
    static String logInUsername = ""

    def UserService

    def index() {

        userAlreadyExists = 0
        logInUsername = ""
        //def usersCount = User.count

        render (view: '/user/LogIn')

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

            render "Rellena todos los campos"

        } else {

            def user = UserService.logIn(username, password)

            if (user) {
                loginFailed = 0
                currentUser = user
                println "Logged in as @${user.username}. ${user.name}"
                session.user = user
                redirect(controller: 'HomeScreen', action: "index")

            } else {

                render "El nombre de usuario o la contraseña son incorrectos"

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

            userSearched = searchedUser

            if (searchedUser) {

                def friendship = Followers.findByUserOneAndUserTwo(currentUser, searchedUser)

                render (view: '/user/UserProfile', model: [searchedUser: searchedUser, user: currentUser, friendship: friendship])

            } else {
                println "User not found"
            }

        } else {
            redirect(uri: "/")

        }
    }

    def followUser() {

        def follow = new Followers(userOne: currentUser, userTwo: userSearched, createDate: new Date(),
                lastModifiedDate: new Date())
        follow.save()

        def u = User.find(currentUser)
        u.following += 1
        u.save(flush: true)

        def u2 = User.find(userSearched)
        u2.followers += 1
        u2.save(flush: true)

        currentUser = u

        render "Ahora sigues a @${u2.username}"

        if (follow.save()) {

           println "You are now following @${userSearched.username}"
        } else {
            println "error"
        }

    }

    def showAllUsers() {

        if (session.user) {

            def allUsers = User.list()
            render(view: "/user/AllUsers", model: [allUsers: allUsers])

        } else {

            redirect(uri: "/")

        }


    }

}



