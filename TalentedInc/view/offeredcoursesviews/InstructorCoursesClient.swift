//
//  InstructorCoursesClient.swift
//  TalentedInc
//
//  Created by Admin on 6/17/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

import UIKit
import Alamofire
import SwiftyJSON

class InstructorCoursesClient : NSObject {
    
    func fetchInstructorCourses(completion : @escaping ([[String:AnyObject]]?) -> () ) {
        Alamofire.request("http://192.168.43.40:3000/offeredcourse/offeredcoursebyinstuctor?insructorId=2&page=0").responseJSON { (response) in
            if response.result.value != nil {
                let result = JSON(response.result.value!)
                
                if let data = result.arrayObject {
                    let finalResult = data as! [[String:AnyObject]]
                    completion(finalResult)
                }
                
            }
            else{
                print("faild to load JSON")
                completion(nil)
            }
        }
        
    }
    
   
    
}
