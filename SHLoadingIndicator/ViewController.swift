//
//  ViewController.swift
//  SHLoadingIndicator
//
//  Created by Ankit Thakur on 05/11/14.
//  Copyright (c) 2014 Ankit Thakur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var loading : SHLoadingIndicator = SHLoadingIndicator(frame: CGRectMake(50, 50, 50, 50));
        self.view.addSubview(loading);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

