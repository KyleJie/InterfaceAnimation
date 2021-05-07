//
//  SimpleAnimationTableViewController.swift
//  InterfaceAnimation
//
//  Created by NightSword on 7/5/21.
//

import UIKit

private let kSimpleAnimationTableViewCellID = "SimpleAnimationTableViewCell"

class SimpleAnimationTableViewController: UITableViewController {
    
    var index:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = .white
        
        self.tableView.register(UINib(nibName: "SimpleAnimationTableViewCell", bundle: nil), forCellReuseIdentifier:kSimpleAnimationTableViewCellID)
        self.tableView.rowHeight = 60
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kSimpleAnimationTableViewCellID, for: indexPath) as! SimpleAnimationTableViewCell
        let randomIndex = arc4random_uniform(3)
        
        cell.bgImage.image = UIImage(named: "bg_\(randomIndex)")
        cell.showLabel.text = "This is row \(indexPath.row)"
        
        return cell
    }
    
    //Animation Type Setting
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch self.index {
        case 0:
            cell.transform = CGAffineTransform(translationX: 0, y: 60)
            cell.layer.opacity = 0.0;
            
            UIView.animate(withDuration: 1.0, animations: {
                cell.transform = .identity
                cell.layer.opacity = 1.0;
            }, completion: nil)
        case 1:
            var transform = CATransform3DIdentity;
            transform = CATransform3DRotate(transform, 0, 0, 0, 1);//渐变
            transform = CATransform3DTranslate(transform, -200, 0, 0);//左边水平移动
            transform = CATransform3DScale(transform, 0, 0, 0);//由小变大
            
            cell.layer.transform = transform;
            cell.layer.opacity = 0.0;
            UIView.animate(withDuration: 0.6, animations: {
                cell.layer.transform = CATransform3DIdentity;
                cell.layer.opacity = 1;
            }, completion: nil)
        case 2:
            cell.alpha = 0.5
            
            let transformScale = CGAffineTransform(scaleX: 0.3, y: 0.8)
            let transformTranslate = CGAffineTransform(translationX: 0.5, y: 0.6)
            cell.transform = transformScale.concatenating(transformTranslate)
            
            tableView.bringSubviewToFront(cell)
            UIView.animate(withDuration: 0.4, delay: 0, options: .allowUserInteraction, animations: {
                cell.alpha = 1
                cell.transform = .identity
            }, completion: nil)
        case 3:
            var transform = CATransform3DMakeRotation(CGFloat((90.0 * Double.pi) / 180.0), 0.0, 0.7, 0.4);
            transform.m34 = 1.0 / -600;
            cell.layer.shadowColor = UIColor.black.cgColor;
            cell.layer.shadowOffset = CGSize(width: 10, height: 10)
            cell.alpha = 0
            cell.layer.transform = transform
            cell.layer.anchorPoint = CGPoint(x: 0, y: 0.5)//锚点
            if(cell.layer.position.x != 0){
                cell.layer.position = CGPoint(x: 0, y: cell.layer.position.y)
            }
            UIView.beginAnimations("transform", context: nil)
            UIView.setAnimationDuration(0.8)
            cell.layer.transform = CATransform3DIdentity;
            cell.alpha = 1;
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            UIView.commitAnimations()
            
        default:
            break
        }
    }
    
}
