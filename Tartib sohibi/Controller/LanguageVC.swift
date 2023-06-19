//
//  LanguageVC.swift
//  Tartib sohibi
//
//  Created by MacBook Pro on 09/05/23.
//

import UIKit

struct SelectLang {
    var title: String
    var isSelect: Bool
}

class LanguageVC: UIViewController {
    
    private lazy var backImage:UIImageView = {
        let i = UIImageView(image: UIImage(named: "background"))
//        i.contentMode = .scaleAspectFill
        return i
    }()
    
    private lazy var tableView: UITableView = {
        let t = UITableView()
        t.backgroundColor = .white
        return t
    }()
    
    
    
    var arr: [SelectLang] = [
    SelectLang(title: "O'zbekcha", isSelect: true),
    SelectLang(title: "Ўзбекча", isSelect: false),
    SelectLang(title: "Қарақалпақша", isSelect: false),
    SelectLang(title: "Русский", isSelect: false),
    SelectLang(title: "English", isSelect: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }
    func setUpUI() {
        
        view.addSubview(backImage)
        backImage.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(8)
            make.left.right.bottom.equalTo(0)
        }
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "LanguageTVC", bundle: nil), forCellReuseIdentifier: "LanguageTVC")
        
    }

   

}
extension LanguageVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for i in 0..<arr.count {
            if i == indexPath.row {
                arr[i].isSelect = true
            }else {
                arr[i].isSelect = false
            }
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageTVC", for: indexPath) as? LanguageTVC else {return UITableViewCell()}
        cell.updateCell(lang: arr[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
}
