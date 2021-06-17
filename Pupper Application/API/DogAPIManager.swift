//
//  DogModel.swift
//  Pupper Application
//
//  Created by Julian Carachure on 8/26/18.
//  Copyright © 2018 juliancarachure. All rights reserved.
//

import Foundation

class DogAPIManager {
    
    let links : [String] = [    "https://dog.ceo/api/breeds/list/all",
                                "https://dog.ceo/api/breed/",
                                "https://dog.ceo/api/breeds/image/random"]
    
    var dynamicLink = String()
    
    func getListDogs(completion: @escaping(_ alldog: allDog?,_ error: Error?) -> Void) {
        //1.
        getJSONFromURL(urlString: links[0]) { (data,error) in
            guard let data = data, error == nil else {
                return completion(nil,error)
            }
        //2.
            self.createAllDogObjetWith(json: data, completion: { (alldog, error) in
                if let error = error {
                    print("Failed to convert data")
                    return completion(nil,error)
                }
                return completion(alldog,nil)
            })
        }
    }
    
    func getImagesDogs(completion: @escaping(_ alldog: allDogImages?,_ error: Error?) -> Void) {
        //1.
        let updatedLink = links[1] + dynamicLink + "/images"
        print(updatedLink)
        getJSONFromURL(urlString: updatedLink) { (data,error) in
            guard let data = data, error == nil else {
                return completion(nil,error)
            }
            //2.
            self.createAllDogImagesWith(json: data, completion: { (allDogImages, error) in
                if let error = error {
                    print("Failed to convert data")
                    return completion(nil,error)
                }
                return completion(allDogImages,nil)
            })
        }
    }
    
    func getRandomImagesDogs(completion: @escaping(_ alldog: allDogImagesRandom?,_ error: Error?) -> Void) {
        //1.
        
        print(links[2])
        getJSONFromURL(urlString: links[2]) { (data,error) in
            guard let data = data, error == nil else {
                print("FAILED HERE")
                return completion(nil,error)
            }
            //2.
            
            self.createDogRandomImagesWith(json: data, completion: { (allDogImagesRandom, error) in
                if let error = error {
                    print("Failed to convert data")
                    return completion(nil,error)
                }
                return completion(allDogImagesRandom,nil)
            })
        }
        
    }
    
    
    
}

extension DogAPIManager {
    private func getJSONFromURL(urlString: String, completion: @escaping(_ data: Data?,_ error: Error?) -> Void) {

        guard let myURL = URL(string: urlString) else {
            print("Error: Cant create a url from string")
            return
        }
        let myURLRequest = URLRequest(url: myURL)
        let task = URLSession.shared.dataTask(with: myURLRequest) { (data, _, error) in
            guard error == nil else {
                print("error calling api")
                return completion(nil,error)
            }
            guard let responseData = data else {
                print("data is nil")
                return completion(nil, error)
            }
            completion(responseData,nil)
        }
        task.resume()
    }
    
    private func createAllDogObjetWith(json: Data, completion: @escaping(_ data:  allDog?,_ error: Error?) -> Void) {
        do {
            // 1
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            // 2
            let Dog = try decoder.decode(allDog.self, from: json)
            return completion(Dog,nil)
            
        } catch let error {
            print("Error creating all dog object from JSON because \(error.localizedDescription)")
            return completion(nil,error)
        }
    }
    
    private func createAllDogImagesWith(json: Data, completion: @escaping(_ data:  allDogImages?,_ error: Error?) -> Void) {
        do {
            // 1
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            // 2
            let Dog = try decoder.decode(allDogImages.self, from: json)
            return completion(Dog,nil)
            
        } catch let error {
            print("Error creating all dog object from JSON because \(error.localizedDescription)")
            return completion(nil,error)
        }
    }
    
    private func createDogRandomImagesWith(json: Data, completion: @escaping(_ data:  allDogImagesRandom?,_ error: Error?) -> Void) {
        do {
            // 1
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            // 2
            let Dog = try decoder.decode(allDogImagesRandom.self, from: json)
            return completion(Dog,nil)
            
        } catch let error {
            print("Error creating all dog object from JSON because \(error.localizedDescription)")
            return completion(nil,error)
        }
    }
    
}

