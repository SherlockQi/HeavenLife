//
//  NEMagicViewController.swift
//  HeavenLife
//
//  Created by hosa on 2017/4/13.
//  Copyright © 2017年 Sherlock. All rights reserved.
//

import UIKit
import GPUImage

class NEMagicViewController: UIViewController {
    
    
    //    var sourcePicture:GPUImagePicture?
    //    var sepiaFilter:GPUImageOutput?
    
    
    
    //    @IBOutlet weak var imageLeftConstraint: NSLayoutConstraint!
    //    @IBOutlet weak var imageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var perviewCollectivew: NEPreViewCollectionView!
    //    @IBOutlet weak var magicShowImageView: UIImageView!
    //    @IBOutlet weak var magicImageView: UIView!
    //
    //    @IBOutlet weak var imageScrollView: UIScrollView!
    //    @IBOutlet weak var backScrollViewWidth: NSLayoutConstraint!
    //    @IBOutlet weak var backScrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var Slider: UISlider!
    
    lazy var scrollView:UIScrollView = {
        let rect = CGRect(x: 0, y: 64, width: kScreenWidth(), height: kScreenHeight() - 180)
        var scrollView = UIScrollView(frame: rect)
        scrollView.maximumZoomScale = 4
        scrollView.minimumZoomScale = 0.5
        scrollView.setZoomScale(1, animated: true)
        scrollView.scrollsToTop = false
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.contentSize =  scrollView.frame.size
        
        
        

        
        scrollView.backgroundColor = .red
        let btn = UIButton(type:.contactAdd)
        btn.center = scrollView.center
        scrollView.addSubview(btn)
        return scrollView
    }()
    
    var image:UIImage? = nil
    
    var magicView:GPUImageView?
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        NELog(message: sender.value)

    }
    
    
    @IBAction func backButtonDidClick(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var filter:GPUImageFilter?
    
    class func magicView(image:UIImage) -> NEMagicViewController {
        let sb = UIStoryboard(name: "NEMagicViewController", bundle: nil)
        let vc = sb.instantiateInitialViewController() as! NEMagicViewController
        vc.image = image
        return vc
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        NELog(message: image)
        perviewCollectivew.image = image?.scaleImage()
        perviewCollectivew.preViewCollectionViewDelegate = self
        setMagicImageShowImageView(image: image!)
        view.addSubview(self.scrollView)
       

        
        
        
        //        setScrollImageView()
    }
    
    
    //    func setScrollImageView(){
    //        self.imageScrollView.maximumZoomScale = 4
    //        self.imageScrollView.minimumZoomScale = 0.5
    //        self.imageScrollView.setZoomScale(1, animated: true)
    //        self.imageScrollView.scrollsToTop = false
    //        self.imageScrollView.isScrollEnabled = true
    //        self.imageScrollView.showsVerticalScrollIndicator = false
    //        self.imageScrollView.showsHorizontalScrollIndicator = false
    //    }
    
    func setMagicImageShowImageView(image:UIImage){
        
        //        magicView = GPUImageView(frame: magicImageView.bounds)
        //        let sourcePicture = GPUImagePicture.init(image: image, smoothlyScaleOutput: true)
        //        let sepiaFilter = GPUImageSobelEdgeDetectionFilter()
        //        self.magicImageView.addSubview(magicView!)
        //        sepiaFilter.forceProcessing(at: (magicView?.sizeInPixels)!)
        //        sourcePicture?.addTarget(sepiaFilter)
        //        sepiaFilter.addTarget(magicView)
        //        sourcePicture?.processImage()
        
    }
}

extension NEMagicViewController:NEPreViewCollectionViewDelegate,NEMagicImageEngineDelegate{
    
    func preViewCollectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let filterInfo = NEMagicImageEngine.magicFilterInfo(index: indexPath.row)
        
        if let filter = filterInfo?.filter{
            
            filter.useNextFrameForImageCapture()
            let source = GPUImagePicture(image:image)
            source?.addTarget(filter)
            source?.processImage()
            let newImage = filter.imageFromCurrentFramebuffer()
            setMagicImageShowImageView(image: newImage!)
        }
        NELog(message: filterInfo?.params)
        
    }
    
    //返回图片
    func NEMagicImageEngineDelegate(magicComplete image: UIImage) {
        setMagicImageShowImageView(image: image)
    }
    
}


extension NEMagicViewController:UIScrollViewDelegate{
    
    //    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    //        return self.magicImageView
    //    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if (scrollView.bounds.size.width > scrollView.contentSize.width) {
        }
        if (scrollView.bounds.size.height > scrollView.contentSize.height) {
        }
    }
    
    
}
extension NEMagicViewController{
    
    
}
