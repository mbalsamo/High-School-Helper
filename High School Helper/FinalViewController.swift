//
//  FinalViewController.swift
//  High School Helper
//
//  Created by MBalsamo on 11/29/15.
//  Copyright © 2015 Student. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {
    @IBOutlet weak var wantGrade: UITextField!
    @IBOutlet weak var haveGrade: UITextField!
    @IBOutlet weak var worthPercent: UITextField!
    @IBOutlet weak var reply: UILabel!
    @IBOutlet weak var comment: UILabel!

    var name : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //just setting the labels to nothing for when you first open the app (and alphas to 0)
        reply.text = ""
        comment.text = ""
        reply.alpha = 0
        comment.alpha = 0
    }
    
    @IBAction func calculateButton(sender: UIButton) {
        reply.alpha = 0
        comment.alpha = 0
        view.addSubview(reply)
        view.addSubview(comment)
        
        UIView.animateWithDuration(1.2, animations: {//after the animation the alpha (opacity) is 1
            self.reply.alpha = 1.0
        })
        UIView.animateWithDuration(1.5, animations: {//after the animation the alpha (opacity) is 1
            self.comment.alpha = 1.0
        })
        
        //creating variables and setting the desired grade, final worth, and current grade to doubles
        var curGrade = (haveGrade.text! as NSString).doubleValue
        var desiredGrade = (wantGrade.text! as NSString).doubleValue
        var finalWorth = (worthPercent.text! as NSString).doubleValue
        
        //  Equation for final Grade = (100 * Grade You Want - (100 - Final Worth) * Grade You Have) / Worth of Final
        var finalGrade = (100 * desiredGrade - (100 - finalWorth) * curGrade) / finalWorth;
        
        func doubleToStringDecimalPlacesWithDouble(number:Double, numberOfDecimalPlaces:Int) -> String
        {                               //this formats it so that it will not have any decimal places for the double
            return String(format:"%."+numberOfDecimalPlaces.description+"f", number)
        }
        var finalGradeString = doubleToStringDecimalPlacesWithDouble(finalGrade, numberOfDecimalPlaces: 0)
        var desiredGradeString = doubleToStringDecimalPlacesWithDouble(desiredGrade, numberOfDecimalPlaces: 0)
        
        
        //this is where i make it so that if you dont have anything written in text boxes then it wont work
                if wantGrade.text == "" || haveGrade.text == "" || worthPercent.text == ""
        {
            reply.text = "Begin by entering some values...."
            comment.text = ""
        }
        else
        {
        reply.text = "You will need a \(finalGradeString)% on your \nfinal to get a \(desiredGradeString)% in class"
        }
        
        //here is where I have the comment that says stuff depending on what your final grade percent that you need was
        if name == "" //this is if you havent entered a name
        {
            if (finalGrade >= 90 && finalGrade < 100)
            {
                comment.text = "Start studying now.";
            }
            else if (finalGrade >= 80 && finalGrade < 90)
            {
                comment.text = "Review the notes and do some studying.";
            }
            else if (finalGrade < 80 && finalGrade >= 0)
            {
                comment.text = "You only need a \(finalGradeString)%!\n Go home and get some sleep."
            }
            else if (finalGrade > 100)
            {
                comment.text = "Rest in pepperoni, you need more than 100%"
            }
            else if (finalGrade < -1)
            {
                comment.text = ""
                reply.text = "Please use the calculator in a \nrespectful and responsible manner, \nwithout putting random numbers."
            }
            else if (desiredGrade - curGrade > 10)
            {
                comment.text = "It's good to be confident, right?"
            }
        }
        else
        {
        if (finalGrade >= 90 && finalGrade < 100)
        {
            comment.text = "\(name), you need to start studying now."
        }
        else if (finalGrade >= 80 && finalGrade < 90)
        {
            comment.text = "Review the notes and do some studying, \(name)."
        }
        else if (finalGrade < 80 && finalGrade >= 0)
        {
            comment.text = "ONLY A \(finalGradeString)%?! \n Go home and get some sleep."
        }
        else if (finalGrade > 100)
        {
            comment.text = "Rest in pepperoni"
        }
        else if (finalGrade < -1)
        {
            comment.text = ""
            reply.text = "Ahem, \(name), please use the calculator in a \nrespectful and responsible manner, \nwithout putting random numbers."
        }
        else if (desiredGrade - curGrade > 10)
        {
            comment.text = "It's good to be confident, right \(name)?"
            
        }
        }
        
    }
    
//after all the stuff with the changing anwsers, if you click the tip button then...
    @IBAction func tip(sender: UIButton)
    {
        //this is the alert that tells you that the final here is worth 20%
        let alert = UIAlertController(title: "Tip!", message: "The final at Barrington High School is worth 20%", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok Thanks Wow Michael You're Awesome", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
}






//as you can see i have the 5 coding concepts, the 5 ui elements, my app is beautifully amazing and I