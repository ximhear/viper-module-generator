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

class TwitterLoginView: UIViewController, TwitterLoginViewProtocol, UITextFieldDelegate
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
        static private let EXTRA_LABEL_HEIGHT: CGFloat = 20
        static private let TEXTFIELD_FONT_SIZE: CGFloat = 15
        static private let TEXTFIELD_SCALE_PERCENTAGE: CGFloat = 0.8
        static private let TEXTFIELD_MARGIN: CGFloat = 20
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
    lazy var curtainView: UIView = {
        var view = UIView()
        //view.alpha = 0.0
        return view
    }()
    lazy var floatingBoardView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light))
    lazy var loginButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = Styles.LOGIN_BUTTON_COLOR
        return button
    }()
    lazy var extraLabel: UILabel = {
        var label: UILabel = UILabel()
        label.textColor = UIColor.whiteColor()
        label.backgroundColor = UIColor.clearColor()
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(12)
        label.numberOfLines = 1
        return label
    }()
    lazy var usernameTextField: UITextField = {
        var textField: UITextField = UITextField()
        textField.backgroundColor = UIColor.clearColor()
        textField.textColor = UIColor.whiteColor()
        textField.layer.borderColor = UIColor.whiteColor().CGColor
        textField.layer.borderWidth = 1.0
        textField.textAlignment = NSTextAlignment.Center
        textField.font = UIFont.systemFontOfSize(Styles.TEXTFIELD_FONT_SIZE)
        textField.returnKeyType = UIReturnKeyType.Next
        return textField
    }()
    lazy var passwordTextField: UITextField = {
        var textField: UITextField = UITextField()
        textField.backgroundColor = UIColor.clearColor()
        textField.textColor = UIColor.whiteColor()
        textField.layer.borderColor = UIColor.whiteColor().CGColor
        textField.layer.borderWidth = 1.0
        textField.textAlignment = NSTextAlignment.Center
        textField.font = UIFont.systemFontOfSize(Styles.TEXTFIELD_FONT_SIZE)
        textField.secureTextEntry = true
        textField.returnKeyType = UIReturnKeyType.Done
        return textField
        }()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        self.setupSubviews()
        self.setupAutolayouts()
        self.setupGestures()
        self.presenter!.viewDidLoad()
    }
    
    // MARK: - Autolayouts
    
    private func setupSubviews()
    {
        self.backgroundVideoPlayer.play()
        self.view.addSubview(self.backgroundVideoPlayer.view)
        self.view.addSubview(self.curtainView)
        self.view.addSubview(self.floatingBoardView)
        self.loginButton.addTarget(self, action: Selector("login"), forControlEvents: UIControlEvents.TouchUpInside)
        self.floatingBoardView.addSubview(self.loginButton)
        self.view.addSubview(self.logoImageView)
        self.view.addSubview(self.extraLabel)
        self.usernameTextField.delegate = self
        self.floatingBoardView.addSubview(self.usernameTextField)
        self.passwordTextField.delegate = self
        self.floatingBoardView.addSubview(self.passwordTextField)
    }
    
    private func setupAutolayouts()
    {
        self.backgroundVideoPlayer.view.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.backgroundVideoPlayer.view.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero)
        self.curtainView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.curtainView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero)
        self.floatingBoardView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.floatingBoardView.autoMatchDimension(ALDimension.Width, toDimension: ALDimension.Width, ofView: self.view, withMultiplier: Styles.FLOATING_WIDTH_PERCENTAGE)
        self.floatingBoardView.autoMatchDimension(ALDimension.Height, toDimension: ALDimension.Height, ofView: self.view, withMultiplier: Styles.FLOATING_HEIGHT_PERCENTAGE)
        self.floatingBoardView.autoCenterInSuperview()
        self.floatingBoardView.clipsToBounds = true
        self.floatingBoardView.layer.masksToBounds = true
        self.floatingBoardView.layer.cornerRadius = Styles.FLOATING_CORNER_RADIUS
        self.loginButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.loginButton.autoMatchDimension(ALDimension.Width, toDimension: ALDimension.Width, ofView: self.floatingBoardView)
        self.loginButton.autoSetDimension(ALDimension.Height, toSize: Styles.LOGIN_BUTTON_HEITHT)
        self.loginButton.autoPinEdge(ALEdge.Bottom, toEdge: ALEdge.Bottom, ofView: self.floatingBoardView)
        self.loginButton.autoAlignAxis(ALAxis.Vertical, toSameAxisOfView: self.floatingBoardView)
        self.logoImageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.logoImageView.autoSetDimension(ALDimension.Height, toSize: Styles.LOGO_SIZE)
        self.logoImageView.autoSetDimension(ALDimension.Width, toSize: Styles.LOGO_SIZE)
        self.logoImageView.autoAlignAxis(ALAxis.Vertical, toSameAxisOfView: self.floatingBoardView)
        self.logoImageView.autoPinEdge(ALEdge.Bottom, toEdge: ALEdge.Top, ofView: self.floatingBoardView, withOffset: -Styles.MARGIN_20)
        self.extraLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.extraLabel.autoPinEdge(ALEdge.Top, toEdge: ALEdge.Bottom, ofView: self.floatingBoardView)
        self.extraLabel.autoSetDimension(ALDimension.Height, toSize: Styles.EXTRA_LABEL_HEIGHT)
        self.extraLabel.autoMatchDimension(ALDimension.Width, toDimension: ALDimension.Width, ofView: self.floatingBoardView)
        self.extraLabel.autoAlignAxis(ALAxis.Vertical, toSameAxisOfView: self.floatingBoardView)
        self.usernameTextField.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.usernameTextField.autoMatchDimension(ALDimension.Width, toDimension: ALDimension.Width, ofView: self.floatingBoardView, withMultiplier: Styles.TEXTFIELD_SCALE_PERCENTAGE)
        self.usernameTextField.autoSetDimension(ALDimension.Height, toSize: 30)
        self.usernameTextField.autoPinEdgeToSuperviewEdge(ALEdge.Top, withInset: 20)
        self.usernameTextField.autoAlignAxis(ALAxis.Vertical, toSameAxisOfView: self.floatingBoardView)
        self.passwordTextField.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.passwordTextField.autoMatchDimension(ALDimension.Width, toDimension: ALDimension.Width, ofView: self.floatingBoardView, withMultiplier: Styles.TEXTFIELD_SCALE_PERCENTAGE)
        self.passwordTextField.autoSetDimension(ALDimension.Height, toSize: 30)
        self.passwordTextField.autoPinEdge(ALEdge.Top, toEdge: ALEdge.Bottom, ofView: self.usernameTextField, withOffset: Styles.TEXTFIELD_MARGIN)
        self.passwordTextField.autoAlignAxis(ALAxis.Vertical, toSameAxisOfView: self.floatingBoardView)
    }
    
    
    // MARK: - Gestures
    
    private func setupGestures()
    {
        var resignTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("resign"))
        resignTapGesture.numberOfTapsRequired = 1
        resignTapGesture.numberOfTouchesRequired = 1
        self.curtainView.userInteractionEnabled = true
        self.curtainView.addGestureRecognizer(resignTapGesture)
    }
    
    func resign()
    {
        self.usernameTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }

    
    // MARK: - TwitterLoginViewProtocol
    
    func setLoginTitle(let title: String)
    {
        self.loginButton.setTitle(title, forState: UIControlState.Normal)
    }
    
    func setDetailText(let detailText: String)
    {
        self.extraLabel.text = detailText
    }
    
    func setLogo(let image: UIImage)
    {
        self.logoImageView.image = image
        self.logoImageView.tintColor = UIColor.whiteColor()
    }
    
    func setUsernamePlaceholderText(text: String)
    {
        self.usernameTextField.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSForegroundColorAttributeName: UIColor(white: 0.7, alpha: 1.0)])
    }
    
    func setPasswordPlaceholderText(text: String)
    {
        self.passwordTextField.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSForegroundColorAttributeName: UIColor(white: 0.7, alpha: 1.0)])
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
    
    // MARK: - UITextField Delegate
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        if (textField === self.usernameTextField) {
            self.passwordTextField.becomeFirstResponder()
        }else if (textField === self.passwordTextField) {
            self.login()
        }
        return true
    }
    
    // MARK: Actions
    
    private func login()
    {
        self.presenter!.userDidSelectLogin(username: self.usernameTextField.text, password: self.passwordTextField.text)
    }
    
    // MARK: - Status Bar
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.BlackOpaque
    }
}