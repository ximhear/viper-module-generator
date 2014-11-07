//
//  AccountManager.swift
//  VIPERGenDemo
//
//  Created by Pedro Piñera Buendía on 06/11/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation

public class AccountManager
{
    /**
    Stores the user credentials in the NSUserDefaults
    
    :param: username String with the username to be persisted
    :param: password String with the password to be persisted
    */
    public class func persist(#username: String, password: String)
    {
        NSUserDefaults.standardUserDefaults().setObject(username, forKey: "username")
        NSUserDefaults.standardUserDefaults().setObject(password, forKey: "password")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    /**
    Restore persisted credentials of the user from the NSUserDefaults
    
    :returns: (username, password) returns the user credentials
    */
    public class func restore() -> (username: String?, password: String?)
    {
        let username: String? = NSUserDefaults.standardUserDefaults().objectForKey("username") as String?
        let password: String? = NSUserDefaults.standardUserDefaults().objectForKey("password") as String?
        return (username, password)
    }
    
    /**
    Remove the user credentials from the NSUserDefaults
    */
    public class func clean()
    {
        NSUserDefaults.standardUserDefaults().removeObjectForKey("username")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("password")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}