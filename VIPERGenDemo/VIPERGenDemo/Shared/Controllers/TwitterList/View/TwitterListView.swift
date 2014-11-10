//
//  TwitterListView.swift
//  TwitterListGenDemo
//
//  Created by Pedro Piñera Buendía on 24/10/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation
import UIKit

class TwitterListView: UIViewController, TwitterListViewProtocol, UITableViewDataSource, UITableViewDelegate
{
    var presenter: TwitterListPresenterProtocol?
    lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.backgroundColor = UIColor.whiteColor()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        tableView.registerClass(TweetCell.self, forCellReuseIdentifier: "tweetCell")
        return tableView
    }()
    
    // MARK - View Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupSubviews()
        self.setupAutolayouts()
        self.presenter?.viewDidLoad()
    }
    
    
    // MARK: - Subviews
    
    private func setupSubviews()
    {
        self.view.addSubview(self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self

    }
    
    private func setupAutolayouts()
    {
        // TableView
        self.tableView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero)
    }
    
    
    // MARK: - TwitterListViewProtocol
    
    func setViewTitle(title: String)
    {
        self.title = title
    }
    
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.presenter!.numberOfTweets(inSection: section)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var tweetCell: TweetCell = self.tableView.dequeueReusableCellWithIdentifier("tweetCell", forIndexPath: indexPath) as TweetCell
        tweetCell.userLabel.text = "@username"
        tweetCell.bodyLabel.text = "asdgas gas dgasdg asdgasdg adsga sdg asdg asdg asd ga dsgaasdgasdgasdgagsg asdgasdgadgas"
        tweetCell.dateLabel.text = "Monday"
        tweetCell.setNeedsUpdateConstraints()
        tweetCell.updateConstraintsIfNeeded()
        return tweetCell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int // Default is 1 if not implemented
    {
        return self.presenter!.numberOfSections()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.presenter!.userDidSelectTweet(atIndexPath: indexPath)
    }
}