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
        self.view!.setDetailText(NSLocalizedString("Developed Using VIPER", comment: "comment"))
        self.view!.setUsernamePlaceholderText(NSLocalizedString("introduce username", comment: "").capitalizedString)
        self.view!.setPasswordPlaceholderText(NSLocalizedString("introduce password", comment: "").capitalizedString)
    }
    
    func userDidSelectLogin(#username: String?, password: String?)
    {
        
    }
}