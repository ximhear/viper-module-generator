//
//  TwitterListWireFrame.swift
//  TwitterListGenDemo
//
//  Created by Pedro Piñera Buendía on 24/10/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation

class TwitterListWireFrame: TwitterListWireFrameProtocol
{
    class func presentTwitterListModule(fromView view: AnyObject)
    {
        // Generating module components
        var view: TwitterListViewProtocol = TwitterListView()
        var presenter: protocol<TwitterListPresenterProtocol, TwitterListInteractorOutputProtocol> = TwitterListPresenter()
        var interactor: TwitterListInteractorInputProtocol = TwitterListInteractor()
        var APIDataManager: TwitterListAPIDataManagerInputProtocol = TwitterListAPIDataManager()
        var localDataManager: TwitterListLocalDataManagerInputProtocol = TwitterListLocalDataManager()
        var wireFrame: TwitterListWireFrameProtocol = TwitterListWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDatamanager = localDataManager
    }
}