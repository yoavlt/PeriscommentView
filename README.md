<a align="center">
<img src="https://dl.dropboxusercontent.com/u/32240968/periscommentView.png" alt="PeriscommentView" width="500" height="80">
</p>

This module can show name and comment, design inspired by [Periscope](http://periscope.tv).
The demo is the following.

![Demo](https://dl.dropboxusercontent.com/u/32240968/periscommentViewDemoLow.gif)

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
