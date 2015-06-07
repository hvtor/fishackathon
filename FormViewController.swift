//
//  FormViewController.swift
//  fishYouWereHereFinal
//
//  Created by Hemant V. Torsekar on 2015-06-07.
//  Copyright (c) 2015 Gavin Thompson. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet var estimateSlider: UISlider!
    
    
    @IBOutlet var estimateValueLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
//    func configureDefaultSlider() {
//        estimateSlider.minimumValue = 1
//        
//        estimateSlider.maximumValue = 1000
//        
//        estimateSlider.continuous = true
//        
//        estimateSlider.addTarget(self, action: "sliderValueDidChange:", forControlEvents: .ValueChanged)
//    }
//    
//    @IBAction func sliderValueChanged(sender: UISlider) {
//        
//        var selectedValue = Float(sender.value);
//        
//        estimateValueLabel.text = "\(selectedValue)"
//        
//    }

    
    

}
