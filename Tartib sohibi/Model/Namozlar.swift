//
//  Namozlar.swift
//  Tartib sohibi
//
//  Created by MacBook Pro on 17/05/23.
//

import UIKit
import SwiftyJSON
import RealmSwift

class NamazDM: Object,Codable {
   @objc dynamic var day:String
   @objc dynamic var bomdod:Bool
   @objc dynamic var peshin:Bool
   @objc dynamic var asr:Bool
   @objc dynamic var shom:Bool
   @objc dynamic var xufton:Bool
   @objc dynamic var vitr:Bool
   @objc dynamic var day_id:String
    override class func primaryKey() -> String? {
        "day"
    }
    
    override init() {
        self.day = ""
        self.day_id = ""
        self.bomdod = false
        self.peshin = false
        self.asr = false
        self.shom = false
        self.xufton = false
        self.vitr = false
    }
    
    init(day:String,bomdod:Bool,peshin:Bool,asr:Bool,shom:Bool,xufton:Bool,vitr:Bool,day_id:String) {
        self.day = day
        self.bomdod = bomdod
        self.peshin = peshin
        self.asr = asr
        self.shom = shom
        self.xufton = xufton
        self.vitr = vitr
        self.day_id = day_id
    }
    
    
    init(json:JSON){
        day = json["day"].stringValue
        bomdod = json["bomdod"].boolValue
        peshin = json["peshin"].boolValue
        asr = json["asr"].boolValue
        shom = json["shom"].boolValue
        xufton = json["xufton"].boolValue
        vitr = json["vitr"].boolValue
        day_id = json["day_id"].stringValue
    }
}
