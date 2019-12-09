//
//  BaseViewController.swift
//  Banki
//
//  Created by Nihat on 16.08.2018.
//  Copyright © 2018 Nihat Basmacı. All rights reserved.
//

import UIKit

class BaseViewModel: NSObject {

    var isLoading = true

    var onLoadStart: (() -> Void)?
    var onLoadEnd: (() -> Void)?
    var onChange: (() -> Void)?
    var onLoadError: (() -> Void)?

    func didChange() {
        self.onChange?()
    }

    func startLoading() {
        self.isLoading = true
        self.onLoadStart?()
    }

    func endLoading() {
        self.isLoading = false
        self.didChange()
        self.onLoadEnd?()
    }

}
