//
//  HomeViewController.swift
//  RxSwift_
//
//  Created by Mac on 16/11/2023.
//

import UIKit

//MARK: - Objects properties
class HomeViewController: UIViewController, SidebarViewControllerDelegate {
    
    let sideBarWidth: CGFloat = 250
    
    var sideBarShowing = false
    
    var sideBarViewController = SideBarViewController()
    
    let sideBarButton = Button(image: UIImage(systemName: "text.alignleft"), label: "", btnTitleColor: .clear, backgroundColor: .clear, radius: 0, imageColor: .black)
    
    let titleLabel = Label(label: "Delicious \nfood for you", textColor: .black, font: UIFont.systemFont(ofSize: 40, weight: .bold))
    
    let searchIconImage = CustomImageView(image: UIImage(systemName: "magnifyingglass"))
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Search"
        textField.addSubview(searchIconImage)
        textField.layer.cornerRadius = 30
        textField.backgroundColor = .systemGray6
        return textField
    }()
    
    lazy var segmentedControlScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var segmentedControl: CustomSegmentedControl = {
        let segmentedControl = CustomSegmentedControl()
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupSideBarButton()
        setupTitleLabel()
        setupSearchIconImage()
    }
    
    func setupSideBarButton() {
        sideBarButton.addTarget(self, action: #selector(toggleSideBar), for: .touchUpInside)
    }
    
    func setupTitleLabel() {
        titleLabel.textAlignment = .left
    }
    
    func setupSearchIconImage() {
        searchIconImage.tintColor = .gray
        searchIconImage.backgroundColor = .clear
    }
}

//MARK: - Objects Constraints, setting up event to toggle the SideBar
extension HomeViewController {
    
    func setupViews() {
        segmentedControlScrollView.addSubview(segmentedControl)
        let subviews = [sideBarButton, titleLabel, searchTextField, searchIconImage, segmentedControlScrollView]
        for subview in subviews {
            view.addSubview(subview)
        }
        NSLayoutConstraint.activate([
            sideBarButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            sideBarButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            sideBarButton.heightAnchor.constraint(equalToConstant: 40),
            sideBarButton.widthAnchor.constraint(equalToConstant: 40),
            
            titleLabel.topAnchor.constraint(equalTo: sideBarButton.bottomAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            searchTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchTextField.heightAnchor.constraint(equalToConstant: 60),
            
            searchIconImage.topAnchor.constraint(equalTo: searchTextField.topAnchor, constant: 22),
            searchIconImage.leadingAnchor.constraint(equalTo: searchTextField.leadingAnchor, constant: 14),
            searchIconImage.widthAnchor.constraint(equalToConstant: 20),
            searchIconImage.heightAnchor.constraint(equalToConstant: 20),
            
            segmentedControlScrollView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 40),
            segmentedControlScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedControlScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            segmentedControlScrollView.heightAnchor.constraint(equalToConstant: 40),
            
            segmentedControl.topAnchor.constraint(equalTo: segmentedControlScrollView.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: segmentedControlScrollView.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: segmentedControlScrollView.trailingAnchor),
            segmentedControl.bottomAnchor.constraint(equalTo: segmentedControlScrollView.bottomAnchor)
        ])
        segmentedControlScrollView.isScrollEnabled = true
        segmentedControlScrollView.showsHorizontalScrollIndicator = false
    }
    
    @objc func toggleSideBar() {
        if sideBarShowing {
            hideSideBar()
        } else {
            showSideBar()
        }
    }
    
    func showSideBar() {
        sideBarViewController = SideBarViewController()
        sideBarViewController.delegate = self
        addChild(sideBarViewController)
        view.addSubview(sideBarViewController.view)
        
        sideBarViewController.view.frame = CGRect(x: -sideBarWidth, y: 0, width: sideBarWidth, height: view.frame.height)
        
        UIView.animate(withDuration: 0.3) {
            self.sideBarViewController.view.frame = CGRect(x: 0, y: 0, width: self.sideBarWidth, height: self.view.frame.height)
        }
        sideBarShowing = true
        tabBarController?.tabBar.isHidden = true
    }
    
    func hideSideBar() {
        UIView.animate(withDuration: 0.3, animations: {
            self.sideBarViewController.view.frame = CGRect(x: -self.sideBarWidth, y: 0, width: self.sideBarWidth, height: self.view.frame.height)
        }) { (completed) in
            self.sideBarViewController.view.removeFromSuperview()
            self.sideBarViewController.removeFromParent()
            self.sideBarShowing = false
        }
        tabBarController?.tabBar.isHidden = false
    }
    
    func sideBarDidToggleBack() {
        hideSideBar()
    }
}
