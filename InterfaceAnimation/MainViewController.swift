//
//  ViewController.swift
//  InterfaceAnimation
//
//  Created by NightSword on 7/5/21.
//

import UIKit

class MainViewController: UIViewController {
    
    
    fileprivate lazy var tableview:UITableView = {
        let tableview = UITableView(frame: self.view.bounds,style: .plain)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableview
    }()
    fileprivate lazy var categoriesArr:[String] = []
    fileprivate lazy var itemsArr:[[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "🌄 Interface Animation"
        
        initData()
        
        self.view.addSubview(self.tableview)
    }
    
    func initData(){
        
        self.categoriesArr = ["Simple UITableViewCell Animation",
                              "Simple UICollectionViewCell Animation"]
        
        self.itemsArr = [["Effect_1","Effect_2","Effect_3","Effect_4"],
                         ["Effect_1","Effect_2"]]
    }
}


extension MainViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.categoriesArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemsArr[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.itemsArr[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            let vc = SimpleAnimationTableViewController()
            vc.index = indexPath.row
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 10
            layout.itemSize = CGSize(width:( UIScreen.main.bounds.size.width - 33) * 0.5, height: 120)
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            
            let vc = SimpleAnimationCollectionViewController(collectionViewLayout: layout)
            vc.index = indexPath.row
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.categoriesArr[section]
    }
    

}
