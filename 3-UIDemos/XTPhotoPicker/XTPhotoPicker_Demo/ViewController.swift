//
//  ViewController.swift
//  XTPhotoPicker_Demo
//
//  Created by DragonLi on 2018/4/8.
//  Copyright © 2018年 DragonLi. All rights reserved.
//

import UIKit

import Photos


class ViewController: UIViewController ,TLPhotosPickerViewControllerDelegate{
    
    var selectedAssets = [TLPHAsset]()
    //     var viewController = TLPhotosPickerViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let viewController = TLPhotosPickerViewController()  // 内存问题
        viewController.delegate = self
        //        viewController.didExceedMaximumNumberOfSelection = { [weak self] (picker) in
        ////            self?.showExceededMaximumAlert(vc: picker)
        //        }
        viewController.configure = TLPhotosPickerConfigure()
        viewController.selectedAssets = self.selectedAssets
        self.present(viewController, animated: true, completion: nil)
    }
    
    func dismissPhotoPicker(withTLPHAssets: [TLPHAsset]) {
        self.selectedAssets = withTLPHAssets
        var picModelArray = [XTPicModel]()  // 模型数组
        // gif  jpg  png  忽略转换
        for asset in self.selectedAssets {  // asset.ImageExtType
            let model = XTPicModel()
            if asset.extType() == .gif {
                PHCachingImageManager.default().requestImageData(for: asset.phAsset!, options: nil) { (data, string, _, _) in
                    model.data = data
                    picModelArray.append(model)
                }
                //                PHImageManager.default().requestImageData(for: asset.phAsset!, options: nil) { (data, string, _, _) in
                //                    model.data = data
                //                    picModelArray.append(model)
                //                }
            }else{
                model.image = asset.fullResolutionImage
                picModelArray.append(model)
            }
        }
        print(picModelArray)
    }
    
    func photoPickerDidCancel() {
        // cancel
    }
    
    func didExceedMaximumNumberOfSelection(picker: TLPhotosPickerViewController) {
        self.showExceededMaximumAlert(vc: picker)
    }
    
    func handleNoAlbumPermissions(picker: TLPhotosPickerViewController) {
        picker.dismiss(animated: true) {
            let alert = UIAlertController(title: "", message: "Denied albums permissions granted", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func handleNoCameraPermissions(picker: TLPhotosPickerViewController) {
        let alert = UIAlertController(title: "", message: "Denied camera permissions granted", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        picker.present(alert, animated: true, completion: nil)
    }
    
    func showExceededMaximumAlert(vc: UIViewController) {
        let alert = UIAlertController(title: "", message: "Exceed Maximum Number Of Selection", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
}

