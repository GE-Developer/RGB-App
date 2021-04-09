//
//  ColorViewController.swift
//  RGB App
//
//  Created by Mikhail Bukhrashvili on 09.04.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setBackgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat)
}

class ColorViewController: UIViewController {

    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.color = view.backgroundColor
        settingsVC.delegate = self
    }
    
}

// MARK: - Set Background Color
extension ColorViewController: SettingsViewControllerDelegate {
    func setBackgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat) {
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}
