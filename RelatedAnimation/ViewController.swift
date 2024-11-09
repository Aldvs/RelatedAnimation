//
//  ViewController.swift
//  RelatedAnimation
//
//  Created by admin on 09.11.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        setupRectangle()
    }
    
    private func setupRectangle() {
        let rotatingView = UIView()
        rotatingView.frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        rotatingView.backgroundColor = UIColor.green
        rotatingView.layer.cornerRadius = 17
        view.addSubview(rotatingView)
    }
}

