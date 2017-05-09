//
//  Cardio.swift
//  GymLog
//
//  Created by Sam on 4/13/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class Cardio: UIViewController {
    
    //TAKE OUT COLORIES BURNED IF YOU CAN FIND OUT
    // HOW TO CALCULATE THAT
    
    
    
    //Cardio Workouts
    @IBOutlet weak var Biking: UIButton!
    @IBOutlet weak var Elliptical: UIButton!
    @IBOutlet weak var Erging: UIButton!
    @IBOutlet weak var Running: UIButton!
    @IBOutlet weak var StairMaster: UIButton!
    @IBOutlet weak var Swimming: UIButton!
    
    //Enter Buttons
//    @IBOutlet weak var DistanceE: UIButton!
//    @IBOutlet weak var TimeE: UIButton!
//    @IBOutlet weak var InclineE: UIButton!
//    @IBOutlet weak var CaloriesE: UIButton!
//    @IBOutlet weak var ResistanceE: UIButton!
    
    
    //TextFields
    @IBOutlet weak var DistanceTF: UITextField!
    @IBOutlet weak var TimeTF: UITextField!
    @IBOutlet weak var InclineTF: UITextField!
    @IBOutlet weak var CaloriesTF: UITextField!
    @IBOutlet weak var ResistanceTF: UITextField!
    
    
    //TextView
    @IBOutlet weak var NotesTV: UITextView!
    
    //array of cardio workouts
    var carAr = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MusclesTrained.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    
    //adds muscle groups to a string array
    func addCardio() {
        
        if (Biking.isHighlighted == false) {
            carAr.append("Biking")
        }
        if (Elliptical.isHighlighted == false) {
            carAr.append("Elliptical")
        }
        if (Erging.isHighlighted == false) {
            carAr.append("Erging")
        }
        if (Running.isHighlighted == false) {
            carAr.append("Running")
        }
        if (StairMaster.isHighlighted == false) {
            carAr.append("StairMaster")
        }
        if (Swimming.isHighlighted == false) {
            carAr.append("Swimming")
        }

    }
    
    
    func post() {
        
        addCardio()
        
        let distTF = DistanceTF.text
        let timeTF = TimeTF.text
        let incTF = InclineTF.text
        let calTF = CaloriesTF.text
        let resTF = ResistanceTF.text
        
        let carList = carAr.joined(separator: " | ")
        
        let post : [String : AnyObject] = ["Exercise" : carList as AnyObject,"Distance" : distTF as AnyObject, "Time" : timeTF as AnyObject,
                                           "Incline" : incTF as AnyObject, "Calories Burned" : calTF as AnyObject,
                                           "Resistance" : resTF as AnyObject]
        
        let databaseRef = FIRDatabase.database().reference()
        
        databaseRef.child("Cardio").childByAutoId().setValue(post)
    }
    
    
    
    @IBAction func SaveButton(_ sender: Any) {
        post()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        DistanceTF.resignFirstResponder()
        TimeTF.resignFirstResponder()
        InclineTF.resignFirstResponder()
        CaloriesTF.resignFirstResponder()
        ResistanceTF.resignFirstResponder()
        view.endEditing(true)
    }
    
}
