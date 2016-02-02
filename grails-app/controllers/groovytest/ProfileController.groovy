package groovytest

class ProfileController {
    static int editProfile = 0

    def ProfileService


    def index() {

        if(session.user) {

            editProfile = 0
            def user = UserController.currentUser
            render (view: '/Profile', model: [user: user])

        } else {
            redirect(uri: '/')

        }
    }

    def editProfileView() {

        editProfile = 1
        def user = UserController.currentUser
        render (view: '/Profile', model: [user: user])
    }

    def editProfile(String username, String name, String lastName, String phoneNumber, String address) {

        if (username == "" || name == "" || lastName == "") {

            editProfile = 2
            def user = UserController.currentUser
            render (view: '/Profile', model: [user: user])

        } else {

            ProfileService.editProfile username, name, lastName, phoneNumber, address
            editProfile = 5
            def user = UserController.currentUser
            render (view: '/Profile', model: [user: user])

        }

    }

    def changePassword(String password) {

        if (params.password == params.repeatPassword) {

            ProfileService.changePassword password

            editProfile = 4
            def user = UserController.currentUser
            render (view: '/Profile', model: [user: user])

        } else {
            editProfile = 3
            def user = UserController.currentUser
            render (view: '/Profile', model: [user: user])
        }

    }
}
