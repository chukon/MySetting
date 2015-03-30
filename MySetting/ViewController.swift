//
//  ViewController.swift
//  MySetting
//
//  Created by RVC on 3/29/15.
//  Copyright (c) 2015 Rock Valley College. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    
    
    
    
    
    
    @IBAction func btnClean(sender: AnyObject) {
        
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(nil, forKey: "title")
        defaults.setObject(nil, forKey: "comment")
        defaults.setObject(nil, forKey: "places")
        
        defaults.synchronize()
        
        txtTitle.text = ""
        
        txtComment.text = ""
       myPlaces.selectRow(0,inComponent: 0, animated: true)
        txtTitle.becomeFirstResponder()
        
        }
    var selectedplaces:String!
    let pickerPlaces = ["Work","Home", "Other"]
    @IBAction func btnLoad(sender: UIButton) {var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if let titleNotNull = defaults.objectForKey("title") as? String {
            self.txtTitle.text = defaults.objectForKey("title") as String
        }
        
        if let commentIsNotNill = defaults.objectForKey("comment") as? String {
            self.txtComment.text = defaults.objectForKey("comment") as String
        }
        
        
        if let placesIsNotNill = defaults.objectForKey("places") as? String {
            var favoritePlaceSelected = defaults.objectForKey("places") as String
            var SelectedPlaces:Int = find(pickerPlaces, favoritePlaceSelected)!
            myPlaces.selectRow(SelectedPlaces,inComponent: 0, animated: true)
        }

    }
    
    
    
    
    
    
    
    @IBOutlet weak var txtTitle: UITextField!
    
    
    
    @IBOutlet weak var txtComment: UITextField!
    
    
    
    
    @IBOutlet weak var myPlaces: UIPickerView!
    
    
    
    
    
    @IBAction func btnSave(sender: UIButton) {
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(self.txtTitle.text, forKey: "title")
        defaults.setObject(self.txtComment.text, forKey: "comment")
        defaults.setObject(selectedplaces, forKey: "places")
        
        
        defaults.synchronize()
        
        
        
        
        
        
    }
    //Needed for picker
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerPlaces.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        selectedplaces=pickerPlaces[row]
        return pickerPlaces[row]
        
    }
    //new method hiding keyboard
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    //set delegate to all uitextfields
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtTitle.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

