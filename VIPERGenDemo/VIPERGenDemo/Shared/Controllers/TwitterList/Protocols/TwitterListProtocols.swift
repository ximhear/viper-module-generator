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
}

protocol TwitterListWireFrameProtocol: class
{
    class func presentTwitterListModule(fromView view: AnyObject)
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
