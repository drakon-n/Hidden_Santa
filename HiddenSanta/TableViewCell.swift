//
//  TableViewCell.swift
//  HiddenSanta
//
//  Created by Влад on 06/12/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var NameLabel: UILabel!
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.backgroundColor = #colorLiteral(red: 1, green: 0.8628559709, blue: 0.6909814477, alpha: 1)
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fillCell(with model: CellModel) {
        NameLabel.text = model.title
    }
    
}
