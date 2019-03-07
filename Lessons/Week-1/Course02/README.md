Mar 7, 2019 (Thur)
<H1> Lesson 2 - Shell / Terminal </H1>

<h2> 1. GUI vs CLI </h2>

**GUI: Graphic User Interface** (macOS, Windows)

**CLI: Command Line Interface** (MS-DOS, Linux, Terminal)

<img width="400" alt="2019-03-07 5 22 38" src="https://user-images.githubusercontent.com/29372705/53942316-cc4cce80-40fd-11e9-9bac-6589d8610788.png">

<h2> 2. LaunchPad </h2>

<img width="400" alt="2019-03-07 5 28 24" src="https://user-images.githubusercontent.com/29372705/53942578-7cbad280-40fe-11e9-8b13-5430ff72cbe4.png">

<h2> 3. Spotlight </h2>

<img width="400" alt="2019-03-07 5 30 26" src="https://user-images.githubusercontent.com/29372705/53942699-c1df0480-40fe-11e9-909c-233d5a58d126.png">

<h2> 4. Terminal </h2>

<img width="566" alt="2019-03-07 5 31 49" src="https://user-images.githubusercontent.com/29372705/53942761-ee931c00-40fe-11e9-8ecd-3443833a36e3.png">

<h2> 5. Shell </h2>

- echo $SHELL - output the shell currently in use
- cat /etc/shells - output a list of the available shells

<img width="421" alt="2019-03-07 5 36 13" src="https://user-images.githubusercontent.com/29372705/53943025-8f81d700-40ff-11e9-9694-a0dd1f5fdea7.png">

- Perform as an interpreter to facilitate communicate between the user and OS (kernel)
- User (Command) -> Shell (Interpret) -> Kernel (Perform command & send result) -> Shell (Interprete) -> User (Check result)

<img width="300" alt="2019-03-07 7 21 58" src="https://user-images.githubusercontent.com/29372705/53949877-50a74d80-410e-11e9-99e0-2246f8274311.png">

<h2> 6. Kernel </h2>

**What is Kernel?**

A Kernel is a center component of an operating system (OS). It is an interface between the user and the software system (means, it is and interface between hardware components and software applications).

**What is its function?**

Hardware components are those which we can touch (mouse, speaker, hard disk, etc.) and we humans cannot directly interact with the hardware to get things done. Softwares are those pieces of programs which we cannot touch but see and  we can work with them because they have a user-friendly interface. That is why we make use of software. That is why they are built in user-friendly interfaces. These softwares do the work of taking input from us, interact with the required hardware and produce specific output and display it. So, this is what a kernel does. 

Kernel makes the software interact with the hardware to get a specific task done. It facilitates a communication between an application and a hardware according to the user input. The functions of a kernel are not limited as an interface. It is the most important component of OS. It starts when the computer starts and it is kept loaded until it's turned off. It decides the amount of resources (Hard Disk, RAM, GPU, etc.) to be used by every application. Every program must get a limited amount of resources so that all the other programs  are run well and are not interrupted.

The kernel allows the application data to flow into the memory. It also decides in what order the programs will be executed. The kernel has separate space in memory which allows it to function independently. If the user data interfaces with the functioning of the kernel, it may cause instability and ultimate system failure. It acts as a central authority which guides memory and keeps an eye on all the hardware and software data flow.

<img width="280" alt="2019-03-07 6 14 31" src="https://user-images.githubusercontent.com/29372705/53945401-e807a300-4104-11e9-9c86-2129a87c1746.png">

<h2> 6. Command line </h2>

<h3>Basic Commands</h3>

1. __pwd__ - to know which directory you are in
2. __ls__ - to know what files are in the directory you are in
   __ls__ -a - show all hidden files
3. __cd__ - to go to a directory
   __cd ~__ - to go to root folder 
   __cd ..__ - to go back to parent folder

<div>
  <img width="200" alt="2019-03-07 7 29 24" src="https://user-images.githubusercontent.com/29372705/53950385-5ea99e00-410f-11e9-942e-84770726456a.png">
  <img width="320" alt="2019-03-07 7 32 46" src="https://user-images.githubusercontent.com/29372705/53950648-f909e180-410f-11e9-8257-4ec0ba011a18.png">
<img width="326" alt="2019-03-07 7 37 36" src="https://user-images.githubusercontent.com/29372705/53950883-8c431700-4110-11e9-9ba6-0e0d7b2f3fc2.png">
  </div>
  

4. __mkdir & rmdir__ - to create and remove directory (But rmdir can only be used to delete an empty directory. To delete a directory containing files, use rm)

<img width="350" alt="2019-03-07 7 44 04" src="https://user-images.githubusercontent.com/29372705/53951258-68340580-4111-11e9-9e21-491fed22633f.png">


5. __rm__ - to delete files and directories
   __rm -r directory__ - to delete directory containing files

<img width="350" alt="2019-03-07 7 51 04" src="https://user-images.githubusercontent.com/29372705/53951693-61f25900-4112-11e9-9a5c-8b08738a962b.png">

6. __touch__ - to create a file

<img width="350" alt="2019-03-07 7 52 43" src="https://user-images.githubusercontent.com/29372705/53951795-9c5bf600-4112-11e9-918f-71e7cf91936f.png">

7. __man & --help__ - To know more about a command and how to use it

<div>
<img width="350" alt="2019-03-07 7 55 54" src="https://user-images.githubusercontent.com/29372705/53951993-0f656c80-4113-11e9-928e-7e3794806d3f.png">
<img width="350" alt="2019-03-07 7 55 32" src="https://user-images.githubusercontent.com/29372705/53952000-12605d00-4113-11e9-8cd6-5ea915fdecad.png">
</div>

8. __cp__ - to copy files

<img width="350" alt="2019-03-07 8 04 17" src="https://user-images.githubusercontent.com/29372705/53952500-3a9c8b80-4114-11e9-906e-27419a6f207e.png">

9. __mv__ - to move files / rename files

<img width="350" alt="2019-03-07 8 08 57" src="https://user-images.githubusercontent.com/29372705/53952712-e219be00-4114-11e9-813b-5547d42dbbb9.png">

10. __vi / nano__ - text editors

<img width="350" alt="2019-03-07 8 14 56" src="https://user-images.githubusercontent.com/29372705/53953118-e692a680-4115-11e9-9760-50c159ec9854.png">

11. __cat__ - to display the contents of a file

<img width="350" alt="2019-03-07 8 17 51" src="https://user-images.githubusercontent.com/29372705/53953224-1e99e980-4116-11e9-91e7-2258e081180f.png">

12. __clear__ - to clear screen

<div>
   <img width="300" alt="2019-03-07 8 23 53" src="https://user-images.githubusercontent.com/29372705/53953573-08d8f400-4117-11e9-80e8-b9deae5d3dc5.png">
<img width="300" alt="2019-03-07 8 24 21" src="https://user-images.githubusercontent.com/29372705/53953575-08d8f400-4117-11e9-97a9-4907b8c78b09.png">
   </div>


