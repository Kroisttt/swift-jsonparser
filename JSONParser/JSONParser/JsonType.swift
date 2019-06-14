//
//  JsonType.swift
//  JSONParser
//
//  Created by 이진영 on 20/05/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum TypeName: String {
    case array = "배열"
    case number = "숫자"
    case string = "문자열"
    case bool = "부울"
    case object = "객체"
}

protocol JsonType {
    var typeDescription: String { get }
}

extension Int: JsonType {
    var typeDescription: String {
        return TypeName.number.rawValue
    }
}

extension String: JsonType {
    var typeDescription: String {
        return TypeName.string.rawValue
    }
}

extension Bool: JsonType {
    var typeDescription: String {
        return TypeName.bool.rawValue
    }
}

extension Array: JsonType where Element: JsonType {
    var typeDescription: String {
        return TypeName.array.rawValue
    }
}

extension Dictionary: JsonType where Key == String, Value == JsonType {
    var typeDescription: String {
        return TypeName.object.rawValue
    }
}
