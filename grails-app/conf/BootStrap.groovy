import groovyTest.Role
import groovyTest.User
import groovyTest.UserRole

class BootStrap {

    def init = { servletContext ->

        def adminRole = Role.findOrSaveWhere(authority: 'ROLE_ADMIN')
        def user = User.findOrSaveWhere(username: 'admin', password: 'password', name: 'admin')

        if (!user.authorities.contains(adminRole)) {
            UserRole.create(user, adminRole, true)
        }
    }

    def destroy = {
    }
}
