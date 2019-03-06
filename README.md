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
<img width="200" alt="2019-03-06 11 48 29" src="https://user-images.githubusercontent.com/29372705/53852581-ddb2af80-4005-11e9-8d54-d273e6176710.png">
    
<img width="200" alt="2019-03-06 11 48 48" src="https://user-images.githubusercontent.com/29372705/53852583-e0150980-4005-11e9-94b2-70d6b4237f52.png">

<img width="350" alt="2019-03-06 11 52 04" src="https://user-images.githubusercontent.com/29372705/53852711-53b71680-4006-11e9-94c5-e6079daffffb.png">
</div>

<H2> 4. Queue </H2>

**FIFO** (First In First Out), **LILO** (Last In Last Out)

Ex) Bank queue, Container Belt, etc.
    DispatchQueue, NotificationQueue, etc.

<img width="350" alt="2019-03-06 12 07 36" src="https://user-images.githubusercontent.com/29372705/53853385-95e15780-4008-11e9-9af1-f9d7283ac601.png">

Inserting: **Enqueue** or **Put**
Removing: **Dequeue* or **Get**
**Front**: Index to be used for **Dequeue**
**Rear (Back)**: Index to be used for **Enqueue**

Enqueue means to insert an item into the **back** of the queue, dequeue means removing the **front** item.

<img width="320" alt="2019-03-06 12 08 52" src="https://user-images.githubusercontent.com/29372705/53853402-abef1800-4008-11e9-94b4-40a2bd36d55a.png">

<H2> 5. Number System </H2>

**5.1 Type of Notation**

- Binary notation: Digital number system used in computer
- Decimal notation: Normal number system
- Octal notation: used to abbreviate binary (hardly used today)
- Hexadecimal notation: used to abbreviate binary

**Conversions:**

<div>
<img width="260" alt="2019-03-06 12 38 09" src="https://user-images.githubusercontent.com/29372705/53854421-c9be7c00-400c-11e9-91c6-ff205b68341c.png">

<img width="300" alt="2019-03-06 12 36 12" src="https://user-images.githubusercontent.com/29372705/53854353-8532e080-400c-11e9-8b1a-59c6cc59a4b4.png">

<img width="300" hight="300" alt="2019-03-06 12 36 32" src="https://user-images.githubusercontent.com/29372705/53854354-85cb7700-400c-11e9-94e1-7df03e05cfd6.png">
</div>

<H2> 6. Bitwise operation </H2>

In digital computer programming, a bitwise operation operates on one or more bit patterns or binary numerals at the level of their individual bits. It is a fast and simple action, directly supported by the processor, and is used to manipulate values for comparisons and calculations.

Ex) **a = 0011 1100 / b = 0000 1101**

Operator | Description | Example
-------- | ----------- | --------
& | AND; Both true | (a & b) = 0000 1100
<img width="19" alt="2019-03-06 12 57 59" src="https://user-images.githubusercontent.com/29372705/53855102-8dd8e600-400f-11e9-9a97-399abedeb396.png">| OR; Either one true | <img width="92" alt="2019-03-06 12 59 44" src="https://user-images.githubusercontent.com/29372705/53855154-ca0c4680-400f-11e9-912c-f18ce05b1578.png">
^ | XOR; Only one true | (a ^ b) = 0011 0001
~ | NOT | (~a) = 1100 0011
<< | Left Shift; move variable value to the left by the specified bits | a << 2 = 1111 0000
<img width="27" alt="2019-03-06 2 14 40" src="https://user-images.githubusercontent.com/29372705/53857595-3f7d1480-401a-11e9-8a9b-3ea20a293424.png"> | Right Shift; move variable value to the right by the specified bits | <img width="96" alt="2019-03-06 2 14 47" src="https://user-images.githubusercontent.com/29372705/53857597-4146d800-401a-11e9-9c2f-bc835051b791.png">

<H2> 7. Logical operation </H2>

Logical operation operates on 2 types of logical values, _True_ or _False_.

**AND (&&) / OR (||) / NOT (!)**

<img width="300" alt="2019-03-06 2 23 59" src="https://user-images.githubusercontent.com/29372705/53857952-88819880-401b-11e9-8a58-348583ae4e3b.png">

<H2> 8. Naming Convention <H2>

**Pascal Case** (upper camel case): 
The first letter of every word in the identifier is upper case, the rest lower case and merged without space.

__Swift__ use pascal case for _filename, class, struct, enum, protocol, and type_.

<img width="300" alt="2019-03-06 2 43 36" src="https://user-images.githubusercontent.com/29372705/53858636-5a518800-401e-11e9-8f77-f5fbd6150af7.png">

**Camel Case** (lower camel case):
The first letter of the first word in the identifier is lower case, and all subsequent words use upper case.

__Swift__ use all camel case for _variable name, function, method, and so on_ except the pascal case.

<img width="300" alt="2019-03-06 2 43 52" src="https://user-images.githubusercontent.com/29372705/53858639-5c1b4b80-401e-11e9-9b19-365f606c8b91.png">

