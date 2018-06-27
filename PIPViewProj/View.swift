//
//  View.swift
//  PIPViewProj
//
//  Created by Samuel Lee on 6/25/18.
//  Copyright © 2018 Samuel Lee. All rights reserved.
//

import UIKit

class View: DragView {

     override init(frame: CGRect) {
          super.init(frame: frame)
          self.backgroundColor = UIColor.blue
     }

     required init?(coder aDecoder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
     }
}
