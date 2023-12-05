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
    
    let foodView = FoodsView()
    let drinksView = DrinksView()
    let snacksView = SnacksView()
    let sauceView = SauceView()
    
    let segmentedControlIndicatorView = UIView()
    
    lazy var segmentedControl: UISegmentedControl = {
        let items = ["Foods", "Drinks", "Snacks", "Sauce"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segmentedControl.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
        segmentedControl.setTitleTextAttributes([.foregroundColor: #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1)], for: .selected)
        segmentedControl.tintColor = #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1)
        segmentedControl.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        return segmentedControl
    }()
    
    lazy var segmentedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        updatingUi()
    }
    
    func updatingUi() {
        setupViews()
        hideBackButton()
        setupTitleLabel()
        setupSegmentedViews()
        setupSearchIconImage()
        setupSideBarButtonAction()
        setupSegmentsTappedAction()
        setupSegmentedControlIndicator()
    }
    
    func hideBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func setupSideBarButtonAction() {
        let action = UIAction { [weak self] _ in
            self?.toggleSideBar()
        }
        sideBarButton.addAction(action, for: .primaryActionTriggered)
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
        let subviews = [sideBarButton, titleLabel, searchTextField, searchIconImage, segmentedView, segmentedControl, foodView, drinksView, snacksView, sauceView]
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
            
            segmentedView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 40),
            segmentedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            segmentedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            segmentedView.heightAnchor.constraint(equalToConstant: 10),
            
            segmentedControl.topAnchor.constraint(equalTo: segmentedView.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: segmentedView.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: segmentedView.trailingAnchor),
            segmentedControl.bottomAnchor.constraint(equalTo: segmentedView.bottomAnchor),
            
            foodView.topAnchor.constraint(equalTo: segmentedView.bottomAnchor, constant: 20),
            foodView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            foodView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            foodView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            drinksView.topAnchor.constraint(equalTo: segmentedView.bottomAnchor, constant: 20),
            drinksView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            drinksView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            drinksView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            snacksView.topAnchor.constraint(equalTo: segmentedView.bottomAnchor, constant: 20),
            snacksView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            snacksView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            snacksView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            sauceView.topAnchor.constraint(equalTo: segmentedView.bottomAnchor, constant: 20),
            sauceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            sauceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            sauceView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
        ])
    }
    
    func setupSegmentedViews() {
        sauceView.isHidden =  true
        snacksView.isHidden = true
        drinksView.isHidden = true
        foodView.delegate = self
        drinksView.delegate = self
        snacksView.delegate = self
        sauceView.delegate = self
        foodView.translatesAutoresizingMaskIntoConstraints = false
        drinksView.translatesAutoresizingMaskIntoConstraints = false
        snacksView.translatesAutoresizingMaskIntoConstraints = false
        sauceView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func toggleSideBar() {
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
    
    func setupSegmentsTappedAction() {
        let action = UIAction { [weak self] _ in
            self?.segmentedControlChanged(self!.segmentedControl)
        }
        segmentedControl.addAction(action, for: .valueChanged)
    }
    
    func setupSegmentedControlIndicator() {
        segmentedControlIndicatorView.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1)
        let segmentedWidth = segmentedControl.frame.width/CGFloat(segmentedControl.numberOfSegments )
        segmentedControlIndicatorView.frame = CGRect(x: 15, y: 30, width: segmentedWidth * 1, height: 2)
        segmentedView.addSubview(segmentedControlIndicatorView)
    }
    
    func segmentedControlChanged(_ sender: UISegmentedControl) {
        sauceView.isHidden = sender.selectedSegmentIndex != 3
        snacksView.isHidden = sender.selectedSegmentIndex != 2
        drinksView.isHidden = sender.selectedSegmentIndex != 1
        foodView.isHidden = sender.selectedSegmentIndex != 0
        
        let segmentedWidth = segmentedControl.frame.width/CGFloat(segmentedControl.numberOfSegments)
        let indicatorX = CGFloat(sender.selectedSegmentIndex) * segmentedWidth
        UIView.animate(withDuration: 0.2) {
            self.segmentedControlIndicatorView.frame.origin.x = indicatorX + 15
        }
    }
}

extension HomeViewController: SeeMoreFoodsDelegate {
    func seeMoreFoodsButtonTapped() {
        let vc = SeeMoreFoodsViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func didSelectFoodsItem(at index: Int) {
        let vc = FoodsDetailsViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}

extension  HomeViewController: SeeMoreDrinksDelegate {
    func didSelectDrinksItem(at index: Int) {
        print("print")
    }
    
    func seeMoreDrinksButtonTapped() {
        print("print")
    }
}

extension HomeViewController: SeeMoreSnacksDelegate {
    func didSelectSnacksItem(at index: Int) {
        print("print")
    }
    
    func seeMoreSnacksButtonTapped() {
        print("print")
    }
}

extension HomeViewController: SeeMoreSauceDelegate {
    func didSelectSauceItem(at index: Int) {
        print("print")
    }
    
    func seeMoreSauceButtonTapped() {
        print("print")
    }
}
