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
    var delegate: SettingsViewControllerDelegate!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.layer.cornerRadius = 15
        colorView.layer.cornerRadius = 15
        
        setValueForSlider()
        setColor()
        setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
        setValue(for: redTF, greenTF, blueTF)
    }
    
    // MARK: - IB Actions
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider:
            setValue(for: redValueLabel)
            setValue(for: redTF)
        case greenSlider:
            setValue(for: greenValueLabel)
            setValue(for: greenTF)
        default:
            setValue(for: blueValueLabel)
            setValue(for: blueTF)
        }
    }
    
    @IBAction func rgbTF(_ sender: UITextField) {
        switch sender {
        case redTF:
            redSlider.value = Float(redTF.text ?? "") ?? 0
            setValue(for: redValueLabel)
            
            if redSlider.value == 0 {
                redTF.text = "0.00"
            }
        case greenTF:
            greenSlider.value = Float(greenTF.text ?? "") ?? 0
            setValue(for: greenValueLabel)
            
            if greenSlider.value == 0 {
                greenTF.text = "0.00"
            }
        default:
            blueSlider.value = Float(blueTF.text ?? "") ?? 0
            setValue(for: blueValueLabel)
            
            if blueSlider.value == 0 {
                blueTF.text = "0.00"
            }
        }
        setColor()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setBackgroundColor(red: CGFloat(redSlider.value),
                                    green: CGFloat(greenSlider.value),
                                    blue: CGFloat(blueSlider.value))
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
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
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTF:
                textField.text = string(from: redSlider)
            case greenTF:
                textField.text = string(from: greenSlider)
            default:
                textField.text = string(from: blueSlider)
            }
        }
    }
}
    
extension SettingsViewController {
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setValueForSlider() {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        redSlider.value = Float(r)
        greenSlider.value = Float(g)
        blueSlider.value = Float(b)
    }
}
