//
//  RegisterVC.swift
//  Tartib sohibi
//
//  Created by MacBook Pro on 04/05/23.
//

import UIKit
import SnapKit
let cache = UserDefaults.standard

class RegisterVC: UIViewController {
    private lazy var backImg: UIImageView = {
        let i = UIImageView(image: UIImage(named: "background"))
        i.contentMode = .scaleAspectFill
        return i
    }()
 
    private lazy var backV:UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 12
        return v
    }()
    private lazy var titleLbl: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 24,weight: .semibold)
        l.text = "Ro'yxatdan o'tish"
        return l
    }()
    
    private lazy var fullName:UITextField = {
        let tf = UITextField()
        tf.placeholder = "Ism Familiya"
        tf.layer.cornerRadius = 8
        tf.textColor = .label
        tf.backgroundColor = .systemGray6
        tf.borderStyle = .none
        tf.leftViewMode = .always
        let lview: UIView = {
            let lv = UIView()
            return lv
        }()
        lview.snp.makeConstraints { make in
            make.width.equalTo(15)
        }
        tf.leftView = lview
        return tf
    }()
    
    //password textField
    private lazy var passwordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Parol"
        tf.layer.cornerRadius = 8
        tf.textColor = .label
        tf.backgroundColor = .systemGray6
        tf.leftViewMode = .always
        tf.rightViewMode = .always
        let lview: UIView = {
            let lv = UIView()
            return lv
        }()
        lview.snp.makeConstraints { make in
            make.width.equalTo(15)
        }
        tf.leftView = lview
        tf.borderStyle = .none
        tf.isSecureTextEntry = true
        
        openPasswordBtn.snp.makeConstraints { make in
            make.height.width.equalTo(48)
        }
        tf.rightView = openPasswordBtn
        return tf
    }()
    //passwords show/hide (eye) Button
    lazy var openPasswordBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "eye"), for: .normal)
        btn.tintColor = .systemGray
        btn.addTarget(self, action: #selector(eyeTapped), for: .touchUpInside)
        return btn
    }()
    
    //password textField
    private lazy var confirmPasswordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Parolni tasdiqlang"
        tf.layer.cornerRadius = 8
        tf.textColor = .label
        tf.backgroundColor = .systemGray6
        tf.leftViewMode = .always
        tf.rightViewMode = .always
        let lview: UIView = {
            let lv = UIView()
            return lv
        }()
        lview.snp.makeConstraints { make in
            make.width.equalTo(15)
        }
        tf.leftView = lview
        tf.borderStyle = .none
        tf.isSecureTextEntry = true
        
        openConfirmPasswordBtn.snp.makeConstraints { make in
            make.height.width.equalTo(48)
        }
        tf.rightView = openConfirmPasswordBtn
        return tf
    }()
    //passwords show/hide (eye) Button
    lazy var openConfirmPasswordBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "eye"), for: .normal)
        btn.tintColor = .systemGray
        btn.addTarget(self, action: #selector(eye1Tapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var emailTF:UITextField = {
        let tf = UITextField()
        tf.placeholder = "Elektron pochta"
        tf.layer.cornerRadius = 8
        tf.textColor = .label
        tf.backgroundColor = .systemGray6
        tf.borderStyle = .none
        tf.leftViewMode = .always
        let lview: UIView = {
            let lv = UIView()
            return lv
        }()
        lview.snp.makeConstraints { make in
            make.width.equalTo(15)
        }
        tf.leftView = lview
        return tf
    }()
    
    //    genderTf
    lazy var genderTf:UITextField = {
        let t = UITextField()
        t.font = UIFont.systemFont(ofSize: 16)
        t.textColor = .black
        t.placeholder = "Jinsi"

        return t
    }()
    
    lazy var selectGender:UIButton = {
        let b = UIButton()
        b.backgroundColor = .clear
        b.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        b.tintColor = .systemGray2
        b.addTarget(.none, action: #selector(selectGenderTapped), for: .touchUpInside)
        return b
    }()
    private lazy var genderStack:UIStackView = {
        let s = UIStackView(arrangedSubviews: [genderTf,selectGender])
        genderTf.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.right.equalTo(-30)
        }
        s.axis = .horizontal
        s.distribution = .equalSpacing
        s.spacing = 0
        s.alignment = .fill
        return s
    }()
    private lazy var genderV:UIView = {
        let v = UIView()
        v.addSubview(genderStack)
        v.backgroundColor = .systemGray6
        v.layer.cornerRadius = 8
        genderStack.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-8)
            make.top.equalTo(12)
            make.bottom.equalTo(-12)
        }
        return v
    }()
    
    //    date of birth
    lazy var dateTf:UITextField = {
        let t = UITextField()
        t.font = UIFont.systemFont(ofSize: 16)
        t.textColor = .black
        t.placeholder = "Tug'ilgan yili"
      
        return t
    }()
    lazy var selectDate:UIButton = {
        let b = UIButton()
        b.backgroundColor = .clear
        b.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        b.tintColor = .systemGray2
        b.addTarget(.none, action: #selector(selectDateTapped), for: .touchUpInside)
        return b
    }()
    private lazy var dateStack:UIStackView = {
        let s = UIStackView(arrangedSubviews: [dateTf,selectDate])
        s.axis = .horizontal
        s.distribution = .fill
        s.spacing = 0
        s.alignment = .fill
        return s
    }()
    private lazy var dateV:UIView = {
        let v = UIView()
        v.addSubview(dateStack)
        v.backgroundColor = .systemGray6
        v.layer.cornerRadius = 8
        dateStack.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-8)
            make.top.equalTo(12)
            make.bottom.equalTo(-12)
        }
        return v
    }()
    
    //    date of birth
    lazy var startDateTf:UITextField = {
        let t = UITextField()
        t.font = UIFont.systemFont(ofSize: 16)
        t.textColor = .black
        t.placeholder = "Namozni boshlagan yilingiz"
        
        return t
    }()
    lazy var selectStartDate:UIButton = {
        let b = UIButton()
        b.backgroundColor = .clear
        b.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        b.tintColor = .systemGray2
        b.addTarget(.none, action: #selector(selectStartD), for: .touchUpInside)
        return b
    }()
    private lazy var startDateStack:UIStackView = {
        let s = UIStackView(arrangedSubviews: [startDateTf,selectStartDate])
        s.axis = .horizontal
        s.distribution = .fill
        s.spacing = 0
        s.alignment = .fill
        return s
    }()
    private lazy var startDateV:UIView = {
        let v = UIView()
        v.addSubview(startDateStack)
        v.backgroundColor = .systemGray6
        v.layer.cornerRadius = 8
        startDateStack.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-8)
            make.top.equalTo(12)
            make.bottom.equalTo(-12)
        }
        return v
    }()
    
    //    date of birth
    lazy var lastDateTf:UITextField = {
        let t = UITextField()
        t.font = UIFont.systemFont(ofSize: 16)
        t.textColor = .black
        t.placeholder = "Namoz farz bo'lgan yil"
      
        return t
    }()
    lazy var selectLastDate:UIButton = {
        let b = UIButton()
        b.backgroundColor = .clear
        b.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        b.tintColor = .systemGray2
        b.addTarget(.none, action: #selector(selectLastD), for: .touchUpInside)
        return b
    }()
    private lazy var lastDateStack:UIStackView = {
        let s = UIStackView(arrangedSubviews: [lastDateTf,selectLastDate])
        s.axis = .horizontal
        s.distribution = .fill
        s.spacing = 0
        s.alignment = .fill
        return s
    }()
    private lazy var lastDateV:UIView = {
        let v = UIView()
        v.addSubview(lastDateStack)
        v.backgroundColor = .systemGray6
        v.layer.cornerRadius = 8
        lastDateStack.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-8)
            make.top.equalTo(12)
            make.bottom.equalTo(-12)
        }
        return v
    }()
    
    
    private lazy var signUpBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.1311129332, green: 0.5999528766, blue: 0, alpha: 1)
        btn.layer.cornerRadius = 8
        btn.setTitle("Ro'yxatdan o'tish", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        btn.addTarget(.none, action: #selector(loginTapped), for: .touchUpInside)
        return btn
    }()
    private lazy var txtLbl: UILabel = {
       let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 14)
        l.text = "Sizning hisobingiz bormi?"
        l.textColor = .black
        return l
    }()
    private lazy var loginBtn: UIButton = {
        let b = UIButton()
        b.setTitle("Kirish", for: .normal)
        b.setTitleColor(#colorLiteral(red: 0.1311129332, green: 0.5999528766, blue: 0, alpha: 1), for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        b.addTarget(.none, action: #selector(btnTapped), for: .touchUpInside)
        return b
    }()
    private lazy var stackV: UIStackView = {
        let s = UIStackView(arrangedSubviews: [txtLbl,loginBtn])
        s.spacing = 4
        s.axis = .horizontal
        s.alignment = .center
        s.distribution = .fill
        return s
    }()
    
    let calendar = Calendar(identifier: .gregorian)
    var components = DateComponents()
    var genderPicker = UIPickerView ()
    let datePicker = UIDatePicker()
    let genders:[String] = ["Erkak","Ayol"]
    var isGender:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        components.calendar = calendar
        view.backgroundColor = .gray.withAlphaComponent(0.4)
        setUpUI()
        setPickerView()
        setDataPicker()
        
    }
    func setUpUI() {
        view.addSubview(backImg)
        backImg.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
        
        view.addSubview(backV)
        backV.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(24)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(24)
            make.left.right.equalToSuperview().inset(24)
        }
        backV.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.left.equalTo(16)
        }
        backV.addSubview(fullName)
        fullName.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp_bottomMargin).offset(18)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        backV.addSubview(passwordTF)
        passwordTF.snp.makeConstraints { make in
            make.top.equalTo(fullName.snp_bottomMargin).offset(18)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        backV.addSubview(confirmPasswordTF)
        confirmPasswordTF.snp.makeConstraints { make in
            make.top.equalTo(passwordTF.snp_bottomMargin).offset(18)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        backV.addSubview(emailTF)
        emailTF.snp.makeConstraints { make in
            make.top.equalTo(confirmPasswordTF.snp_bottomMargin).offset(18)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        backV.addSubview(genderV)
        genderV.snp.makeConstraints { make in
            make.top.equalTo(emailTF.snp_bottomMargin).offset(18)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        backV.addSubview(dateV)
        dateV.snp.makeConstraints { make in
            make.top.equalTo(genderV.snp_bottomMargin).offset(18)
            make.left.right.equalToSuperview().inset(16)
        }
        backV.addSubview(startDateV)
        startDateV.snp.makeConstraints { make in
            make.top.equalTo(dateV.snp_bottomMargin).offset(18)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        backV.addSubview(lastDateV)
        lastDateV.snp.makeConstraints { make in
            make.top.equalTo(startDateV.snp_bottomMargin).offset(18)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        backV.addSubview(signUpBtn)
        signUpBtn.snp.makeConstraints { make in
            make.top.equalTo(lastDateV.snp_bottomMargin).offset(18)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        backV.addSubview(stackV)
        stackV.snp.makeConstraints { make in
            make.top.equalTo(signUpBtn.snp_bottomMargin).offset(8)
            make.centerX.equalTo(backV.snp_centerXWithinMargins)
        }
        
    }
    
    func setDataPicker() {
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        datePicker.datePickerMode = .date
        
        datePicker.locale = Locale(identifier: "uz_UZ")
        
        datePicker.backgroundColor = .clear
        
        setMinMaxDate(picker: datePicker)
        
        dateTf.inputView = datePicker
        startDateTf.inputView = datePicker
        lastDateTf.inputView = datePicker
        setToolBar()
        
        datePicker.addTarget(self, action: #selector(changeDatePicker), for: .valueChanged)
        
    }
    @objc func changeDatePicker() {
        if dateTf.isFirstResponder {
            dateTf.text = convertDateToString(datePicker.date)
        }else if startDateTf.isFirstResponder {
            startDateTf.text = convertDateToString(datePicker.date)
        }else if lastDateTf.isFirstResponder {
            lastDateTf.text = convertDateToString(datePicker.date)
        }
        
        
        
    }
    func setToolBar() {
        
        let cancel = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelTapped))
        
        let done = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTapped))
        var spaceView = UIBarButtonItem()
        if #available(iOS 14.0, *) {
             spaceView = UIBarButtonItem(systemItem: .flexibleSpace)
        }
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        
        toolBar.items = [cancel,spaceView,done]
        
        dateTf.inputAccessoryView = toolBar
        startDateTf.inputAccessoryView = toolBar
        lastDateTf.inputAccessoryView = toolBar
        genderTf.inputAccessoryView = toolBar
    }
    
    @objc func cancelTapped() {
        lastDateTf.resignFirstResponder()
        startDateTf.resignFirstResponder()
        dateTf.resignFirstResponder()
        genderTf.resignFirstResponder()
    }
    @objc func doneTapped() {
        if isGender {
            if genderTf.text!.isEmpty {
                genderTf.text = genders.first
            }
            genderTf.resignFirstResponder()
        }else {
            if dateTf.isFirstResponder {
                dateTf.text = convertDateToString(datePicker.date)
                if genderTf.text?.lowercased() == "ayol" {
                    components.year = 9
                    lastDateTf.text = convertDateToString(calendar.date(byAdding: components, to: datePicker.date) ?? Date())
                }else {
                    components.year = 12
                    lastDateTf.text = convertDateToString(calendar.date(byAdding: components, to: datePicker.date) ?? Date())
                }
                dateTf.resignFirstResponder()
            }else if startDateTf.isFirstResponder {
                startDateTf.text = convertDateToString(datePicker.date)
                startDateTf.resignFirstResponder()
            }else if lastDateTf.isFirstResponder {
                lastDateTf.text = convertDateToString(datePicker.date)
                lastDateTf.resignFirstResponder()
            }
            
            
        }
        
    }
    
    func setMinMaxDate(picker: UIDatePicker) {
        
        let calendar = Calendar(identifier: .gregorian)
        let currentDate = Date()
        var components = DateComponents()
        components.calendar = calendar
        components.year = 0
        components.month = 12
        let maxDate = calendar.date(byAdding: components, to: currentDate)!
        components.year = -60
        let minDate = calendar.date(byAdding: components, to: currentDate)!
        picker.maximumDate = maxDate
        picker.minimumDate = minDate
        
    }
    
    func convertDateToString(_ date: Date) -> String {
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd.MM.YYYY "
        
        formatter.locale = Locale(identifier: "uz_UZ")
        
        let dateStr = formatter.string(from: date)
        
        return dateStr
        
    }
    
    
    func setPickerView() {
        genderPicker.dataSource = self
        genderPicker.delegate = self
        genderTf.inputView = genderPicker
    }
    
    @objc func eyeTapped(){
        if passwordTF.isSecureTextEntry {
            openPasswordBtn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            passwordTF.isSecureTextEntry = false
        }else {
            openPasswordBtn.setImage(UIImage(systemName: "eye"), for: .normal)
            passwordTF.isSecureTextEntry = true
        }
    }
    @objc func eye1Tapped(){
        if confirmPasswordTF.isSecureTextEntry {
            openConfirmPasswordBtn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            confirmPasswordTF.isSecureTextEntry = false
        }else {
            openConfirmPasswordBtn.setImage(UIImage(systemName: "eye"), for: .normal)
            confirmPasswordTF.isSecureTextEntry = true
        }
    }
    
    
    @objc func selectGenderTapped() {
        isGender = true
        genderTf.becomeFirstResponder()
    }
    @objc func selectDateTapped() {
        isGender = false
        dateTf.becomeFirstResponder()
    }
    @objc func selectStartD(){
        startDateTf.becomeFirstResponder()
    }
    @objc func selectLastD(){
        lastDateTf.becomeFirstResponder()
    }
    
    
    @objc func loginTapped(){
        Loader.start()
        if passwordTF.text!.count >= 8 {
            register()
        }else {
            Alert.showAlert(title: "Xatolik", message: "Parol 8 ta belgidan uzun bo'lishi kerak!", vc: self)
        }
        
        
    }
    @objc func btnTapped(){
        let vc = LoginVC()
        ChangeRootViewController.change(with: vc)
    }
}
//MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension RegisterVC:UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return genders.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        genderTf.text = genders[row]
        //        self.view.endEditing(true)
    }
    
}


extension RegisterVC {
    
    func register(){
        API.register1(email: emailTF.text!, password: passwordTF.text!, username: fullName.text!) { [self] data in
            Loader.stop()
            print("DATA = ",data)
            
            cache.set(dateTf.text, forKey: "DATE")
            cache.set(startDateTf.text, forKey: "STARTDATE")
            cache.set(lastDateTf.text, forKey: "FARZDATE")
            
            
            cache.set(data["username"].stringValue, forKey: "USERNAME")
            if data["id"].int != nil {
                cache.set(data["id"].intValue, forKey: "ID")
                register2(id: data["id"].intValue)
                if data["id"].int != nil {
                    let vc = HomeVC()
                    vc.isLogin = false
                    cache.set(true, forKey: "isHome")
                    vc.modalPresentationStyle = .overFullScreen
                    self.present(vc, animated: true)
                }else {
                    Alert.showAlert(title: "Error", message: "Bunday foydalanuvchi mavjud iltimos boshqa ism kiriting!", vc: self)
                }
                
                
            }else{
                Alert.showAlert(title: "Xatolik", message: "Bunday foydalanuvchi mavjud iltimos boshqa ism kiriting! ", vc: self)
            }
            
            
        }
    }
    
    
    func register2(id:Int){
        var gender: Bool!
        if genderTf.text == "Erkak" {
             gender = true
        }else if genderTf.text == "Ayol" {
             gender = false
        }
        
        
        let param:[String:Any] = [
            
            "gender":gender ?? true,
            "birthday":dateTf.text!,
            "whenStartNamoz":startDateTf.text!,
            "whenFarzNamoz":lastDateTf.text!,
            "auth_id": id
    

        ]
        API.register2(param:param ) { data in
            
        }
    }
}
