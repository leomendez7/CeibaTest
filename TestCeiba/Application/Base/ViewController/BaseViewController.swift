//
//  BaseViewController.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 23/08/22.
//

import UIKit
import Lottie
import ObjectMapper
import CoreData

class BaseViewController: UIViewController {
    
    public var animationView: AnimationView = AnimationView(name: "loading")
    public let backgroundLoadingView = UIView()
    public let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundLoadingView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = ColorScheme.green
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func configureBackgroundLoadingView() {
        backgroundLoadingView.backgroundColor = .white
        view.addSubview(backgroundLoadingView)
        let views = ["view": backgroundLoadingView]
        backgroundLoadingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views))
        backgroundLoadingView.isHidden = true
    }

    func configurateAnimationView() {
        configureBackgroundLoadingView()
        animationView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        backgroundLoadingView.addSubview(animationView, contentMode: .center)
        animationView.loopMode = .loop
    }

    func playAnimateView() {
        configurateAnimationView()
        backgroundLoadingView.isHidden = false
        animationView.play()
    }

    func stopAnimate() {
        animationView.stop()
        backgroundLoadingView.isHidden = true
    }
    
}
