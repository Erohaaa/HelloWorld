//
//  DocumentViewController.swift
//  HelloWorld
//
//  Created by oleg on 29.04.2022.
//

import UIKit

class DocumentViewController: UIViewController {
    
    @IBOutlet var helloWorldLabel1: UILabel!
    @IBOutlet var textShow: UIButton!
    @IBOutlet weak var documentNameLabel: UILabel!
    
    var document: UIDocument?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Access the document
        document?.open(completionHandler: { (success) in
            if success {
                // Display the content of the document, e.g.:
                self.documentNameLabel.text = self.document?.fileURL.lastPathComponent
            } else {
                // Make sure to handle the failed import appropriately, e.g., by presenting an error message to the user.
            }
        })
    }
    
    @IBAction func dismissDocumentViewController() {
        dismiss(animated: true) {
            self.document?.close(completionHandler: nil)
        }
    }
    @IBAction func showTextButtonPress() {
    }
}
