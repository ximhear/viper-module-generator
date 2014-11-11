//
//  TwitterListInteractor.swift
//  TwitterListGenDemo
//
//  Created by Pedro Piñera Buendía on 24/10/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation

class TwitterListInteractor: TwitterListInteractorInputProtocol
{
    weak var presenter: TwitterListInteractorOutputProtocol?
    var APIDataManager: TwitterListAPIDataManagerInputProtocol?
    var localDatamanager: TwitterListLocalDataManagerInputProtocol?
    var downloading: Bool = false
    
    init() {}
    
    
    // MARK: - TwitterListInteractorInputProtocol
    
    func logoutUser(completion: (error: NSError?) -> ())
    {
        self.localDatamanager?.logoutUser()
        completion(error: nil)
    }
    
    func refreshTweets(completion: (error: NSError?) -> ())
    {
        if downloading { return }
        downloading = true
        let mostRecentDate: NSDate? = self.localDatamanager?.mostRecentTweetDate()
        if mostRecentDate != nil {
            self.APIDataManager?.downloadTweets(moreRecentThan: mostRecentDate!, amount: 20, completion: { [weak self] (error, tweets) -> () in
                self?.downloading = false
                if error != nil {
                    completion(error: error)
                }
                else if tweets != nil{
                    self?.localDatamanager?.persist(tweets: tweets!)
                }
            })
        }
        else {
            self.APIDataManager?.downloadTweets(olderThan: NSDate(), amount: 20, completion: { [weak self] (error, tweets) -> () in
                self?.downloading = false
                if error != nil {
                    completion(error: error)
                }
                else if tweets != nil{
                    self?.localDatamanager?.persist(tweets: tweets!)
                }
            })
        }
    }
    
    func loadLocalTweets()
    {
        self.loadLocalTweets()
    }
    
    func downloadOlderTweets(completion: (error: NSError?) -> ())
    {
        if downloading { return }
        downloading = true
        let oldestDate: NSDate? = self.localDatamanager?.oldestTweetDate()
        self.APIDataManager?.downloadTweets(olderThan: oldestDate!, amount: 20, completion: { [weak self] (error, tweets) -> () in
            self?.downloading = false
            if error != nil {
                completion(error: error)
            }
            else if tweets != nil{
                self?.localDatamanager?.persist(tweets: tweets!)
            }
        })
    }
}