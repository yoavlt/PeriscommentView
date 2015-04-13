//
//  PeriscommentView.swift
//  PeriscommentView
//
//  Created by Takuma Yoshida on 2015/04/08.
//  Copyright (c) 2015 Uniface, Inc. All rights reserved.
//

import UIKit

public class PeriscommentView: UIView {
    
    private var visibleCells: [PeriscommentCell] = []
    private var config: PeriscommentConfig
    
    convenience override init(frame: CGRect) {
        let config = PeriscommentConfig()
        self.init(frame: frame, config: config)
    }

    required public init(coder aDecoder: NSCoder) {
        self.config = PeriscommentConfig()
        super.init(coder: aDecoder)
    }
    
    init(frame: CGRect, config: PeriscommentConfig) {
        self.config = config
        super.init(frame: frame)
    }
    
    override public func willMoveToSuperview(newSuperview: UIView?) {
        super.willMoveToSuperview(newSuperview)
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = config.layout.backgroundColor
    }
    
    public func addCell(cell: PeriscommentCell) {
        cell.frame = CGRect(origin: CGPoint(x: 0, y: self.frame.height), size: cell.frame.size)
        visibleCells.append(cell)
        self.addSubview(cell)
        
        UIView.animateWithDuration(self.config.appearDuration, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            let dy = cell.frame.height + self.config.layout.cellSpace
            for c in self.visibleCells {
                let origin = c.transform
                let transform = CGAffineTransformMakeTranslation(0, -dy)
                c.transform = CGAffineTransformConcat(origin, transform)
            }
        }, completion: nil)
        
        UIView.animateWithDuration(self.config.disappearDuration, delay: self.config.appearDuration, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            cell.alpha = 0.0
        }) { (Bool) -> Void in
            cell.removeFromSuperview()
            self.visibleCells.removeLast()
        }
    }
    
    public func addCell(profileImage: UIImage, name: String, comment: String) {
        let rect = CGRect.zeroRect
        let cell = PeriscommentCell(frame: rect, profileImage: profileImage, name: name, comment: comment, config: self.config)

        self.addCell(cell)
    }

}

