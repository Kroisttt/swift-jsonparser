//
//  Parser.swift
//  JSONParser
//
//  Created by 이진영 on 24/05/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Parser {
    static func parse(tokens: [String]) throws -> JsonType {
        if tokens.first == String(JsonElement.startOfArray), tokens.last == String(JsonElement.endOfArray) {
            return try parse(array: tokens)
        } else {
            throw TypeError.unsupportedType
        }
    }
    
    private static func parse(array: [String]) throws -> JsonArray {
        var tokens = array
        tokens.removeFirst()
        tokens.removeLast()
        
        var data: [JsonType] = []
        var datum: String = ""
        var isString = false
        
        for token in tokens {
            if isString {
                datum = datum + token
                
                if token == String(JsonElement.string) {
                    isString = false
                    data.append(try convert(token: datum))
                    datum.removeAll()
                }
                
                continue
            }
            
            if token == String(JsonElement.string) {
                datum = datum + token
                isString = true
                
                continue
            }
            
            if !(token == String(JsonElement.comma) || token == String(JsonElement.whitespace)) {
                data.append(try convert(token: token))
            }
        }
        
        return try JsonArray(array: data)
    }
    
    private static func convert(token: String) throws -> JsonType {
        if let result = Int(token) {
            return result
        }
        
        if token == JsonElement.true || token == JsonElement.false {
            return token == JsonElement.true ? true : false
        }
        
        if token.first == JsonElement.string, token.last == JsonElement.string {
            return token
        }
        
        throw ParseError.invalidValue
    }
}
