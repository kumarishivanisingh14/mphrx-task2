//
//  WebviewTableCell.swift
//  task2
//
//  Created by Mphrx on 19/10/21.
//

import UIKit
import WebKit

class WebviewTableCell: UITableViewCell {

    @IBOutlet var webview : WKWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
