//
//  HomeVC.swift
//  Tartib sohibi
//
//  Created by MacBook Pro on 05/05/23.
//

import UIKit
import SnapKit
import SideMenu
import RealmSwift

struct DataDM {
    var title: String
    var isSelect: Bool
}



class HomeVC: UIViewController {
    
    private lazy var backV: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        v.addSubview(backImage)
        backImage.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
        return v
    }()

    private lazy var backImage:UIImageView = {
        let i = UIImageView(image: UIImage(named: "background"))
//        i.contentMode = .scaleAspectFill
        return i
    }()
    
    private lazy var figureV: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        
        return v
    }()
    private lazy var figureImg: UIImageView = {
        let i = UIImageView(image: UIImage(named: "backImg"))
//        i.contentMode = .scaleAspectFill
        return i
    }()
    private lazy var yearLbl: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 16,weight: .semibold)
        l.textColor = .white
        l.text = "2020-yil"
        return l
    }()
    private lazy var dayLbl: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 16,weight: .semibold)
        l.textColor = .white
        l.text = "30 - Aprel"
        return l
    }()
    private lazy var weekLbl: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 16,weight: .semibold)
        l.textColor = .white
        l.text = "Seshanba"
        return l
    }()
    private lazy var lblStack: UIStackView = {
        let s = UIStackView(arrangedSubviews: [yearLbl,dayLbl,weekLbl])
        s.spacing = 0
        s.axis = .vertical
        s.alignment = .center
        s.distribution = .fill
        return s
    }()
    private lazy var tableView: UITableView = {
        let t = UITableView()
        t.backgroundColor = .clear
        return t
    }()
    
    private lazy var dateV: UIView = {
       let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.1311129332, green: 0.5999528766, blue: 0, alpha: 1)
        v.layer.cornerRadius = 24
        v.addSubview(lblStack)
        lblStack.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.bottom.equalTo(-16)
            make.left.equalTo(16)
            make.right.equalTo(-16)
        }
        return v
    }()

    private lazy var leftBtnV: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.1311129332, green: 0.5999528766, blue: 0, alpha: 1)
        v.layer.cornerRadius = 35
        v.addSubview(leftBtnI)
        leftBtnI.snp.makeConstraints { make in
            make.top.equalTo(17.5)
            make.bottom.equalTo(-17.5)
            make.left.equalTo(17.5)
            make.right.equalTo(-17.5)
            make.height.width.equalTo(35)
        }
        v.addSubview(leftBtn)
        leftBtn.snp.makeConstraints { make in
            make.bottom.right.left.top.equalTo(0)
        }
        
        return v
    }()
    private lazy var leftBtnI:UIImageView = {
        let i = UIImageView(image: UIImage(named: "leftBtn"))
        i.contentMode = .scaleAspectFill
        return i
    }()
    private lazy var leftBtn: UIButton = {
        let b = UIButton()
        b.backgroundColor = .clear
        b.addTarget(.none, action: #selector(leftBtnTapped), for: .touchUpInside)
        return b
    }()
    
    private lazy var rightBtnV: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.1311129332, green: 0.5999528766, blue: 0, alpha: 1)
        v.layer.cornerRadius = 35
        v.addSubview(rightBtnI)
        rightBtnI.snp.makeConstraints { make in
            make.top.equalTo(17.5)
            make.bottom.equalTo(-17.5)
            make.left.equalTo(20)
            make.right.equalTo(-15)
            
            make.height.width.equalTo(35)
        }
        v.addSubview(rightBtn)
        rightBtn.snp.makeConstraints { make in
            make.bottom.right.left.top.equalTo(0)
        }
        
        return v
    }()
    private lazy var rightBtnI:UIImageView = {
        let i = UIImageView(image: UIImage(named: "rightBtn"))
        i.contentMode = .scaleAspectFill
        return i
    }()
    private lazy var rightBtn: UIButton = {
        let b = UIButton()
        b.backgroundColor = .clear
        b.addTarget(.none, action: #selector(rightBtnTapped), for: .touchUpInside)
        return b
    }()
    
    private lazy var calendarBtn: UIButton = {
        let b = UIButton()
        b.backgroundColor = #colorLiteral(red: 0.1311129332, green: 0.5999528766, blue: 0, alpha: 1)
        b.setImage(UIImage(systemName: "calendar"), for: .normal)
        b.tintColor = .white
        b.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 24), forImageIn: .normal)
        b.layer.cornerRadius = 12
        b.addTarget(.none, action: #selector(calendar1Tapped), for: .touchUpInside)
        return b
    }()
    
    private lazy var calendar2Btn: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "calendar2"), for: .normal)
        b.addTarget(.none, action: #selector(calendar2Tapped), for: .touchUpInside)
        return b
    }()
    private lazy var taribLbl: UILabel = {
        let l = UILabel()
        l.text = "Tartib sohibi"
        l.textColor = .white
        l.font = UIFont.systemFont(ofSize: 20,weight: .semibold)
        return l
    }()
    private lazy var menuBtn: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "menu"), for: .normal)
        b.addTarget(.none, action: #selector(menuTapped), for: .touchUpInside)
        return b
    }()
    
    
    let stringDate = "2010.2.24"
    
    let dateF = DateFormatter()
    
    let YearF = DateFormatter()
    let dayF = DateFormatter()
    let weekF = DateFormatter()
    
    let localeIdentifier = "uz_UZ"
    
    
    var arr: [DataDM] = [
    DataDM(title: "Bomdod", isSelect: false),
    DataDM(title: "Peshin", isSelect: false),
    DataDM(title: "Asr", isSelect: false),
    DataDM(title: "Shom", isSelect: false),
    DataDM(title: "Xufton", isSelect: false),
    DataDM(title: "Vitr", isSelect: false)
    ]
    var isLogin:Bool = true
    var namaz:[NamazDM] =  []
    var count = 0
    var id:Int = 0
    private var realm:Realm!
    let calendar = Calendar(identifier: .gregorian)
    var components = DateComponents()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateF.dateFormat = "yyyy.MM.dd"
        YearF.dateFormat = "yyyy"
        dayF.dateFormat = "d-MMMM"
        weekF.dateFormat = "EEEE"
        
        YearF.locale = Locale(identifier: localeIdentifier)
        dayF.locale = Locale(identifier: localeIdentifier)
        weekF.locale = Locale(identifier: localeIdentifier)

        
        if !namaz.isEmpty {
            yearLbl.text = YearF.string(from: dateF.date(from: namaz[count].day)!)
            dayLbl.text = dayF.string(from: dateF.date(from: namaz[count].day)!)
            weekLbl.text = weekF.string(from: dateF.date(from: namaz[count].day)!)
        }
        
        setUpUi()
        if isLogin {
            Loader.start()
            getMySelf()
            
        }
        Loader.start()
       getNamaz()
        getMyInfo()
        tableView.isScrollEnabled = false
        
        try? realm = Realm()
        namaz = realm.objects(NamazDM.self).compactMap{$0}
        print("file url = ",realm.configuration.fileURL ?? "")
        print(realm.objects(NamazDM.self).compactMap{$0})
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        uploadNamaz()
    }
    
    func setUpUi() {
        
        
        
        self.view.addSubview(backV)
        backV.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
        backV.addSubview(menuBtn)
        
        menuBtn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(8)
            make.right.equalTo(-16)
            make.width.equalTo(50)
            make.height.equalTo(40)
        }
        backV.addSubview(calendar2Btn)
        calendar2Btn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(8)
            make.left.equalTo(16)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        backV.addSubview(taribLbl)
        taribLbl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.centerX.equalTo(backV.snp_centerXWithinMargins)
        }
        
        backV.addSubview(figureV)
        
        figureV.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(30)
            make.left.right.equalToSuperview().inset(48)
        }
        
        figureV.addSubview(figureImg)
        figureImg.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
        
        
        figureV.addSubview(dateV)
        dateV.snp.makeConstraints { make in
            make.top.equalTo(24)
            make.left.right.equalToSuperview().inset(50)
            make.height.equalTo(100)
        }
        figureV.addSubview(tableView)
        
        figureV.addSubview(leftBtnV)
        leftBtnV.snp.makeConstraints { make in
            make.left.equalTo(-30)
            make.top.equalTo(tableView.snp_bottomMargin).offset(30)
            make.width.height.equalTo(70)
        }
        figureV.addSubview(rightBtnV)
        rightBtnV.snp.makeConstraints { make in
            make.right.equalTo(30)
            make.top.equalTo(tableView.snp_bottomMargin).offset(30)
            make.width.height.equalTo(70)
        }
        
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(dateV.snp_bottomMargin).offset(30)
            make.left.right.equalTo(0)
            make.height.equalTo(300)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeTVC", bundle: nil), forCellReuseIdentifier: "HomeTVC")
        tableView.separatorStyle = .none
        
        
        figureV.addSubview(calendarBtn)
        calendarBtn.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp_bottomMargin).offset(24)
            make.width.equalTo(60)
            make.height.equalTo(40)
            make.centerX.equalTo(figureV.snp_centerXWithinMargins)
        }
        
    }

    
    @objc func menuTapped(){
        let vc = MenuVC()
        let menu = SideMenuNavigationController(rootViewController: vc)
        menu.leftSide = false
        vc.namaz = namaz
        menu.menuWidth = 0.8 * (UIScreen.main.bounds.width)
        self.present(menu, animated: true)
        
    }
    @objc func calendar1Tapped(){
       let vc = CalendarVC()
        if !namaz.isEmpty {
            vc.minDate = namaz.first?.day ?? ""
            vc.maxDate = namaz.last?.day ?? ""
        }
        self.present(vc, animated: true)
        vc.editData = { [self] data in
            print("data = ",data)
            for i in 0..<namaz.count {
                if namaz[i].day == data {
                    print("namaz = ",namaz[i])
                    print("data = ",data)
                    count = i
                    yearLbl.text = YearF.string(from: dateF.date(from: namaz[i].day)!)
                    dayLbl.text = dayF.string(from: dateF.date(from: namaz[i].day)!)
                    weekLbl.text = weekF.string(from: dateF.date(from: namaz[i].day)!)
                    tableView.reloadData()
                }
            }
        }
        
    }
    @objc func calendar2Tapped(){
        let vc = DateVC()
        vc.namaz = self.namaz
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
         
    }

    @objc func rightBtnTapped(){
        
        if count == namaz.count - 1 {
            if dateF.date(from: namaz[count].day) ?? Date() < dateF.date(from: "STARTDATE" ) ?? Date(){
                components.day  = 1
                let date = calendar.date(byAdding: components, to: dateF.date(from: namaz[count].day) ?? Date()) ?? Date()
                
                addDay(day: dateF.string(from: date), day_id: namaz.count)
            }else {
                rightBtn.isEnabled = false
            }
        }else {
            rightBtn.isEnabled = true
            count += 1
            if !namaz.isEmpty {
                yearLbl.text = YearF.string(from: dateF.date(from: namaz[count].day)!)
                dayLbl.text = dayF.string(from: dateF.date(from: namaz[count].day)!)
                weekLbl.text = weekF.string(from: dateF.date(from: namaz[count].day)!)
            }
        }
        if count == 0 {
            leftBtn.isEnabled = false
            
        }else {
            leftBtn.isEnabled = true
            
        }
        
        tableView.reloadData()
    }
    @objc func leftBtnTapped() {
        if count == namaz.count - 1 {
            rightBtn.isEnabled = false
        }else {
            rightBtn.isEnabled = true
            
        }
        
        if count == 0 {
            leftBtn.isEnabled = false
            
        }else {
            leftBtn.isEnabled = true
            count -= 1
            if !namaz.isEmpty {
                yearLbl.text = YearF.string(from: dateF.date(from: namaz[count].day)!)
                dayLbl.text = dayF.string(from: dateF.date(from: namaz[count].day)!)
                weekLbl.text = weekF.string(from: dateF.date(from: namaz[count].day)!)
            }
        }
        
        tableView.reloadData()
    }
    
    
    func addDay(day:String,day_id:Int) {
        
        namaz.append(NamazDM(day: day, bomdod: false, peshin: false, asr: false, shom: false, xufton: false, vitr: false, day_id: "\(day_id)"))
        
    }
    
    
    
    
    
}
extension HomeVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !namaz.isEmpty {
            return 6
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTVC", for: indexPath) as? HomeTVC else {return UITableViewCell()}
        cell.delegate = self
        cell.selectionStyle = .none
        cell.updateCell(data: namaz[count])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}

extension HomeVC: HomeTVCDelegate {
    func editData(data: String) {
        if data == "bomdod" {
           
            try! realm.write {

                namaz[count].bomdod = !namaz[count].bomdod
                realm.add(namaz[count], update: .modified)
            }

        } else if data == "peshin" {

            try! realm.write {

                namaz[count].peshin = !namaz[count].peshin
                realm.add(namaz[count], update: .modified)
            }
        }else if data == "asr" {
           
            try! realm.write {

                namaz[count].asr = !namaz[count].asr
                realm.add(namaz[count], update: .modified)
            }

        }else if data == "shom" {
           
            try! realm.write {

                namaz[count].shom = !namaz[count].shom
                realm.add(namaz[count], update: .modified)
            }

        }else if data == "xufton" {
           
            try! realm.write {

                namaz[count].xufton = !namaz[count].xufton
                realm.add(namaz[count], update: .modified)
            }

        }else {
            
            try! realm.write {

                namaz[count].vitr = !namaz[count].vitr
                realm.add(namaz[count], update: .modified)
            }

        }
        
       
        
        tableView.reloadData()
    }
    
    
}


extension HomeVC {
    func getMySelf() {
        API.getMySelf { data in
            Loader.stop()
            if data["id"].int != nil {
                cache.set(data["id"].intValue, forKey: "ID")
                cache.set(data["username"].stringValue, forKey: "USERNAME")
                cache.set(data["email"].stringValue, forKey: "EMAIL")
            }
        }
    }
    func getNamaz() {
        
        API.getNamaz { [self] data in
            Loader.stop()
            print("TOKEN = ",cache.string(forKey: "TOKEN")!)
            print("ID=",cache.integer(forKey: "ID"))
            if data.isEmpty {
                addDay(day: cache.string(forKey: "FARZDATE") ?? "", day_id: namaz.count)
                count = 0
            }else {
                self.namaz = data
            }
            try! realm.write{
                realm.add(namaz,update: .modified)
            }
            self.tableView.reloadData()
        }
    }
    
    func getMyInfo() {
        API.getMyInfo { data in
            Loader.stop()
            print("MY_INFO = ",data)
            cache.set(data["birthday"].stringValue, forKey: "DATE")
            cache.set(data["whenStartNamoz"].stringValue, forKey: "STARTDATE")
            cache.set(data["whenFarzNamoz"].stringValue, forKey: "FARZDATE")
        }
    }
    
    func uploadNamaz() {
        API.uploadNamaz(data: namaz) { data in
            print("fsdsdcsd",data)
        }
    }
    
    
}
