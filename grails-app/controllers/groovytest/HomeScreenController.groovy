package groovytest

class HomeScreenController {
    def static user

    def index() {

        user = User.findByUsername(UserController.currentUser)
        println user.name

            if(session.user) {
                render view: '/homeScreen/HomeScreen'

            } else {
                redirect(uri:'/')
        }
    }
}
