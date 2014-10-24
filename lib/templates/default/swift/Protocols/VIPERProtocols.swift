//
//  VIPERProtocols.swift
//  VIPERGenDemo
//
//  Created by Pedro Piñera Buendía on 22/08/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation

protocol VIPERViewProtocol
{
    var presenter: VIPERPresenterProtocol? { get set }
    /**
    * Add here your methods for communication VIEWCONTROLLER -> PRESENTER
    */
}

protocol VIPERWireFrameProtocol
{
    var presenter: VIPERPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol VIPERPresenterProtocol
{
    var view: VIPERViewProtocol? { get set }
    var interactor: VIPERInteractorInputProtocol? { get set }
    var wireFrame: VIPERWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEWCONTROLLER -> PRESENTER
    */
}

protocol VIPERInteractorOutputProtocol
{
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol VIPERInteractorInputProtocol
{
    var presenter: VIPERInteractorOutputProtocol? { get set }
    var APIDataManager: VIPERAPIDataManagerInputProtocol? { get set }
    var localDatamanager: VIPERLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
}

protocol VIPERDataManagerInputProtocol
{
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol VIPERAPIDataManagerInputProtocol
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol VIPERLocalDataManagerInputProtocol
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}
