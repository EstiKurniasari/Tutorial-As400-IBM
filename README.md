# Tutorial-As400-IBM

## A. CL Programming
### A.1 Introduction to CL Programming
CL (Command Language) is a programming language used primarily for scripting on IBM's operating systems, particularly on IBM i (formerly known as AS/400 or iSeries). CL programs consist of a series of commands and parameters that are executed sequentially to perform specific actions, such as invoking programs, manipulating files, and managing job queues. CL programming is essential for system administrators and developers working on AS400 systems, providing them with a powerful toolset to streamline operations and enhance system efficiency.
#### A.1.1 Overview of CL as a scripting language for IBM i (formerly AS/400) systems
Originally developed alongside the AS/400 system in the late 1980s, CL was designed to provide users with a powerful yet straightforward language for system management and automation. Over the years, CL has evolved alongside the IBM i platform, incorporating new features and enhancements to keep pace with changing technological demands.
#### A.1.2 Basic syntax and structure of CL programs
Program Definition: A CL program typically starts with a program definition statement. This statement specifies the program name, library, and other attributes.
```
PGM        PARM(&PARM1 &PARM2)
```
Parameter Declaration: If the program accepts parameters, they are declared after the program definition statement. For example: 
```
DCL        VAR(&PARM1) TYPE(*CHAR) LEN(10)
DCL        VAR(&PARM2) TYPE(*DEC) LEN(5 0)
```
Here, we declare two parameters, &PARM1 as a character string of length 10, and &PARM2 as a decimal number with a length of 5 digits and no decimal places.
Executable Commands: Following the parameter declaration (if any), executable commands are written. These commands perform various operations such as calling other programs, executing SQL statements, performing calculations, etc. For example: 
```
CHGVAR     VAR(&RESULT) VALUE(&PARM1 * &PARM2)
```
This command calculates the product of &PARM1 and &PARM2 and stores the result in the variable &RESULT.
End of Program: The program ends with the ENDPGM statement:
```
ENDPGM
```

#### A.1.3 Understanding commands, parameters, and variables in CL
### A.2 Control Sructure in CL 
#### Conditional statements: IF, ELSE IF, and SELECT
#### Handling exception and errors with MONMSG
handling biasa dan handling untuk qsh 
### A.3 Working with Commands and Program 
#### Using CL commands to interact with the operation system
#### Calling and passing parameters to programs written in other language (such  as RPG or COBOL)
#### Creating and calling CL programs for spesific tasks
### A.4 File and Data Manipulation 
#### Accesing and manipulating files and databaeses in CL
#### Reading, writing, and updating records in physical and logical files
#### Handlinkg file exceptions and errors
esti notes : 
how to do ftp and sftp 
overdbf 
how to do data processing using qsh  
### A.5 Advance Topecs and Best Practice 
#### Subroutines and modular programming in CL
#### Error handling and debugging techniques
#### Integration with other languages and technologies
#### Best practices for writing maintenable and efficient CL code
## B. RPG Programming
### B.1 Introduction to RPG Programming Language
#### Understanding the history and evolution of RPG
#### Basic syntax, data types, and program sturcture 
#### Difference between fixed-format RPG and free-format RPGLE. 
### B.2 File Handling and Data Manipulation 
#### File declaration and organization concepts 
#### Techniques for reading, writing, updating, and deleting records
#### Working with database files and accessing data using SQL embedded in RPGLE
### B.3 Program Logic and Control Structures 
#### Conditional statements (IF, SELECT) 
#### Looping structures (DO, DOU, DOW, FOR, etc) 
#### Subroutins and procedures for modular programming
### B.4 Advanced RPGLE Concepts 
#### Error handling and exeption processing 
#### Data sturctures and arrays for efficeint data handling 
#### Built-in functions and orperation codes for string manipulation, date handling, etc 
### B.5 Integration and Interfacing 
#### Calling programs written in other languages (e.g., CL, C, Java) 
#### Interfacing with external systems through APIs (Application Programming Interfaces) 
#### Web enablement using technologies like RPG Open Acccess or Web Services
## C. COBOL Programming 
### C.1 Introduction to COBOL and AS400 Environment
#### Overview of COBOL programming language 
#### Introduction to the AS400 platform and its features
#### Setting up the development environment to COBOL programming on AS400
### C.2 COBOL Syntax and Structure 
#### Understanding the basic syntax and structure of COBOL programs
#### Identifying divisions, sections, paragraphs, and statements in a COBOL program 
#### Exploring COBOL data types, variables, and ata manipulation techniquies. 
### C.3 File Handling in COBOL on AS400 
#### Working with sequential files, indexed files, and relative fiels in COBOL
#### Performing file operation such as reading, writing, updating, and deleting records
#### Understanding file organization, access modes, and file processing techniques 
### C.4 COBOL Programming Constructs 
#### Exploring control structures such as IF-ELSE, PERFORM, and GO TO statements 
#### Implementing looping construcs like PERFORM UNTIL and PERFORM VARYING 
#### Utilizing arithmetic and logic operations in COBOL programs
### C.5 Advanced Topics and Application Development
#### Introduction to subprograms and modular programming in COBOL
#### Error handling and exception management techniques in COBOL programs
#### Buildeing interactive applications using screen design aids (SDA) and programming support tools (PST)

# Learn Fitur On IBM i Client Access
- get software
- get file PF from library
- get file from ifs folder
- setting ssh

# Transfer File 
- ftp (cobol, cl, rpgle)
- sftp : using key, using password
- using IFS folder to do transfer file

## Import data using CSV
