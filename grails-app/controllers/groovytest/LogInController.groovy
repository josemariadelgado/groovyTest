package groovytest

class LogInController {

    public static String loggedIn = "false"

    def index() {}

    def login = {

        User user = User.findByUsernameAndPass(params.username, params.password);
        if(params.username == "" || params.password == "" || !user) {
            redirect(uri:"/login/error?username=${params.username}")
        } else {

            loggedIn = "true"
            redirect(uri: "/homeScreen/user?username=$params.username")
        }
    }
}
