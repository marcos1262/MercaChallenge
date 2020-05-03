//
//  ImageLoader.swift
//  MercaChallenge
//
//  Created by Marcos Santos
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

import UIKit

struct ImageLoader {
    static func loadImageUsingCache(from url: URL?, _ completion: @escaping (UIImage) -> Void) {
        guard let url = url else {
            return completion(.placeholder)
        }

        let imageName = url.absoluteString.split(separator: "/").last! as NSString

        let fileManager = FileManager.default
        let diskPaths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        let cacheDirectory = diskPaths[0] as String
        let diskPath = cacheDirectory.appending(imageName as String)

        // check cache for image first
        if fileManager.fileExists(atPath: diskPath) {
            return completion(UIImage(contentsOfFile: diskPath) ?? .placeholder)
        }

        //otherwise fire off a new download
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard error == nil else {
                return debugPrint("Image download error:", error?.localizedDescription ?? "")
            }
            guard (response as? HTTPURLResponse) != nil else {
                return debugPrint("Image download error")
            }
            if let data = data, let image = UIImage(data: data) {
                try? data.write(to: URL(fileURLWithPath: diskPath), options: .atomic)
                completion(image)
            }
        }).resume()
    }
}
