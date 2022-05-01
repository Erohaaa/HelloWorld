//
//  DocumentViewController.swift
//  HelloWorld
//
//  Created by oleg on 29.04.2022.
//

import UIKit

class DocumentViewController: UIViewController {
    
    @IBOutlet var helloWorldLabel1: UILabel!
    @IBOutlet var showText: UIButton!
    @IBOutlet var go2svc: UIButton!
    @IBOutlet weak var documentNameLabel: UILabel!
    
    var document: UIDocument?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helloWorldLabel1.isHidden =  true
        showText.layer.cornerRadius = 15
        go2svc.layer.cornerRadius = 15
    }
    
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
        if helloWorldLabel1.isHidden {
            helloWorldLabel1.isHidden = false
            showText.setTitle("Hide Text", for: .normal )
        } else {
            helloWorldLabel1.isHidden = true
            showText.setTitle("SHOW", for: .normal)
        }
    }
}
