class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'user')
        "/login"(view:"/user/LogIn")
        "/signup"(view: "user/SignUp")
        "/profile"(view: "user/Profile")
        "/allusers"(controller: "User", action: "showAllUsers")
        "500"(view:'/error')
	}
}
