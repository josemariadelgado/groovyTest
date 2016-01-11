class ActiveLinkGrailsPlugin {
    // the plugin version
    def version = "1.0"
    // the version or versions of Grails the plugin is designed for
    def grailsVersion = "2.3 > *"
    // resources that are excluded from plugin packaging
    def pluginExcludes = [
        "grails-app/views/error.gsp",
        "grails-app/conf/DataSource.groovy",
        "grails-app/conf/UrlMappings.groovy",
        "grails-app/conf/spring/resources.groovy",
        "grails-app/conf/BootStrap.groovy",
        "grails-app/conf/BuildConfig.groovy"
    ]

    def title = "Active Link Tag Plugin" // Headline display name of the plugin
    def author = "Ramil Zayneev"
    def authorEmail = "ramilzrr@gmail.com"
    def description = "active-link it's decoration for g:link tag. Plugin providing g:activeLink tag which will add additional css class for g:link according specified condition. This plugin is a translation for RoR \"active_link_to\"."

    // URL to the plugin's documentation
    def documentation = "http://grails.org/plugin/active-link"

    // Extra (optional) plugin metadata

    // License: one of 'APACHE', 'GPL2', 'GPL3'
    def license = "APACHE"

    // Any additional developers beyond the author specified above.
    def developers = [ [ name: "Ramil Zayneev", email: "ramilzrr@gmail.com" ]]

    // Location of the plugin's issue tracker.
    def issueManagement = [ system: "Bitbucket", url: "https://bitbucket.org/rzayneev/active-link/issues" ]

    // Online location of the plugin's browseable source code.
    def scm = [ url: "https://bitbucket.org/rzayneev/active-link/" ]
}
