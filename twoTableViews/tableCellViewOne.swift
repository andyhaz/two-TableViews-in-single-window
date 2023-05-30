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

    @IBOutlet weak var myLabel: NSTextField!
        
    func configurd( string:String){
      //  button.title = string
        myLabel.stringValue = string
      //  print("table config")
    }
}
