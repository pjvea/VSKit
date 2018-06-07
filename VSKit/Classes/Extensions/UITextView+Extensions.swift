//
//  UITextView+Extensions.swift
//  VSKit
//
//  Created by PJ Vea on 6/6/18.
//  Copyright © 2018 Vea Software. All rights reserved.
//

import Foundation

extension UITextView {
    @IBInspectable public var doneAccessory: Bool {
        get {
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                self.addDoneButtonOnKeyboard()
            }
        }
    }
    
    public func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc public func doneButtonAction() {
        self.resignFirstResponder()
    }
}
