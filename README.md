import Foundation

func appendToJSONFile(at path: String, newKey: String, dictionary: [String: Any]) {
    let fileManager = FileManager.default
    let fileURL = URL(fileURLWithPath: path)
    
    if fileManager.fileExists(atPath: path) {
        print("JSON file exists. Appending new data.")
        
        do {
            // Read existing JSON data
            let jsonData = try Data(contentsOf: fileURL)
            var existingJSON = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] ?? [:]
            
            // Add new key-value pair to the JSON
            existingJSON[newKey] = dictionary
            
            // Convert updated JSON back to Data
            let updatedJSONData = try JSONSerialization.data(withJSONObject: existingJSON, options: .prettyPrinted)
            
            // Write updated JSON back to the file
            try updatedJSONData.write(to: fileURL, options: .atomic)
            print("Data successfully appended to \(path)")
        } catch {
            print("Error reading or updating JSON file: \(error.localizedDescription)")
        }
    } else {
        print("JSON file does not exist. Creating a new one.")
        
        do {
            // Create new JSON with the given dictionary under the specified key
            let newJSON = [newKey: dictionary]
            let jsonData = try JSONSerialization.data(withJSONObject: newJSON, options: .prettyPrinted)
            
            // Write JSON to file
            try jsonData.write(to: fileURL, options: .atomic)
            print("JSON file created successfully at \(path)")
        } catch {
            print("Error creating JSON file: \(error.localizedDescription)")
        }
    }
}

// Example usage
let path = "/a.b.json"
let newKey = "1"
let newDictionary: [String: Any] = ["key1": "value1", "key2": 42]

appendToJSONFile(at: path, newKey: newKey, dictionary: newDictionary)