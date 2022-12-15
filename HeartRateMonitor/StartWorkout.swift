import Foundation
import UIKit
import CoreBluetooth
import AVFoundation




func executeWorkout(typeOfWorkout:String){

  if typeOfWorkout == "an upper body workout" {
    var utterance = AVSpeechUtterance(string: "Starting your workout now, today's workout will be " + typeOfWorkout)
    utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
    
    upperBodyWorkout()
  }
  else if typeOfWorkout == "a lower body workout" {
    var utterance = AVSpeechUtterance(string: "Starting your workout now, today's workout will be " + typeOfWorkout)
    utterance.voice = AVSpeechSynthesisVoice(language: "en-AU");utterance.rate = 0.5; synthesizer.speak(utterance)
    
    lowerBodyWorkout()
  }
  else if typeOfWorkout == "a full body workout" {
    let utterance = AVSpeechUtterance(string: "Starting your workout now, today's workout will be " + typeOfWorkout)
    utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
    
    fullBodyWorkout()
  }
}

func finalizeWorkout() {
  var utterance = AVSpeechUtterance(string: "Done")
  utterance.voice = AVSpeechSynthesisVoice(language: "en-AU")
  utterance.rate = 0.5
  synthesizer.speak(utterance)
}


func upperBodyWorkout() {
//  "Coach: Okay, let's start with a warm-up to get your blood flowing and muscles loose. I want you to do some light cardio for about 5 minutes. You can walk on a treadmill, do jumping jacks, or choose your own favorite activity.
  var utterance = AVSpeechUtterance(string: "Let's start with a warm-up to get your blood flowing and muscles loose. I want you to do some light cardio for about 5 minutes. You can walk on a treadmill, do jumping jacks, or choose your own favorite activity. The 5 minutes starts now!")
  utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)

//  (5 minutes of warm-up)
    //  Coach: Great job! Keep moving and get that heart rate up. You're doing great!
  var timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: false) { _ in
    utterance = AVSpeechUtterance(string: "Great job! Keep moving and get that heart rate up. You're doing great!")
    utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
  }

//  Now let's do some dynamic stretches to prepare your muscles for the workout. We'll do arm circles, shoulder rolls, and torso twists.
    timer = Timer.scheduledTimer(withTimeInterval: 80, repeats: false) { _ in
      utterance = AVSpeechUtterance(string: "Now let's do some dynamic stretches to prepare your muscles for the workout. We'll do arm circles, shoulder rolls, and torso twists.")
      utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
    }

//  (30 seconds of each stretch)
//  Coach: Excellent work! You're feeling loose and ready to go. Keep up the good work!
    timer = Timer.scheduledTimer(withTimeInterval: 1000, repeats: false) { _ in
      utterance = AVSpeechUtterance(string: "Excellent work! You're feeling loose and ready to go. Keep up the good work!")
      utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
    }

//  Now let's move on to the main part of the workout. We're going to start with a compound exercise that works multiple muscle groups at once. I want you to do 3 sets of 8-12 reps of push-ups or bench press, using a weight that is challenging but allows you to maintain good form.
//  (3 sets of 8-12 reps of push-ups or bench press)
    timer = Timer.scheduledTimer(withTimeInterval: 1000, repeats: false) { _ in
        utterance = AVSpeechUtterance(string: "Now let's move on to the main part of the workout. We're going to start with a compound exercise that works multiple muscle groups at once. I want you to do 3 sets of 8-12 reps of push-ups or bench press, using a weight that is challenging but allows you to maintain good form.")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
  }

//  Coach: Great job! Keep pushing yourself and don't give up. You've got this!
    timer = Timer.scheduledTimer(withTimeInterval: 1000, repeats: false) { _ in
        utterance = AVSpeechUtterance(string: "Now let's move on to the main part of the workout. We're going to start with a compound exercise that works multiple muscle groups at once. I want you to do 3 sets of 8-12 reps of push-ups or bench press, using a weight that is challenging but allows you to maintain good form.")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
  }

//  Now let's move on to some isolation exercises that target specific muscle groups. I want you to do 3 sets of 8-12 reps of bicep curls, tricep dips, lateral raises for your shoulders, and lateral pull-downs for your back. Again, use a weight that is challenging but allows you to maintain good form.
    timer = Timer.scheduledTimer(withTimeInterval: 1000, repeats: false) { _ in
    utterance = AVSpeechUtterance(string: "Now let's move on to some isolation exercises that target specific muscle groups. I want you to do 3 sets of 8-12 reps of bicep curls, tricep dips, lateral raises for your shoulders, and lateral pull-downs for your back. Again, use a weight that is challenging but allows you to maintain good form.")
    utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
}

//  (3 sets of 8-12 reps of each exercise)

//  Coach: Great job! Keep pushing yourself and don't settle for anything less than your best. You're doing awesome!
    timer = Timer.scheduledTimer(withTimeInterval: 1000, repeats: false) { _ in
    utterance = AVSpeechUtterance(string: "Now let's move on to some isolation exercises that target specific muscle groups. I want you to do 3 sets of 8-12 reps of bicep curls, tricep dips, lateral raises for your shoulders, and lateral pull-downs for your back. Again, use a weight that is challenging but allows you to maintain good form.")
    utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
}

//  Now let's cool down with some static stretches. We'll do stretches for your chest, biceps, triceps, and shoulders.
    timer = Timer.scheduledTimer(withTimeInterval: 1000, repeats: false) { _ in
    utterance = AVSpeechUtterance(string: "Now let's cool down with some static stretches. We'll do stretches for your chest, biceps, triceps, and shoulders.")
    utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
}
//  (30 seconds of each stretch)

//  Coach: Excellent work! You're stretching out those muscles and helping them recover. Keep up the good work!
    timer = Timer.scheduledTimer(withTimeInterval: 1000, repeats: false) { _ in
    utterance = AVSpeechUtterance(string: "Excellent work! You're stretching out those muscles and helping them recover. Keep up the good work!")
    utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
}

//  Now let's finish with a few minutes of light cardio to help your heart rate return to normal and flush out any lactic acid that has built up in your muscles.
    timer = Timer.scheduledTimer(withTimeInterval: 1000, repeats: false) { _ in
    utterance = AVSpeechUtterance(string: "Now let's finish with a few minutes of light cardio to help your heart rate return to normal and flush out any lactic acid that has built up in your muscles.")
    utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
}

//  (5 minutes of light cardio)

//  Coach: Great job! You did an awesome workout. Remember to listen to your body and stop if you feel any pain or discomfort. And don't forget to vary your workouts to keep your muscles guessing and avoid plateaus. You can mix up the exercises, sets, reps, and weight to challenge yourself and avoid boredom. Well done! You should be proud of yourself. Keep up the good work!"
    timer = Timer.scheduledTimer(withTimeInterval: 1000, repeats: false) { _ in
    utterance = AVSpeechUtterance(string: "Great job! You did an awesome workout. Remember to listen to your body and stop if you feel any pain or discomfort. And don't forget to vary your workouts to keep your muscles guessing and avoid plateaus. You can mix up the exercises, sets, reps, and weight to challenge yourself and avoid boredom. Well done! You should be proud of yourself. Keep up the good work!")
    utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
    }

}

func lowerBodyWorkout() {
//Coach: Okay, let's start with a warm-up to get your blood flowing and muscles loose. I want you to do some light cardio for about 5 minutes. You can walk on a treadmill, do jumping jacks, or choose your own favorite activity.
      var utterance = AVSpeechUtterance(string: "Okay, let's start with a warm-up to get your blood flowing and muscles loose. I want you to do some light cardio for about 5 minutes. You can walk on a treadmill, do jumping jacks, or choose your own favorite activity.")
      utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
//(5 minutes of warm-up)

//Coach: Great job! Keep moving and get that heart rate up. You're doing great!
      var timer = Timer.scheduledTimer(withTimeInterval: 3*60, repeats: false) { _ in
          var utterance = AVSpeechUtterance(string: "Great job! Keep moving and get that heart rate up. You're doing great!")
          utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
    }

//Now let's do some dynamic stretches to prepare your muscles for the workout. We'll do leg swings, lunges, and ankle rotations.
        timer = Timer.scheduledTimer(withTimeInterval: 2*60, repeats: false) { _ in
        var utterance = AVSpeechUtterance(string: "Now let's do some dynamic stretches to prepare your muscles for the workout. We'll do leg swings, lunges, and ankle rotations.")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
    }
        
//(30 seconds of each stretch)

//Coach: Excellent work! You're feeling loose and ready to go. Keep up the good work!
        timer = Timer.scheduledTimer(withTimeInterval: 1.5*60, repeats: false) { _ in
          var utterance = AVSpeechUtterance(string: "Excellent work! You're feeling loose and ready to go. Keep up the good work!")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
    }

//Now let's move on to the main part of the workout. We're going to start with a compound exercise that works multiple muscle groups at once. I want you to do 3 sets of 8-12 reps of squats or lunges, using a weight that is challenging but allows you to maintain good form.
        timer = Timer.scheduledTimer(withTimeInterval: 15, repeats: false) { _ in
          var utterance = AVSpeechUtterance(string: "Now let's move on to the main part of the workout. We're going to start with a compound exercise that works multiple muscle groups at once. I want you to do 3 sets of 8-12 reps of squats or lunges, using a weight that is challenging but allows you to maintain good form.")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
    }
        
//(3 sets of 8-12 reps of squats or lunges)

//Coach: Great job! Keep pushing yourself and don't give up. You've got this!
        timer = Timer.scheduledTimer(withTimeInterval: 4*60, repeats: false) { _ in
          var utterance = AVSpeechUtterance(string: "Great job! Keep pushing yourself and don't give up. You've got this!")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
    }
        
//Now let's move on to some isolation exercises that target specific muscle groups. I want you to do 3 sets of 8-12 reps of leg press, calf raises, and glute bridges. Again, use a weight that is challenging but allows you to maintain good form.
        timer = Timer.scheduledTimer(withTimeInterval: 4*60, repeats: false) { _ in
          var utterance = AVSpeechUtterance(string: "Great job! Keep pushing yourself and don't give up. You've got this!")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
    }
        
//(3 sets of 8-12 reps of each exercise)

//Coach: Great job! Keep pushing yourself and don't settle for anything less than your best. You're doing awesome!
        timer = Timer.scheduledTimer(withTimeInterval: 4*60, repeats: false) { _ in
          var utterance = AVSpeechUtterance(string: "Great job! Keep pushing yourself and don't give up. You've got this!")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
    }
//Now let's cool down with some static stretches. We'll do stretches for your quads, hamstrings, and calves.
        timer = Timer.scheduledTimer(withTimeInterval: 4*60, repeats: false) { _ in
          var utterance = AVSpeechUtterance(string: "Now let's cool down with some static stretches. We'll do stretches for your quads, hamstrings, and calves.")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
    }
//(30 seconds of each stretch)

//Coach: Excellent work! You're stretching out those muscles and helping them recover. Keep up the good work!
        timer = Timer.scheduledTimer(withTimeInterval: 1*60, repeats: false) { _ in
          var utterance = AVSpeechUtterance(string: "Great job! Keep pushing yourself and don't give up. You've got this!")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
    }
//Now let's finish with a few minutes of light cardio to help your heart rate return to normal and flush out any lactic acid that has built up in your muscles.
        timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: false) { _ in
          var utterance = AVSpeechUtterance(string: "Now let's finish with a few minutes of light cardio to help your heart rate return to normal and flush out any lactic acid that has built up in your muscles.")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
    }
//(5 minutes of light cardio)

//Coach: Great job! You did an awesome workout. Remember to listen to your body and stop if you feel any pain or discomfort. And don't forget to vary your workouts to keep your muscles guessing and avoid plateaus. You can mix up the exercises, sets, reps, and weight to challenge yourself and avoid boredom. Well done! You should be proud of yourself. Keep up the good work!
        timer = Timer.scheduledTimer(withTimeInterval: 6*60, repeats: false) { _ in
          var utterance = AVSpeechUtterance(string: "Great job! You did an awesome workout. Remember to listen to your body and stop if you feel any pain or discomfort. And don't forget to vary your workouts to keep your muscles guessing and avoid plateaus. You can mix up the exercises, sets, reps, and weight to challenge yourself and avoid boredom. Well done! You should be proud of yourself. Keep up the good work!")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-AU"); utterance.rate = 0.5; synthesizer.speak(utterance)
    }
}

func fullBodyWorkout() {
//Coach: Okay, let's start with a warm-up to get your blood flowing and muscles loose. I want you to do some light cardio for about 5 minutes. You can walk on a treadmill, do jumping jacks, or choose your own favorite activity.
//
//(5 minutes of warm-up)
//
//Coach: Great job! Keep moving and get that heart rate up. You're doing great!
//
//Now let's do some dynamic stretches to prepare your muscles for the workout. We'll do arm circles, shoulder rolls, and torso twists.
//
//(30 seconds of each stretch)
//
//Coach: Excellent work! You're feeling loose and ready to go. Keep up the good work!
//
//Now let's move on to the main part of the workout. We're going to start with a compound exercise that works multiple muscle groups at once. I want you to do 3 sets of 8-12 reps of push-ups or bench press, using a weight that is challenging but allows you to maintain good form.
//
//(3 sets of 8-12 reps of push-ups or bench press)
//
//Coach: Great job! Keep pushing yourself and don't give up. You've got this!
//
//Now let's move on to some isolation exercises that target specific muscle groups. I want you to do 3 sets of 8-12 reps of bicep curls, tricep dips, lateral raises for your shoulders, and lateral pull-downs for your back. Again, use a weight that is challenging but allows you to maintain good form.
//
//(3 sets of 8-12 reps of each exercise)
//
//Coach: Great job! Keep pushing yourself and don't settle for anything less than your best. You're doing awesome!
//
//Now let's move on to the lower body. We'll start with a compound exercise that works multiple muscle groups at once. I want you to do 3 sets of 8-12 reps of squats or lunges, using a weight that is challenging but allows you to maintain good form.
//
//(3 sets of 8-12 reps of squats or lunges)
//
//Coach: Great job! Keep pushing yourself and don't give up. You've got this!
//
//Now let's move on to some isolation exercises that target specific muscle groups in the lower body. I want you to do 3 sets of 8-12 reps of leg press, calf raises, and glute bridges. Again, use a weight that is challenging but allows you to maintain good form.
//
//(3 sets of 8-12 reps of each exercise)
//
//Coach: Great job! Keep pushing yourself and don't settle for anything less than your best. You're doing awesome!
//
//Now let's cool down with some static stretches. We'll do stretches for your chest, biceps, triceps, shoulders, quads, hamstrings, and calves.
//
//(30 seconds of each stretch)
//
//Coach: Excellent work! You're stretching out those muscles and helping them recover. Keep up the good work!
//
//Now let's finish with a few minutes of light cardio to help your heart rate return to normal and flush out any lactic acid that has built up in your muscles.
//
//(5 minutes of light cardio)
}
  
  

