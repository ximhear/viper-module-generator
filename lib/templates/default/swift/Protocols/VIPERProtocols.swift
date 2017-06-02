//
//  ___FILENAME___.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol VIPERViewProtocol: class {
    var presenter: VIPERPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
}

protocol VIPERWireFrameProtocol: class {
    static func presentVIPERModule(fromVC: UIViewController)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol VIPERPresenterProtocol: class {
    var view: VIPERViewProtocol? { get set }
    var interactor: VIPERInteractorInputProtocol? { get set }
    var wireFrame: VIPERWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
}

protocol VIPERInteractorOutputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol VIPERInteractorInputProtocol: class
{
    var presenter: VIPERInteractorOutputProtocol? { get set }
    var APIDataManager: VIPERAPIDataManagerInputProtocol? { get set }
    var localDatamanager: VIPERLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
}

protocol VIPERDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol VIPERAPIDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol VIPERLocalDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
