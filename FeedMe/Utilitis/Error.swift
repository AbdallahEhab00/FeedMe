//
//  Error.swift
//  FeedMe
//
//  Created by Abdallah Ehab on 08/06/2022.
//

import Foundation

enum FMError: String , Error{
    case invalidUserName   = "Created invalid request. Please try again."
    case unableToComplete  = "Unable to Complete your Request. please Check internet Connection"
    case invalidResponse   = "invalid Response from Server. please Check The Connetion and try again."
    case invalidData       = "The data Recived from server was invalid. please try again."
}
