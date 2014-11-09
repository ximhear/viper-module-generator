//
//  TwitterLoginPresenter.swift
//  TwitterLoginGenDemo
//
//  Created by Pedro Piñera Buendía on 24/10/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation

class TwitterLoginPresenter: TwitterLoginPresenterProtocol, TwitterLoginInteractorOutputProtocol
{
    weak var view: TwitterLoginViewProtocol?
    var interactor: TwitterLoginInteractorInputProtocol?
    var wireFrame: TwitterLoginWireFrameProtocol?
    
    init() {}
    
    // MARK: - TwitterLoginPresenterProtocol
    
    func viewDidLoad()
    {
        if (self.view == nil) { return }
        self.view!.setLoginTitle(NSLocalizedString("Login Twitter", comment: "comment"))
        self.view!.setLogo(UIImage(named: "twitter_logo")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate))
    }
    
    func userDidSelectLogin()
    {
        self.interactor?.login() { (error: NSError?) -> () in
            
        }
    }
}