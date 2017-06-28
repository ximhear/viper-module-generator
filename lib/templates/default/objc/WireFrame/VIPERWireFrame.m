//
//  ___FILENAME___.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "VIPERWireFrame.h"

@implementation VIPERWireFrame

+ (void)presentVIPERModuleFrom:(UIViewController*)fromViewController {
    // Generating module components
    id <VIPERViewProtocol> view = [[VIPERViewController alloc] initWithNibName:@"VIPERViewController" bundle:nil];
    id <VIPERPresenterProtocol, VIPERInteractorOutputProtocol> presenter = [VIPERPresenter new];
    id <VIPERInteractorInputProtocol> interactor = [VIPERInteractor new];
    id <VIPERAPIDataManagerInputProtocol> APIDataManager = [VIPERAPIDataManager new];
    id <VIPERLocalDataManagerInputProtocol> localDataManager = [VIPERLocalDataManager new];
    id <VIPERWireFrameProtocol> wireFrame= [VIPERWireFrame new];
    
    // Connecting
    view.presenter = presenter;
    presenter.view = view;
    presenter.wireFrame = wireFrame;
    presenter.interactor = interactor;
    interactor.presenter = presenter;
    interactor.APIDataManager = APIDataManager;
    interactor.localDataManager = localDataManager;
    
    //TOODO - New view controller presentation (present, push, pop, .. )
}

@end
