//
//  PresentController.swift
//  HiddenSanta
//
//  Created by Влад on 06/12/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit

var grandson:[String] = []
var santa:[String]=[]
class PresentController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBAction func closeTable(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var endButton: UIButton!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var tableList: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = modelArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        if let castedCell = cell as? TableViewCell {
            castedCell.fillCell(with: model)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        performSegue(withIdentifier: "GoToGrandson", sender: nil)
        
    }
    
    
    var modelArray = [CellModel]()
    let cellIdentifier = "TableViewCell"
    override func viewDidLoad() {
        endButton.alpha = 0
        super.viewDidLoad()
        grandson = santa
        tableList.delegate = self
        tableList.dataSource = self
        tableList.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        fillModelArray(santa)
        self.tableList.reloadData()
    }
    
    func fillModelArray(_ mass: [String]) {
        modelArray = []
        for name in mass {
            let model = CellModel()
            model.title = name
            modelArray.append(model)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    override func viewWillAppear(_ animated: Bool) {
        fillModelArray(santa)
        self.tableList.reloadData()
        if(santa.count==0){
            TitleLabel.text = "Похоже, что все роли розданы"
            tableList.alpha = 0
            endButton.alpha = 1
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?){
        if(segue.identifier == "GoToGrandson"){
            let indexPath = tableList.indexPathForSelectedRow
            let finishResult = segue.destination as? GrandsonController
            finishResult?.text = "\(santa[indexPath?.row ?? 1])"
        }
    }

}
