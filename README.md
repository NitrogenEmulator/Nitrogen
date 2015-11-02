NitrogenTV
=======
###### Supports tvOS 9.

NitrogenTV is a port of the multi-platform Nintendo DS emulator to tvOS.

Currently, emulation is powered by a threaded ARM interpreter. As a result, emulation is rather slow on Apple TV, which has somewhat crippled iPhone 6 hardware. You'll be able to run stuff like Ace Attorney somewhat OKish but forget about Mario Kart.

[Nitrogen](http://nitrogen.reimuhakurei.net/)

[DeSmuME](http://desmume.org/) 

Installing NitrogenTV
------------------------
##### IMPORTANT: Make sure your working directory is devoid of spaces. Otherwise, bad things will happen.

1. Clone the main Nitrogen Git repository branch. You may do this from a Terminal instance with the command `git clone https://github.com/NitrogenEmulator/Nitrogen.git`, or from a Git frontend like [SourceTree](http://sourcetreeapp.com/).

3. Open "Nitrogen.xcodeproj" located within the cloned "Nitrogen" folder.

5. Switch your build target to NitrogenTV.

4. Connect your tvOS device and let Xcode Organizer associate itself with your device.

5. In the Xcode IDE, select your tvOS device and make sure you are using the Release configuration. Make sure that you are signed in to your Apple Developer account for Xcode to automatically provision your device. (actually I'm not sure if tvOS devices are automatically provisioned)

7. Make sure you've got a rom in the project folder named "demo.nds"

6. Click the "Run" button or press Command + R.

Reporting Bugs
------------------------
#### When something in Nitrogen isn't working correctly for you, please [open a GitHub issue ticket here](https://github.com/NitrogenEmulator/Nitrogen/issues/new).

##### Please do not open issues about the following topics:
* Slow performance

##### Your issue ticket will be closed if you fail to follow the above instructions.

To-do
------------------------
###### We'll get to these, really!
* Work around Apple's tvOS restrictions
* GNU Lightning JIT
* OpenGL ES rendering
* ROM streaming
* ROM auto-trimming
* Add more localizations
* Much more
