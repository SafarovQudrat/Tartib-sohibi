//
//  Profile.swift
//  Tartib sohibi
//
//  Created by MacBook Pro on 16/05/23.
//

import UIKit
import RealmSwift

class Profile: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    private lazy var profileImg: UIImageView = {
        let i = UIImageView(image: UIImage(systemName: "person.circle"))
        i.contentMode = .scaleAspectFill
        i.snp.makeConstraints { make in
            make.height.width.equalTo(100)
        }
        return i
    }()
    private lazy var username: UILabel = {
        let l = UILabel()
        l.textColor = .black
        
        l.text = cache.string(forKey: "USERNAME") ?? ""
        return l
    }()
    private lazy var profileStackV: UIStackView = {
        let v = UIStackView(arrangedSubviews: [profileImg,username])
        v.spacing = 8
        v.alignment = .center
        v.axis = .vertical
        v.distribution = .fill
        return v
    }()
    
    private lazy var dateImg: UIImageView = {
        let i = UIImageView(image: UIImage(systemName: "calendar"))
        i.contentMode = .center
        return i
    }()
    private lazy var dateLbl: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.text = cache.string(forKey: "DATE")
        return l
    }()
    private lazy var dateStackV: UIStackView = {
        let s = UIStackView(arrangedSubviews: [dateImg,dateLbl])
        s.alignment = .center
        s.axis = .vertical
        s.distribution = .fill
        s.spacing = 8
        return s
    }()

    private lazy var startDateImg: UIImageView = {
        let i = UIImageView(image: UIImage(systemName: "calendar"))
        i.contentMode = .center
        return i
    }()
    private lazy var startDateLbl: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.text = cache.string(forKey: "STARTDATE")
        return l
    }()
    private lazy var sDateStackV: UIStackView = {
        let s = UIStackView(arrangedSubviews: [startDateImg,startDateLbl])
        s.alignment = .center
        s.axis = .vertical
        s.distribution = .fill
        s.spacing = 8
        return s
    }()
    
    private lazy var farzDateImg: UIImageView = {
        let i = UIImageView(image: UIImage(systemName: "calendar"))
        i.contentMode = .center
        return i
    }()
    private lazy var farzDateLbl: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.text = cache.string(forKey: "FARZDATE")
        return l
    }()
    private lazy var fDateStackV: UIStackView = {
        let s = UIStackView(arrangedSubviews: [farzDateImg,farzDateLbl])
        s.alignment = .center
        s.axis = .vertical
        s.distribution = .fill
        s.spacing = 8
        return s
    }()
    
    private lazy var lastStack: UIStackView = {
        let s = UIStackView(arrangedSubviews: [dateStackV,sDateStackV,fDateStackV])
        s.distribution = .fillEqually
        s.axis = .horizontal
        s.alignment = .fill
        s.spacing = 16
        return s
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    var namaz:[NamazDM] =  []
    private var realm:Realm!
    
    var bomdod:[Bool] = []
    var peshin:[Bool] = []
    var asr:[Bool] = []
    var shom:[Bool] = []
    var xufton:[Bool] = []
    var vitr:[Bool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       
        view.addSubview(profileStackV)
        profileStackV.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.centerX.equalTo(view.snp_centerXWithinMargins)
            make.left.right.equalToSuperview().inset(70)
            
        }
        view.addSubview(lastStack)
        lastStack.snp.makeConstraints { make in
            make.top.equalTo(profileStackV.snp_bottomMargin).offset(24)
            make.left.right.equalToSuperview().inset(24)
        }
        view.addSubview(collectionView)
        collectionView.backgroundColor = .red
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(profileStackV.snp_bottomMargin).offset(100)
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(24)
        }
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ProgressCVC", bundle: nil), forCellWithReuseIdentifier: "ProgressCVC")
        try? realm = Realm()
        namaz = realm.objects(NamazDM.self).compactMap{$0}
        print(namaz)
        getNamaz()
    }
    
    func getNamaz() {
        
        for i in namaz {
            if i.bomdod {
                bomdod.append(i.bomdod)
            }
            if i.peshin {
                peshin.append(i.peshin)
            }
            if i.asr {
                asr.append(i.asr)
            }
            if i.shom {
                shom.append(i.shom)
            }
            if i.xufton {
                xufton.append(i.xufton)
            }
            if i.vitr {
                vitr.append(i.vitr)
            }
            
        }
        
    }
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProgressCVC", for: indexPath) as? ProgressCVC else {return UICollectionViewCell()}
        return cell
    }
    
    
   
    
    
    
    

}

