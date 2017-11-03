//
//  JokesTabViewController.swift
//  ikid
//
//  Created by Thipok Cholsaipant on 10/31/17.
//  Copyright © 2017 Thipok Cholsaipant. All rights reserved.
//

import UIKit

class JokeViewController: UIViewController {
    
    @IBOutlet weak var jokeView: JokeView!
    private var heading = "\(String(describing: type(of: self)))"
    private var statement:String!
    private var hasNextStatement = false

    override func viewDidLoad() {
        
        super.viewDidLoad()
        if statement != nil {
            jokeView.setText(titleType: heading, statement: statement)
        }
        if hasNextStatement {
            jokeView.nextActionButton.isHidden = false
            jokeView.nextActionButton!.addTarget(self.parent, action: #selector(JokesViewController.goToNextViewController), for: .touchUpInside)
        }
        
    }
    
    func setStatement (heading:String!, statement:String, hasNextStatement:Bool) {
        if heading != nil {
            self.heading = heading
        }
        self.statement = statement
        self.hasNextStatement = hasNextStatement
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

