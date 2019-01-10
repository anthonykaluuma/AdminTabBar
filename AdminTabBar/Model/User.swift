//
//  User.swift
//  AdminTabBar
//
//  Created by Stephen Dowless on 1/10/19.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

struct User {
    
    var email: String
    var password: String
    var username: String
    var accountType: AccountType
    
}

enum AccountType: Int, CustomStringConvertible {
    
    case Admin
    case Staff
    
    var description: String {
        switch self {
        case .Admin: return "Admin"
        case .Staff: return "Staff"
        }
    }
}
