//
//  Alert.swift
//  Tartib sohibi
//
//  Created by MacBook Pro on 16/05/23.
//

import UIKit

class Alert:UIView {
    class func showAlert(title:String,message:String,vc:UIViewController){
        let alertvc = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Ok", style: .cancel)
       alertvc.addAction(cancel)
        vc.present(alertvc, animated: true)
    }
}
