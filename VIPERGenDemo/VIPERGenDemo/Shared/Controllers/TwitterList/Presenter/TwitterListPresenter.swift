//
//  TwitterListPresenter.swift
//  TwitterListGenDemo
//
//  Created by Pedro Piñera Buendía on 24/10/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation

class TwitterListPresenter: TwitterListPresenterProtocol, TwitterListInteractorOutputProtocol
{
    weak var view: TwitterListViewProtocol?
    var interactor: TwitterListInteractorInputProtocol?
    var wireFrame: TwitterListWireFrameProtocol?
    
    init() {}
    
    
    // MARK: - TwitterListPresenterProtocol
    
    func viewDidLoad()
    {
        updateTitle()
    }
    
    func composeTweet()
    {
        self.wireFrame?.openComposer(fromView: self.view!)
    }
    
    func logout()
    {
        self.interactor?.logoutUser() { [weak self] (error: NSError?) -> () in
            if error != nil {
                self!.wireFrame!.openLogin(fromView: self!.view!)
            }
            else {
                // TODO
            }
        }
    }
    
    func refreshTweets()
    {
        self.interactor?.refreshTweets() { [weak self] (error: NSError?) -> () in
            self!.view!.stopRefreshing()
        }
    }
    
    
    // MARK - Formatting
    
    func updateTitle()
    {
        self.view?.setViewTitle(NSLocalizedString("timeline", comment: "").firstLetterCapitalized())
    }
    
    func numberOfTweets(inSection section: Int) -> Int
    {
        return 100
    }

    func numberOfSections() -> Int
    {
        return 1
    }
    
    func setTweetContent(usingPresenter presenter: AnyObject)
    {
        
    }
    
    func userDidSelectTweet(atIndexPath indexPath: NSIndexPath)
    {
        //TODO
    }
}