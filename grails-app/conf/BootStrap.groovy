import groovyTest.Role
import groovyTest.User
import groovyTest.UserRole

class BootStrap {

    def init = { servletContext ->
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

        def testUser = new User(name: "chema", username: "chema", password: "123", enabled: true, accountExpired: false,
                accountLocked: false, passwordExpired: false, lastName: "delgado", phoneNumber: "666", address: "address")
        testUser.save(flush: true)

        UserRole.create testUser, userRole, true

        assert User.count() == 1
        assert Role.count() == 1
        assert UserRole.count() == 1
    }
    def destroy = {
    }
}
