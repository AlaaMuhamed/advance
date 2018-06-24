//
//  offeredCoursesClient.swift
//  TalentedInc
//
//  Created by Admin on 6/16/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class offeredCoursesClient: NSObject {
    
    func fetchOfferedCourses(completion : @escaping ([[String:AnyObject]]?) -> () ) {
        Alamofire.request("http://192.168.43.40:3000/offeredcourse/createdByWorkspaces?instructorId=2&page=0").responseJSON { (response) in
            if response.result.value != nil {
                let result = JSON(response.result.value!)
                
                if let data = result["content"].arrayObject {
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
    
    func sendOfferedCourseRequest(courseId : Int , instructorId : Int) {
        Alamofire.request( "http://192.168.43.40:3000/InstructorReqOfferedCourse/requestcourse?instructorId=2&courseId=33" , method: .post ).responseJSON { (response) in
            if ((response.response?.statusCode) == 200) {
                print("request sent ")
               
            }
            else{
                print("faild to connect")
            }
        }
        
        
        
    }
    
    
    func cancelOfferedCourseRequest(courseId : Int , instructorId : Int) {
        Alamofire.request("http://192.168.43.40:3000/InstructorReqOfferedCourse/cancelCourseRequest?instructorId=\(instructorId)&courseId=\(courseId)" , method: .delete ).responseJSON { (response) in
            if ((response.response?.statusCode) == 200) {
                print("request sent ")
                
            }
            else{
                print("faild to connect")
            }
        }
        
        
        
    }
    

}
