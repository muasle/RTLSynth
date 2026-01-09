RTL SYNTH DOC
  (This project was created for the Synthesis Theory I course at the Peabody Institute at Johns Hopkins)


The “RTL Synthesizer” is a software driven synth that uses radio signals as audio input, that can then be manipulated for MIDI playback. The idea is based on the OP-1 synthesizer created by Teenage Engineering. The OP-1 has a built-in radio receiver that allows the user to record, manipulate, and playback radio signals all on the same device. However, the OP-1 is set at a price point of $2,000. I wanted to take this same idea of being able to playback and manipulate radio signals, but make it more affordable by using more accessible materials.


HARDWARE:

To do this I used two pieces of hardware. One was a Raspberry Pi 4, which retails for around $50-$100 depending on where it is purchased. In my case, the Raspberry Pi was free as it came from the Computer Music department’s library. One of the reasons I chose the Raspberry Pi is because many users that would be interested in instrument making or synthesis may already have this device laying around due to its versatility and affordability. The second reason was a needed something that would be easily transportable as well as powerful enough to run the code for the synthesizer. I wanted to match the characteristics of the OP-1 as much as possible, and by using a Raspberry Pi, it allows the user to upgrade this project to have something like a hardwired power supply, enabling transportability. However, since this project is all software driven as well as built in Linux, it can be run without the Pi on any computer.

The second piece of hardware I used was an RTL SDR dongle. SDR stands for “Software Driven Radio” while RTL refers to the Realtek chipset used in mass produced DVB-T TV tuners. This dongle plugs into the Raspberry Pi via USB type A, and then uses a coaxial connection to any basic radio antenna in order to receive signal. The dongle along with an antenna can be found online for around $50, and the software package in order to run the device is open-source. This device does all of the radio signal logic for the RTL synth including tuning and playing back the found signal. The project also uses an Akai MPK Mini as a standard MIDI controller, however the MIDI mapping in this project is fully customizable, meaning any controller could be used including a computer keyboard.


CODE:

The synth uses two programming languages, PureData and Unix Shell. The Shell script calls to the RTL SDR dongle to find a frequency, in this case channel 103.1 and then plays it at a sample rate of 48k Hz, returning a .iq file or a raw data file. In the same Shell script call, it then uses a package called “SoX”, an open-source audio editing software to record that .iq file into a .wav file with a custom name.


The Shell script is activated via a PureData patch. The patch uses embedded MIDI logic to grab button information that then uses an object call “shell” to activate the Shell script and set the returned .wav file as the current audio sample. In my demo, I am using a Akai MPK Mini, and mapped the bottom row of drum pads on the controller to this logic, allowing a bank of four audio samples. In order to callback to any of these samples, I mapped the top row to reselect the sample that was recorded with the button below it. For example, if you recorded a sample on button 1, and then recorded another sample on button 2, you could select the button above button 1 to reselect the first recorded sample.

Using the same MIDI notein logic, a standard MIDI keyboard is mapped to playback the returned audio sample, with middle C initializing the sample at its original pitch. Moving up or down from this note changes the pitch of the audio sample. In my demo, I also programmed my MIDI controller’s knobs to perform various effects, such as change velocity, duration, or control a high pass filter. These effects can be expanded upon for users using the PureData library, and similar to the drum pads, be adapted for the user’s specific controller.

All of the MIDI mapping can be changed or replaced with a computer keyboard input. The audio manipulation can also be adapted by remapping or by expanding the logic using PureData’s library.


Link to Demo: https://www.youtube.com/watch?v=Osrueppk-UM 


