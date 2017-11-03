//
//  JokesViewController.swift
//  ikid
//
//  Created by Thipok Cholsaipant on 11/1/17.
//  Copyright © 2017 Thipok Cholsaipant. All rights reserved.
//

import UIKit

class JokesViewController: UIViewController {
    fileprivate var currentViewController:JokeViewController!
    fileprivate var nextViewController:JokeViewController!
    fileprivate var statementArray:[String] = ["1", "2", "3", "4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        currentViewController = initNextViewController(heading: nil)
        switchViewController(nil, to: currentViewController)
    }
    
    func setStatements (_ statmentArray:[String]) {
        self.statementArray = statmentArray
    }
    
    
    func initNextViewController(heading:String!) -> (JokeViewController?) {
        // If next VC is empty and has next statement
        if statementArray.count != 0 {
            let currentStatement = statementArray.remove(at: 0)
            let viewController = storyboard?
                .instantiateViewController(withIdentifier: "JokeViewController")
                as! JokeViewController
            viewController.setStatement(heading: "Jokes", statement: currentStatement, hasNextStatement: statementArray.count != 0)
            viewController.view.frame = view.bounds
            viewController.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            return viewController
        }
        return nil
    }

    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParentViewController: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParentViewController: self)
        }
    }
    
    @objc func goToNextViewController() {
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
        
        nextViewController = initNextViewController(heading: nil)
        nextViewController.view.frame = view.frame
        switchViewController(currentViewController, to: nextViewController)
        currentViewController = nextViewController
        nextViewController = nil
        
        UIView.commitAnimations()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
