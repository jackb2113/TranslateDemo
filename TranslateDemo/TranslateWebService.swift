//
//  TranlsateWebService.swift
//  TranslateDemo
//
//  Created by Jack Bailey on 10/3/15.
//  Copyright © 2015 Jack Bailey. All rights reserved.
//

import Foundation

class TranslateWebService {
    
    private let googleAPIKey = "enter-key-here"
    
    let jsonKeys = TranslateJSONKeys()
    let endpoints =  TranslateEndpoints()
    let notificationStrings = TranslateNotificationKeys()
    var lastTranslated : String?
    
    private var translateManager : AFHTTPRequestOperationManager!
    
    init() {
        translateManager = AFHTTPRequestOperationManager(baseURL: NSURL(string: endpoints.kBaseURL))
        translateManager.requestSerializer = AFJSONRequestSerializer()
        translateManager.responseSerializer = AFJSONResponseSerializer()
    }

    func translateToSpanish(originalText: String) {
        
        let params = getParamsForTranslateWithText(originalText, targetLanguage: jsonKeys.kKeySpanish, sourceLanguage: jsonKeys.kKeyEnglish)
        doTranslationWithParameters(params)
    }
    
    func translateToEnglish(originalText: String) {
        
        let params = getParamsForTranslateWithText(originalText, targetLanguage: jsonKeys.kKeyEnglish, sourceLanguage: jsonKeys.kKeySpanish)
        doTranslationWithParameters(params)
    }
    
    private func doTranslationWithParameters(translateParms : [String : AnyObject]) {
        
        translateManager.GET(endpoints.kEndpointLanugage, parameters: translateParms, success: {(request, responseObject) in
            
            DDLogSwift.logVerbose(responseObject.description);
            
            NSNotificationCenter.defaultCenter().postNotificationName(self.notificationStrings.kNotificationTranslateComplete,
                object: nil,
                userInfo: [self.notificationStrings.kNotificationTranslatedText : responseObject])
            },
            failure: {(request, errorObject) in
                
                DDLogSwift.logError(errorObject.localizedDescription)
                DDLogSwift.logDebug(errorObject.debugDescription)
        })
    }

    func getParamsForTranslateWithText(originalText: String, targetLanguage: String, sourceLanguage: String) -> [String:AnyObject] {
        
        return [jsonKeys.kKeySourceText : originalText,
                jsonKeys.kKeySource : sourceLanguage,
                jsonKeys.kKeyTarget : targetLanguage,
                jsonKeys.kKey : googleAPIKey];
    }
    
    
    struct TranslateJSONKeys {
        let kKey = "key"
        let kKeyLanguage = "language"
        let kKeySpanish = "es"
        let kKeyEnglish = "en"
        let kKeyTarget = "target"
        let kKeySource = "source"
        let kKeySourceText = "q"
    }
    
    struct TranslateEndpoints {
        let kBaseURL = "https://www.googleapis.com/"
        let kEndpointLanugage = "language/translate/v2/"
    }
}
