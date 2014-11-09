//
//  TwitterLoginAPIDataManager.swift
//  TwitterLoginGenDemo
//
//  Created by Pedro Piñera Buendía on 24/10/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation
import SwifteriOS

class TwitterLoginAPIDataManager: TwitterLoginAPIDataManagerInputProtocol
{
    init() {}
    
    // MARK: - TwitterLoginAPIDataManagerInputProtocol
    
    func login(completion: (error: NSError?, account: AccountEntity?) -> ())
    {
        let swifter = Swifter(consumerKey: "U2YlcSsiOD3lxJNcxye1rpxvx", consumerSecret: "hDopZymcZeMh7LDlmEXqyL1R3J5in96iYxEHZIHKlTy0OJd8s6")
        swifter.authorizeWithCallbackURL(NSURL(string: "")!, success: {
            (accessToken: SwifterCredential.OAuthAccessToken?, response: NSURLResponse) in
            
            // ...
            
            },
            failure: {
                (error: NSError) in
                
                // ...
                
        })
    }
}