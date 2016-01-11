package groovytest

class HomeScreenController {

    def index() {

            if(session.user) {
                render view: '/homeScreen/HomeScreen'
                println session
            } else {
                render "You are not logged in"
        }
    }

//    def user() {
//
//        if (LogInController.loggedIn == "true") {
//
//            print "logged in Sucees"
//            render view: "/homeScreen/HomeScreen"
//            LogInController.loggedIn = "false"
//
//            User u = User.findByUsername(params.username)
//            println u.username
//            println u.name
//            println u.lastName
//            println u.phoneNumber
//            println u.address
//
//        } else {
//            print "failed"
//            redirect(uri:"/login")
//        }
//
//    }
//
//    def logout = {
//
//        LogInController.loggedIn = "false"
//        redirect(uri:"/login")
//
//    }
}
