//
//  DoSomethingIntentHandler.swift
//  PhotoDeleteApp
//
//  Created by coco j on 2019/02/26.
//  Copyright © 2019 amaocha. All rights reserved.
//
//
import Foundation
import Intents


class DoSomethingIntentHandler: NSObject, DoSomethingIntentHandling {

    func handle(intent: DoSomethingIntent, completion: @escaping (DoSomethingIntentResponse) -> Void) {
        guard let taskName = intent.taskName else {
            completion(DoSomethingIntentResponse(code: .failure,
                                                 userActivity: nil))
            return
        }

        // ここで何か処理を行う
        print("handleされた")
        let response = DoSomethingIntentResponse.success(taskName: taskName)
        completion(response)
    }
}
