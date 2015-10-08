//
//  EnglishViewController.swift
//  TranslateDemo
//
//  Created by Jack Bailey on 10/8/15.
//  Copyright © 2015 Jack Bailey. All rights reserved.
//

import Foundation

class EnglishViewController: BaseTranslateViewController {
    
    @IBAction func translateSelected(sender: AnyObject) {
        
        let service =  TranslateWebService()
        service.translateToEnglish(translateTextField.text)
    }
}