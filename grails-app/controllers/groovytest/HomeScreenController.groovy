package groovytest

class HomeScreenController {
    def static user

    def index() {

        UserController.editProfile = 0

        println UserController.currentUser.name

            if(session.user) {

                def u = UserController.currentUser
                render (view: '/homeScreen/HomeScreen', model: [user: u])

            } else {
                redirect(uri:'/')
        }
    }
}
