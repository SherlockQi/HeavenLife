//
//  NEPreViewCollectionView.swift
//  HeavenLife
//
//  Created by hosa on 2017/4/13.
//  Copyright © 2017年 Sherlock. All rights reserved.
//

import UIKit

protocol NEPreViewCollectionViewDelegate {
    func preViewCollectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
}

class NEPreViewCollectionView: UICollectionView {

    var image :UIImage? = nil
    var preViewCollectionViewDelegate :NEPreViewCollectionViewDelegate?  = nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.delegate = self
        self.dataSource = self
    }
}

extension NEPreViewCollectionView:UICollectionViewDataSource{

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterInfoS.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let item =  NEPerviewCollectionViewCell.cell(
                            collectionView  : collectionView,
                            indexPath       : indexPath as NSIndexPath,
                            imageSoure      : self.image!
        )
       
        return item
    }
}

extension NEPreViewCollectionView:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        preViewCollectionViewDelegate?.preViewCollectionView(collectionView, didSelectItemAt: indexPath)
        
    }
}

