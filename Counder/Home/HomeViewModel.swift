//
//  HomeViewModel.swift
//  Counder
//
//  Created by Sameer Nawaz on 05/03/21.
//


import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var progress = Double(0)
    
    var timer = Timer()
    @Published var timerActive = false
    @Published var duration = 0.0
    
    init() { }
    
    func setTimer(hours: Int, minutes: Int, seconds: Int) {
        let hrs = hours * 3600, mins = minutes * 60, secs = seconds
        let seconds = secs + mins + hrs
        self.duration = Double(seconds)
    }
    
    func timerButt() {
        if progress == 0 {
            setTimer(hours: 2, minutes: 3, seconds: 8)
            enableTimerMethod()
        }
    }
    
    func enableTimerMethod() {
        timerActive = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.duration -= 1
            let seconds = Int(self.duration) % 60
            self.progress = 100 - Double((Double(seconds)/60) * 100)
        }
    }
    
    func timerActionButton() {
        if timerActive {
            timerActive = false
            timer.invalidate()
        } else { enableTimerMethod() }
    }
    
    func stopTimerButton() {
        timerActive = false; timer.invalidate()
        progress = 0; duration = 0
    }
}
