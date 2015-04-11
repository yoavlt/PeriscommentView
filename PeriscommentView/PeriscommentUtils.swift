//
//  PeriscommentView.swift
//  PeriscommentView
//
//  Created by Takuma Yoshida on 2015/04/10.
//  Copyright (c) 2015 Uniface, Inc. All rights reserved.
//

import UIKit

class ColorGenerator {
    
    let red = UIColor(red: 0.96, green: 0.26, blue: 0.21, alpha: 0.7)
    let pink = UIColor(red: 0.91, green: 0.12, blue: 0.38, alpha: 0.7)
    let purple = UIColor(red: 0.61, green: 0.15, blue: 0.69, alpha: 0.7)
    let blue = UIColor(red: 0.12, green: 0.59, blue: 0.95, alpha: 0.7)
    let green = UIColor(red: 0.3, green: 0.69, blue: 0.31, alpha: 0.7)
    let yellow = UIColor(red: 1.0, green: 0.92, blue: 0.23, alpha: 0.7)
    let orange = UIColor(red: 1.0, green: 0.60, blue: 0, alpha: 0.7)
    
    func pick() -> UIColor {
        let colors = [red, pink, purple, blue, green, yellow, orange]
        let index = arc4random_uniform(UInt32(colors.count))
        return colors[Int(index)]
    }
    
}

struct PeriscommentConfig {
    let layout: PeriscommentLayout
    let commentFont = PeriscommentFont(font: UIFont.systemFontOfSize(14.0), color: UIColor.blackColor())
    let nameFont = PeriscommentFont(font: UIFont.systemFontOfSize(12.0), color: UIColor.lightGrayColor())
    let disappearDuration = 6.0
    let appearDuration = 1.0
    init() {
        self.layout = PeriscommentLayout()
    }
}

struct PeriscommentLayout {
    let offset: CGFloat = 10.0
    let padding: CGFloat = 2.5
    let commentSpace: CGFloat = 1.5
    let cellSpace: CGFloat = 4.0
    let maximumWidth: CGFloat = 200.0
    let markWidth: CGFloat = 40.0
    let allowLineBreak = true
    let backgroundColor = UIColor.clearColor()
    init() {
        
    }
    func maxCommentWidth() -> CGFloat {
        return self.maximumWidth - (self.padding * 2 + self.markWidth + self.offset)
    }
}

struct PeriscommentFont {
    let font: UIFont
    let color: UIColor
}

class CommentLabel : UILabel {
    var allowLineBreak: Bool
    let maxCommentWidth: CGFloat
    init(frame: CGRect, font: PeriscommentFont, allowLineBreak: Bool, maxWidth: CGFloat) {
        self.allowLineBreak = allowLineBreak
        self.maxCommentWidth = maxWidth
        super.init(frame: frame)
        self.textColor = font.color
        self.font = font.font
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sizeToFit() {
        if allowLineBreak {
            self.lineBreakMode = NSLineBreakMode.ByWordWrapping
            self.numberOfLines = 0
        }
        super.sizeToFit()
        
        self.frame.size.width = min(maxCommentWidth, self.frame.size.width)
        super.sizeToFit()
    }
}


