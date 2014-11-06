//
//  TwitterLoginProtocols.swift
//  TwitterLoginGenDemo
//
//  Created by Pedro Piñera Buendía on 22/08/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation

protocol TwitterLoginViewProtocol: class
{
    var presenter: TwitterLoginPresenterProtocol? { get set }
    /**
    * Add here your methods for communication VIEWCONTROLLER -> PRESENTER
    */
}

protocol TwitterLoginWireFrameProtocol: class
{
    class func presentTwitterLoginModule(fromView view: AnyObject)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol TwitterLoginPresenterProtocol: class
{
    var view: TwitterLoginViewProtocol? { get set }
    var interactor: TwitterLoginInteractorInputProtocol? { get set }
    var wireFrame: TwitterLoginWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEWCONTROLLER -> PRESENTER
    */
}

protocol TwitterLoginInteractorOutputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol TwitterLoginInteractorInputProtocol: class
{
    var presenter: TwitterLoginInteractorOutputProtocol? { get set }
    var APIDataManager: TwitterLoginAPIDataManagerInputProtocol? { get set }
    var localDatamanager: TwitterLoginLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
}

protocol TwitterLoginDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol TwitterLoginAPIDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol TwitterLoginLocalDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}
