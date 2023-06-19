//
//  DateVC.swift
//  Tartib sohibi
//
//  Created by MacBook Pro on 09/05/23.
//

import UIKit
import SnapKit
class DateVC: UIViewController {
    
    
    private lazy var collectionV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()

    private lazy var backBtn: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        b.tintColor = .black
        b.addTarget(.none, action: #selector(btnTapped), for: .touchUpInside)
        return b
    }()
    
    var namaz:[NamazDM] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setUpUI()
        
    }
    func setUpUI() {
        view.backgroundColor = .white
        view.addSubview(backBtn)
        backBtn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(16)
            make.width.height.equalTo(50)
        }
        view.addSubview(collectionV)
        collectionV.snp.makeConstraints { make in
            make.top.equalTo(backBtn.snp_bottomMargin).offset(16)
            make.left.right.equalToSuperview().inset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        collectionV.delegate = self
        collectionV.dataSource = self
        collectionV.register(UINib(nibName: "DateCVC", bundle: nil), forCellWithReuseIdentifier: "DateCVC")
    }

    @objc func btnTapped(){
        self.dismiss(animated: true)
    }

}
extension DateVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        namaz.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateCVC", for: indexPath) as? DateCVC else {return UICollectionViewCell()}
        cell.layer.cornerRadius = 8
        cell.dateLbl.text = namaz[indexPath.row].day
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (self.collectionV.frame.width + 50)/5 , height: 34)
    }
    
    
}
