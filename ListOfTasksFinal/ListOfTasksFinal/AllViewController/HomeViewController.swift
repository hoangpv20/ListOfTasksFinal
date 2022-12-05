//
//  HomeViewController.swift
//  ListOfTasksFinal
//
//  Created by admin on 23/11/2022.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var models = [TodoListItem]()
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var plusButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.navigationItem.leftBarButtonItem = nil
        plusButton.backgroundColor = .red
        plusButton.layer.cornerRadius = 0.5 * plusButton.bounds.size.width
        plusButton.clipsToBounds = true
        plusButton.addTarget(self, action: #selector(plusAction), for: .touchUpInside)
        getAllItem()
        // Do any additional setup after loading the view.
    }
    
    @objc
    func plusAction(){
        let alert = UIAlertController(title: "New Item", message: "EnterNewItem", preferredStyle: .alert)
        alert.addTextField()
        alert.textFields![0].placeholder = "Enter Activities"
        alert.addTextField()
        alert.textFields![1].placeholder = "Enter Description"
//        alert.addTextField()
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak self] _ in
            guard let text1 = alert.textFields![0].text, !text1.isEmpty else {
                return
            }
            guard let text2 = alert.textFields![1].text, !text2.isEmpty else{
                return
            }

            self?.createItem(titleText: text1, descText: text2)
            
        }))
        
        present(alert, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homm", for: indexPath) as! HomeCollectionViewCell
        cell.layer.cornerRadius = 12
        cell.backgroundColor = UIColor(named: "Color2")
        cell.mainText.text = model.title
        cell.subtext.text = model.desc
        cell.trashButton.layer.setValue(indexPath.row, forKey: "trashIndex")
        cell.trashButton.addTarget(self, action: #selector(deleteUser), for: .touchUpInside)
//        cell.checkButton.layer.setValue(indexPath.row, forKey: "checkIndex")
//        cell.checkButton.addTarget(self, action: #selector(checkBox), for: .touchUpInside)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height*100/550)
    }
    
    @objc
    func deleteUser(sender: UIButton){
        let i : Int = (sender.layer.value(forKey: "trashIndex")) as! Int
        deleteItem(item: models[i])
    }
    
    func getAllItem(){
        do {
            models = try context.fetch(TodoListItem.fetchRequest())
            DispatchQueue.main.async {
                self.homeCollectionView.reloadData()
            }
        }
        catch{
            
        }
        
    }
    
    func createItem(titleText: String, descText: String) {
        let newItem = TodoListItem(context: context)
        newItem.title = titleText
        newItem.desc = descText
        
        do {
            try context.save()
            getAllItem()
        }
        catch {
            
        }
        
    }
    
    func deleteItem(item: TodoListItem){
        context.delete(item)
        
        do {
            try context.save()
            getAllItem()
        }
        catch {
            
        }
        
    }
    
    func updateItem(item: TodoListItem, newName: String){
        item.title = newName
        do{
            try context.save()
            getAllItem()
        }
        catch{
            
        }
    }
    
}
