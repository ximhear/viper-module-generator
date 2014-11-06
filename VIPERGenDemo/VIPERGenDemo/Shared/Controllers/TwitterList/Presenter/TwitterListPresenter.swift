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
}