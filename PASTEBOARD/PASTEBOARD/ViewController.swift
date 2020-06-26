//
//  ViewController.swift
//  PASTEBOARD
//
//  Created by Hemang on 26/04/20.
//  Copyright © 2020 Hemang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let DATA_KEY="data_key"
    @IBOutlet weak var textView: UITextView!
    
    var pasted:[String]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        if let loadedStrings=UserDefaults.standard.stringArray(forKey: DATA_KEY){
            pasted.append(contentsOf:loadedStrings)
        }
        showText()
        trashcan()
    }
    
    func addText(){
        guard let text=UIPasteboard.general.string, !pasted.contains(text) else{
            return
        }
        
        pasted.append(text)
        UserDefaults.standard.set(pasted, forKey: DATA_KEY)
        showText()
    }
    
    func showText(){
        textView.text=""
        for str in pasted {
            textView.text.append("\(str)\n\n")
        }
        
    }

    @IBAction func trashcan() {
        pasted.removeAll()
        textView.text=""
        UserDefaults.standard.removeObject(forKey: DATA_KEY)
    }
    
}

