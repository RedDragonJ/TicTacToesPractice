//
//  AlertViewHelper.swift
//  AutoGuardian
//
//  Created by James on 7/5/17.
//  Copyright © 2017 James. All rights reserved.
//

import UIKit

class AlertViewManager {
    static let shared = AlertViewManager()
    private init(){}
    
    func presentAlertWithClosure(title: String?, msg: String?, vc: UIViewController, closure: (()->())?) {
        let alertView = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(action) in
            closure!()
        })
        alertView.addAction(okAction)
        vc.present(alertView, animated: true, completion: nil)
    }
}
