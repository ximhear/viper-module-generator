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
}

protocol TwitterListWireFrameProtocol: class
{
    class func presentTwitterListModule(inWindow window: UIWindow)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
    func openLogin(fromView view: AnyObject)
    func openComposer(fromView view: AnyObject)
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
    func composeTweet()
    func logout()
    func refreshTweets()
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
}

protocol TwitterListLocalDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}
