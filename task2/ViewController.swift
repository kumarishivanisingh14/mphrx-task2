//
//  ViewController.swift
//  task2
//
//  Created by Mphrx on 18/10/21.
//

import UIKit
import WebKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    let text1 = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry.  with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    
    let text2 = "https://mphrx.com"
    
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var dataPoints: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let fixedCellNib = UINib(nibName: "FixedTableCell", bundle: nil)
        let dynamicCellNib = UINib(nibName: "DynamicTableCell", bundle: nil)
        let webviewCellNib = UINib(nibName: "WebviewTableCell", bundle: nil)
        
        tableView.register(fixedCellNib, forCellReuseIdentifier: "FixedTableCell")
        tableView.register(dynamicCellNib, forCellReuseIdentifier: "DynamicTableCell")
        tableView.register(webviewCellNib, forCellReuseIdentifier: "WebviewTableCell")
        dataPoints = [text1,text1,text2]
        
   

    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataPoints.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 200
        }
        else{
            return UITableView.automaticDimension
        }
            
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "FixedTableCell",for: indexPath) as! FixedTableCell
            cell.textLabel?.text = dataPoints[indexPath.row]
//            cell.labelText?.text = dataPoints[indexPath.row]
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.adjustsFontSizeToFitWidth = true
            return cell
        }
        else if (indexPath.row == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "DynamicTableCell", for: indexPath) as! DynamicTableCell
            cell.labelText?.text = dataPoints[indexPath.row]
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WebviewTableCell", for: indexPath) as! WebviewTableCell
            
            cell.webview.load(URLRequest(url: URL(string: dataPoints[indexPath.row])!))
            
            return cell
        }
        
    }
    
}


