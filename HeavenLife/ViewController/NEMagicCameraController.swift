//
//  NEMagicCameraController.swift
//  HeavenLife
//
//  Created by hosa on 2017/4/14.
//  Copyright © 2017年 Sherlock. All rights reserved.
//

import UIKit

class NEMagicCameraController: UIViewController {

    var videoCamera:GPUImageVideoCamera?
    var filterView:GPUImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.title = "You Are My Sunshine";

        videoCamera = GPUImageVideoCamera.init(sessionPreset: AVCaptureSessionPreset640x480, cameraPosition: .front)
        videoCamera?.outputImageOrientation = .portrait
        videoCamera?.horizontallyMirrorFrontFacingCamera = true
        filterView = GPUImageView.init(frame: view.bounds)
        filterView?.center = view.center
        view.addSubview(filterView!)
        videoCamera?.addTarget(filterView)
        videoCamera?.startCapture()
        filterView?.setBackgroundColorRed(252/256, green: 157/256, blue: 154/256, alpha: 1)
        let beautifyFilter = GPUImageBeautifyFilter()
        videoCamera?.addTarget(beautifyFilter)
        beautifyFilter.addTarget(filterView)
        
        let takePhotoBtn = UIButton(type: .custom)
        takePhotoBtn.frame = CGRect(x: 0, y: 0, width: 66, height: 66)
        takePhotoBtn.backgroundColor = UIColor.white
        takePhotoBtn.center = CGPoint(x: view.centerX, y: view.height-40)
        takePhotoBtn.layer.cornerRadius = 33
        takePhotoBtn.layer.masksToBounds = true
        takePhotoBtn.addTarget(self, action: #selector(takePhotoBtnDidClick), for: .touchUpInside)
        view.addSubview(takePhotoBtn)
    }
    func takePhotoBtnDidClick() {
        NELog(message: "咔嚓")
    }
}
