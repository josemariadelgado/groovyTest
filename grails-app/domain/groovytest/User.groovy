package groovytest

class User {

    String username;
    String pass;
    String name;
    String lastName;
    String phoneNumber;
    String address;

    static constraints = {

        username(blank: false, unique: true)
        pass(blank: false)
        name(blank: false)
        lastName(blank: false)
        phoneNumber(blank: false, nullable: true)
        address(blank: false, nullable: true)
    }

}
