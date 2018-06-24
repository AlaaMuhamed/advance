//
//  OfferedCoursesViewModel.swift
//  TalentedInc
//
//  Created by Admin on 6/16/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class OfferedCoursesViewModel: NSObject {
    
    @IBOutlet var offeredCourseClient : offeredCoursesClient!

    var offeredCourses: [[String:AnyObject]]!
    
    func numberOfItemsInSection(section: Int) -> Int {
        return offeredCourses?.count ?? 0
    }
    
    func titleForItemAtIndexPath(index:NSIndexPath) -> String{
        return offeredCourses?[index.row]["name"] as! String
    }
    
    func DateForItemAtIndexPath(index:NSIndexPath) -> String{
        return offeredCourses?[index.row]["startDate"] as! String
    }
    
    func workSpaceForItemAtIndexPath (index : NSIndexPath) -> String {
        
        let json = JSON(offeredCourses?[index.row]["hostingWorkSpaceId"] as Any)
        let workSpaceName = json["name"].stringValue
        return workSpaceName
    }
    
    func sendOfferedCourseDetails (index : NSIndexPath) -> OfferedCourse {
        var course  = OfferedCourse()
        course.courseName = offeredCourses[index.row]["name"] as! String
        let json = JSON(offeredCourses?[index.row]["hostingWorkSpaceId"] as Any)
        course.workSpaceName  = json["name"].stringValue
        course.workSpaceAddress = json["description"].stringValue
        course.description = offeredCourses[index.row]["description"] as? String
        course.startDate = offeredCourses[index.row]["startDate"] as? String
        course.endDate = offeredCourses[index.row]["endDate"] as? String
        course.duration = offeredCourses[index.row]["durationHours"] as? Int

        return course
        
    }
    
    func getCourseId(index : Int )-> Int {
        var  courseId  = offeredCourses[index]["offeredCourseId"] as! Int
        return courseId
        
    }
    
    
    
    func fetchDataForView(completion : @escaping () -> ()  ){
        offeredCourseClient.fetchOfferedCourses { offeredCourses in
            self.offeredCourses = offeredCourses
            completion()
            
        }
    }
    
    func sendRequest (courseId : Int , instructorId : Int ) -> ( ) {
     offeredCourseClient.sendOfferedCourseRequest(courseId: courseId, instructorId: instructorId)
    
    }
    func cancelRequest (courseId : Int , instructorId : Int ) -> ( ) {
        offeredCourseClient.sendOfferedCourseRequest(courseId: courseId, instructorId: instructorId)
        
    }
    
    
}
