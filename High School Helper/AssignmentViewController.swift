//
//  AssignmentViewController.swift
//  High School Helper
//
//  Created by MBalsamo on 11/29/15.
//  Copyright © 2015 Student. All rights reserved.
//

import UIKit

class AssignmentViewController: UIViewController {
    @IBOutlet weak var yourGrade: UITextField!
    @IBOutlet weak var pointsPossible: UITextField!
    @IBOutlet weak var feedback: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    var name : String!
    
    var previousAnwsers :[String] = [] //the array i have for previous anwsers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedback.text = ""
    }

    @IBAction func CalculateButton(sender: UIButton) //if you press calculate...
    {

        //changing  to double
        var curGrade = (yourGrade.text! as NSString).doubleValue
        var pointsPoss = (pointsPossible.text! as NSString).doubleValue
        
        feedback.alpha = 0
        view.addSubview(feedback)
        UIView.animateWithDuration(1.2, animations: {//after the animation the alpha (opacity) is 1
            self.feedback.alpha = 1.0
        })

        if pointsPoss == 0 //this is the stuff for if you dont enter any values
        {
            feedback.text = "\(name), please enter values before you click the calculate button."
        }
        else if yourGrade.text == ""
        {
            feedback.text = "\(name), what grade did you get?"
        }
        else if pointsPossible.text == ""

        {
            feedback.text = "\(name), how many points was it out of?"
        }
        else
        {
        var almostanwser = (curGrade / pointsPoss)
        var anwserdouble = almostanwser * 100 //the equation to find your grade on a test/ assignment

            
            func doubleToString(number:Double, numberOfDecimalPlaces:Int) -> String
            {
                return String(format:"%."+numberOfDecimalPlaces.description+"f", number)
                //this formats it so that it doesnt have a decimal
            }
            var anwser = doubleToString(anwserdouble, numberOfDecimalPlaces: 0)
            
            
            previousAnwsers.insert(anwser, atIndex: 0)
            //this adds the anwsers to the array for previous anwsers (at index makes it go to the first one)
            
            
            if name == "" //if the person doesnt enter a name it will be different
            {
                if (anwserdouble <= 70 && anwserdouble > 61)
                {
                    feedback.text = "I'm sorry. \nYou got a \(anwser)% on your assignment. Try to redo it?"
                    imageView.image = UIImage(named: "")
                    // the comments that change depending on how good or bad your grade was (and changing the pictures)
                }
                else if (anwserdouble <= 60 && anwserdouble > 50)
                {
                    feedback.text = "You got a \(anwser)% on your assignment."
                    imageView.image = UIImage(named: "")
                }
                else if (anwserdouble <= 50)
                {
                    imageView.image = UIImage(named: "gravestone")
                    feedback.text = "Rest in Pepperoni \nYou got a \(anwser)%..."
                }
                else if (anwserdouble >= 90 && anwserdouble <= 100)
                {
                    imageView.image = UIImage(named: "thumbs up")
                    feedback.text = "Wow, you got a \(anwser)%! Thats a good grade!!!"
                }
                else if (anwserdouble > 120)
                {
                    feedback.text = "Getting a \(anwser)% surely seems like alot of extra credit..."
                    imageView.image = UIImage(named: "")
                }
                else
                {
                    feedback.text = "You got a \(anwser)% on your assignment."
                    imageView.image = UIImage(named: "")
                }
            }
        else //and if there is a name then it changes to have the name
        {
            if (anwserdouble <= 70 && anwserdouble > 61)
            {
                feedback.text = "I'm sorry. \nYou got a \(anwser)% on your assignment. Ask your teacher for a retake?"
                imageView.image = UIImage(named: "")

            }
            else if (anwserdouble <= 60 && anwserdouble > 50)
            {
                feedback.text = "\(name), you got a \(anwser)% on your assignment."
                imageView.image = UIImage(named: "")

            }
            else if (anwserdouble <= 50)
            {
            imageView.image = UIImage(named: "gravestone")
                feedback.text = "Rest in Pepperoni \(name) \nYou got a \(anwser)%..."
            }
            else if (anwserdouble >= 90 && anwserdouble <= 100)
            {
                imageView.image = UIImage(named: "thumbs up")
                feedback.text = "\(name), you got a \(anwser)%! Thats a good grade!!!"
            }
            else if (anwserdouble > 120)
            {
                feedback.text = "Wow \(name), getting a \(anwser)% surely seems like alot of extra credit..."
                imageView.image = UIImage(named: "")
            }
            else
            {
                feedback.text = "You got a \(anwser)% on your assignment."
                imageView.image = UIImage(named: "")
            }
            }

        }
        
    }

    @IBAction func infoButton(sender: UIButton)
    {

        if previousAnwsers.count == 0 //this if statement sees if youve used the calculator yet (for the previous grades button)
        {
            feedback.text = "You haven't used the calculator yet."
        }
        else
        { //if you have used it it will restart the image to blank
        imageView.image = UIImage(named: "")
        var howManyGrades = 0
        var output = ""
        for item in previousAnwsers //will do a loop to format it so that the array doesnt look like [93,84,29]
        {
            howManyGrades++   //will add to the variable that sees how many grades youve checked
            output += "\(item)% " //does the formating so that it looks nice not like [93,94,83]
        
        }
        
        if howManyGrades == 1
        {
            feedback.text = "The only grade that you have checked has been \(output)"
        }
        else
        {
        feedback.text = "Your \(howManyGrades) recent grades on tests and assignemnts have been \(output)"
        }
    }
    }
    


}
