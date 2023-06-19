//
//  LanguageTVC.swift
//  Tartib sohibi
//
//  Created by MacBook Pro on 09/05/23.
//

import UIKit

class LanguageTVC: UITableViewCell {

    
    @IBOutlet weak var titleLbl: UILabel!
    
    
    @IBOutlet weak var greenV: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(lang: SelectLang) {
        titleLbl.text = lang.title
        if lang.isSelect {
            greenV.backgroundColor = #colorLiteral(red: 0.1815147102, green: 0.6001556516, blue: 0, alpha: 1)
        }else {
            greenV.backgroundColor = .clear
        }
    }
    
    
}
