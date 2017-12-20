//
//  Configuration.swift
//  baggage
//
//  Created by Nicolas Palmieri on 12/14/17.
//  Copyright © 2017 Nicolas Palmieri. All rights reserved.
//

import Foundation

class Configuration {
    class func getScheme() -> String {
        #if DEBUG
            return "http"
        #else
            return "https"
        #endif
    }

    class func getBaseURL() -> String {
        #if DEBUG
            return "https://debug-one.com"
        #elseif INTEGRATION
            return "https://integration.com"
        #elseif QA
            return "https://QA-one.com"
        #elseif PROD
            return "https://tha-real-one.com"
        #endif
    }
}
