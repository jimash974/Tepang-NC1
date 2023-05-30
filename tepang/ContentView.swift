//
//  ContentView.swift
//  projekdeveloper
//
//  Created by Macbook Pro on 15/03/23.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
//    var gambar: Image = Image(uiImage: UIImage(named: "spin")!)
    @State private var rotateimage = 330

    
    @State var isTimerRunning = false
    @State private var startTime =  Date()
    @State private var timerString = "Spin Sekarang"
    let timer = Timer.publish(every: 0.001, on: .main, in: .common).autoconnect()

    
    let contacts1 = ["Kenalan dengan salah satu teman lawan jenis mu dan minta nomor telfonnya",
                    "Ajak 2 temanmu ke tepang booth",
                    "Boomerang bersama temanmu yang paling tinggi",
                    "Kenalan sama orang yang pakai baju ungu dan sebutkan orang kesukaannya",
                    "Ajak selfie teman kamu yang pakai baju hitam",
                    "Kenalan sama orang yang ga pernah kamu ajak ngobrol sambil video",
                    "Videokan dirimu sedang menyemangati learner yang lain",
                    "Ajak kenalan 5 orang dan foto bersama"
    ]
    
    let contacts2 = ["Jika kamu memiliki miliaran dollar, apakah kamu bisa membeli pertemanan dengan itu ? mengapa ?",
                    "Apakah kamu ingat siapa teman pertamamu di academy?, ajak dia foto !",
                     "Boomerang bersama temanmu yang paling gokil",
                     "Ajak kenalan 3 orang dan teriak WOoHhHOoOoOo",
                     "Cari teman yang memiliki kesamaan denganmu dan selfie bersama",
                     "Foto bersama orang yg menjaga di booth tepang",
                     "Jika kamu mengalami hari yang buruk, siapa yang ada disini yang bakal kamu ceritakan pertama dan kenapa",
                     "Videokan dirimu, sedang memberikan quotes yang membangun ke learner  lain"
                     
    ]
    
    let contacts3 = ["Videokan dirimu berkenalan dengan orang yang memakai jaket",
                     "Videokan dirimu, sedang memberikan quotes yang membangun kepada learner yang menjaga booth",
                     "Ajak 4 temanmu ke tepang booth",
                     "Coba tirukan salah satu orang yang kamu kenal disini",
                     "Minta nomor telefon temanmu yang rambutnya dikuncir",
                     "Jika kamu menjadi mentor, challenge apa yang akan kamu buat berikutnya ?",
                     "Cari temanmu yang belum kenal, dan selfie di hp nya",
                     "Perkenalkan dirimu dengan mengubah huruf vokal menjadi i"
    ]
    var contacts : [String] = []
    let randomquestion = Int.random(in: 0..<2)
    
    
    @State private var rules = false
    @State private var promptNumber = 0
    
    @State var soundEffect:AVAudioPlayer?
    @State var backgroundMusic:AVAudioPlayer?
    @State var soundeffecttelurpecah:AVAudioPlayer?
    
    @State private var backSoundButton = true
    @State private var soundEffButton = true 

    
    
    @State var isTimerRunning1 = true
    let timertelur = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var telurno = 1
    @State private var telur = "telur1"
    
    
    
    @State private var isanimated = false
    
    @State private var showDetails = false
    
    @State private var scale: CGFloat = 1.0

    
    var body: some View {
       
        NavigationView(){
            ZStack {
//                if rules {
//                    Text("TEst")
//                    RulesView(rules: $rules)
//                        .transition(.slide)
//                        .transition(AnyTransition.move(edge: .leading).combined(with: .opacity).animation(.easeInOut(duration: 1)))
//                }else{
                    VStack {
                        ZStack(alignment: .top) {
                            
                            Image(uiImage: UIImage(named: "bgatas")!).resizable()
                                .frame(width: 415, height: 332)
                                .aspectRatio(contentMode: .fill)
                                .edgesIgnoringSafeArea(.all)
                            
                            Image(uiImage: UIImage(named: "logotepang")!).resizable()
                                .frame(width: 294, height: 144)
                                .padding(.top,120)
                            
                            HStack(alignment: .bottom){
                                HStack {
                                    Image(systemName: backSoundButton ? "speaker.wave.2.circle.fill" : "speaker.circle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(Color(red: 0.887, green: 0.62, blue: 0.622))
                                        .foregroundColor(.black)
                                        .frame(width: 40, height: 40)
                                        .padding(.leading, 100)
                                        .padding(.top, 30)
                                        .padding(.leading, 20)
                                        .onTapGesture {
                                            backSoundButton.toggle()
                                            if !backSoundButton{
                                                backgroundMusic?.volume = 0
                                                
                                            }else{
                                                backgroundMusic?.volume = 1
                                            }
                                        }
                                        .onAppear(perform: {
                                            self.soundBackground(music: "backgroundMusic.mp3")
                                            if !backSoundButton{
                                                backgroundMusic?.volume = 0
                                                
                                            }else{
                                                backgroundMusic?.volume = 1
                                            }
                                        })
                                }
                                
                                Image(systemName: soundEffButton ? "headphones.circle.fill" : "headphones.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color(red: 0.887, green: 0.62, blue: 0.622))
                                    .foregroundColor(.black)
                                    .frame(width: 40, height: 40)
                                    .padding(.top, 30)
                                    .onTapGesture {
                                        soundEffButton.toggle()
                                        if !soundEffButton{
                                            soundEffect?.volume = 0
                                        }else{
                                            soundEffect?.volume = 20
                                        }
                                    }
                                    .padding(.top, 10)

                                Spacer()
                                
                                Button(action: {
                                    self.rules.toggle()
                                }) {
                                    Image("icon")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40, height: 40)
                                        .padding(.trailing, 120)
                                        .padding(.top, 30)
                                }
                                .sheet(isPresented: $rules){
                                    RulesView(rules: $rules)
                                }
                            }
                        }
                        .padding(.top, 250)
                        .padding(.bottom, 60)                        
                        
                    ZStack(alignment: .bottom) {
                            
                        Image(uiImage: UIImage(named: "numberedwheel")!)
                            .resizable()
                            .frame(width: 500, height: 500,alignment: .bottom)
        //                    .edgesIgnoringSafeArea(.all)
                            .rotationEffect(
                            .degrees(Double(rotateimage)))
    //                        .padding(.leading, 10)
                            .padding(.bottom, 150)
                            
                            
                        Image("wheelframe")
                            .resizable()
                            .frame(width: 570, height: 210)
                            .aspectRatio(contentMode: .fit)
                            .padding(.bottom, 450)
                            
                            
                            Image(uiImage: UIImage(named: "karakter")!)
                                .resizable()
                                .frame(width: 440, height: 204)
                                .edgesIgnoringSafeArea(.all)
                                .padding(.top,-770)
                            
                            Image(uiImage: UIImage(named: "spinbutton")!)
                                .resizable()
                                .frame(width: 130, height: 130)
                                .edgesIgnoringSafeArea(.all)
                                .padding(.top,-450)
                                .onReceive(timer) { _ in
                                    if self.isTimerRunning {
                                        rotateimage = rotateimage + 1
                                        if(rotateimage == 360){
                                            rotateimage = 0
                                        }
                                    }
                                }
                                .scaleEffect(scale) // Add the scaleEffect modifier here
                                .onTapGesture {
                                    if !showDetails{
                                        withAnimation(.easeInOut(duration: 0.1)) {
                                            self.scale = 1.1
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                            withAnimation(.easeInOut(duration: 0.2)) {
                                                self.scale = 1.0
                                            }
                                        }
                                        if !isTimerRunning {
                                            if !backSoundButton{
                                                backgroundMusic?.volume = 0
                                            }else{
                                                backgroundMusic?.volume = 0.1
                                            }
                                            
                                            self.sound(music: "spinaudio.mp3")
                                            if !soundEffButton{
                                                print(backSoundButton)
                                                soundEffect?.volume = 0
                                            }else{
                                                soundEffect?.volume = 15
                                            }
                                            
                                            rotateimage = 0
                                            timerString = "Stop Spin"
                                            showDetails = false
                                            startTime = Date()
                                        }else{
                                            soundEffect?.stop()
                                            if soundEffButton{
                                                soundtelurpecah()
                                                soundeffecttelurpecah?.volume = 15
                                            }
                                            
                                            timerString = "Spin Sekarang"
                                            showDetails = true
                                            isTimerRunning1 = true
                                            if(rotateimage > 0 && rotateimage < 45){
                                                promptNumber = 2
                                            }else if(rotateimage > 45 && rotateimage < 90){
                                                promptNumber = 1
                                            }else if(rotateimage > 90 && rotateimage < 135){
                                                promptNumber = 8
                                            }else if(rotateimage > 135 && rotateimage < 180){
                                                promptNumber = 7
                                            }else if(rotateimage > 180 && rotateimage < 225){
                                                promptNumber = 6
                                            }else if(rotateimage > 225 && rotateimage < 270){
                                                promptNumber = 5
                                            }else if(rotateimage > 270 && rotateimage < 315){
                                                promptNumber = 4
                                            }else if(rotateimage > 315 && rotateimage < 360){
                                                promptNumber = 3
                                            }
                                            
                                        }
                                        isTimerRunning.toggle()
                                    }
                
                                }
                        }
                    }
                    .ignoresSafeArea(.all)
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: showDetails ? 10 : 0)
                    .opacity(showDetails ? 0.63 : 1)
//                    .transition(.move(edge: .trailing))

//                    .transition(.slide)
                    
//                }
                
                if showDetails{
                    VStack (spacing: 0){
                      ZStack{
                          Image("close")
                              .frame(width: isanimated ? 50 : 0 , height: isanimated ? 50 : 0)
                                .padding(.top, isanimated ? 550 : 300)
                              .onTapGesture {
                                  isTimerRunning1 = false
                                  isanimated = false
                                  
                                  telurno = 1
                                  telur = "telur1"
                                  
                                  showDetails = false
                                  rotateimage = 0
                                  soundeffecttelurpecah?.stop()
                                  if !backSoundButton{
                                      backgroundMusic?.volume = 0
                                      
                                  }else{
                                      backgroundMusic?.volume = 1
                                  }
                              }
                          Image(uiImage: UIImage(named: telur)!).resizable()
                              .frame(width: 500, height: 500)
                              .padding(.top,0)
                              .onReceive(timertelur) { _ in
                                  if self.isTimerRunning1 {
                                      if(telurno == 42){
                                          self.isTimerRunning1 = false
                                          soundeffecttelurpecah?.stop()
                                          withAnimation(Animation.default.delay(0.05)){
                                              isanimated.toggle()
                                              soundPopUp()
                                          }
                                          
                                      }else{
                                          telurno = telurno + 1
                                          telur = "telur" + String(telurno)
                                      }
                                      
                                  }
                              }
                          
                          VStack{
                              
                              VStack(spacing: 10) {
                                  
                                  Text("Prompt \(promptNumber)")
                                      .font(.system(size: 20, weight: .bold))
                                  
                                  if(randomquestion == 0) {
                                                                  
                                      Text("\(contacts1[promptNumber - 1])")
                                          .font(.system(size: 15))
                                          .multilineTextAlignment(.center)
                                          .italic()
                                      
                                  }
                                  else if(randomquestion == 1) {
                                      Text("\(contacts2[promptNumber - 1])")
                                          .font(.system(size: 15))
                                          .multilineTextAlignment(.center)
                                          .italic()
                                      
                                  }
                                  else if(randomquestion == 2) {
                                      Text("\(contacts3[promptNumber - 1])")
                                          .font(.system(size: 15))
                                          .multilineTextAlignment(.center)
                                          .italic()
                                  }
          //                        Text("📸")
                              }
                              .frame(width:  isanimated ? 250 : 0, height:  isanimated ? 100 : 0)
                              .padding(isanimated ? 10 : 0)
                              .background(Color.white)
                                  .cornerRadius(10)
                          }.padding(.bottom,isanimated ? 520 : 0)
                          
                          
                      }
                      


                     
                  }
                              
                }
            }
            .background(Color.white)

        }
        .preferredColorScheme(.light)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
    
    func sound(music: String) {
        print("check sound")
            if let path = Bundle.main.path(forResource: music, ofType: nil){
                print("check sound1")
                do{
                    soundEffect = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    soundEffect?.numberOfLoops = -1
                    
//                    try AVAudioSession.sharedInstance().setCategory(.playback)
                    try AVAudioSession.sharedInstance().setCategory(.playback, options: [.mixWithOthers])
                    try AVAudioSession.sharedInstance().setActive(true)
                    
//                    try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
//                    try? AVAudioSession.sharedInstance().setActive(true)
                    
                    soundEffect?.prepareToPlay()
                
                  
                    soundEffect?.play()
                    print("check sound1")
                }catch {
                    print("Error")
                }
            }
         }
    
    func soundBackground(music: String) {
        print("check sound")
            if let path = Bundle.main.path(forResource: music, ofType: nil){
                print("check sound1")
                do{
                    backgroundMusic = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    backgroundMusic?.numberOfLoops = -1
                    
                    try AVAudioSession.sharedInstance().setCategory(.playback)
                    try AVAudioSession.sharedInstance().setCategory(.playback, options: .duckOthers)
                    try AVAudioSession.sharedInstance().setActive(true)
                    
                    backgroundMusic?.prepareToPlay()
                    backgroundMusic?.play()
                    print("check sound1")
                }catch {
                    print("Error")
                }
            }
         }
    func soundtelurpecah() {
        
            if let path = Bundle.main.path(forResource: "telurpecah.mp3", ofType: nil){
                do{
                    soundeffecttelurpecah = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    
                    try AVAudioSession.sharedInstance().setCategory(.playback)
                    try AVAudioSession.sharedInstance().setCategory(.playback, options: .duckOthers)
                    try AVAudioSession.sharedInstance().setActive(true)
                    
                    soundeffecttelurpecah?.prepareToPlay()
                    soundeffecttelurpecah?.play()
                    print("check sound1")
                }catch {
                    print("Error")
                }
            }
         }
    
    func soundPopUp() {
        
            if let path = Bundle.main.path(forResource: "popUp.mp3", ofType: nil){
                do{
                    soundeffecttelurpecah = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    
                    try AVAudioSession.sharedInstance().setCategory(.playback)
                    try AVAudioSession.sharedInstance().setCategory(.playback, options: .duckOthers)
                    try AVAudioSession.sharedInstance().setActive(true)
                    
                    soundeffecttelurpecah?.prepareToPlay()
                    soundeffecttelurpecah?.play()
                    print("check sound1")
                }catch {
                    print("Error")
                }
            }
         }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


