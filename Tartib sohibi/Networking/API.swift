//
//  API.swift
//  Tartib sohibi
//
//  Created by MacBook Pro on 12/05/23.
//

import Foundation
import SwiftyJSON
import Alamofire


class API {
    
   static let baseURL: String = "https://tartib-sohibi.uz/api/v1/"
    
    
    
   static let loginUrl: String = "auth/users/"
   static let login2Url: String = "profile/"
   static let register: String = "auth/token/login"
   static let getMySelfUrl: String = "auth/users/me/"
    static let resetPassUrl: String = "auth/users/reset_password/"
    static let namazUrl:String = "profile/namaz/"
    
    
    static func register1(email: String,password: String,username:String,complation:@escaping(JSON)->Void){
        
        let param:[String:Any] = [
            "email":email,
            "password":password,
            "username":username
        
        ]
        
        Net.sendRequest(to: baseURL + loginUrl, method: .post, headers: nil, param: param) { data in
            guard let data = data else{return}
            
            complation(data)
        }
        
    }
    
    static func register2(param:[String:Any],complation:@escaping(JSON)->Void) {
        

        
        Net.sendRequest(to: baseURL + login2Url, method: .post, headers: nil, param: param) { data in
            guard let data = data else {return}
            complation(data)
        }
        
    }
    
    static func resetPassword(email:String,complation:@escaping(JSON)->Void){
        let param: [String:Any] = [
            "email":email
        ]
        
        Net.sendRequest(to: baseURL + resetPassUrl, method: .post, headers: nil, param: param) { data in
            guard let data = data else {return}
            complation(data)
        }
    }
    
    static func login(username: String, password: String, complation:@escaping (JSON)->Void) {
        let param: [String: Any] = [
            "password":password,
            "username":username
        ]
        
        Net.sendRequest(to: baseURL + register, method: .post, headers: nil, param: param) { data in
            guard let data = data else {return}
            complation(data)
        }
    }
    
    static func getMySelf(complation:@escaping(JSON)->Void) {
        let headers:HTTPHeaders = [
            "Authorization":"Token \(cache.string(forKey: "TOKEN")!)"
        ]
        
        Net.sendRequest(to: baseURL + getMySelfUrl, method: .get, headers: headers, param: nil) { data in
            guard let data = data else {return}
            
            complation(data)
        }
    }
    
    static func getMyInfo(complation:@escaping(JSON)->Void) {
        Net.sendRequest(to: baseURL + login2Url + "\(cache.integer(forKey: "ID"))", method: .get, headers: nil, param: nil) { data in
            guard let data = data else {return}
            complation(data)
        }
        
    }
    
    
    static func getNamaz(complation:@escaping([NamazDM])->Void) {
        Net.sendRequest(to: baseURL + namazUrl + "\(cache.integer(forKey: "ID"))", method: .get, headers: nil, param: nil) { data in
            guard let data = data else {return}
            print("GetNamaz = ",data)
            let info = data.arrayValue.map{NamazDM(json: $0)}
            complation(info)
        }
    }
    
    
    static func uploadNamaz(data:[NamazDM],complation:@escaping (JSON)->Void) {
        
        
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
       var myJson = ""
        if let jsonData = try? jsonEncoder.encode(data),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            myJson = jsonString
        } else {
            print("Error converting to JSON")
        }
        let param: [String:Any] = [
            "user_id": cache.integer(forKey: "ID"),
            "data":myJson
            
        ]
        
        Net.sendRequest(to: baseURL + namazUrl, method: .post, headers: nil, param: param) { data in
            guard let data = data else {return}
            complation(data)
        }
        
    }
}
