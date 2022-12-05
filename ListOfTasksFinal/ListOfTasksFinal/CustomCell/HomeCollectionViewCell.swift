//
//  HomeCollectionViewCell.swift
//  ListOfTasksFinal
//
//  Created by admin on 23/11/2022.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var checkButton: UIButton!{
        didSet{
            checkButton.setImage(UIImage(named:"whiteUncheck"), for: .normal)
            checkButton.setImage(UIImage(named:"whiteCheck"), for: .selected)
        }
    }
    @IBOutlet weak var trashButton: UIButton!
    @IBOutlet weak var mainText: UILabel!
    @IBOutlet weak var subtext: UILabel!
}
