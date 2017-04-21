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
        item.magicEngine.magicImage(image: imageSoure, indexPath: indexPath)
        
        if indexPath.row < fliterNames.count{
            item.fliterNameLabel.text = fliterNames[indexPath.row]
        }else{
            item.fliterNameLabel.text  = "Magic"
        }
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
//        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    lazy var magicEngine:NEMagicImageEngine = {
        let magicEngine = NEMagicImageEngine()
        magicEngine.delegate = self
        return magicEngine
    }()
}
extension NEPerviewCollectionViewCell:NEMagicImageEngineDelegate{
    func NEMagicImageEngineDelegate(magicComplete image: UIImage) {
        self.imageView.image = image
    }
}
