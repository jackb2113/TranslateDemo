//
//  TranslateParseUtility.swift
//  TranslateDemo
//
//  Created by Jack Bailey on 10/6/15.
//  Copyright © 2015 Jack Bailey. All rights reserved.
//

import Foundation

class TranslateParseUtility {
    
    let parserKeys = TranslateParserKeys()
    
    func getFirstTranslateString(json: [String : AnyObject]) -> String? {
        
        var firstParsedString : String? = nil
        
        if let translations = json[parserKeys.kKeyData]?[parserKeys.kKeyTranslations] as? [[String : String]] {
            
            firstParsedString = getAllTranslatedItems(translations).first
        }
        
        return firstParsedString
    }
    
    func getAllTranslateStrings(json: [String : AnyObject]) -> [String] {
        
        var translatedItems : [String] = []
        
        if let translations = json[parserKeys.kKeyData]?[parserKeys.kKeyTranslations] as? [[String : String]] {
            
            translatedItems = getAllTranslatedItems(translations)
        }
        
        return translatedItems
    }
    
    private func getAllTranslatedItems(json : [[String : String]]) -> [String] {
        var translatedItems : [String] = []
        
        for translatedTuple in json {
            
            if let text = translatedTuple[parserKeys.kKeyTranslatedText] {
                translatedItems.append(text)
            }
        }
        
        return translatedItems
    }
    
    struct TranslateParserKeys {
        let kKeyData = "data"
        let kKeyTranslations = "translations"
        let kKeyTranslatedText = "translatedText"
    }
}