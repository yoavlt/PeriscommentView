![PeriscommentView](https://raw.githubusercontent.com/yoavlt/PeriscommentView/master/periscommentView.png)

This module can show name and comment, design inspired by [Periscope](http://periscope.tv).
The demo is the following.

![Demo](https://raw.githubusercontent.com/yoavlt/PeriscommentView/master/periscommentViewDemoLow.gif)

As you can see, profile color is picked at random and long comments is supported.

## Installation
[CocoaPods](http://cocoapods.org) is a library manager for iOS projects. To install using CocoaPods:
```
pod 'PeriscommentView', '0.0.1'
```

## Usage
``` swift
import PeriscommentView

let periscommentView: PeriscommentView = ...
let profileImage = UIImage(named: "hoge.png")!
let name = "name"
let comment = "comment"
PeriscommentView.addCell(profileImage, name: name, comment: comment)
```

## License
under MIT License
