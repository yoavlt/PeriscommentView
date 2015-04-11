//
//  PeriscommentMark.swift
//  PeriscommentView
//
//  Created by Takuma Yoshida on 2015/04/10.
//  Copyright (c) 2015 Uniface, Inc. All rights reserved.
//

import UIKit

@IBDesignable class PeriscommentMark : UIView {

    @IBInspectable let color: UIColor = ColorGenerator().pick()
    @IBInspectable var imageView: UIImageView?
    
    init(frame: CGRect, image: UIImage) {
        super.init(frame: frame)
        setupView(image)
    }
    
    private func setupView(image: UIImage) {
        imageView = UIImageView(image: image)
        imageView!.frame = self.frame
        imageView!.contentMode = UIViewContentMode.ScaleAspectFit
        self.addSubview(imageView!)
        
        let colorView = UIView(frame: self.frame)
        colorView.backgroundColor = self.color
        self.addSubview(colorView)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

