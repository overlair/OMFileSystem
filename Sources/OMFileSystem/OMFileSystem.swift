// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public class OMFileSystem: NSObject {
    
    public static func documentURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                   in: .userDomainMask,
                                   appropriateFor: nil,
                                   create: true)
    }
    
    public static func directoryURL(for path: String) throws  -> URL {
        return try documentURL().appendingPathComponent(path, isDirectory: true)
    }
    
    public  static func fileURL(for path: String,
                        file: String,
                        pathExtension: String? = nil) throws  -> URL {

        var url = try directoryURL(for: path)
//            .appendingPathComponent(idPath.folder, conformingTo: .folder)
        
            url = url
            .appendingPathComponent(path, isDirectory: false)
        if let pathExtension {
            url = url
                .appendingPathExtension(pathExtension)
        }

        return url
       
    }
    
    
    public static func write(to url: URL, data: Data, options: Data.WritingOptions = .atomic) throws {
        try data.write(to: url, options: options)
    }

    public static func read(from url: URL) throws -> Data? {
        return try Data(contentsOf: url)
    }
    
    public static func delete(url: URL) throws {
        try FileManager.default.removeItem(at: url)
    }
    
    public static func createDirectory(at url: URL) throws {
        try FileManager.default.createDirectory(at:url,
                                                withIntermediateDirectories: true,
                                                attributes: nil)
    }
    
    public static func directoryExists(at url: URL) -> Bool {
        let fileManager = FileManager.default
        var isDir : ObjCBool = false
        if fileManager.fileExists(atPath: url.path, isDirectory:&isDir) {
            return isDir.boolValue
        } else {
            return false
        }
    }
    
    public static func fileExists(at url: URL) -> Bool {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: url.path) {
            return true
        } else {
            return false
        }
    }
}
