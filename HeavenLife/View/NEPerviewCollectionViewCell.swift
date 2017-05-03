//
//  NEPerviewCollectionViewCell.swift
//  HeavenLife
//
//  Created by hosa on 2017/4/13.
//  Copyright © 2017年 Sherlock. All rights reserved.
//

import UIKit

class NEPerviewCollectionViewCell: UICollectionViewCell {
    
    var imageSoure:UIImage? = nil
    
    var indexPath:NSIndexPath?
    
    
    class func cell(collectionView:UICollectionView, indexPath:NSIndexPath, imageSoure:UIImage ) -> NEPerviewCollectionViewCell {
        
        let reuseIdentifier = NSString.init(format: "NEPerviewCollectionViewCell %d", indexPath.row)
        
        collectionView.register(NEPerviewCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier as String)
        
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier as String, for: indexPath as IndexPath) as! NEPerviewCollectionViewCell
        item.contentView.backgroundColor = kRandomColor()
        item.imageSoure = imageSoure
        item.indexPath = indexPath as NSIndexPath
        
        
        if let filter = filterInfoS[indexPath.row].filter {
            
            filter.useNextFrameForImageCapture()
            let source = GPUImagePicture(image: imageSoure)
            source?.addTarget(filter)
            source?.processImage()
            item.imageView.image = filter.imageFromCurrentFramebuffer()
        }
        
        if let filterGroup = filterInfoS[indexPath.row].filterGroup {
            filterGroup.useNextFrameForImageCapture()
            let source = GPUImagePicture(image: imageSoure)
            source?.addTarget(filterGroup)
            source?.processImage()
            item.imageView.image = filterGroup.imageFromCurrentFramebuffer()
            
        }
        
        item.fliterNameLabel.text = filterInfoS[indexPath.row].filterName

        
        
        
        
        return item
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView(frame: bounds)
        
        contentView.addSubview(self.imageView)
        contentView.addSubview(self.fliterNameLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var fliterNameLabel:UILabel = {
        
        var fliterNameLabel = UILabel(frame:CGRect(x: 0, y:self.height - 12, width: self.width, height: 12))
        fliterNameLabel.backgroundColor  = UIColor.init(red: 252/256, green: 157/256, blue: 154/256, alpha: 1)
        fliterNameLabel.textAlignment = .center
        fliterNameLabel.font = UIFont.systemFont(ofSize: 9)
        fliterNameLabel.textColor = UIColor.white
        return fliterNameLabel
    }()
    
    lazy var imageView:UIImageView = {
        var imageView = UIImageView(frame: self.bounds)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

}
//extension NEPerviewCollectionViewCell:NEMagicImageEngineDelegate{
//    func NEMagicImageEngineDelegate(magicComplete image: UIImage) {
//        self.imageView.image = image
//    }
//}
