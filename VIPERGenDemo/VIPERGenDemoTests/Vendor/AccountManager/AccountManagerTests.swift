//
//  AccountManagerTests.swift
//  VIPERGenDemo
//
//  Created by Pedro Piñera Buendía on 06/11/14.
//  Copyright (c) 2014 ___Redbooth___. All rights reserved.
//

import Foundation
import XCTest
import VIPERGenDemo

class VIPERGenDemoTests: XCTestCase
{
    func testIfUsernameAndPasswordArePersisted()
    {
        AccountManager.persist(username: "test_user", password: "test_password")
        let credentials = AccountManager.restore()
        XCTAssertEqual(credentials.username!, "test_user", "The user should be the persisted")
        XCTAssertEqual(credentials.password!, "test_password", "The password should be the persisted")
    }
    
    func testIfResetCleansTheCredentials()
    {
        AccountManager.persist(username: "test_user", password: "test_password")
        AccountManager.clean()
        let credentials = AccountManager.restore()
        XCTAssertNil(credentials.password, "The password should be nil")
        XCTAssertNil(credentials.username, "The username should be nil")
    }
}
