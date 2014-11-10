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
    * Add here your methods for communication VIEWCONTROLLER -> PRESENTER
    */
    func setViewTitle(title: String)
}

protocol TwitterListWireFrameProtocol: class
{
    class func presentTwitterListModule(inWindow window: UIWindow)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol TwitterListPresenterProtocol: class
{
    var view: TwitterListViewProtocol? { get set }
    var interactor: TwitterListInteractorInputProtocol? { get set }
    var wireFrame: TwitterListWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEWCONTROLLER -> PRESENTER
    */
    func viewDidLoad()
    func numberOfTweets(inSection section: Int) -> Int
    func numberOfSections() -> Int
    func userDidSelectTweet(atIndexPath indexPath: NSIndexPath)
    func setTweetContent(usingPresenter presenter: AnyObject)
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
