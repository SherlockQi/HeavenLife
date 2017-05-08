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
    
    @IBOutlet weak var perviewCollectivew: NEPreViewCollectionView!
    @IBOutlet var sliders: [UISlider]!
    
    var params:[String]?
    var selectFilter:GPUImageFilter?
    
    
    lazy var scrollView:UIScrollView = {
        let rect = CGRect(x: 0, y: 64, width: kScreenWidth(), height: kScreenHeight() - 280)
        var scrollView = UIScrollView(frame: rect)
        scrollView.maximumZoomScale = 4
        scrollView.minimumZoomScale = 0.5
        scrollView.setZoomScale(1, animated: true)
        scrollView.scrollsToTop = false
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.contentSize =  scrollView.frame.size
        return scrollView
    }()
    
    var image:UIImage? = nil
    
    var magicView:GPUImageView?
    
//
//    @IBAction func slider_0ValueChanged(_ sender: UISlider) {
//         NELog(message: sender.value)
//        selectFilter?.setValue(sender.value, forKey: params![0])
//        selectFilter?.forceProcessing(at: (magicView?.sizeInPixels)!)
//        let sourcePicture = GPUImagePicture.init(image: image, smoothlyScaleOutput: true)
//        sourcePicture?.addTarget(selectFilter)
//        selectFilter?.addTarget(magicView)
//        sourcePicture?.processImage()
//        
//    }
//    
//    @IBAction func slider_1ValueChanged(_ sender: UISlider) {
//         NELog(message: sender.value)
//         selectFilter?.setValue(sender.value, forKey: params![1])
//        selectFilter?.forceProcessing(at: (magicView?.sizeInPixels)!)
//        let sourcePicture = GPUImagePicture.init(image: image, smoothlyScaleOutput: true)
//        sourcePicture?.addTarget(selectFilter)
//        selectFilter?.addTarget(magicView)
//        sourcePicture?.processImage()
//    }
//    
//    @IBAction func slider_2ValueChanged(_ sender: UISlider) {
//         NELog(message: sender.value)
//         selectFilter?.setValue(sender.value, forKey: params![2])
//        selectFilter?.forceProcessing(at: (magicView?.sizeInPixels)!)
//        let sourcePicture = GPUImagePicture.init(image: image, smoothlyScaleOutput: true)
//        sourcePicture?.addTarget(selectFilter)
//        selectFilter?.addTarget(magicView)
//        sourcePicture?.processImage()
//    }
    
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
    }
    
    func setMagicImageShowImageView(image:UIImage){
        
        let h = kScreenWidth() * image.size.height / image.size.width
        
        let rect = CGRect(x: 0, y: (scrollView.height - h) * 0.5, width: kScreenWidth(), height:h)
        magicView = GPUImageView(frame: rect)
        magicView?.fillMode = .preserveAspectRatioAndFill
        let sourcePicture = GPUImagePicture.init(image: image, smoothlyScaleOutput: true)
        let sepiaFilter = GPUImageFilter()
        self.scrollView.addSubview(magicView!)
        sepiaFilter.forceProcessing(at: (magicView?.sizeInPixels)!)
        sourcePicture?.addTarget(sepiaFilter)
        sepiaFilter.addTarget(magicView)
        sourcePicture?.processImage()
    }
}


extension NEMagicViewController:NEPreViewCollectionViewDelegate{
    
    func preViewCollectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            changeFilter(index: indexPath.row)
    }

    
    //选择了滤镜之后
    func changeFilter(index:Int){
        
        let filterInfo = filterInfoS[index]
        let sourcePicture = GPUImagePicture.init(image: image, smoothlyScaleOutput: true)
        NELog(message: filterInfo)
        
        if filterInfo.filterGroup == nil && filterInfo.filter == nil{
            magicView?.removeFromSuperview()
            setMagicImageShowImageView(image: image!)
        }
        
        if let filter = filterInfo.filter{
            selectFilter = filter
            filter.forceProcessing(at: (magicView?.sizeInPixels)!)
            sourcePicture?.addTarget(filter)
            filter.addTarget(magicView)
            sourcePicture?.processImage()
        }
        
        if let filter = filterInfo.filterGroup{
            filter.forceProcessing(at: (magicView?.sizeInPixels)!)
            sourcePicture?.addTarget(filter)
            filter.addTarget(magicView)
            sourcePicture?.processImage()
        }

        
        
        
        for filterParam:FilterParam in filterInfo.params! {

            let silder = NETitleSlider.slider(filterParam: filterParam)
            
            
        }

//        params = filterInfo.params
    }
}


extension NEMagicViewController:UIScrollViewDelegate{
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return magicView
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        if (scrollView.bounds.size.width > scrollView.contentSize.width || scrollView.bounds.size.height > scrollView.contentSize.height) {
            magicView?.center = CGPoint(x: scrollView.center.x, y: scrollView.center.y-40)
        }else{
            magicView?.center = CGPoint(x: scrollView.contentSize.width * 0.5, y: scrollView.contentSize.height * 0.5)
        }
        scrollView.contentSize = magicView!.frame.size
    }
}
extension NEMagicViewController{
    
    
}
