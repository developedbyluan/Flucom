//
//  StringExt.swift
//  Flucom
//
//  Created by Tran Luan on 17/7/25.
//

extension String {
   func removeSpaces() -> String {
       self.replacingOccurrences(of: " ", with: "")
   }
    
    func removeCaseAndSpace() -> String {
        self.removeSpaces().lowercased()
    }
}
