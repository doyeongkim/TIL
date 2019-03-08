Mar 7, 2019 (Thur)
<H1> Lesson 2 - Git / Markdown </H1>

<h2> 1. Version Control System </h2>

- To manage the change of the code by recording the version of each point on the same purpose of data
- Record each information separately by giving a version number for each change

**Why do we use VSC?**

- Track changes through the context of the current code
- Identify who has modified the source code
- Provides the ability to revert to a previous version in case of any issue
- Perform backup for codes
- Synchronize code while working together / Prevent code collisions and loss
- Documentation only with its history

<h2> 2. VCS Type </h2>

- **Original Version Control**

   - Save seperately after copying files

- **LVCS (Local Version Control System)**

   - Manage versions individually: Difficult to collaborate and all history is lost if the person's data goes wrong.

- **CVCS (Central Version Control System)**
 
   - Manage storing multiple clients' files in one server
   - Largely afftected by central server
   - Typically CVS / SVN

- **DVCS (Distributed Version Control System)**

   - Have both local and remote repository separately. Can have multiple remote repositories.
   - Have powerful branch merging function compared to the original VCS, and not dependent on the central server
   - Typically Git / Mercurial

<h2> 3. Git </h2>

**Git's Goal**

    - Rapid speed
    - Simple structure
    - Nonlinear development (thousands of simultaneous branch)
    - Perfect distribution
    - Useful for large project such as Linux kernel (in speed or data size)

<h3>SVN, Mercurial - Delta</h3>

<img width="350" alt="2019-03-08 3 21 37" src="https://user-images.githubusercontent.com/29372705/54011458-fbbf1200-41b5-11e9-9cf0-588bdf64682b.png">

<h3> Git - Snapshot </h3>

<img width="350" alt="2019-03-08 3 21 49" src="https://user-images.githubusercontent.com/29372705/54011459-fbbf1200-41b5-11e9-899b-d76d406937b6.png">

Three states & main sections

<div>
<img width="350" alt="2019-03-08 3 23 28" src="https://user-images.githubusercontent.com/29372705/54011508-2741fc80-41b6-11e9-9ea2-62440feb28b9.png">
 
<img width="350" alt="2019-03-08 3 24 39" src="https://user-images.githubusercontent.com/29372705/54011561-53f61400-41b6-11e9-8063-06cadfc412ff.png">
</div>

