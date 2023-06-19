//
//  ResetPasswordVC.swift
//  Tartib sohibi
//
//  Created by MacBook Pro on 06/05/23.
//

import UIKit

class ResetPasswordVC: UIViewController {
    
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
    
    private lazy var titleLbl: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 24,weight: .semibold)
        l.text = "Parolni unutdingizmi"
        return l
    }()
    
    private lazy var emailTF:UITextField = {
        let tf = UITextField()
        tf.placeholder = "Elektron pochtani kiriting"
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
    
    private lazy var signUpBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.1311129332, green: 0.5999528766, blue: 0, alpha: 1)
        btn.layer.cornerRadius = 8
        btn.setTitle("Parolni yangilash", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        btn.addTarget(.none, action: #selector(loginTapped), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

       setUpUI()
    }
    
    func setUpUI() {
        self.view.addSubview(backImg)
        backImg.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
        view.addSubview(backV)
        backV.snp.makeConstraints { make in
            make.top.equalTo(170)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(200)
        }
        backV.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.centerX.equalTo(backV.snp_centerXWithinMargins)
            make.top.equalTo(24)
            
        }
        backV.addSubview(emailTF)
        emailTF.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp_bottomMargin).offset(24)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(48)
            
        }
        backV.addSubview(signUpBtn)
        signUpBtn.snp.makeConstraints { make in
            make.top.equalTo(emailTF.snp_bottomMargin).offset(24)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(48)
        }
    }
    
    
    @objc func loginTapped() {
        Loader.start()
        resetPass()
    }
    

}
extension ResetPasswordVC {
    func resetPass(){
        API.resetPassword(email: emailTF.text!) { data in
            Loader.stop()
            print("data = ",data)
            Alert.showAlert(title: "", message: "Elektron pochta manzilingizga xabar yuborildi", vc: self)
        }
    }
}
