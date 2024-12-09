# Working With Query
Create table <br>
```sql
CREATE TABLE esti/Persons (
    PersonID num(5),          
    LastName char(15),    
    FirstName char(15),   
    Address char(15),     
    City char(15)         
```
update the table using command ```upddta esti/Persons``` .
Here is the example 
```
Position to line  . . . . .                                                 
....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+.
PERSONID  LASTNAME         FIRSTNAME        ADDRESS          CITY           
      1   GRANGER          HERMOINE         HOGWARTS SCHOOL  MAGIG CITY     
      2   MALFOY           DRACO            HOGWARTS SCHOOL  MAGIC CITY     
      3   SNAPE            SAVERUS          HOGWARTS SCHOOL  MAGIC CITY     
********  End of data  ********                                             
```
## Change numeric to string
Based on table we create previously, we can confer personId to string. The steps are: 
1. `wrkqry`
2. Input the file
```
                              Work with Queries                               
                                                                              
Type choices, press Enter.                                                    
                                                                              
  Option  . . . . . .   1              1=Create, 2=Change, 3=Copy, 4=Delete   
                                       5=Display, 6=Print definition          
                                       8=Run in batch, 9=Run                  
  Query . . . . . . .                  Name, F4 for list                      
    Library . . . . .     esti         Name, *LIBL, F4 for list

---
                               Define the Query                           
                                                                          
Query . . . . . . :                     Option  . . . . . :   CREATE      
  Library . . . . :     DEVESTI         CCSID . . . . . . :   65535       
                                                                          
Type options, press Enter.  Press F21 to select all.                      
  1=Select                                                                
                                                                          
Opt    Query Definition Option                                            
 1   > Specify file selections                                            
 1   > Define result fields                                               
 1   > Select and sequence fields                                         
       Select records                                                     
       Select sort fields                                                 
       Select collating sequence                                          
       Specify report column formatting                                   
       Select report summary functions                                    
       Define report breaks                                               
       Select output type and output form                                 
       Specify processing options

---
                           Specify File Selections                  
                                                                    
Type choices, press Enter.  Press F9 to specify an additional       
  file selection.                                                   
                                                                    
  File . . . . . . . . .   persons        Name, F4 for list         
    Library  . . . . . .     esti         Name, *LIBL, F4 for list  
  Member . . . . . . . .   *FIRST         Name, *FIRST, F4 for list 
  Format . . . . . . . .   *FIRST         Name, *FIRST, F4 for list
---
                              Define Result Fields                             
                                                                               
 Type definitions using field names or constants and operators, press Enter.   
   Operators:  +, -, *, /, SUBSTR, ||, DATE...                                 
                                                                               
 Field       Expression                         Column Heading        Len   Dec
 ID_STRING   DIGITS(PERSONID)                                                                                                             
                                                                        Bottom 
                                                                               
 Field           Text                                                  Len  Dec
 PERSONID                                                                5    0
 LASTNAME                                                               15    
 FIRSTNAME                                                              15     
 ADDRESS                                                                15    



```
![image](https://github.com/user-attachments/assets/9ffe89aa-9fa3-46c8-9519-3f1775489cca)

## Substring 
Dengan menggunakan substring kita bisa memotong atau menggabungkan field dengan tipe char 

```
                              Define Result Fields                              
                                                                                
 Type definitions using field names or constants and operators, press Enter.    
   Operators:  +, -, *, /, SUBSTR, ||, DATE...                                  
                                                                                
 Field       Expression                         Column Heading        Len   Dec 
 FULLNAME    SUBSTR(FIRSTNAME,1,10)||SUBSTR(                                    
             LASTNAME,1,10)
```
rESULT
```table
                                                          Display Report                                                           
                                                                                                  Report width . . . . . :      98 
 Position to line  . . . . .                                                                  Shift to column  . . . . . .         
 Line   ....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8....+....9....+...                         
        FULLNAME              PERSONID  LASTNAME         FIRSTNAME        ADDRESS          CITY                                    
 000001 HERMOINE  GRANGER           1   GRANGER          HERMOINE         HOGWARTS SCHOOL  MAGIG CITY                              
 000002 DRACO     MALFOY            2   MALFOY           DRACO            HOGWARTS SCHOOL  MAGIC CITY                              
 000003 SAVERUS   SNAPE             3   SNAPE            SAVERUS          HOGWARTS SCHOOL  MAGIC CITY                              
 ****** ********  End of report  ********
```
We add ``` ID_CHAR     DIGITS(PERSONID)      ``` then press F5
```
Line   ....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8....+....9....+...10....+..        
       FULLNAME              ID_CHAR  PERSONID  LASTNAME         FIRSTNAME        ADDRESS          CITY                   
000001 HERMOINE  GRANGER      00001         1   GRANGER          HERMOINE         HOGWARTS SCHOOL  MAGIG CITY             
000002 DRACO     MALFOY       00002         2   MALFOY           DRACO            HOGWARTS SCHOOL  MAGIC CITY             
000003 SAVERUS   SNAPE        00003         3   SNAPE            SAVERUS          HOGWARTS SCHOOL  MAGIC CITY             
****** ********  End of report  ********
```
Compared to 
```
Field       Expression                         Column Heading        Len   Dec
FULLNAME    FIRSTNAME || LASTNAME                                             
```
Result:
```
                                                                                                 Report width . . . . . :     117 
Position to line  . . . . .                                                                  Shift to column  . . . . . .         
Line   ....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8....+....9....+...10....+...11....+..      
       FULLNAME                        ID_CHAR  PERSONID  LASTNAME         FIRSTNAME        ADDRESS          CITY                 
000001 HERMOINE       GRANGER           00001         1   GRANGER          HERMOINE         HOGWARTS SCHOOL  MAGIG CITY           
000002 DRACO          MALFOY            00002         2   MALFOY           DRACO            HOGWARTS SCHOOL  MAGIC CITY           
000003 SAVERUS        SNAPE             00003         3   SNAPE            SAVERUS          HOGWARTS SCHOOL  MAGIC CITY           
****** ********  End of report  ********
```


## Pivot/Summary 
## Generate Spooled File From Query 
## Generate File From Query 
## Open Query in CL Program 
- why / objective ?
- how ?
- when 
- 
