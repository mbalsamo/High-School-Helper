//
//  ViewController.swift
//  High School Helper
//
//  Created by MBalsamo on 11/28/15.
//  Copyright © 2015 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var helloName: UILabel!
    @IBOutlet weak var highSchoolHelper: UILabel!
    @IBOutlet weak var gradeCalcButton: UIButton!
    @IBOutlet weak var finalsCalcButton: UIButton!
    @IBOutlet weak var enterName: UILabel!
    @IBOutlet weak var nameDoneButton: UIButton!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        helloName.text = ""
        
        highSchoolHelper.alpha = 0 //when it starts the opacity/alpha is set to 0 so its invisible
        finalsCalcButton.alpha = 0
        gradeCalcButton.alpha = 0
        enterName.alpha = 0
        nameDoneButton.alpha = 0
        nameTextField.alpha = 0
        helloName.alpha = 0
        
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated) //using view did appear (different then view did load)
        view.addSubview(highSchoolHelper)//this is where the beautiful animations are
        view.addSubview(finalsCalcButton)
        view.addSubview(gradeCalcButton)
        view.addSubview(enterName)
        view.addSubview(nameDoneButton)
        view.addSubview(nameTextField)

        UIView.animateWithDuration(1.2, animations: {//after the animation the alpha (opacity) is 1
            self.highSchoolHelper.alpha = 1.0
            })
        UIView.animateWithDuration(1.6, animations: {
            self.gradeCalcButton.alpha = 1.0
            })
        UIView.animateWithDuration(1.7, animations: {
            self.finalsCalcButton.alpha = 1.0
            })
        UIView.animateWithDuration(2.2, animations: {
            self.enterName.alpha = 1.0
            })
        UIView.animateWithDuration(2.6, animations: {
            self.nameTextField.alpha = 1.0
            })
        UIView.animateWithDuration(3.0, animations: {
            self.nameDoneButton.alpha = 1.0
            })
    }
    
    @IBAction func doneName(sender: UIButton)
    {
        let name : String = nameTextField.text!
        
        if nameTextField.text == "" //if you dont enter a name nothing nothing will happen with done button
        {
            helloName.text = ""
        }
        else
        {
            helloName.text = "Hello, \(name)"
            self.view.addSubview(helloName)
            UIView.animateWithDuration(2.6, animations: {   //the animation for the hello, name
                self.helloName.alpha = 1.0
            })
        }

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "FinalsCalc"
        {           //this is how I made it so that in the finals calculator it will say Finals Calculator at the top
            let finalView = segue.destinationViewController as! UIViewController
            finalView.title = "Finals Calculator"
            var svcFinals = segue.destinationViewController as! FinalViewController;
        svcFinals.name = nameTextField.text
        }
        if segue.identifier == "AssignmentCalc"  //same with the grade calculator
        {
            let assignmentView = segue.destinationViewController as! UIViewController
            assignmentView.title = "Grade Calculator"
            var svcAssignment = segue.destinationViewController as! AssignmentViewController;
        svcAssignment.name = nameTextField.text
        }
        
    }
    
//make the top bar with back and stuff go away on the first view controller (the one where you put your name)
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
        super.viewWillDisappear(animated)
    }
    //make it come back after you leave the first page
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

