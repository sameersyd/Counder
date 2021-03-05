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
    
    init() { }
    
    func timerButt() {
        if progress == 0 { enableTimerMethod() }
    }
    
    func enableTimerMethod() {
        timerActive = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.progress = self.progress > 100 ? 0.1 : self.progress + 1.7
        }
    }
    
    func timerActionButton() {
        if timerActive {
            timerActive = false
            timer.invalidate()
        } else { enableTimerMethod() }
    }
    
    func stopTimerButton() {
        timerActive = false
        timer.invalidate()
        progress = 0
    }
}
