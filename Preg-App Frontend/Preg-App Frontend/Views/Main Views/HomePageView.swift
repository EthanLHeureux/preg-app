//
//  HomePageView.swift
//  Preg-App Frontend
//
//  Created by Abraham Gomez Jr on 4/11/26.
//


import SwiftUI

struct HomePageView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var weekVM = WeekViewModel()
    
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 1, green: 0.9435498118, blue: 0.8799069524, alpha: 1))
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
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
                    
                    Button(action: {
                        weekVM.nextWeek()
                    }) {
                        Image(systemName: "chevron.right")
                            .font(.title2)
                            .foregroundColor(.brown)
                    }
                }
                .padding(.horizontal)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(.pink.opacity(0.4))
                    .frame(width: 350, height: 80)
                    .overlay(
                        Text("Verse")
                            .foregroundColor(.white)
                    )
                
                HStack {
                    Rectangle()
                        .fill(.black)
                        .frame(width: 160, height: 300)
                        .overlay(
                            VStack {
                                Text("Picture")
                                    .foregroundColor(.white)
                            }
                        )
                    
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
