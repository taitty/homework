//
//  calendarListRepository.swift
//  googleCalendar
//
//  Created by 김희수 on 2020/05/01.
//  Copyright © 2020 taitty. All rights reserved.
//

import Foundation

protocol calendarListRepository {
    func getCalendarList()
    func getUserData()
    func setUserData()
}
