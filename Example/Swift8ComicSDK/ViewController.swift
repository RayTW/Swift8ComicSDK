//
//  ViewController.swift
//  Swift8ComicSDK
//
//  Created by RayTW on 06/07/2017.
//  Copyright (c) 2017 RayTW. All rights reserved.
//

import UIKit
import Swift8ComicSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loadAllComic(_ sender: Any) {
        R8Comic.get().getAll { (comics:[Comic]) in
            
            print("comics==>\(comics)")
        }

    }
}

