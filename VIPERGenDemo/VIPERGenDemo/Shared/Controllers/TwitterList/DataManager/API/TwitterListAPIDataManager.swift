//
//  TwitterListAPIDataManager.swift
//  TwitterListGenDemo
//
//  Created by Pedro Piñera Buendía on 24/10/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation

class TwitterListAPIDataManager: TwitterListAPIDataManagerInputProtocol
{
    init() {}
    
    func downloadTweets(#olderThan: NSDate, amount: Int, completion: (error: NSError?, tweets: [TwitterListItem]?) -> ())
    {
        // TODO
    }
    
    func downloadTweets(#moreRecentThan: NSDate, amount: Int, completion: (error: NSError?, tweets: [TwitterListItem]?) -> ())
    {
        // TODO
    }
}