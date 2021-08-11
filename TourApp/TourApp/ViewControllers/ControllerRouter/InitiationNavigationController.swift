//
//  InitiationNavigationController.swift
//  TourApp
//
//  Created by Vu Minh Tam on 8/9/21.
//

import UIKit
import Localize_Swift

class InitiationNavigationController: UINavigationController {
    
    var customeNavBar: UIView = UIView()
    private var backButton = UIButton.init(type: UIButton.ButtonType.custom)
    private var titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.defaultAppFont(size: 16, type: .bold),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().backIndicatorImage = UIImage()
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage()
        self.navigationBar.backItem?.title = ""
        UIApplication.shared.statusBarStyle = .lightContent
        var notchHeight: CGFloat = 0
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 2436, 2688, 1792:
                print("iPhone X, Xs, Xs Max, Xr")
                notchHeight = 44.0
            default:
                break
            }
        }
        
        customeNavBar.tag = 100
        customeNavBar.backgroundColor = .clear
        customeNavBar.frame = CGRect.init(x: 0, y: -20 - notchHeight, width: UIScreen.main.bounds.size.width, height: 64 + notchHeight)
        self.navigationBar.addSubview(customeNavBar)
        customeNavBar.clipsToBounds = true
        backButton.frame = CGRect.init(x: 0, y: 20 + notchHeight, width: 54, height: 44)
        self.customeNavBar.addSubview(backButton)
        backButton.setImage(UIImage.init(named: "back-white"), for: UIControl.State.normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: UIControl.Event.touchUpInside)
        backButton.isHidden = true
        backButton.backgroundColor = .clear
        titleLabel.frame = CGRect.init(x: 54, y: 20 + notchHeight, width: UIScreen.main.bounds.size.width - 54*2, height: 44)
        self.customeNavBar.addSubview(titleLabel)
        titleLabel.font = UIFont.defaultAppFont(size: 16, type: .bold)
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = .white
        customeNavBar.backgroundColor = UIColor.init(netHex: kColorPrimary)
        
        
        if UserDefaultManager.shared.isSignedIn() {
            // go to home
        }
        else {
            Localize.setCurrentLanguage("vi")
            self.gotoLogin()
        }
        
        
    }
    
    @objc func backButtonTapped() {
        self.popViewController(animated: true)
    }
    
    func gotoLogin() {
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        if let startVC = UIStoryboard.init(name: "Login", bundle: Bundle.main).instantiateInitialViewController() as? ChooseLanguageViewController {
            self.viewControllers = [startVC]
        }
    }
    
}
