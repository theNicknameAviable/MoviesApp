//
//  PersistenceManager.swift
//  MoviesApp
//
//  Created by Raul Bautista on 20/4/22.
//

import Foundation


protocol PersistenceManager {
    func save(objet: [Movies]) -> Bool
    func read() -> [Movies]
}

// MARK: - Save & Read on Disc
class PlistPersistenceManager: PersistenceManager{
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths [0]
        return documentsDirectory
    }
    
    func getFilePath() -> URL {
        let path = getDocumentsDirectory()
        return path.appendingPathComponent("data_saved.plist")
    }
    
    func save(objet: [Movies]) -> Bool{
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        
        let path = getFilePath()
        do{
            let data = try encoder.encode(objet)
            try data.write(to: path)
            return true
        }
        catch{
           print(error)
            return false
        }
    }
    
    func read() -> [Movies]{
        let path = getFilePath()
        let decoder = PropertyListDecoder()
        do{
            let xml = try Data(contentsOf: path)
            let object = try decoder.decode([Movies].self, from: xml)
            return object
        }
        catch{
            print(error)
            return []
        }
    }
}
