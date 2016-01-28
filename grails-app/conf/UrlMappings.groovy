class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "Home", action: "index")
        "/login"(controller: "Login", action: "index")
        "/signup"(controller: "SignUp", action: "index")
        "/profile"(view: "user/Profile")
        "/allusers"(controller: "User", action: "showAllUsers")
        "500"(view:'/error')
	}
}
