//
//  NetworkManager.swift
//  agsChat
//
//  Created by MAcBook on 10/06/22.
//

import UIKit
import Network

class NetworkManager: NSObject {

    static let sharedInstance = NetworkManager()
    private override init() {}
    
    let monitor = NWPathMonitor()
    private var status: NWPath.Status = .requiresConnection
    var isReachable: Bool { status == .satisfied }
    var isReachableOnCellular: Bool = true
    
    func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.status = path.status
            self?.isReachableOnCellular = path.isExpensive
            
            if path.status == .satisfied {
                print("We're connected!")
                // post connected notification
            } else {
                print("No connection.")
                // post disconnected notification
            }
            print(path.isExpensive)
        }
        
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> Cancellable {
        
//        if let cachedImage = image(url: URL(string: grupImage)) {
//            DispatchQueue.main.async {
//                completion(item, cachedImage)
//            }
//            return
//        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, err in
            if err == nil {
                completion(data, response, err)
            }
        }
        dataTask.resume()
        return dataTask
    }
    
    func download(url : URL, fileLocation : URL, completion : @escaping (_ result : String) -> Void) {
        
        let downloadTask = URLSession.shared.dataTask(with: url) { data, response, error in
            //let saveFile = documentUrl.appendingPathComponent(fileLocation)
            //try FileManager.default.moveItem(at: fileUrl, to: savedFile)
            //data?.write(to: saveFile, options: .noFileProtection)
            do {
                try data?.write(to: fileLocation)
                completion("downloaded")
            } catch let error {
                print(error.localizedDescription)
            }
        }
        downloadTask.resume()
    }
}
