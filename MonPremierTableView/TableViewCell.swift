//
//  TableViewCell.swift
//  MonPremierTableView
//
//  Created by Naoher on 14/01/2022.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var dateTodo: UILabel!
    @IBOutlet weak var done: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func onChange(_ sender: UISwitch) {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
