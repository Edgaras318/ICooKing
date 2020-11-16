import SwiftUI
import Speech



struct RecipeRecipe: View {
    
    @ObservedObject var store: RecipeStore
    
    private let audioEngine = AVAudioEngine()
   @State private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    @State private var speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en_IN"))
    
    @State var recognitionTask: SFSpeechRecognitionTask?
    @State private var counter = 0;
    @State private var previousTime = 0;
    @State private var OutputText = ""
    @State private var speakerSwitch = "speaker.3"
    @State private var showFinishView: Int? = nil
    @State private var voiceCommand = "Touch to activate voice command"
    
    var sandwich: Recipe

    var body: some View {
        
        ZStack {
            Color.themeBackground
                .edgesIgnoringSafeArea(.all)
        
        VStack {
            
            VStack {
                
                Button(action: {
                    if(speakerSwitch == "speaker.3"){
                        self.getPermissions()
                       try? self.startRecording()
                        speakerSwitch = "speaker.3.fill"
                        voiceCommand = "Voice command is active!"
                    }
                    else{
                        if self.audioEngine.isRunning
                        {
                            self.recognitionRequest?.endAudio()
                            self.audioEngine.stop()
                            speakerSwitch = "speaker.3"
                            voiceCommand = "Touch to activate voice command"
                        }
                    }

                    //OutputText = "hi"
                    //print("console print")
                    
                }) {
                    VStack{
                    Image(systemName: speakerSwitch)
                                            .resizable().aspectRatio(contentMode: .fill)
                   // Text("Start using voice command")
                      //  .fontWeight(.bold)
                       // .font(.headline)
                        .padding(20)
                        .frame(width: 80, height: 80)
                        Text(voiceCommand)
                        //.resizable()
                        
                            //.background(Color.red)
                       // .background(Color.blue)
                       // .cornerRadius(40)
                       // .foregroundColor(.white)
                    }
                    .padding(-10)

                    
                }
                .padding(.vertical)
               // .position(x: 350, y: 20)
                //TODO: pass which recipe it is
                //show 3 steps in middle black(well visible)
                // previous and upcoming in grey
                // for loop showing 3 steps
                // style view of text and button to start/ stop
                //
                
                if(counter == 0)
                {
                Text(sandwich.steps[counter].text)
                    .font(.title)
                    .foregroundColor(Color.themeForeground)
                    .multilineTextAlignment(.center)
                    .padding(.all)
                    .animation(.default)

                Text(sandwich.steps[counter + 1].text)
                    .font(.headline)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .animation(.default)

                }
                
                else if(counter >= 1 && counter < sandwich.steps.count - 1)
                {
                    Text(sandwich.steps[counter - 1].text)
                        .font(.headline)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .animation(.default)
                    Text(sandwich.steps[counter].text)
                        .font(.title)
                        .foregroundColor(Color.themeForeground)
                        .multilineTextAlignment(.center)
                        .padding(.all)
                        .animation(.default)

                    Text(sandwich.steps[counter + 1].text)
                        .font(.headline)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .animation(.default)

                }
                
                else if(counter == sandwich.steps.count - 1)
                {
                    Text(sandwich.steps[counter - 1].text)
                        .font(.headline)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .animation(.default)

                    Text(sandwich.steps[counter].text)
                        .font(.title)
                        .foregroundColor(Color.themeForeground)
                        .multilineTextAlignment(.center)
                        .padding(.all)
                        .animation(.default)

                }
                
            }
            Spacer()
            
            
            Spacer()
            VStack {
//                Button(action: {
//                    if self.audioEngine.isRunning
//                    {
//                        self.recognitionRequest?.endAudio()
//                        self.audioEngine.stop()
//                        speakerSwitch = "speaker.3"
//                    }
//                }) {
//                    Text("STOP")
//                        .fontWeight(.bold)
//                        .font(.subheadline)
//                        .padding(8.0)
//                        //.background(Color.red)
//
//                        .background(Color.red)
//                        .cornerRadius(40)
//                        .foregroundColor(.white)
//                }
                
                
                HStack {
                    if(counter >= 1)
                    {
                        Button(action: {
                                self.counter = self.counter - 1
                            
                        }) {
                            Text("Previous")
                                .fontWeight(.bold)
                                .padding(6)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .foregroundColor(.themeForeground)
                        }
                        .padding()
                        .background(Color.themeAccent)
                        .animation(.default)
                        .cornerRadius(15)
						.offset(y: -15.0)
                    }
                    
                    //.disabled(counter.Equals(0))
                    
                    if(counter < sandwich.steps.count - 1)
                    {
                        Button(action: {self.counter = self.counter + 1}) {
                            Text("Next")
                                .fontWeight(.bold)
                                .padding(6)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .foregroundColor(.themeForeground)
                        }
                        
                        .padding()
                        .background(Color.themeAccent)
                        .animation(.default)
                        .cornerRadius(15)
						.offset(y: -15.0)
                    }
                    
                    if(counter == sandwich.steps.count - 1)
                    {
                        NavigationLink(
                            destination: //RecipeFinish(store: testStore, sandwich: sandwich),
                                ZStack
                                {
                                    Color.themeBackground
                                    .edgesIgnoringSafeArea(.all)
                                Text("🥳 Congratulations! You have succesfully finished cooking " + sandwich.name + "!")
                                .font(.title)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                
                                },
                            tag :1, selection: self.$showFinishView,
                            label: {
                                Text("Finish")
                                    .fontWeight(.bold)
                                    .padding(6)
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .foregroundColor(.themeForeground)
                            })
                            .padding()
                            .background(Color.themeSecondary)
                            .cornerRadius(15)
                            .animation(.default)
							.offset(y: -15.0)
                    }
                    
                    //.disabled(counter.Equals(sandwich.steps.count - 1))
                }//.frame(width: 10ß0, height: .100)
            }
            
        }
    }
    }
    
    func getPermissions(){
        SFSpeechRecognizer.requestAuthorization{authStatus in
            OperationQueue.main.addOperation {
               switch authStatus {
                    case .authorized:
                        print("authorised..")
                    default:
                        print("none")
               }
            }
        }
    }
    
    func getSeconds() -> Int{
        let date = Date()
        let calendar = Calendar.current
            let second = calendar.component(.second, from: date)
        return second
        //print(second)
    }

        func startRecording() throws {

        recognitionTask?.cancel()
        self.recognitionTask = nil

        let audioSession = AVAudioSession.sharedInstance()
        try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
        try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        
        let inputNode = audioEngine.inputNode
        inputNode.removeTap(onBus: 0)
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        try audioEngine.start()
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let recognitionRequest = recognitionRequest else { fatalError("Unable to create a SFSpeechAudioBufferRecognitionRequest object") }
        recognitionRequest.shouldReportPartialResults = true
            
        if #available(iOS 13, *) {
           if speechRecognizer?.supportsOnDeviceRecognition ?? false{
            print("support?")
            recognitionRequest.requiresOnDeviceRecognition = true
             }
            }

        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest) { result, error in
            if let result = result {
                DispatchQueue.main.async {
                        let message = result.bestTranscription.formattedString
                     // print("Message : \(message)")
                    self.OutputText = (message)
                      var lastString: String = ""
                      for segment in result.bestTranscription.segments {
                          let indexTo = message.index(message.startIndex, offsetBy: segment.substringRange.location)
                        lastString = String(message[indexTo...]).lowercased()
                        

//                        let currentDateTime = Date()
//                        let formatter = DateFormatter()
//                        formatter.timeStyle = .medium
//                        formatter.dateStyle = .long
//
//                        let dateTimeString = formatter.string(from: currentDateTime)
//
//                        let ndateTimeString = formatter.string(from: currentDateTime+3)
                        

                        let timeNow = self.getSeconds()
  
                        
                        if lastString == "next" && timeNow > self.previousTime+1 && counter < sandwich.steps.count - 1 { // multiple words
                            self.counter+=1
                            self.previousTime = self.getSeconds()
                            
                            //secondN = second
                            //datatimeLater = Data()
                            // store time
                            // if time is more when 1 second ago
                            // swift data time storing
                            //working with dates in swift
                            print("activate button! \(self.counter)")
                            
                           // solution change button color means click next
                            //but only after certain amount of time
                            // lol every third number click next
                        }
                        
                        else if lastString == "forward" && timeNow > self.previousTime+1 && counter < sandwich.steps.count - 1 { // multiple words
                            self.counter+=1
                            self.previousTime = self.getSeconds()
                            
                            //secondN = second
                            //datatimeLater = Data()
                            // store time
                            // if time is more when 1 second ago
                            // swift data time storing
                            //working with dates in swift
                            print("activate button! \(self.counter)")
                        }
                        
                        else if lastString == "previous" && timeNow > self.previousTime+1 && counter > 0{ // multiple words
                            self.counter-=1
                            self.previousTime = self.getSeconds()
                            
                            //secondN = second
                            //datatimeLater = Data()
                            // store time
                            // if time is more when 1 second ago
                            // swift data time storing
                            //working with dates in swift
                            print("activate button! \(self.counter)")
                            
                           // solution change button color means click next
                            //but only after certain amount of time
                            // lol every third number click next
                        }
                        
                        else if lastString == "back" && timeNow > self.previousTime+1 && counter > 0{ // multiple words
                            self.counter-=1
                            self.previousTime = self.getSeconds()
                            
                            //secondN = second
                            //datatimeLater = Data()
                            // store time
                            // if time is more when 1 second ago
                            // swift data time storing
                            //working with dates in swift
                            print("activate button! \(self.counter)")
                        }
                        else if lastString == "finish"  && counter == sandwich.steps.count - 1 { // multiple words
                            showFinishView = 1
                            
                            //secondN = second
                            //datatimeLater = Data()
                            // store time
                            // if time is more when 1 second ago
                            // swift data time storing
                            //working with dates in swift
                            print("activate finish button! \(self.counter)")
                        }
                      }
                }
            }
            
            if error != nil {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                self.recognitionRequest = nil
                self.recognitionTask = nil
            }
        }
    }}



struct RecipeRecipe_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeRecipe(store: testStore, sandwich: testData[0])
                .preferredColorScheme(.dark)
            RecipeRecipe(store: testStore, sandwich: testData[1])
        }
    }
}
