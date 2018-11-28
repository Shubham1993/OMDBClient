//
//  DetailViewRouter.swift
//  OMDBClientTests
//
//  Created by Shubham Gupta on 29/10/18.
//  Copyright © 2018 OMDB. All rights reserved.
//

import Foundation


import Foundation
@testable import OMDBClient

class DetailViewRouterSpy: DetailViewRouter {
    
    var moveToSocialLoginViewToBeCalled = false
    var backToSendOTPViewToBeCalled = false
    var moveToHomeViewToBeCalled = false
    
    func moveToSocialLoginView() {
        moveToSocialLoginViewToBeCalled = true
    }
    
    func backToSendOTPView() {
        backToSendOTPViewToBeCalled = true
    }
    
    func moveToHomeView() {
        moveToHomeViewToBeCalled = true
    }
}

