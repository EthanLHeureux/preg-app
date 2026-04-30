//
//  HomePageView.swift
//  Preg-App Frontend
//
//  Created by Abraham Gomez Jr on 4/11/26.
//


import SwiftUI

// Struct used because views should be temporary and recomputed when states change. A class would be too persistent.
struct HomePageView: View {
    
    
    // WeekViewModel is created as a state object here since it is only displayed on the home page.
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var weekVM = WeekViewModel()
    
    // Controls the homepage design.
    var body: some View {
        
        // ZStack controls the depth of the design. This means that things placed towards the top of the stack will be
        // placed in the background, while things placed at the bottom are in the front.
        ZStack{
            Color(#colorLiteral(red: 1, green: 0.9435498118, blue: 0.8799069524, alpha: 1))
                .ignoresSafeArea()
            
            // VStack controls vertically stacked items.
            VStack {
                
                // HStack controls horizontally stacked items.
                HStack {
                    
                    // Left arrow button, which contains an action that will ensure new week data is displayed.
                    Button(action: {
                        weekVM.previousWeek()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.brown)
                    }
                    
                    Spacer()
                    
                    Text("Week \(weekVM.current_week)")
                        .foregroundColor(Color(#colorLiteral(red: 0.7978, green: 0.6680, blue: 0.6557, alpha: 1)))
                        .font(.system(size: 20, weight: .bold, design: .serif))
                    
                    Spacer()
                    
                    // Right arrow button with similar action as the left button.
                    Button(action: {
                        weekVM.nextWeek()
                    }) {
                        Image(systemName: "chevron.right")
                            .font(.title2)
                            .foregroundColor(.brown)
                    }
                }
                .padding(.horizontal)
                
                // Verse box
                RoundedRectangle(cornerRadius: 20)
                    .fill(.pink.opacity(0.4))
                    .frame(width: 350, height: 80)
                    .overlay(
                        Text("Verse")
                            .foregroundColor(.white)
                    )
                
                HStack {
                    
                    // Picture box
                    Rectangle()
                        .fill(.black)
                        .frame(width: 160, height: 300)
                        .overlay(
                            VStack {
                                Text("Picture")
                                    .foregroundColor(.white)
                            }
                        )
                    
                    // These stacked rectangles contain common symptoms and an emotional change the mother
                    //may feel during specific weeks.
                    VStack{
                        Rectangle()
                            .fill(.black)
                            .frame(width: 170, height: 95)
                            .overlay(
                                Text(weekVM.current_week_data?.mother.commonSymptoms[0] ?? "")
                                    .foregroundColor(.white)
                            )
                        
                        Rectangle()
                            .fill(.black)
                            .frame(width: 170, height: 95)
                            .overlay(
                                Text(weekVM.current_week_data?.mother.commonSymptoms[1] ?? "")
                                    .foregroundColor(.white)
                            )
                        
                        Rectangle()
                            .fill(.black)
                            .frame(width: 170, height: 95)
                            .overlay(
                                Text(weekVM.current_week_data?.mother.emotionalChanges[2] ?? "")
                                    .foregroundColor(.white)
                            )
                    }
                }
                
                // Contains the mother and baby boxes.
                HStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.pink.opacity(0.4))
                        .frame(width: 170, height: 200)
                        .overlay(
                            VStack {
                                
                                Text("Mom")
                                    .foregroundColor(.white)
                                    .padding(5)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    
                                    Text("• \(weekVM.current_week_data?.mother.bodyChanges[0] ?? "")")
                                    Text("• \(weekVM.current_week_data?.mother.bodyChanges[1] ?? "")")
                                    Text("• \(weekVM.current_week_data?.mother.emotionalChanges.first ?? "")")
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.white)
                            }
                        )
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.pink.opacity(0.4))
                        .frame(width: 170, height: 200)
                        .overlay(
                            VStack {
                                
                                Text("Baby")
                                    .foregroundColor(.white)
                                    .padding(5)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    
                                    Text("•  \(weekVM.current_week_data?.baby.expectedDevelopment[0] ?? "")")
                                        .foregroundColor(.white)
                                    Text("•  \(weekVM.current_week_data?.baby.sizeComparison ?? "")")
                                        .foregroundColor(.white)
                                    Text("•  \(weekVM.current_week_data?.baby.expectedWeight ?? "")")
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.white)
                            }
                        )
                }
            }
        }
        
        // When the view is called, this allows the inital week display to be that of the users
        // current week of pregnancy,
        .onAppear {
            if let userWeek = authViewModel.user?.current_week {
                weekVM.setWeek(userWeek)
            }
        }
    }
}

#Preview {
    HomePageView()
        .environmentObject(AuthViewModel())
}
