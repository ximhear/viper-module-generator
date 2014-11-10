//
//  TwitterClient.swift
//  VIPERGenDemo
//
//  Created by Pedro Piñera Buendía on 09/11/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation
import Accounts
import Social
import SwifteriOS

private var _SingletonASharedInstance = TwitterClient(consumerKey: "U2YlcSsiOD3lxJNcxye1rpxvx", consumerSecret: "hDopZymcZeMh7LDlmEXqyL1R3J5in96iYxEHZIHKlTy0OJd8s6")

class TwitterClient: Swifter
{
    class var sharedInstance : TwitterClient {
        return _SingletonASharedInstance
    }
    class func set(#sharedInstance: TwitterClient)
    {
        _SingletonASharedInstance = sharedInstance
    }
}