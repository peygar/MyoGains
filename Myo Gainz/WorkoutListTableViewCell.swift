///Users/Peyman/Documents/uofthacks/repo/MyoGains/Myo Gainz.xcodeproj
//  WorkoutListTableViewCell.swift
//  Myo Gainz
//
//  Created by Matthew Dias on 2016-01-23.
//  Copyright © 2016 Myo Something. All rights reserved.
//

import UIKit

class WorkoutListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        titleLabel = UILabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel = UILabel()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
