//
//  GrandsonController.swift
//  HiddenSanta
//
//  Created by Влад on 07/12/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit

class GrandsonController: UIViewController {
    var text: String = ""
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var nowButton: UIButton!
    var i:Int = 0
    @IBAction func grandsonButton(_ sender: Any) {
        
        repeat{ i = Int.random(in: 0..<grandson.count)
            nameLabel.text = "\(grandson[i])"}while(nameLabel.text==text)
        grandson.remove(at: i)
        doneButton.alpha = 1
        nowButton.alpha = 0
    }
    @IBAction func doneButton(_ sender: Any) {
        for i in 0..<santa.count {
            if(santa[i]==text){santa.remove(at: i)
                break}
        }
                 navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    self.navigationController?.isNavigationBarHidden = true
    titleLabel.text = "Ну что же, \(text), твоим внучком/внучкой в этом году будет..."
    doneButton.alpha = 0
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
