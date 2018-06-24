//
//  InstructorCoursesViewModel.swift
//  TalentedInc
//
//  Created by Admin on 6/17/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class InstructorCoursesViewModel: NSObject {
    
    @IBOutlet var instructorCoursesClient : InstructorCoursesClient!
    
    var offeredCourses: [[String:AnyObject]]!

    func numberOfItemsInSection(section: Int) -> Int {
        return offeredCourses?.count ?? 0
    }

    func titleForItemAtIndexPath(index:NSIndexPath) -> String{
        return offeredCourses?[index.row]["name"] as! String
    }

    func dateForItemAtIndexPath(index:NSIndexPath) -> String{
        return offeredCourses?[index.row]["startDate"] as! String
    }
    //to be edited
    
    func creatorForItemAtIndexPath (index : NSIndexPath) -> String {
        //3ayzen el instructor name
        return "instructor"
    }
    
    
    func getCourseId(index : NSIndexPath )-> Int {
        var  courseId  = offeredCourses[index.row]["offeredCourseId"] as! Int
        
        return courseId
        
    }
    
    
    
    func fetchDataForView(completion : @escaping () -> ()  ){
        instructorCoursesClient.fetchInstructorCourses { offeredCourses in
            self.offeredCourses = offeredCourses
            completion()
            
        }
    }
    
    
    
    
}
