//
//  LoginVC.swift
//  Tartib sohibi
//
//  Created by MacBook Pro on 04/05/23.
//

import UIKit

class LoginVC: UIViewController {
    private lazy var backImg: UIImageView = {
        let i = UIImageView(image: UIImage(named: "background"))
        i.contentMode = .scaleAspectFill
        return i
    }()
    
    private lazy var backV: UIView = {
       let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 12
        return v
    }()
    
//    titleLbl
    private lazy var titleLbl: UILabel = {
       let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 24,weight: .semibold)
        l.text = "Tizimga kirish"
        return l
    }()
    
//    userName
    private lazy var userNameTF:UITextField = {
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
    //Forgot Password Button
    let forgotPasswordBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Forgot Password", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.setTitleColor(#colorLiteral(red: 0.1311129332, green: 0.5999528766, blue: 0, alpha: 1), for: .normal)
        btn.addTarget(.none, action: #selector(frogotPasswordTapped), for: .touchUpInside)
        return btn
    }()
    //Sign Up Button
    private let loginBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.1311129332, green: 0.5999528766, blue: 0, alpha: 1)
        btn.layer.cornerRadius = 8
        btn.setTitle("Kirish", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        btn.addTarget(.none, action: #selector(loginTapped), for: .touchUpInside)
        return btn
    }()
    private lazy var txtLbl: UILabel = {
       let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 14)
        l.text = "Sizning hisobingiz yo'qmi?"
        l.textColor = .black
        return l
    }()
    private lazy var signUpBtn: UIButton = {
        let b = UIButton()
        b.setTitle("Ro'yxatdan o'tish", for: .normal)
        b.setTitleColor(#colorLiteral(red: 0.1311129332, green: 0.5999528766, blue: 0, alpha: 1), for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        b.addTarget(.none, action: #selector(btnTapped), for: .touchUpInside)
        return b
    }()
    private lazy var stackV: UIStackView = {
        let s = UIStackView(arrangedSubviews: [txtLbl,signUpBtn])
        s.spacing = 4
        s.axis = .horizontal
        s.alignment = .center
        s.distribution = .fill
        return s
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray.withAlphaComponent(0.4)
        
        setUpUI()
    }
    
    func setUpUI(){
        view.addSubview(backImg)
        backImg.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
        view.addSubview(backV)
        backV.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.center.equalTo(view.center)
            make.height.equalTo(350)
        }
        backV.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.top.equalTo(24)
            make.left.equalTo(16)
        }
        backV.addSubview(userNameTF)
        userNameTF.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp_bottomMargin).offset(50)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(48)
            
        }
        backV.addSubview(passwordTF)
        passwordTF.snp.makeConstraints { make in
            make.top.equalTo(userNameTF.snp_bottomMargin).offset(24)
            make.height.equalTo(48)
            make.left.right.equalToSuperview().inset(16)
        }
        backV.addSubview(forgotPasswordBtn)
        forgotPasswordBtn.snp.makeConstraints { make in
            make.right.equalTo(-16)
            make.top.equalTo(passwordTF.snp_bottomMargin).offset(8)
            make.height.equalTo(20)
        }
        backV.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordBtn.snp_bottomMargin).offset(24)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        backV.addSubview(stackV)
        stackV.snp.makeConstraints { make in
            make.top.equalTo(loginBtn.snp_bottomMargin).offset(10)
            make.centerX.equalTo(backV.snp_centerXWithinMargins)
        }
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
    //Opens ForgotVC Tapped
    @objc func frogotPasswordTapped() {
        let vc = ResetPasswordVC()
        
        self.present(vc, animated: true)
    }
    @objc func loginTapped(){
        Loader.start()
        login()
        
    }
    
    @objc func btnTapped(){
        let vc = RegisterVC()
        ChangeRootViewController.change(with: vc)
    }

}
extension LoginVC {
    func login(){
        API.login(username: userNameTF.text!, password: passwordTF.text!) { data in
            Loader.stop()
            if data["auth_token"].string != nil {
                let vc = HomeVC()
                cache.set(true, forKey: "isHome")
                cache.set(data["auth_token"].stringValue, forKey: "TOKEN")
                vc.isLogin = true
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }else {
                Alert.showAlert(title: "Xatolik", message: "Bunday foydalanuvchi mavjud emas", vc: self)
            }
        }
    }
}
