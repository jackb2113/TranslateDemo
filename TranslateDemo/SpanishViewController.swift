//
//  SpanishViewController.swift
//  TranslateDemo
//
//  Created by Jack Bailey on 10/3/15.
//  Copyright © 2015 Jack Bailey. All rights reserved.
//

import UIKit

class SpanishViewController : BaseTranslateViewController {
    
    @IBAction func translateSelected(sender: AnyObject) {
        
        let service =  TranslateWebService()
        service.translateToSpanish(translateTextField.text)
    }
}