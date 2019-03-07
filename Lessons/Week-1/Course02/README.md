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

User (Command) -> Shell (Interpret) -> Kernel (Perform command then send results) -> Shell (Interprete) -> User (Check results)

<img width="300" alt="2019-03-07 7 15 31" src="https://user-images.githubusercontent.com/29372705/53949457-69fbca00-410d-11e9-8776-05d4599fdf46.png">

<h2> 6. Kernel </h2>

**What is Kernel?**

A Kernel is a center component of an operating system (OS). It is an interface between the user and the software system (means, it is and interface between hardware components and software applications).

**What is its function?**

Hardware components are those which we can touch (mouse, speaker, hard disk, etc.) and we humans cannot directly interact with the hardware to get things done. Softwares are those pieces of programs which we cannot touch but see and  we can work with them because they have a user-friendly interface. That is why we make use of software. That is why they are built in user-friendly interfaces. These softwares do the work of taking input from us, interact with the required hardware and produce specific output and display it. So, this is what a kernel does. 

Kernel makes the software interact with the hardware to get a specific task done. It facilitates a communication between an application and a hardware according to the user input. The functions of a kernel are not limited as an interface. It is the most important component of OS. It starts when the computer starts and it is kept loaded until it's turned off. It decides the amount of resources (Hard Disk, RAM, GPU, etc.) to be used by every application. Every program must get a limited amount of resources so that all the other programs  are run well and are not interrupted.

The kernel allows the application data to flow into the memory. It also decides in what order the programs will be executed. The kernel has separate space in memory which allows it to function independently. If the user data interfaces with the functioning of the kernel, it may cause instability and ultimate system failure. It acts as a central authority which guides memory and keeps an eye on all the hardware and software data flow.

<img width="280" alt="2019-03-07 6 14 31" src="https://user-images.githubusercontent.com/29372705/53945401-e807a300-4104-11e9-9c86-2129a87c1746.png">





