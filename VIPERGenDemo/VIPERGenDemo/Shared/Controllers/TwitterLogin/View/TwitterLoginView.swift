//
//  TwitterLoginView.swift
//  TwitterLoginGenDemo
//
//  Created by Pedro Piñera Buendía on 24/10/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer

class TwitterLoginView: UIViewController, TwitterLoginViewProtocol
{
    // MARK: - Styles
    private struct Styles {
        static private let LOGIN_BUTTON_HEITHT: CGFloat = 50
        static private let LOGIN_BUTTON_COLOR: UIColor = UIColor(red: 0.0/255, green: 132.0/255, blue: 180.0/255, alpha: 1.0)
        static private let FLOATING_CORNER_RADIUS: CGFloat = 10
        static private let FLOATING_HEIGHT_PERCENTAGE: CGFloat = 0.3
        static private let FLOATING_WIDTH_PERCENTAGE: CGFloat = 0.8
        static private let LOGO_SIZE: CGFloat = 80
        static private let MARGIN_20: CGFloat = 20
    }
    
    
    // MARK: - Attributes
    
    var presenter: TwitterLoginPresenterProtocol?
    lazy var backgroundVideoPlayer: MPMoviePlayerController = {
        var moviePlayer = MPMoviePlayerController(contentURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("video", ofType: "mp4")!))
        moviePlayer.controlStyle = MPMovieControlStyle.None
        moviePlayer.repeatMode = MPMovieRepeatMode.One
        moviePlayer.scalingMode = MPMovieScalingMode.AspectFill
        return moviePlayer
    }()
    lazy var logoImageView: UIImageView = UIImageView()
    lazy var loginButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = Styles.LOGIN_BUTTON_COLOR
        return button
    }()
    
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        self.setupSubviews()
        self.setupAutolayouts()
        self.presenter!.viewDidLoad()
    }
    
    
    // MARK: - Autolayouts
    
    private func setupSubviews()
    {
        self.backgroundVideoPlayer.play()
        self.view.addSubview(self.backgroundVideoPlayer.view)
        self.view.addSubview(self.loginButton)
        self.loginButton.addTarget(self, action: Selector("login"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.logoImageView)
    }
    
    private func setupAutolayouts()
    {
        self.backgroundVideoPlayer.view.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.backgroundVideoPlayer.view.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero)
        self.loginButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.loginButton.autoMatchDimension(ALDimension.Width, toDimension: ALDimension.Width, ofView: self.view, withMultiplier: 0.8)
        self.loginButton.autoSetDimension(ALDimension.Height, toSize: Styles.LOGIN_BUTTON_HEITHT)
        self.loginButton.autoCenterInSuperview()
        self.logoImageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.logoImageView.autoSetDimension(ALDimension.Height, toSize: Styles.LOGO_SIZE)
        self.logoImageView.autoSetDimension(ALDimension.Width, toSize: Styles.LOGO_SIZE)
        self.logoImageView.autoAlignAxis(ALAxis.Vertical, toSameAxisOfView: self.loginButton)
        self.logoImageView.autoPinEdge(ALEdge.Bottom, toEdge: ALEdge.Top, ofView: self.loginButton, withOffset: -Styles.MARGIN_20)
    }
    
    
    // MARK: - TwitterLoginViewProtocol
    
    func setLoginTitle(let title: String)
    {
        self.loginButton.setTitle(title, forState: UIControlState.Normal)
    }
    
    func setLogo(let image: UIImage)
    {
        self.logoImageView.image = image
        self.logoImageView.tintColor = UIColor.whiteColor()
    }
    
    func showError(let errorMessage: String)
    {
        ProgressHUD.showError(errorMessage)
    }
    
    func showLoading()
    {
        ProgressHUD.show("")
    }
    
    func hideLoading()
    {
        ProgressHUD.dismiss()
    }
    
    
    // MARK: Actions
    
    func login()
    {
        //self.presenter!.userDidSelectLogin(username: self.usernameTextField.text, password: self.passwordTextField.text)
    }
    
    // MARK: - Status Bar
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.BlackOpaque
    }
}