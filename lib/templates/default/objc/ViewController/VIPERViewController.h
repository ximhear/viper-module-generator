//
//  ___FILENAME___.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VIPERProtocols.h"
#import "_BASE_VIEW_CONTROLLER_.h"

@interface VIPERView : _BASE_VIEW_CONTROLLER_<VIPERViewProtocol>

@property (nonatomic, strong) id <VIPERPresenterProtocol> presenter;

@end
