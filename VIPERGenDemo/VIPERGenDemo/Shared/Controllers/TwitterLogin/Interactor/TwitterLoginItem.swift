//
//  TwitterLoginItem.swift
//  TwitterLoginGenDemo
//
//  Created by Pedro Piñera Buendía on 24/10/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation

struct TwitterLoginItem
{
    /**
    *  Attributes
    */
    var accessToken: String?
    var error: NSError?
    
    // MARK: - Constructors
    
    init(accessToken: String?, error: NSError?)
    {
        self.accessToken = accessToken
        self.error = error
    }
}

public struct OAuthAccessToken {
    
    public internal(set) var key: String
    public internal(set) var secret: String
    public internal(set) var verifier: String?
    public internal(set) var screenName: String?
    public internal(set) var userID: String?
}