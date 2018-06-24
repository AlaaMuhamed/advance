//
//  InstructorOfferedCourses.swift
//  TalentedInc
//
//  Created by Admin on 6/17/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class InstructorOfferedCourses: UIViewController ,UITableViewDataSource  , UITableViewDelegate{
    
    @IBOutlet var instrctorCoursesViewMdel: InstructorCoursesViewModel!
    
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "My Courses"
        instrctorCoursesViewMdel.fetchDataForView {
            self.tableView.reloadData()
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  instrctorCoursesViewMdel.numberOfItemsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "instructorCell", for: indexPath) as! InstructorCustomCell
        cell.courseName.text = instrctorCoursesViewMdel.titleForItemAtIndexPath(index: indexPath as NSIndexPath)
        
        cell.courseStartDate.text = instrctorCoursesViewMdel.dateForItemAtIndexPath(index: indexPath as NSIndexPath)
        
        cell.courseCreator.text = instrctorCoursesViewMdel.creatorForItemAtIndexPath(index: indexPath as NSIndexPath)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //courseId
        var courseId = instrctorCoursesViewMdel.getCourseId(index: indexPath as NSIndexPath)
        
        //send it to the other view  model
        
        
    }
    
    
}
