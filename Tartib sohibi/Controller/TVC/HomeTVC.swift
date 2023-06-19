//
//  HomeTVC.swift
//  Tartib sohibi
//
//  Created by MacBook Pro on 05/05/23.
//

import UIKit
protocol HomeTVCDelegate {
    func editData(data:String)
}



class HomeTVC: UITableViewCell {

    
    @IBOutlet weak var bomdod: UIButton!
    @IBOutlet weak var peshin: UIButton!
    @IBOutlet weak var asr: UIButton!
    @IBOutlet weak var shom: UIButton!
    @IBOutlet weak var xufton: UIButton!
    @IBOutlet weak var vitr: UIButton!
    
    
    var delegate: HomeTVCDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func updateCell(data:NamazDM) {
        if data.bomdod {
            bomdod.setImage(UIImage(named: "select"), for: .normal)
        }else {
            bomdod.setImage(UIImage(named: ""), for: .normal)
        }
        if data.peshin {
            peshin.setImage(UIImage(named: "select"), for: .normal)
        }else {
            peshin.setImage(UIImage(named: ""), for: .normal)
        }
        if data.asr {
            asr.setImage(UIImage(named: "select"), for: .normal)
        }else {
            asr.setImage(UIImage(named: ""), for: .normal)
        }
        if data.shom {
            shom.setImage(UIImage(named: "select"), for: .normal)
        }else {
            shom.setImage(UIImage(named: ""), for: .normal)
        }
        if data.xufton {
            xufton.setImage(UIImage(named: "select"), for: .normal)
        }else {
            xufton.setImage(UIImage(named: ""), for: .normal)
        }
        if data.vitr {
            vitr.setImage(UIImage(named: "select"), for: .normal)
        }else {
            vitr.setImage(UIImage(named: ""), for: .normal)
        }
        
        
        
        
        
        
        
    }
    
    @IBAction func bomdodBtn(_ sender: Any) {
        
        delegate.editData(data: "bomdod")
    }
    
    @IBAction func peshinBtn(_ sender: Any) {
        delegate.editData(data: "peshin")
    }
    
    @IBAction func asrBtn(_ sender: Any) {
        delegate.editData(data: "asr")
    }
    
    @IBAction func shomBtn(_ sender: Any) {
        delegate.editData(data: "shom")
    }
    
    @IBAction func xuftonBtn(_ sender: Any) {
        delegate.editData(data: "xufton")
    }
    
    @IBAction func vitrBtn(_ sender: Any) {
        delegate.editData(data: "vitr")
    }
    
    
}
