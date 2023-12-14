//
//  SauceDetailsViewController.swift
//  RxSwift_
//
//  Created by Mac on 05/12/2023.
//

import UIKit

class SauceDetailsViewController: UIViewController {
    
    let pageControl = UIPageControl()
    
//    let images: [UIColor] = [.red, .blue, .green, .brown]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configurePageControl()
        pageControlSelectedAction()
    }
    
    func configurePageControl() {
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1)
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.frame = CGRect(x: 0, y: 320, width: view.frame.size.width, height: 50)
    }
    
    func pageControlSelectedAction() {
        let action = UIAction { [weak self] _ in
            self?.pageControlTapped(self!.pageControl)
        }
        pageControl.addAction(action, for: .primaryActionTriggered)
    }
    
    func pageControlTapped(_ sender: UIPageControl) {
       // let sauceSection: Int = sender.currentPage
    }
    
    func setupViews() {
        view.addSubview(pageControl)
    }
}
