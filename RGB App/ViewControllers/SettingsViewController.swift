//
//  SettingsViewController.swift
//  RGB App
//
//  Created by Mikhail Bukhrashvili on 26.03.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    // MARK: Public Properties
    var color: UIColor!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.layer.cornerRadius = 15
        colorView.layer.cornerRadius = 15
    
        setColor()
        setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
        
        redTF.text = redValueLabel.text
        greenTF.text = greenValueLabel.text
        blueTF.text = blueValueLabel.text
    }
    
    // MARK: - IB Actions
    // Изменение цветов слайдерами
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider:
            setValue(for: redValueLabel)
            redTF.text = redValueLabel.text
        case greenSlider:
            setValue(for: greenValueLabel)
            greenTF.text = greenValueLabel.text
        default:
            setValue(for: blueValueLabel)
            blueTF.text = blueValueLabel.text
        }
    }
    
    // MARK: - Private Methods
    // Цвет view
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }

    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redValueLabel:
                label.text = string(from: redSlider)
            case greenValueLabel:
                label.text = string(from: greenSlider)
            default:
                label.text = string(from: blueSlider)
            }
        }
    }

    // Значения RGB
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}
