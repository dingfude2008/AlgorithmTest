//
//  ViewController.swift
//  算法Test
//
//  Created by DFD on 2017/4/27.
//  Copyright © 2017年 DFD. All rights reserved.
//

import UIKit

fileprivate let cellID = "cellID";

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            cell = UITableViewCell()
        }
        
        cell?.textLabel?.text = "\(indexPath.row + 1)"
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        let vcName = "VC" + String(format: "%02d", indexPath.row + 1)
        
        guard let vcClass = NSClassFromString(Bundle.main.namespace + "." + vcName) as? UIViewController.Type else {
            return
        }
        
        let vc = vcClass.init()
        
        self.navigationController?.pushViewController(vc, animated: true);
    }
}






