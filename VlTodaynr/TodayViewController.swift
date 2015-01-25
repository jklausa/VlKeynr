//
//  TodayViewController.swift
//  VlTodaynr
//
//  Created by Jan Klausa on 25/01/15.
//  Copyright (c) 2015 Michał Kałużny. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {

    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: 250)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      if segue.identifier == "embedKeyboard" {
        if let dvc = segue.destinationViewController as? KeyboardViewController {
          dvc.isActuallyAKeyboard = false
        }
      }
    }

    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
      return UIEdgeInsetsZero
    }
}
