Mar 5, 2019 (Tue)
<H1> Lesson 1 - Computer Introduction </H1>

<H2> 1. Program VS Process </H2>

The major difference between these two is "program" is a group of instructions to carry out a specified task, whereas the "process" is a program in execution. The program is a definite group of ordered operations that are to be performed. On the other hand, an instance of a program being executed is a process. A program is considered to be a passive, since it does nothing until it gets executed, while a process is an active entity as it is an instance of executing program and perform the specific action. The resource requirement is much higher in case of process; it could need CPU, memory address, I/O resources for successful execution. However, a program just needs memory for storage.

<H2> 2. Memory </H2>

**2.1 Memory Hierarchy**

<img width="450" src="https://user-images.githubusercontent.com/29372705/53848587-409d4a00-3ff8-11e9-99f5-d49467b7b91b.png">

**2.2 How CPU (Central Processing Unit) Works**

<img width="445" src="https://user-images.githubusercontent.com/29372705/53850423-89f09800-3ffe-11e9-9ed9-8b787e3ddf1c.png">

Components | Roles
---------- |------
ALU (Arithmetic Logic Unit) | Executes all arithmetic and logical operations
CU (Control Unit) | Decodes the instruction (send data to ALU to execute arithmetic and logical instructions)
CPU register | Temporary storage for instructions or data
Bus interface | receive or send data from other devices

To add more,

The ALU performs arithmetic operations such as addition and subtraction, and logical operations such as AND OR. However, will ALU know the instruction 1+1? Nope! The ALU only performs arithmetic operations. Hence, the control unit (CU) decodes the instruction (decides what it means) fetched from external memory and directs that the necessary data be moved from memory to the ALU.

At this time, what if other arithmetic operation request signals keep coming in while the ALU is under operation? It first needs to complete what it is currently handling, then the following signal is processed. If the other signals continue to come in at this point, it may be more efficient to store these signals somewhere and then pull them out when the situation permits. This temporary storage is called Register. Registers work under the direction of the control unit to accept, hold, and transfer instructions or data and perform arithmetic or logical comparisons at high speed.

<H2> 3. Stack </H2>

**LIFO** (Last In First Out), **FILO** (First In Last Out)

Ex) Pringles sncak, Mart Cart, etc.
    Web browser history (go back), Undo/Redo, etc.

<div>
<img width="450" src="https://user-images.githubusercontent.com/29372705/53852323-05edde80-4005-11e9-979f-b2f33dfd73bd.png">
<img width="450" src="https://user-images.githubusercontent.com/29372705/53852336-0d14ec80-4005-11e9-8eb4-a85cbac982cc.png">
</div>


