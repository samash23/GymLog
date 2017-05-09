//
//  MusclesTrained.swift
//  GymLog
//
//  Created by Sam on 3/18/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase
import CoreData


class MusclesTrained: UIViewController{
    
    @IBOutlet weak var abs: UIButton!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var bis: UIButton!
    @IBOutlet weak var calves: UIButton!
    @IBOutlet weak var chest: UIButton!
    @IBOutlet weak var forearms: UIButton!
    @IBOutlet weak var glutes: UIButton!
    @IBOutlet weak var hamstrings: UIButton!
    @IBOutlet weak var quads: UIButton!
    @IBOutlet weak var shoulders: UIButton!
    @IBOutlet weak var traps: UIButton!
    @IBOutlet weak var tris: UIButton!

    
    @IBOutlet weak var textField: UITextView!
    
    @IBOutlet weak var save: UIButton!
    
    var musAr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MusclesTrained.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    //adds muscle groups to a string array
    func addMuscles() {
        
        if (abs.isHighlighted == false) {
            musAr.append("Abs")
        }
        if (back.isHighlighted == false) {
            musAr.append("Back")
        }
        if (bis.isHighlighted == false) {
            musAr.append("Bicepts")
        }
        if (calves.isHighlighted == false) {
            musAr.append("Calves")
        }
        if (chest.isHighlighted == false) {
            musAr.append("Chest")
        }
        if (forearms.isHighlighted == false) {
            musAr.append("Forearms")
        }
        if (glutes.isHighlighted == false) {
            musAr.append("Glutes")
        }
        if (hamstrings.isHighlighted == false) {
            musAr.append("Hamstrings")
        }
        if (quads.isHighlighted == false) {
            musAr.append("Quads")
        }
        if (shoulders.isHighlighted == false) {
            musAr.append("Shoulders")
        }
        if (traps.isHighlighted == false) {
            musAr.append("Traps")
        }
        if (tris.isHighlighted == false) {
            musAr.append("Tricepts")
        }
        
    }
    
    
    func post() {
        
        addMuscles()
        

        let woDet = textField.text
        
        let arList = musAr.joined(separator: " | ")
        
        let post : [String : AnyObject] = ["Muscles Trained" : arList as AnyObject, "Workout Details" : woDet as AnyObject]
        
        let databaseRef = FIRDatabase.database().reference()
        
     //   let arList = musAr.joined(separator: " | ")
        
        databaseRef.child("Lifts").childByAutoId().setValue(post)
        
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        post()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        textField.resignFirstResponder()
        view.endEditing(true)
    }
    


    
}
