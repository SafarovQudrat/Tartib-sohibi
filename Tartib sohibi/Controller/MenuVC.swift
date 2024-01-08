//
//  MenuVC.swift
//  Tartib sohibi
//
//  Created by MacBook Pro on 07/05/23.
//

import UIKit
import PKHUD
import RealmSwift

struct SettingsDM {
    var image: UIImage!
    var title: String
}

class MenuVC: UIViewController {
    private lazy var backImage:UIImageView = {
        let i = UIImageView(image: UIImage(named: "background"))
//        i.contentMode = .scaleAspectFill
        return i
    }()
    
    private lazy var tartibV: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        v.addSubview(img)
        img.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
        v.addSubview(tartibImg)
        tartibImg.snp.makeConstraints { make in
            make.top.equalTo(24)
            make.left.equalTo(50)
            make.width.height.equalTo(100)
        }
        return v
    }()

    private lazy var img: UIImageView = {
        let i = UIImageView(image: UIImage(named: "tartibBack"))
        i.contentMode = .scaleAspectFill
        return i
    }()
    
    private lazy var tartibImg: UIImageView = {
        let i = UIImageView(image: UIImage(named: "tartib"))
//        i.contentMode = .scaleAspectFill
        return i
    }()
    
    
    private lazy var tableView: UITableView = {
        let t = UITableView()
        t.backgroundColor = .white
        return t
    }()
    
    var arr: [SettingsDM] = [
//    SettingsDM(image: UIImage(named: "namoz"),title: "Malum vaqtdagi qazo namozlar"),
    SettingsDM(image: UIImage(named: "namoz"), title: "Qazo namoz"),
    SettingsDM(image: UIImage(named: "download"), title: "Ma'lumotlarni yuklash"),
    SettingsDM(image: UIImage(named: "profile"), title: "Mening ma'lumotlarim"),
    SettingsDM(image: UIImage(systemName: "globe"), title: "Til"),
    SettingsDM(image: UIImage(named: "share"), title: "Ulashish"),
    SettingsDM(image: UIImage(named: "about"), title: "Dastur haqida"),
    SettingsDM(image: UIImage(named: "logout-2"), title: "Chiqish")
    ]
    
    var namaz: [NamazDM] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        
    }
    func setUpUI(){
        view.backgroundColor = .clear
        view.addSubview(backImage)
        backImage.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
        view.addSubview(tartibV)
        tartibV.snp.makeConstraints { make in
            make.top.equalTo(30)
            make.left.right.equalToSuperview()
            make.height.equalTo(150)
        }
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(tartibV.snp_bottomMargin)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(0)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MenuTVC", bundle: nil), forCellReuseIdentifier: "MenuTVC")
    }

    

}
extension MenuVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTVC", for: indexPath) as? MenuTVC else {return UITableViewCell()}
        if indexPath.row == 3 {
            cell.img.contentMode = .center
        }
        
        cell.updateCell(data: arr[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            let vc = Profile()
            self.present(vc, animated: true)
        }else if indexPath.row == 6 {
            let vc = LoginVC()
            cache.set(false, forKey: "isHome")
            let realm = try! Realm()
            let allObjects = realm.objects(NamazDM.self)
            try! realm.write {
                realm.delete(allObjects)
            }
            let myObj = realm.objects(NamazDM.self)
            print("Qolgan data = ",myObj)
            ChangeRootViewController.change(with: vc)
        }else if indexPath.row == 1 {
            HUD.flash(.progress,delay: 1.0) { [self] finished in
                uploadData()
            }
        }
    }
}

extension MenuVC {
    func uploadData() {
        
        API.uploadNamaz(data: namaz) { [self] data in
            HUD.flash(.success)
            print("namaz",namaz)
            print("data",data)
        }
    }
}
