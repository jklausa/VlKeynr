//
//  VlKeynrButton.swift
//  VlKeynr
//
//  Created by Jan Klausa on 15/11/14.
//  Copyright (c) 2014 Michał Kałużny. All rights reserved.
//

import UIKit

class VlKeynrButton : UIButton {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    @IBInspectable var associatedSound: VlKeynrSound?
}