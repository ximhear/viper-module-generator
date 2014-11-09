//
//  LoginError.swift
//  VIPERGenDemo
//
//  Created by Pedro Piñera Buendía on 09/11/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation

enum LoginError: Printable
{
    case MissingUsername, MissingPassword
    
    /**
    Returns (if exists) a login error from the usrname and the password introduced
    
    :param: username String with the username
    :param: password String with the password
    
    :returns: LoginError optional (nil if there's no error)
    */
    internal static func error(fromUsername username: String?, password: String?) -> LoginError?
    {
        if username == nil || username == "" {
            return MissingUsername
        }
        else if password == nil || password == "" {
            return MissingPassword
        }
        return nil
    }
    
    /// Description var ( Printable protocol )
    var description: String {
        switch self {
            case .MissingUsername: return NSLocalizedString("missing username", comment: "").firstLetterCapitalized();
            case .MissingPassword: return NSLocalizedString("missing password", comment: "").firstLetterCapitalized();
            default: return ""
        }
    }
}