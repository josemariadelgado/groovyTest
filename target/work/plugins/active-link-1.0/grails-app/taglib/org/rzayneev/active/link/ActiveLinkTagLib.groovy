package org.rzayneev.active.link

import java.util.regex.Pattern

class ActiveLinkTagLib {
    static namespace = "g"
    static final defaultActiveClassName = 'active'

    def activeLink = { attrs, body ->

        def activeClassName = attrs.activeClass ?: defaultActiveClassName

        def wrapperTag = attrs?.wrapper

        def isActive = isLinkActiveFor(createLink(attrs?.clone() << [absolute: false]), attrs.containsKey('condition') ? attrs?.condition : 'default')

        def linkAttrs = attrs.clone()

        ['activeClass', 'condition', 'wrapper'].each {
            linkAttrs.remove(it);
        }

        if (!wrapperTag && isActive)
            linkAttrs << [class: (linkAttrs?.class ? linkAttrs?.class + ' ' : '') + activeClassName]

        if (wrapperTag) {
            out << "<${wrapperTag}" + (isActive ? " class=\"${activeClassName}\"" : '') + ">"
        }

        out << g.link(linkAttrs, body)

        if (wrapperTag) {
            out << "</${wrapperTag}>"
        }
    }

    def isLinkActiveFor(uri, Pattern condition) {
        request.forwardURI =~ condition
    }

    def isLinkActiveFor(uri, Map condition) {
        ! condition.any{ key, val ->
            val = !(val instanceof List) ? [val] : val
            (!params.containsKey(key) || !val?.contains(params[key]))
        }
    }

    def isLinkActiveFor(uri, Boolean condition) {
        condition
    }

    def isLinkActiveFor(uri, String condition) {
        if (condition?.empty || condition == 'default') {
            request.forwardURI ==~ /^${uri?.replaceAll(/\?.*/, "")?.replaceAll(/\/$/,"")}((\?.*)|(\/.*)*)$/
        } else if (condition == 'exclude') {
            request.forwardURI ==~ /^${uri?.replaceAll(/\?.*/, "")?.replaceAll(/\/$/,"")}(\?.*)*$/
        } else if (condition == 'include') {
            def (currentUri, currentParams) = request.forwardURI.tokenize("?")
            def (linkUri, linkParams) = uri.tokenize("?")
            (currentUri.replaceAll(/\/$/,"") == linkUri.replaceAll(/\/$/,"") && currentParams?.split("&") as Set == linkParams?.split("&") as Set)
        }
    }
}
