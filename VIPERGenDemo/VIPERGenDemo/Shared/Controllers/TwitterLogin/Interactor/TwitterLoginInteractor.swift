//
//  TwitterLoginInteractor.swift
//  TwitterLoginGenDemo
//
//  Created by Pedro Piñera Buendía on 24/10/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation

class TwitterLoginInteractor: TwitterLoginInteractorInputProtocol
{
    weak var presenter: TwitterLoginInteractorOutputProtocol?
    var APIDataManager: TwitterLoginAPIDataManagerInputProtocol?
    var localDatamanager: TwitterLoginLocalDataManagerInputProtocol?
    
    init() {}
    
    // MARK: - TwitterLoginInteractorInputProtocol
    
    func login(completion: (error: NSError?) -> ())
    {
        self.APIDataManager?.login() { (error: NSError?, account: AccountEntity?) -> () in
            
        }
    }
}