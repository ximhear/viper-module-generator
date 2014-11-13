//
//  TwitterListAPIDataManager.swift
//  TwitterListGenDemo
//
//  Created by Pedro Piñera Buendía on 24/10/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation
import SwifteriOS

let SEARCH_FILTER = "@nsbarcelona"

class TwitterListAPIDataManager: TwitterListAPIDataManagerInputProtocol
{
    init() {}
    
    func downloadTweets(#fromID: Int32, amount: Int, completion: (error: NSError?, tweets: [TwitterListItem]?) -> ())
    {
        TwitterClient.sharedInstance.getSearchTweetsWithQuery(SEARCH_FILTER, geocode: nil, lang: nil, locale: nil, resultType: nil, count: amount, until: nil, sinceID: "\(fromID)", maxID: nil, includeEntities: nil, callback: nil, success: { (statuses, searchMetadata) -> Void in
            completion(error: nil, tweets: TwitterListAPIDataManager.twitterListItemsFromJSONArray(statuses))
        }) { (error) -> Void in
            completion(error: error, tweets: nil)
        }
    }
    
    func downloadTweets(#beforeID: Int32, amount: Int, completion: (error: NSError?, tweets: [TwitterListItem]?) -> ())
    {
        TwitterClient.sharedInstance.getSearchTweetsWithQuery(SEARCH_FILTER, geocode: nil, lang: nil, locale: nil, resultType: nil, count: amount, until: nil, sinceID: nil, maxID: "\(beforeID)", includeEntities: nil, callback: nil, success: { (statuses, searchMetadata) -> Void in
            completion(error: nil, tweets: TwitterListAPIDataManager.twitterListItemsFromJSONArray(statuses))
            }) { (error) -> Void in
                completion(error: error, tweets: nil)
        }
    }
    
    func downloadTweets(amount: Int, completion: (error: NSError?, tweets: [TwitterListItem]?) -> ())
    {
        TwitterClient.sharedInstance.getSearchTweetsWithQuery(SEARCH_FILTER, geocode: nil, lang: nil, locale: nil, resultType: nil, count: amount, until: nil, sinceID: nil, maxID: nil, includeEntities: nil, callback: nil, success: { (statuses, searchMetadata) -> Void in
                completion(error: nil, tweets: TwitterListAPIDataManager.twitterListItemsFromJSONArray(statuses))
            }) { (error) -> Void in
                completion(error: error, tweets: nil)
        }
    }
    
    class func twitterListItemsFromJSONArray(jsonArray: [JSONValue]?) -> [TwitterListItem]
    {
        if jsonArray == nil {
            return [TwitterListItem]()
        }
        else {
            var list: [TwitterListItem] = [TwitterListItem]()
            for value in jsonArray! {
                var twitterListItem: TwitterListItem = TwitterListItem(jsonDict: value.object!)
                list.append(twitterListItem)
            }
            return list
        }
    }
}