//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

var str = "Week5: Flow Control Exercise \nBy: Nestor (Felix) Sotres \n This program keeps a digital 'clock', however, it will stop at one hour so it doesnt go on forever.\n"

println(str)

var delaySeconds: Double = 0.35     //Under 0.4 is normal mode
var hours : Int = 0
var minutes : Int = 0
var seconds : Int = 0

//Create function executing delay
func delay(delay:Double, closure:()->()) {
    //function uses asynchronous method to activate delay
    dispatch_after(
        dispatch_time( DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
}

//Main function calculating timer
func timer()->Void{
    println("Hours: \(hours) Minutes: \(minutes) Seconds: \(seconds)")
    //if delay is less than .3secs, activate (dont want big delays)
    if delaySeconds < 0.4{
        
        //if clock reaches one hour, stop running
        if hours == 1{
            println("Times Up!")
            return      //return from recursive call
        }else{
            //increment seconds
            if seconds < 59{
                seconds++
            }else{
                //60 seconds has been reached
                if minutes < 59{
                    minutes++       //add a minute
                }else{
                    hours++         //add an hour
                    minutes = 0
                }
                seconds = 0
            }
            //recursively run a timer
            delay(delaySeconds){
                timer()
            }
            
        }//end hour check
        
    }//end check for delay
    
    
}//end timer()

//call timer to get things started
timer()

//call below is explained here: http://stackoverflow.com/questions/24058336/how-do-i-run-asynchronous-callbacks-in-playground

XCPSetExecutionShouldContinueIndefinitely() //force playground to pause to let asychronous work to finish