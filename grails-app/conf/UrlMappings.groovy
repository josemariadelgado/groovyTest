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
        "500"(view:'/error')
	}
}
