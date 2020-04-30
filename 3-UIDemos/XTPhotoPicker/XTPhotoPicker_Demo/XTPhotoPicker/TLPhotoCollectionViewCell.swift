//
//  TLPhotoCollectionViewCell.swift
//  TLPhotosPicker
//
//  Created by wade.hawk on 2017. 5. 3..
//  Copyright © 2017년 wade.hawk. All rights reserved.
//

import UIKit
import PhotosUI

open class TLPhotoCollectionViewCell: UICollectionViewCell {
    private var observer: NSObjectProtocol?
    
    @IBOutlet weak var selectionSatusImageView: UIImageView!
    @IBOutlet open var imageView: UIImageView?
    @IBOutlet open var indicator: UIActivityIndicatorView?
    @objc open var isCameraCell = false
    @objc  public var tapRightChooseBlock :(() ->())?
    
    @objc open func popScaleAnim() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        }) { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionSatusImageView.image = TLBundle.podBundleImage(named: "unchoose")
        let tapGeture = UITapGestureRecognizer(target: self, action: #selector(tapGetureAction))
         self.selectionSatusImageView.addGestureRecognizer(tapGeture)
    }
    
     @objc  func tapGetureAction() {
        if tapRightChooseBlock != nil {
            tapRightChooseBlock?()
        }
    }

    @objc open func configCameraItem() {
        self.selectionSatusImageView.isHidden = true
    }
    @objc open var selectedAsset: Bool = false {
        willSet(newValue) {
            self.selectionSatusImageView.isHidden = false
            if newValue {
                self.selectionSatusImageView.image = TLBundle.podBundleImage(named: "choose")
            }else{
                self.selectionSatusImageView.image = TLBundle.podBundleImage(named: "unchoose")
            }
            if !newValue {
                
            }
        }
    }
    
    @objc open func selectedCell() {
        
    }
    
    @objc open func willDisplayCell() {
        
    }
    
    @objc open func endDisplayingCell() {
        
    }
    
    
    override open func prepareForReuse() {
        super.prepareForReuse()
        self.selectedAsset = false
    }
    
}
