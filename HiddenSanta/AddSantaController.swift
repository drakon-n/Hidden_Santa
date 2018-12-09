//
//  AddSantaController.swift
//  HiddenSanta
//
//  Created by Влад on 06/12/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit

class AddSantaController: UIViewController {
    var i:Int = 1
    @IBOutlet weak var newSantaName: UITextField!
    
    @IBOutlet weak var SantaList: UITextView!
    @IBAction func AddNewSanta(_ sender: Any) {
        if !(newSantaName.text!.isEmpty)
        {
            if(i>1){SantaList.text! = SantaList.text! + "\n"}
            SantaList.text! = SantaList.text! + "\(i).\(newSantaName.text!)"
            i = i + 1
            santa.append(newSantaName.text!)
            newSantaName.text = ""
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        SantaList.text = ""
        i = 1
    }

    
}
