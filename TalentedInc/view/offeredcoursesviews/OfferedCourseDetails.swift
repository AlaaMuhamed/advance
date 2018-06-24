//
//  OfferedCourseDetails.swift
//  TalentedInc
//
//  Created by Admin on 6/17/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class OfferedCourseDetails: UIViewController {
    
    var offeredCourse = OfferedCourse()
    
    @IBOutlet var courseImage: UIImageView!
    
    @IBOutlet var courseName: UILabel!
    
    @IBOutlet var workSpaceName: UILabel!
    
    @IBOutlet var workSpaceAddress: UILabel!
    
    @IBOutlet var courseDescription: UITextView!
    
    @IBOutlet var courseStartDate: UILabel!
    
    @IBOutlet var courseEndDate: UILabel!
    
    @IBOutlet var courseDuration: UILabel!
    
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        courseName.text = offeredCourse.courseName
        workSpaceName.text = offeredCourse.workSpaceName
        workSpaceAddress.text = offeredCourse.workSpaceAddress
        courseDescription.text = offeredCourse.description
        courseStartDate.text = offeredCourse.startDate
        courseEndDate.text = offeredCourse.endDate
     //   courseDuration.text =  String(offeredCourse.duration)
        
        

    }

  

}
