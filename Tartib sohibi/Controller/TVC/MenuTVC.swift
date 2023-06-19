//
//  MenuTVC.swift
//  Tartib sohibi
//
//  Created by MacBook Pro on 07/05/23.
//

import UIKit

class MenuTVC: UITableViewCell {

    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    
    func updateCell(data:SettingsDM){
        img.image = data.image
        titleLbl.text = data.title
    }
    
    
    
}
