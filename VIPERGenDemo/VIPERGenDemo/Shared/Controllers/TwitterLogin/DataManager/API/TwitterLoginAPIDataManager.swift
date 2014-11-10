//
//  TwitterLoginAPIDataManager.swift
//  TwitterLoginGenDemo
//
//  Created by Pedro Piñera Buendía on 24/10/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation
import Accounts
import Social
import SwifteriOS

class TwitterLoginAPIDataManager: TwitterLoginAPIDataManagerInputProtocol
{
    init() {}
    
    // MARK: - TwitterLoginAPIDataManagerInputProtocol
    
    func login(completion: (error: NSError?) -> ())
    {
        let accountStore = ACAccountStore()
        let accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        
        // Prompt the user for permission to their twitter account stored in the phone's settings
        accountStore.requestAccessToAccountsWithType(accountType, options: nil) {
            granted, error in
            
            if granted {
                let twitterAccounts = accountStore.accountsWithAccountType(accountType)
                
                if twitterAccounts?.count == 0
                {
                    TwitterClient.sharedInstance.authorizeWithCallbackURL(NSURL(string: "vipergen://success")!, success: { (accessToken, response) -> Void in
                            TwitterClient.sharedInstance.getAccountSettingsWithSuccess({ (settings) -> Void in
                                completion(error: nil)
                            }, failure: { (error) -> Void in
                              completion(error: error)
                            })
                        }, failure: { (error) -> Void in
                            completion(error: error)
                    })
                }
                else {
                    let twitterAccount = twitterAccounts[0] as ACAccount
                    TwitterClient.set(sharedInstance: TwitterClient(account: twitterAccount))
                }
            }
            else {
                completion(error: error)
            }
        }
    }
}