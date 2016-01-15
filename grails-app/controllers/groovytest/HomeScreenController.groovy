package groovytest

class HomeScreenController {
    def static user

    def index() {

        UserController.editProfile = 0

        user = User.findByUsername(UserController.currentUser)

            if(session.user) {
                render view: '/homeScreen/HomeScreen'

            } else {
                redirect(uri:'/')
        }
    }
}
