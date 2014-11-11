//
//  TwitterListItem.swift
//  TwitterListGenDemo
//
//  Created by Pedro Piñera Buendía on 24/10/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation

struct TwitterListItem
{
    var body: String
    var date: NSDate
    var username: String
    var avatar: String
    var identifier: String
    
    init(body: String, date: NSDate, username: String, avatar: String, identifier: String)
    {
        self.body = body
        self.date = date
        self.username = username
        self.avatar = avatar
        self.identifier = identifier
    }
}

// Extension TwitterListItem + Tweet

extension TwitterListItem
{
    init(tweet: Tweet)
    {
        self.body = tweet.body
        self.date = tweet.date
        self.username = tweet.username
        self.avatar = tweet.avatar
        self.identifier = tweet.identifier
    }
    
    func update(inout tweet: Tweet)
    {
        tweet.body = self.body
        tweet.date = self.date
        tweet.username = self.username
        tweet.avatar = self.avatar
        tweet.identifier = self.identifier
    }
}

// Extension TwitterListItem + Twwet

extension TwitterListItem
{
    init (dict: [String: AnyObject])
    {
        //TODO
    }
}