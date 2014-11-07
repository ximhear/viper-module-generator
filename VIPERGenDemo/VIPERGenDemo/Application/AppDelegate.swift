//
//  AppDelegate.swift
//  VIPERGenDemo
//
//  Created by Pedro Piñera Buendía on 22/08/14.
//  Copyright (c) 2014 ___PPinera___. All rights reserved.
//


import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        TwitterLoginWireFrame.presentTwitterLoginModule(inWindow: window!)
        window!.makeKeyAndVisible()
        return true
    }
}
