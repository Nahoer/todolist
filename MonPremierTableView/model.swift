//
//  model.swift
//  MonPremierTableView
//
//  Created by Naoher on 14/01/2022.
//

import Foundation

class MyData {
    var title: String
    var date: Date
    var isDone: Bool
    
    init(title: String, date: Date) {
        self.title = title
        self.date = date
        self.isDone = false;
    }
    
    func dateToString()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy à hh:mm"
        return dateFormatter.string(from: self.date)
    }
}
