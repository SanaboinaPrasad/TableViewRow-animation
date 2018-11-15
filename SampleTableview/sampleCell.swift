//
//  sampleCell.swift
//  SampleTableview
//
//  Created by Sriram Prasad on 15/11/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit
class SimpleCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
