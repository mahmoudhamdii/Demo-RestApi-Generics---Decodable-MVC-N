//
//  PostsTableViewCell.swift
//  Demo (Generics - Decodable)
//
//  Created by hamdi on 04/05/2023.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

  
    @IBOutlet weak var postLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
