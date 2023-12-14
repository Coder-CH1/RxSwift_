//
//  FoodsDetailsViewController.swift
//  RxSwift_
//
//  Created by Mac on 05/12/2023.
//

import UIKit

class FoodsDetailsViewController: UIViewController, UIScrollViewDelegate {
    
    let scrollView = UIScrollView()
    
    let pageControl = UIPageControl()
    
    let imageNames = ["fireIcon", "appLogo", "fireIcon", "appLogo"]
    
    let addToCartButton = Button(image: UIImage(systemName: ""), label: "Add to cart", btnTitleColor: .white, backgroundColor: #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1), radius: 30, imageColor: .clear)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
        tabBarController?.tabBar.isHidden = true
    }
    
    func updateUi() {
        setupViews()
        configureScrollView()
        configurePageControl()
        pageControlSelectedAction()
    }
    
    func configureScrollView() {
        scrollView.frame = view.bounds
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: view.bounds.width * CGFloat(imageNames.count), height: 100)
        
        for (index, imageName) in imageNames.enumerated() {
            let imageView = UIImageView(frame: CGRect(x: view.bounds.width * CGFloat(index), y: 50, width: view.bounds.width, height: 100))
            imageView.image = UIImage(named: imageName)
            imageView.contentMode = .scaleAspectFit
            scrollView.addSubview(imageView)
        }
        view.addSubview(scrollView)
    }
    
    func configurePageControl() {
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1)
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.frame = CGRect(x: 0, y: 320, width: view.frame.size.width, height: 50)
        view.addSubview(pageControl)
    }
    
    func pageControlSelectedAction() {
        let action = UIAction { [weak self] _ in
            self?.pageControlTapped(self!.pageControl)
        }
        pageControl.addAction(action, for: .primaryActionTriggered)
    }
    
    func pageControlTapped(_ sender: UIPageControl) {
        let currentPage = pageControl.currentPage
        let xOffset = view.bounds.width * CGFloat(currentPage)
        scrollView.setContentOffset(CGPoint(x: xOffset, y: 50), animated: false)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.bounds.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
    func setupViews() {
        view.addSubview(addToCartButton)
        NSLayoutConstraint.activate([
            addToCartButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            addToCartButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            addToCartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            addToCartButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}
