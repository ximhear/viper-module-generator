//
//  TweetCell.swift
//  VIPERGenDemo
//
//  Created by Pedro Piñera Buendía on 10/11/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation

class TweetCell: UITableViewCell
{
    private  struct Styles
    {
        static let AVATAR_SIZE: CGFloat = 20
        static let BODY_TEXT_SIZE: CGFloat = 12
        static let BODY_TEXT_COLOR = UIColor(white: 0.2, alpha: 1.0)
        static let BODY_FONT = UIFont.systemFontOfSize(Styles.BODY_TEXT_SIZE)
        static let USERNAME_TEXT_SIZE: CGFloat = 12
        static let USERNAME_TEXT_COLOR = UIColor(white: 0.1, alpha: 1.0)
        static let USERNAME__FONT = UIFont.boldSystemFontOfSize(Styles.BODY_TEXT_SIZE)
        static let DATE_TEXT_SIZE: CGFloat = 11
        static let DATE_TEXT_COLOR = UIColor(white: 0.3, alpha: 1.0)
        static let DATE__FONT = UIFont.systemFontOfSize(Styles.BODY_TEXT_SIZE)
        static let OUTTER_MARGIN: CGFloat = 10
        static let INNER_MARGIN: CGFloat = 5
    }
    
    // MARK: - Attributes
    private var didUpdateConstraints: Bool = false
    lazy var dateLabel: UILabel =  {
        var label: UILabel = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.numberOfLines = 1
        label.font = Styles.DATE__FONT
        label.textColor = Styles.DATE_TEXT_COLOR
        return label
    }()
    lazy var userLabel: UILabel = {
        var label: UILabel = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.font = Styles.USERNAME__FONT
        label.textColor = Styles.USERNAME_TEXT_COLOR
        label.numberOfLines = 1
        label.textAlignment = NSTextAlignment.Left
        return label
    }()
    lazy var bodyLabel: UILabel = {
        var label: UILabel = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.font = Styles.BODY_FONT
        label.textColor = Styles.BODY_TEXT_COLOR
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        return label
    }()
    lazy var avatarView: UIImageView = {
        var imageView: UIImageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = Styles.AVATAR_SIZE/2
        imageView.backgroundColor = UIColor.redColor()
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        return imageView
    }()
    
    // MARK: - Constructor
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupSubviews()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Subviews
    
    func setupSubviews()
    {
        // Adding subviews
        self.contentView.addSubview(self.userLabel)
        self.contentView.addSubview(self.dateLabel)
        self.contentView.addSubview(self.bodyLabel)
        self.contentView.addSubview(self.avatarView)
    }
    
    override func updateConstraints() {
        if (!self.didUpdateConstraints) {
            UIView.autoSetPriority(1000, forConstraints: { () -> Void in
                self.userLabel.autoSetContentCompressionResistancePriorityForAxis(ALAxis.Vertical)
                self.bodyLabel.autoSetContentCompressionResistancePriorityForAxis(ALAxis.Vertical)
                self.dateLabel.autoSetContentCompressionResistancePriorityForAxis(ALAxis.Vertical)
            })
            
            self.avatarView.autoPinEdgeToSuperviewEdge(ALEdge.Leading, withInset: Styles.OUTTER_MARGIN)
            self.avatarView.autoPinEdgeToSuperviewEdge(ALEdge.Top, withInset: Styles.OUTTER_MARGIN)
            self.avatarView.autoSetDimension(ALDimension.Width, toSize: Styles.AVATAR_SIZE)
            self.avatarView.autoSetDimension(ALDimension.Height, toSize: Styles.AVATAR_SIZE)
            
            self.userLabel.autoPinEdgeToSuperviewEdge(ALEdge.Top, withInset: Styles.OUTTER_MARGIN)
            self.userLabel.autoPinEdge(ALEdge.Leading, toEdge: ALEdge.Trailing, ofView: self.avatarView, withOffset: Styles.INNER_MARGIN)
            self.userLabel.autoPinEdgeToSuperviewEdge(ALEdge.Trailing, withInset: Styles.OUTTER_MARGIN)
            
            self.bodyLabel.autoPinEdge(ALEdge.Top, toEdge: ALEdge.Bottom, ofView: self.userLabel, withOffset: Styles.INNER_MARGIN)
            self.bodyLabel.autoPinEdge(ALEdge.Leading, toEdge: ALEdge.Trailing, ofView: self.avatarView, withOffset: Styles.INNER_MARGIN)
            self.bodyLabel.autoPinEdgeToSuperviewEdge(ALEdge.Trailing, withInset: Styles.OUTTER_MARGIN)

            self.dateLabel.autoPinEdge(ALEdge.Top, toEdge: ALEdge.Bottom, ofView: self.bodyLabel, withOffset: Styles.INNER_MARGIN)
            self.dateLabel.autoPinEdge(ALEdge.Leading, toEdge: ALEdge.Trailing, ofView: self.avatarView, withOffset: Styles.INNER_MARGIN)
            self.dateLabel.autoPinEdgeToSuperviewEdge(ALEdge.Trailing, withInset: Styles.OUTTER_MARGIN)
            self.dateLabel.autoPinEdgeToSuperviewEdge(ALEdge.Bottom, withInset: Styles.OUTTER_MARGIN)
            
            self.didUpdateConstraints = true
        }
        super.updateConstraints()
    }
}