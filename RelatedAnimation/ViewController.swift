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
        
        slider.addAction(
            UIAction(handler: { [weak self] _ in
                self?.animator.fractionComplete = CGFloat(self?.sliderView.value ?? 0)
            }),
            for: .valueChanged
        )
        
        slider.addAction(
            UIAction(handler: { [weak self] _ in
                self?.animator.startAnimation()
                self?.sliderView.value = 1
            }),
            for: [.touchUpInside, .touchUpOutside]
        )
        
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
        animator.pausesOnCompletion = true
        
        animator.addAnimations {
            self.squareView.frame.origin.x = self.view.frame.width - (self.view.layoutMargins.right * 2) - self.squareView.frame.width
            self.squareView.transform = .identity.scaledBy(x: 1.5, y: 1.5).rotated(by: .pi / 2)
        }
    }
}

