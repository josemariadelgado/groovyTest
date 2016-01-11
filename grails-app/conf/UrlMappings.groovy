class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'user')
        "/login"(view:"/user/LogIn")
        "/signup"(controller:"User", action: "signUp")
        "500"(view:'/error')
	}
}
