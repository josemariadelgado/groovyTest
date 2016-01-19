package groovytest

class HomeScreenController {
    def static user

    def index() {

        ProfileController.editProfile = 0

        println UserController.currentUser.name

            if(session.user) {

                def user = UserController.currentUser
                render (view: '/homeScreen/HomeScreen', model: [user: user])

            } else {
                redirect(uri:'/')
        }
    }
}
