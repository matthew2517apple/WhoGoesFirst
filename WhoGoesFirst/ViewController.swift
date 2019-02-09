//
//  ViewController.swift
//  WhoGoesFirst
//
//  Created by MJC-iCloud on 2/7/19.
//  Copyright © 2019 Matthew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // The suggested code from the lab assignment:
        SelectRandomButton.isEnabled = false
        SelectRandomButton.setTitle("Enter Both Team Names", for: UIControl.State.disabled)
    }
    
    // I abstracted the followng function,
    // because I use this functionality in both
    // checkBothBoxesForText() and SelectRandomTeam().
    func getArrayOfTrimmedTeamNames() -> [String] {
        // Read in team names:
        let maybeNilTeamNameOne = TeamOneTextField.text
        let maybeNilTeamNameTwo = TeamTwoTextField.text
        
        if var teamNameOne = maybeNilTeamNameOne, var teamNameTwo = maybeNilTeamNameTwo {
            // Remove white space from team names:
            // (I used the method recommended here: https://stackoverflow.com/questions/26797739/does-swift-have-a-trim-method-on-string
            teamNameOne = teamNameOne.trimmingCharacters(in: .whitespacesAndNewlines)
            teamNameTwo = teamNameTwo.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let teamNames = [teamNameOne, teamNameTwo]
            return teamNames
        } else {
            return ["",""]  // this error code indicates one or more names was blank.
        }
    }
    
    func checkBothBoxesForText() {
        let teamNames = getArrayOfTrimmedTeamNames()
        
        if (teamNames[0] != "" && teamNames[1] != "") {
            SelectRandomButton.isEnabled = true
        } else {
            SelectRandomButton.isEnabled = false
            WhoGoesFirstLabel.text = "Who Goes First?"
        }
    }
    
    func SelectRandomTeam() {
        let teamNames = getArrayOfTrimmedTeamNames()
        
        // Randomly select and then display a team name:
        let goesFirstTeam = teamNames.randomElement()
        WhoGoesFirstLabel.text = goesFirstTeam
    }
    
    
    // **********************************************************************
    // Outlets and Actions:

    @IBOutlet weak var TeamOneTextField: UITextField!
    
    @IBAction func TeamOneTextFieldEditingChanged(_ textField: UITextField) {
        checkBothBoxesForText()
    }
    
    @IBOutlet weak var TeamTwoTextField: UITextField!
    
    @IBAction func TeamTwoTextFieldEditingChanged(_ textFied: UITextField) {
        checkBothBoxesForText()
    }
    
    @IBOutlet weak var SelectRandomButton: UIButton!
    
    @IBAction func ButtonClicked(_ sender: Any) {
        SelectRandomTeam()
    }
    
    @IBOutlet weak var WhoGoesFirstLabel: UILabel!
}

