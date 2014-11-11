//
//  TwitterListProtocols.swift
//  TwitterListGenDemo
//
//  Created by Pedro Piñera Buendía on 22/08/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation

protocol TwitterListViewProtocol: class
{
    var presenter: TwitterListPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
    func setViewTitle(title: String)
    func stopRefreshing()
    func showError(errorMessage: String)
}

protocol TwitterListWireFrameProtocol: class
{
    class func presentTwitterListModule(inWindow window: UIWindow)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
    func openLogin(fromView view: AnyObject)
}

protocol TwitterListPresenterProtocol: class
{
    var view: TwitterListViewProtocol? { get set }
    var interactor: TwitterListInteractorInputProtocol? { get set }
    var wireFrame: TwitterListWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    func viewDidLoad()
    func numberOfTweets(inSection section: Int) -> Int
    func numberOfSections() -> Int
    func userDidSelectTweet(atIndexPath indexPath: NSIndexPath)
    func setTweetContent(usingPresenter presenter: AnyObject)
    func logout()
    func refreshTweets()
    func userDidScrollToBottom()
}

protocol TwitterListInteractorOutputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol TwitterListInteractorInputProtocol: class
{
    var presenter: TwitterListInteractorOutputProtocol? { get set }
    var APIDataManager: TwitterListAPIDataManagerInputProtocol? { get set }
    var localDatamanager: TwitterListLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func logoutUser(completion: (error: NSError?) -> ())
    func refreshTweets(completion: (error: NSError?) -> ())
    func downloadOlderTweets(completion: (error: NSError?) -> ())
    func loadLocalTweets()
}

protocol TwitterListDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol TwitterListAPIDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
    func downloadTweets(#olderThan: NSDate, amount: Int, completion: (error: NSError?, tweets: [TwitterListItem]?) -> ())
    func downloadTweets(#moreRecentThan: NSDate, amount: Int, completion: (error: NSError?, tweets: [TwitterListItem]?) -> ())

}

protocol TwitterListLocalDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
    func logoutUser()
    func loadLocalTweets(#hashtag: String)
    func mostRecentTweetDate() -> NSDate?
    func oldestTweetDate() -> NSDate?
    func persist(#tweets: [TwitterListItem])
}
