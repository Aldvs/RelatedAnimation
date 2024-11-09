//
//  ViewController.swift
//  RelatedAnimation
//
//  Created by admin on 09.11.2024.
//

import UIKit

class ViewController: UIViewController {

    let animator = UIViewPropertyAnimator(duration: 0.7, curve: .easeOut)
    
    private lazy var squareView: UIView = {
        let square = UIView()
        
        square.backgroundColor = .systemCyan
        square.layer.cornerRadius = 17
        
        
        return square
    }()
    
    private lazy var sliderView: UISlider = {
        let slider = UISlider()
        

        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupAnimator()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
        guard squareView.transform == .identity else { return }
        
        squareView.frame = .init(x: view.layoutMargins.left, y: 110, width: 80, height: 80)
        
        sliderView.sizeToFit()
        sliderView.frame = .init(
            x: view.layoutMargins.left,
            y: squareView.frame.maxY + 44,
            width: view.frame.width - (view.layoutMargins.left * 2),
            height: 80
        )
        
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(squareView)
        view.addSubview(sliderView)
    }
    
    private func setupAnimator() {
        
    }
}

