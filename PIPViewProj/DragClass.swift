//
//  PIPProtocol.swift
//  PIPViewProj
//
//  Created by Samuel Lee on 6/25/18.
//  Copyright © 2018 Samuel Lee. All rights reserved.
//

import UIKit

//protocol Draggable where Self: UIView {
//    var panSelector: Selector { get }
//    var tapSelector: Selector { get }
//    var originalFrame: CGRect { get set }
//    func enableGestures()
//}
//
//extension Draggable {
//    func enableGestures() {
//        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: panSelector)
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: tapSelector)
//        addGestureRecognizer(panGestureRecognizer)
//        addGestureRecognizer(tapGestureRecognizer)
//    }
//
//    func detectPan(_ recognizer:UIPanGestureRecognizer) {
//        if self.frame.height == originalFrame.height {
//            if recognizer.translation(in: self).y >= 0 {
//                self.frame.origin.y = recognizer.translation(in: self).y
//            }
//            if recognizer.state == .ended {
//                if(self.frame.origin.y >= self.frame.height/6) {
//                    UIView.animate(withDuration: 0.3) {
//                        self.frame = CGRect(x: 0, y: self.frame.height/1.13, width: self.frame.width, height: self.frame.height/11)
//                    }
//                } else {
//                    UIView.animate(withDuration: 0.5) {
//                        self.frame.origin = CGPoint(x: 0, y: 0)
//                    }
//                }
//            }
//        }
//    }
//
//    func detectTap (_ recognizer: UITapGestureRecognizer) {
//        UIView.animate(withDuration: 0.5) {
//            self.frame = self.originalFrame
//        }
//    }
//}

class DragView: UIView {
    var panSelector: Selector
    var tapSelector: Selector
    var originalFrame: CGRect

    override init(frame: CGRect) {
        originalFrame = UIScreen.main.bounds
        panSelector = #selector(detectPan(_:))
        tapSelector = #selector(detectTap(_:))
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

    @objc func detectPan(_ recognizer: UIPanGestureRecognizer) {
        if self.frame.height == originalFrame.height {
            if recognizer.translation(in: self).y >= 0 {
                self.frame.origin.y = recognizer.translation(in: self).y
            }
            if recognizer.state == .ended {
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

    @objc func detectTap (_ recognizer: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5) {
            self.frame = self.originalFrame
        }
    }
}
