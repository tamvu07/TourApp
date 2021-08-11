//
//  ChooseLanguageViewController.swift
//  TourApp
//
//  Created by Vu Minh Tam on 8/10/21.
//

import UIKit

class ChooseLanguageViewController: UIViewController {

    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var chooseLanguageLabel: UILabel!
    @IBOutlet weak var checkBoxVn: UIButton!
    @IBOutlet weak var checkBoxEn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func continueAction(_ sender: UIButton) {
//        guard let datePickerVC = DatePickerViewController.instantiateFromStoryBoard("Login") else {return}
//        checkBoxVn.isSelected ? Localize.setCurrentLanguage("vi") : Localize.setCurrentLanguage("en")
//        self.navigationController?.pushViewController(datePickerVC, animated: true)
    }

}
