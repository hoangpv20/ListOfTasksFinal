//
//  CustomTabbarVC.swift
//  ListOfTasksFinal
//
//  Created by admin on 24/11/2022.
//

import Foundation
import UIKit

let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

class CustomTabbarvc: UITabBarController, UITabBarControllerDelegate{
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.selectedIndex = 0
//        setupMiddleButton()
        setupLeftButton()
    }
//    func setupMiddleButton(){
//        let middleButton = UIButton(frame: CGRect(x: (self.view.bounds.width / 2) - 28, y: -40, width: 80, height: 80))
//
//        middleButton.setBackgroundImage(UIImage(named: "plus"), for: .normal)
//        middleButton.layer.shadowColor = UIColor.black.cgColor
//        middleButton.layer.shadowOpacity = 0.1
//        middleButton.layer.shadowOffset = CGSize(width: 4, height: 4)
//
//        self.tabBar.addSubview(middleButton)
//        middleButton.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
//
//        self.view.layoutIfNeeded()
//    }
//
//    @objc func menuButtonAction(sender: UIButton){
//        let alert = UIAlertController(title: "New Item", message: "EnterNewItem", preferredStyle: .alert)
//        alert.addTextField(configurationHandler: nil)
//        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak self] _ in
//            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
//                return
//            }
//            self?.createItem(name: text)
//
//        }))
//
//        present(alert, animated: true)
//    }
    
    func setupLeftButton(){
        let leftButton = UIButton()
        self.tabBar.addSubview(leftButton)
        leftButton.addTarget(self, action: #selector(leftButtonAction), for: .touchUpInside)
        self.view.layoutIfNeeded()
        
    }
    @objc func leftButtonAction(sender: UIButton){
        if #available(iOS 13.0, *){
            let appDelegate = UIApplication.shared.windows.first
            if appDelegate?.overrideUserInterfaceStyle == .dark{
            appDelegate?.overrideUserInterfaceStyle = .light
            }
            else{
                appDelegate?.overrideUserInterfaceStyle = .dark
            }
        }

    }

}
