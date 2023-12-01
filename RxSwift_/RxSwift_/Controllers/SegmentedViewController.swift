//
//  SegmentedViewController.swift
//  RxSwift_
//
//  Created by Mac on 16/11/2023.
//

import UIKit
//MARK: - Objects properties and Constraints
class SegmentedControlViewController: UIViewController, LoginViewControllerDelegate {
    
    //var delegate: AppCoordinateDelegate?
    
    let segmentedControlIndicatorView = UIView()
    
    let topView = CustomTopView(color: .white)
    
    let appLogo = CustomImageView(image: UIImage(named: "appLogo"))
    
    lazy var segmentedControl: UISegmentedControl = {
        let items = ["Login", "Sign-up"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segmentedControl.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        segmentedControl.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        return segmentedControl
    }()
    
    let loginView = LoginView()
    
    let signupView = SignupView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatingUi()
    }
    
    func updatingUi() {
        setupViews()
        setupSegmentsTappedAction()
        setupSegmentedControlIndicator()
        loginView.delegate = self
        view.backgroundColor = #colorLiteral(red: 0.9436392188, green: 0.9436392188, blue: 0.9436392188, alpha: 1)
        appLogo.backgroundColor = .white
    }
    
    func setupSegmentsTappedAction() {
        let action = UIAction { [weak self] _ in
            self?.segmentedControlChanged(self!.segmentedControl)
        }
        segmentedControl.addAction(action, for: .valueChanged)
    }
    
    func setupSegmentedControlIndicator() {
        segmentedControlIndicatorView.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1)
        let segmentedWidth = segmentedControl.frame.width/CGFloat(segmentedControl.numberOfSegments)
        segmentedControlIndicatorView.frame = CGRect(x: 40, y: 398, width: segmentedWidth * 2, height: 4)
        topView.addSubview(segmentedControlIndicatorView)
    }
}

extension SegmentedControlViewController {
    
    func setupViews() {
        topView.addSubview(appLogo)
        topView.addSubview(segmentedControl)
        let subviews = [topView, loginView, signupView]
        for subview in subviews {
            view.addSubview(subview)
        }
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            appLogo.topAnchor.constraint(equalTo: topView.topAnchor, constant: 100),
            appLogo.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            appLogo.heightAnchor.constraint(equalToConstant: 150),
            appLogo.widthAnchor.constraint(equalToConstant: 150),
            
            segmentedControl.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            segmentedControl.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10),
            segmentedControl.widthAnchor.constraint(equalToConstant: 400),
            segmentedControl.heightAnchor.constraint(equalToConstant: 25),
            
            loginView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 1),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            signupView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 1),
            signupView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            signupView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            signupView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        signupView.isHidden =  true
        loginView.translatesAutoresizingMaskIntoConstraints = false
        signupView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func segmentedControlChanged(_ sender: UISegmentedControl) {
        loginView.isHidden = sender.selectedSegmentIndex == 1
        signupView.isHidden = sender.selectedSegmentIndex == 0
        
        let segmentedWidth = segmentedControl.frame.width/CGFloat(segmentedControl.numberOfSegments)
        let indicatorX = CGFloat(sender.selectedSegmentIndex) * segmentedWidth
        UIView.animate(withDuration: 0.2) {
            self.segmentedControlIndicatorView.frame.origin.x = indicatorX + 30
        }
    }
    
    func customViewDidPresentVC() {
        let vc = TabBarViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
}
