//
//  PeriscommentCell.swift
//  PeriscommentView
//
//  Created by Takuma Yoshida on 2015/04/10.
//  Copyright (c) 2015 Uniface, Inc. All rights reserved.
//

import UIKit

@IBDesignable public class PeriscommentCell: UIView {
    
    var mark: PeriscommentMark?
    let nameLabel: UILabel
    let commentLabel: UILabel
    
    init(frame: CGRect, profileImage: UIImage, name: String, comment: String, config: PeriscommentConfig) {
        let namePos = CGPoint(x: config.layout.markWidth + config.layout.offset, y: config.layout.padding)
        self.nameLabel = UILabel(frame: CGRect(origin: namePos, size: CGSize.zero))
        self.nameLabel.font = config.nameFont.font
        self.nameLabel.textColor = config.nameFont.color
        self.nameLabel.text = name
        self.nameLabel.sizeToFit()
        
        let commentPos = CGPoint(x: config.layout.markWidth + config.layout.offset, y: self.nameLabel.frame.height + config.layout.padding + config.layout.commentSpace)
        let maxCommentWidth = config.layout.maxCommentWidth()
        self.commentLabel = CommentLabel(frame: CGRect(origin: commentPos, size: CGSize.zero), font: config.commentFont, allowLineBreak: config.layout.allowLineBreak, maxWidth: maxCommentWidth)
        self.commentLabel.text = comment
        self.commentLabel.sizeToFit()

        super.init(frame: frame)
        
        setupView(profileImage, name: name, comment: comment, config: config)
    }
    
    internal convenience init(frame: CGRect, profileImage: UIImage, name: String, comment: String) {
        let config = PeriscommentConfig()
        self.init(frame: frame, profileImage: profileImage, name: name, comment: comment, config:config)
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(image: UIImage, name: String, comment: String, config: PeriscommentConfig) {
        self.backgroundColor = UIColor.whiteColor()
        self.layer.cornerRadius = 5
        self.clipsToBounds = true

        self.addSubview(self.nameLabel)
        self.addSubview(self.commentLabel)

        let commentWidth = max(self.nameLabel.frame.width, self.commentLabel.frame.width)
        let inferedWidth = config.layout.markWidth + config.layout.offset + commentWidth + config.layout.padding * 2
        let width = min(inferedWidth, config.layout.maximumWidth)
        let height = config.layout.padding * 2 + config.layout.commentSpace + self.nameLabel.frame.height + self.commentLabel.frame.height
        
        self.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: width, height: height))
        
        let markSize = CGSize(width: config.layout.markWidth, height: height)
        let markRect = CGRect(origin: CGPoint.zero, size: markSize)
        
        self.mark = PeriscommentMark(frame: markRect, image: image)
        self.addSubview(self.mark!)
    }

}
