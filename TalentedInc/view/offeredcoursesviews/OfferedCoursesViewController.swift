//
//  OfferedCoursesViewController.swift
//  TalentedInc
//
//  Created by Admin on 6/16/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class OfferedCoursesViewController: UIViewController , UITableViewDataSource  , UITableViewDelegate {

    @IBOutlet var offeredCourseViewModel: OfferedCoursesViewModel!
    @IBOutlet var tableView: UITableView!
    var offeredCourse :OfferedCourse!
    
    
    
    @IBAction func myCoursesBtn(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "myCourses") as! InstructorOfferedCourses
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    var flag :Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "Offered Courses"
        offeredCourseViewModel.fetchDataForView {
            self.tableView.reloadData()

        }
        

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offeredCourseViewModel.numberOfItemsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OfferedCoursesCustomCell
        
        cell.offeredCourseName.text = offeredCourseViewModel.titleForItemAtIndexPath(index: indexPath as NSIndexPath)
        
        cell.offeredCourseCreator.text = offeredCourseViewModel.workSpaceForItemAtIndexPath(index: indexPath as NSIndexPath)
        
        cell.offeredCourseStartDate.text = offeredCourseViewModel.DateForItemAtIndexPath(index: indexPath as NSIndexPath)
        
        cell.requestBtn.tag = indexPath.row
        cell.requestBtn.addTarget(self, action: Selector("buttonAction:"), for: .touchUpInside)
        if flag == false {
            cell.cancelBtn.isHidden = true
            cell.requestBtn.isHidden = false
            
        }else {
            cell.cancelBtn.isHidden = false
            cell.requestBtn.isHidden = true
        }
        cell.cancelBtn.tag = indexPath.row
        cell.cancelBtn.addTarget(self, action: Selector("cancelAction:"), for: .touchUpInside)
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let courseDetails : OfferedCourseDetails = segue.destination as! OfferedCourseDetails
        courseDetails.offeredCourse = self.offeredCourse
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        offeredCourse = offeredCourseViewModel.sendOfferedCourseDetails(index: indexPath as NSIndexPath)
    
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    func buttonAction(sender: UIButton) {
        let courseId = offeredCourseViewModel.getCourseId(index: sender.tag)
        let instructorId = 2 ;
        offeredCourseViewModel.sendRequest(courseId: courseId, instructorId: instructorId)
        flag = true
        
    }
 
    func cancelAction(sender: UIButton) {
        let courseId = offeredCourseViewModel.getCourseId(index: sender.tag)
        let instructorId = 2 ;
        offeredCourseViewModel.cancelRequest(courseId: courseId, instructorId: instructorId)
        flag = false
        
    }
    


}
