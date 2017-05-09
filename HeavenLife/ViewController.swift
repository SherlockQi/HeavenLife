//
//  ViewController.swift
//  HeavenLife
//
//  Created by hosa on 2017/4/13.
//  Copyright © 2017年 Sherlock. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mainButton_1: UIButton!
    
    
//    @IBOutlet weak var testImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func mainButton_1DidClick(_ sender: UIButton) {
        takePhoteFomeAlbum()
    }
    @IBAction func mainButton_2DidClick(_ sender: UIButton) {
        takePhoteFomeCamera()
    }
    @IBAction func mainButton_3DidClick(_ sender: UIButton) {
        NELog(message: "3333")
    }
    @IBAction func mainButton_4DidClick(_ sender: UIButton) {
        NELog(message: "4444")
    }
    @IBAction func mainButton_5DidClick(_ sender: UIButton) {
        NELog(message: "555")
    }
}

extension ViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func takePhoteFomeAlbum(){
        //判断设置是否支持图片库
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            //初始化图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = self
            //指定图片控制器类型
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            navigationController?.present(picker, animated: true, completion: nil)
            
        }else{
            NELog(message: "读取相册错误")
        }
    }
    //选择图片成功后代理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        NELog(message: info)
        
        let image = info[UIImagePickerControllerOriginalImage] as!UIImage
        picker.dismiss(animated: true) {
            let vc = NEMagicViewController.magicView(image: image.scaleNoImage())
            vc.modalPresentationStyle = .custom
            vc.transitioningDelegate = self
            self.present(vc, animated: true, completion: nil)
        }
    }
}

extension ViewController{
    func takePhoteFomeCamera(){
        navigationController?.pushViewController(NEMagicCameraController(), animated: true)
    }
}

//自定义转场动画
extension ViewController:UIViewControllerTransitioningDelegate{

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return NETransition()
    }

}
