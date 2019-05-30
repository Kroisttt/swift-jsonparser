//
//  TokenElement.swift
//  JSONParser
//
//  Created by 이진영 on 30/05/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct TokenElement {
    static let string: Character = "\""
    static let comma: Character = ","
    static let whitespace: Character = " "
    static let startOfArray: Character = "["
    static let endOfArray: Character = "]"
    
    static let arrayToken = [string, comma, whitespace, startOfArray, endOfArray]
}
