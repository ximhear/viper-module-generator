//
//  TwitterListLocalDataManager.swift
//  TwitterListGenDemo
//
//  Created by Pedro Piñera Buendía on 24/10/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation

class TwitterListLocalDataManager: TwitterListLocalDataManagerInputProtocol
{
    init() {}
    
    func logoutUser()
    {
        logoutFunction()
    }
    
    func loadLocalTweets(#hashtag: String)
    {
        //TODO -- LOAD - (Fetched resultscontroller)
    }
    
    func mostRecentTweetDate() -> NSDate?
    {
        let tweet: Tweet? = Tweet.sorted(by: "date", ascending: true).last().find()?.first as Tweet?
        return tweet?.date
    }
    
    func oldestTweetDate() -> NSDate?
    {
        let tweet: Tweet? = Tweet.sorted(by: "date", ascending: true).first().find()?.first as Tweet?
        return tweet?.date
    }
    
    func persist(#tweets: [TwitterListItem])
    {
        SugarRecord.operation(inBackground: true, stackType: SugarRecordStackType.SugarRecordStackTypeCoreData) { (context) -> () in
            _ = context.beginWriting()
            
            for twitterListItem: TwitterListItem in tweets {
//                let tweet: Tweet? = Tweet.by("", equalTo: "").first().find(inContext: context) as? Tweet
//                

            }
            
            
        }
        
        // 1) Check if the tweet exist
        // 2) If it doesn't exist a
    }
}