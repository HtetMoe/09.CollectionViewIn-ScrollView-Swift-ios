//
//  ViewController.swift
//  CollectionViewInScrollView
//  https://www.youtube.com/watch?v=MGQPRuoTdVo&t=44s
//  Created by Htet Moe Phyu on 07/12/2021.
//

import UIKit

class ViewController: UIViewController {
    var colorArray:[UIColor] = [.red, .green, .gray, .purple, .yellow, .brown, .systemCyan, .blue, .lightGray]
    
    @IBOutlet weak var collection_view_1: UICollectionView!
    @IBOutlet weak var collection_view_2: UICollectionView!
    
    @IBOutlet weak var collection_view_1_height: NSLayoutConstraint!
    @IBOutlet weak var collection_view_2_height: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collection_view_1.register(UINib(nibName: "ItemCollectionViewCell", bundle: nibBundle), forCellWithReuseIdentifier: "ItemCollectionViewCell")
        collection_view_2.register(UINib(nibName: "ItemCollectionViewCell", bundle: nibBundle), forCellWithReuseIdentifier: "ItemCollectionViewCell")
        
        self.view.layoutIfNeeded()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        changeCVHeight()
    }

}

extension ViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func changeCVHeight(){
        collection_view_1_height.constant = collection_view_1.contentSize.height
        collection_view_2_height.constant = collection_view_2.contentSize.height
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        cell.container_view.backgroundColor = colorArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width-4)/2, height: 160)
    }
    
    
}

