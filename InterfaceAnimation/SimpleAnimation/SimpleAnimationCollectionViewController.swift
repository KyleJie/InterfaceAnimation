//
//  SimpleAnimationCollectionViewController.swift
//  InterfaceAnimation
//
//  Created by NightSword on 7/5/21.
//

import UIKit

private let reuseIdentifier = "Cell"

class SimpleAnimationCollectionViewController: UICollectionViewController {
    
    
    var index:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .white
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Animate", style: .plain, target: self, action: #selector(animationCells))
        
        // Register cell classes
        self.collectionView!.register(UINib(nibName: "SimpleAnimationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)

    }
    
    @objc func animationCells(){
        
        self.collectionView.reloadData()
        self.collectionView.layoutIfNeeded()
        
        let cells = self.collectionView.visibleCells
        let collectionHeight = self.collectionView.bounds.size.height
        
        switch self.index {
        case 0:
            for(index, cell) in cells.enumerated(){
                cell.alpha = 1.0
                cell.transform = CGAffineTransform(translationX: 0, y: collectionHeight)
                UIView.animate(withDuration: 0.7, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIView.AnimationOptions(rawValue: 0), animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion: nil)
            }
        case 1:
            for cell in cells {
                cell.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
                UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                    cell.transform = .identity
                }, completion: nil)
            }
        default:
            break
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 100
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SimpleAnimationCollectionViewCell
        
        let randomIndex = arc4random_uniform(3)

        cell.bgImage.image = UIImage(named: "bg_\(randomIndex)")
        cell.showLabel.text = "Item \(indexPath.item)"
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        switch self.index {
        case 0:
            let cells = collectionView.visibleCells
            let collectionHeight = collectionView.bounds.size.height

            for(index, cell) in cells.enumerated(){
                cell.alpha = 1.0
                cell.transform = CGAffineTransform(translationX: 0, y: collectionHeight)
                UIView.animate(withDuration: 0.7, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIView.AnimationOptions(rawValue: 0), animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion: nil)
            }
        case 1:
            cell.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                cell.transform = .identity
            }, completion: nil)
        default:
            break
        }
    }
}
