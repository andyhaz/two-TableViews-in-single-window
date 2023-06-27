//
//  tableCellViewOne.swift
//  twoTableViews
//
//  Created by andyhaz on 5/24/23.
//
//import AppKit
import Cocoa
import Foundation

class tableCellViewOne: NSTableCellView {

    weak var delegate:tableEventDelegate?
    
    @IBOutlet weak var myLabel: NSTextField!
        
    func configurd( string:String){
      //  button.title = string
        myLabel.stringValue = string
        self.delegate?.rowEvent(massage:string)
      //  print("table config")
    }
}
