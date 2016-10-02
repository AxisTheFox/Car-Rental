//
//  ViewController.swift
//  FoxBraydonAssignment2Part2
//
//  Created by Fox, Braydon on 10/2/16.
//  Copyright © 2016 Fox, Braydon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: Properties
    @IBOutlet weak var numberOfDaysTextField: UITextField!
    @IBOutlet weak var vehicleTypePicker: UIPickerView!
    @IBOutlet weak var totalCostLabel: UILabel!
    
    var pickerData: [String] = [String]()
    var selectedVehicle = "Economy"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.vehicleTypePicker.delegate = self
        self.vehicleTypePicker.dataSource = self
        pickerData = ["Economy", "Compact", "Intermediate", "Standard", "Full Size"]
        numberOfDaysTextField.text = "1"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func calculateButton(sender: AnyObject) {
        updateVehicleType()
        let numberOfDays = Double(numberOfDaysTextField.text!)
        var dailyRate = 0.00
        if (selectedVehicle == "Economy") {
            dailyRate = 24.99
        } else if (selectedVehicle == "Compact") {
            dailyRate = 29.99
        } else if (selectedVehicle == "Intermediate") {
            dailyRate = 39.99
        } else if (selectedVehicle == "Standard") {
            dailyRate = 44.99
        } else if (selectedVehicle == "Full Size") {
            dailyRate = 49.99
        }
        let totalCost = numberOfDays! * dailyRate
        totalCostLabel.text = "$" + String.localizedStringWithFormat("%.2f", totalCost)
    }
    
    // MARK: Methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent: Int) {
        updateVehicleType()
    }
    
    func updateVehicleType() {
        selectedVehicle = pickerData[vehicleTypePicker.selectedRowInComponent(0)]
    }

}

