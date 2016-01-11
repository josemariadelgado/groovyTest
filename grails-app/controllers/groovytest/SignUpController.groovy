package groovytest

class SignUpController {

    def index() {}

    def signup = {


            if (params.password == params.repeatPassword) {

                def user = new User(username: params.username, name: params.name, pass: params.password,
                        lastName: params.lastName, phoneNumber: params.phoneNumber, address: params.address, loggedIn: "false")

                user.save()

                if (user.save()) {

                    println "User registered. Username:${user.username}"
                    redirect(uri: "/login")
                } else {
                    user.errors.allErrors.each { println it.defaultMessage }
                }


            } else {

                render "Password fields don't match"
            }
        }

    }

