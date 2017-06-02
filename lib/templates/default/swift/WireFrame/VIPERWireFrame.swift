//
//  ___FILENAME___.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class VIPERWireFrame: VIPERWireFrameProtocol {

    static func presentVIPERModule(fromVC: UIViewController) {

        // Generating module components
        let viewController = storyboard.instantiateViewController(withIdentifier: "VIPERViewController")
        if let view = viewController as? VIPERViewController {
            let presenter: VIPERPresenterProtocol & VIPERInteractorOutputProtocol = VIPERPresenter()
            let interactor: VIPERInteractorInputProtocol = VIPERInteractor()
            let APIDataManager: VIPERAPIDataManagerInputProtocol = VIPERAPIDataManager()
            let localDataManager: VIPERLocalDataManagerInputProtocol = VIPERLocalDataManager()
            let wireFrame: VIPERWireFrameProtocol = VIPERWireFrame()

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

    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}