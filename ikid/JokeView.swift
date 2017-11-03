//
//  TextDisplayView.swift
//  ikid
//
//  Created by Thipok Cholsaipant on 10/31/17.
//  Copyright © 2017 Thipok Cholsaipant. All rights reserved.
//

import UIKit

class JokeView: UIView {
    
    @IBOutlet var jokeView: UIView!
    @IBOutlet weak var titleType: UILabel!
    @IBOutlet weak var statement: UILabel!
    @IBOutlet weak var nextActionButton: UIButton!
    
    func setText(titleType:String, statement:String) {
        self.titleType.text = titleType
        self.statement.text = statement
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("JokeView", owner: self, options: nil)
        addSubview(jokeView)
        jokeView.frame = self.bounds
        jokeView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
