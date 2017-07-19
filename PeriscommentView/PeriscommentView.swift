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
        super.init(coder: aDecoder)!
    }
    
    init(frame: CGRect, config: PeriscommentConfig) {
        self.config = config
        super.init(frame: frame)
    }
    
    override public func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = config.layout.backgroundColor
    }
    
    public func addCell(cell: PeriscommentCell) {
        cell.frame = CGRect(origin: CGPoint(x: 0, y: self.frame.height), size: cell.frame.size)
        visibleCells.append(cell)
        self.addSubview(cell)
        
        UIView.animate(withDuration: self.config.appearDuration, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
            let dy = cell.frame.height + self.config.layout.cellSpace
            for c in self.visibleCells {
                let origin = c.transform
                let transform = CGAffineTransform(translationX: 0, y: -dy)
                c.transform = origin.concatenating(transform)
            }
        }, completion: nil)
        
        UIView.animate(withDuration: self.config.disappearDuration, delay: self.config.appearDuration, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
            cell.alpha = 0.0
        }) { (Bool) -> Void in
            cell.removeFromSuperview()
            self.visibleCells.removeLast()
        }
    }
    
    public func addCell(profileImage: UIImage, name: String, comment: String) {
        let rect = CGRect.zero
        let cell = PeriscommentCell(frame: rect, profileImage: profileImage, name: name, comment: comment, config: self.config)

        self.addCell(cell: cell)
    }

}

