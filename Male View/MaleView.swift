//
//  MaleView.swift
//  LifeLifting
//
//  Created by Justyce Graham on 11/18/23.

import SwiftUI
struct MaleView: View {
    @State private var feet: Int = 5
    @State private var inches: Int = 8
    @State private var weightInPounds: Int = 150
    @State private var age: Int = 30
    @State private var activityLevel: Double = 1.55 // Default to Moderately Active

    @State private var bmrResult: Double = 0
    @State private var bmiResult: Double = 0
    @State private var amrResult: Double = 0
    @State private var activityDescription: String = ""

    var body: some View {
        ZStack {
            Color(red: 0.28235294, green: 0.07843137, blue: 0.17647059)
                .ignoresSafeArea()

            VStack {
                Text("Enter your information:")
                    .font(.title)
                    .foregroundColor(.white)

                HStack {
                    Picker("Feet", selection: $feet) {
                        ForEach(3..<8) {
                            Text("\($0) ft")
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)

                    Picker("Inches", selection: $inches) {
                        ForEach(0..<12) {
                            Text("\($0) in")
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                }

                HStack {
                    Picker("Weight (lbs)", selection: $weightInPounds) {
                        ForEach(50..<300) {
                            Text("\($0) lbs")
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)

                    Picker("Age", selection: $age) {
                        ForEach(18..<100) {
                            Text("\($0) years")
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                }

                Slider(value: $activityLevel, in: 1...5, step: 0.25) {
                    Text("Activity Level")
                }
                .padding()
                .foregroundColor(.white)

                Text("Activity Level Description: \(activityDescription)")
                    .foregroundColor(.white)
                    .padding()

                Button("Calculate") {
                    var maleCalculations = MaleCalculations(feet: feet, inches: inches, weightInPounds: weightInPounds, age: age)
                    maleCalculations.calculateResults(activityLevel: activityLevel)
                    bmrResult = maleCalculations.bmrResult
                    bmiResult = maleCalculations.bmiResult
                    amrResult = maleCalculations.amrResult
                    updateActivityDescription(activityLevel: activityLevel)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)

                Text("Calories burned naturally: \(bmrResult)")
                    .foregroundColor(.white)
                    .padding()

                Text("BMI: \(bmiResult)")
                    .foregroundColor(.white)
                    .padding()

                Text("Active Metabolic Rate: \(amrResult)")
                    .foregroundColor(.white)
                    .padding()

                Spacer()
            }
            .padding()
        }
    }

    func updateActivityDescription(activityLevel: Double) {
        switch activityLevel {
        case 1:
            activityDescription = "Sedentary (little or no exercise)"
        case 2:
            activityDescription = "Lightly active (exercise 1–3 days/week)"
        case 3:
            activityDescription = "Moderately active (exercise 3–5 days/week)"
        case 4:
            activityDescription = "Active (exercise 6–7 days/week)"
        case 5:
            activityDescription = "Very active (hard exercise 6–7 days/week)"
        default:
            activityDescription = ""
        }
    }

    struct MaleView_Previews: PreviewProvider {
        static var previews: some View {
            MaleView()
        }
    }
}
