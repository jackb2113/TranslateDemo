//
//  BaseTranslateViewController.swift
//  TranslateDemo
//
//  Created by Jack Bailey on 10/8/15.
//  Copyright © 2015 Jack Bailey. All rights reserved.
//

import Foundation


class BaseTranslateViewController : UIViewController, UITextViewDelegate {
    @IBOutlet weak var translateTextField: UITextView!
    @IBOutlet weak var targetTextField: UITextView!
    @IBOutlet weak var layoutPadding: NSLayoutConstraint!
    
    weak var rightBarButtonItem : UIBarButtonItem!
    
    private let notificationStrings = TranslateNotificationKeys()
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateText:", name: notificationStrings.kNotificationTranslateComplete, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: notificationStrings.kNotificationTranslateComplete, object: nil)
    }
    
    @IBAction func copyFromClipboard(sender: AnyObject) {
        
        if let clipboardText = UIPasteboard.generalPasteboard().string {
            translateTextField.text.appendContentsOf(clipboardText)
        }
        else {
            let alert = getAlertForEmptyClipboard()
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func getAlertForEmptyClipboard() -> UIAlertController {
        let alertController = UIAlertController(title: "Clipboard", message: "Currently, there is nothing copied on the devices clipboard.", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: .Default, handler: nil))
        
        return alertController
    }
    
    func updateText(notification: NSNotification) {
        
        if  let jsonObject = notification.userInfo?[notificationStrings.kNotificationTranslatedText] as? [String : AnyObject],
            let text = TranslateParseUtility().getFirstTranslateString(jsonObject) {
                
                DDLogSwift.logVerbose(text)
                self.targetTextField.text = text
        }
    }
    
    //MARK: Text View Delegate
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        
        return true
    }
}