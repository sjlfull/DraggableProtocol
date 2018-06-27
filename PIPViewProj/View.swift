//
//  View.swift
//  PIPViewProj
//
//  Created by Samuel Lee on 6/25/18.
//  Copyright © 2018 Samuel Lee. All rights reserved.
//

import UIKit

class View: UIView, Draggable {
     var panSelector: Selector
     var tapSelector: Selector
     var originalFrame : CGRect

     override init(frame: CGRect) {
          originalFrame = UIScreen.main.bounds
          panSelector = #selector(panDetect(_:))
          tapSelector = #selector(tapDetect(_:))
          super.init(frame: frame)
          enableGestures()
          self.backgroundColor = UIColor.blue
     }

     required init?(coder aDecoder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
     }

     @objc func panDetect(_ panRecognizer: UIPanGestureRecognizer) {
          detectPan(panRecognizer)
     }

     @objc func tapDetect(_ tapRecognizer: UITapGestureRecognizer) {
          detectTap(tapRecognizer)
     }
}
