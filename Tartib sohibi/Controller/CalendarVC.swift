//
//  CalendarVC.swift
//  Tartib sohibi
//
//  Created by MacBook Pro on 16/05/23.
//

import UIKit
import FSCalendar




protocol CalendarVCDelegate {
    func editData(data: String)
}




class CalendarVC: UIViewController {
    private lazy var backV: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.addSubview(calendarV)
        calendarV.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview().inset(16)
        }
        v.layer.cornerRadius = 12
        return v
    }()
    
    private lazy var calendarV: FSCalendar = {
        let v = FSCalendar()
        v.backgroundColor = .white
        
        return v
    }()
    
    let dateF = DateFormatter()
    
    var minDate:String = ""
    var maxDate:String = ""
    
    var editData: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        view .addSubview(backV)
        backV.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(300)
            make.top.equalTo(100)
        }
        calendarV.delegate = self
        calendarV.dataSource = self
        dateF.dateFormat = "yyyy.M.d"
//        calendarV.minimumDate = dateF.date(from: minDate)
//        calendarV.maximumDate = dateF.date(from: maxDate)
    }
    

   

}
extension CalendarVC: FSCalendarDelegate,FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("didselectDate =",date)
        
        editData?(dateF.string(from: date))
        
        
        self.dismiss(animated: true)
    }
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        return dateF.date(from: minDate) ?? Date()
    }
    
    func maximumDate(for calendar: FSCalendar) -> Date {
        return dateF.date(from: maxDate) ?? Date()
    }
}
