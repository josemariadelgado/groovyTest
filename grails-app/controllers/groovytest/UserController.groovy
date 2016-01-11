package groovytest

class UserController {
    def scaffold = User;
    int loginFailed = 0;

    def index() {

        if(loginFailed == 0) {
            render view: '/user/LogIn'
        } else {
            render view: '/logInError'
        }
    }

    def signUp() {

        render view: '/signUp/SignUp'

        if (request.method == 'POST') {

            if (params.password == params.repeatPassword) {

                def user = new User(username: params.username, name: params.name, pass: params.password,
                        lastName: params.lastName, phoneNumber: params.phoneNumber, address: params.address)

                user.save()

                if (user.save()) {

                    println "User registered. Username:${user.username}"
                    redirect(action: "index")
                } else {
                    user.errors.allErrors.each { println it.defaultMessage }
                }
            }
        }
    }

    def login() {

        if (request.method == 'POST') {
            def u = User.findByUsernameAndPass(params.username, params.password)
            if (u) {
                session.user = u
                redirect(controller:'HomeScreen')
                println session
                loginFailed = 0
            } else {
                loginFailed = 1
                redirect(action: 'index')
            }
        } else if (session.user) {
            redirect(controller:'HomeScreen')
        }
    }

    def logout() {
        session.invalidate()
        loginFailed = 0
        redirect(action: 'index')

    }

}



