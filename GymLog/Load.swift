//
//  Load.swift
//  GymLog
//
//  Created by Sam on 3/19/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase


class Load: UIViewController {
    
    @IBOutlet weak var loadTF: UIScrollView!
    @IBOutlet weak var scrollLabel: UILabel!
    @IBOutlet weak var woLabel: UILabel!
    
    
    @IBOutlet weak var loadCar: UIButton!
    @IBOutlet weak var carLabel: UILabel!

    @IBOutlet weak var distanceTF: UITextField!
    @IBOutlet weak var timeTF: UITextField!
    @IBOutlet weak var inclineTF: UITextField!
    @IBOutlet weak var caloriesTF: UITextField!
    @IBOutlet weak var resistanceTF: UITextField!
    
    
    
    @IBAction func loadLift(_ sender: Any) {
        let databaseRef = FIRDatabase.database().reference()
        
        databaseRef.child("Lifts").queryOrderedByKey().observe(.childAdded, with: {
            snapshot in
            
            self.woLabel.text = snapshot.childSnapshot(forPath: "Muscles Trained").value as? String
            self.scrollLabel.text = snapshot.childSnapshot(forPath: "Workout Details").value as? String
        })
    }
    
    
    @IBAction func loadCardio(_ sender: Any) {
        
        let databaseRef = FIRDatabase.database().reference()
        
        databaseRef.child("Cardio").queryOrderedByKey().observe(.childAdded, with: {
            snapshot in
            
            self.carLabel.text = snapshot.childSnapshot(forPath: "Exercise").value as? String
            
            self.distanceTF.text = snapshot.childSnapshot(forPath: "Distance").value as? String
            self.timeTF.text = snapshot.childSnapshot(forPath: "Time").value as? String
            self.inclineTF.text = snapshot.childSnapshot(forPath: "Incline").value as? String
            self.caloriesTF.text = snapshot.childSnapshot(forPath: "Calories Burned").value as? String
            self.resistanceTF.text = snapshot.childSnapshot(forPath: "Resistance").value as? String
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCardio((Any).self)
        loadLift((Any).self)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Load.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        loadTF.resignFirstResponder()
        view.endEditing(true)
    }

    
}
