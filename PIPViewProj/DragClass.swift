//
//  PIPProtocol.swift
//  PIPViewProj
//
//  Created by Samuel Lee on 6/25/18.
//  Copyright © 2018 Samuel Lee. All rights reserved.
//

import UIKit

class DragView: UIView {
    var panSelector: Selector
    var tapSelector: Selector
    var originalFrame: CGRect

    override init(frame: CGRect) {
        originalFrame = UIScreen.main.bounds
        panSelector = #selector(detectPan(_:))
        tapSelector = #selector(detectTap)
        super.init(frame: frame)
        enableGestures()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func enableGestures() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: panSelector)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: tapSelector)
        addGestureRecognizer(panGestureRecognizer)
        addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func detectPan(_ panRecognizer: UIPanGestureRecognizer) {
            if self.frame.height == originalFrame.height || self.frame.height == originalFrame.width {
                if panRecognizer.translation(in: self).y >= 0 {
                    self.frame.origin.y = panRecognizer.translation(in: self).y
                }
                if panRecognizer.state == .ended {
                    if(self.frame.origin.y >= self.frame.height/6) {
                        UIView.animate(withDuration: 0.3) {
                            self.frame = CGRect(x: 0, y: self.frame.height/1.13, width: self.frame.width, height: self.frame.height/11)
                        }
                    } else {
                        UIView.animate(withDuration: 0.5) {
                            self.frame.origin = CGPoint(x: 0, y: 0)
                        }
                    }
                }
        }
    }

    @objc func detectTap() {
        if UIDeviceOrientationIsPortrait(UIDevice.current.orientation) {
            UIView.animate(withDuration: 0.5) {
                self.frame = self.originalFrame
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.frame = CGRect(x: 0, y: 0, width: self.originalFrame.height, height: self.originalFrame.width)
            }
        }
    }
}
