%let pgm=utl-stack-tables-with-same-names-but-different-data-types;                                                                   
                                                                                                                                      
Stack tables with same names but different data types                                                                                 
                                                                                                                                      
Change the type of all variables in all tables to character                                                                           
                                                                                                                                      
github                                                                                                                                
https://tinyurl.com/y9jas6pv                                                                                                          
https://github.com/rogerjdeangelis/utl-stack-tables-with-same-names-but-different-data-types                                          
                                                                                                                                      
macros                                                                                                                                
https://tinyurl.com/y9nfugth                                                                                                          
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories                                            
                                                                                                                                      
SAS Forum                                                                                                                             
https://tinyurl.com/y7y7k73j                                                                                                          
https://communities.sas.com/t5/SAS-Data-Management/Data-is-both-character-and-numeric-for-large-number-of-variables/m-p/653798        
*                _     _                                                                                                              
 _ __  _ __ ___ | |__ | | ___ _ __ ___                                                                                                
| '_ \| '__/ _ \| '_ \| |/ _ \ '_ ` _ \                                                                                               
| |_) | | | (_) | |_) | |  __/ | | | | |                                                                                              
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|                                                                                              
|_|                                                                                                                                   
;                                                                                                                                     
                                                                                                                                      
data want;                                                                                                                            
  set class have;                                                                                                                     
run;quit;                                                                                                                             
                                                                                                                                      
ERROR: Variable AGE has been defined as both character and numeric.                                                                   
ERROR: Variable WEIGHT has been defined as both character and numeric.                                                                
                                                                                                                                      
*_                   _                                                                                                                
(_)_ __  _ __  _   _| |_                                                                                                              
| | '_ \| '_ \| | | | __|                                                                                                             
| | | | | |_) | |_| | |_                                                                                                              
|_|_| |_| .__/ \__,_|\__|                                                                                                             
        |_|                                                                                                                           
;                                                                                                                                     
* use typing from template;                                                                                                           
                                                                                                                                      
data class ;                                                                                                                          
  set sashelp.class(obs=3);                                                                                                           
run;quit;                                                                                                                             
                                                                                                                                      
/*                                                                                                                                    
                                                                                                                                      
Up to 40 obs WORK.CLASS total obs=3                                                                                                   
                                                                                                                                      
Obs     NAME     SEX    AGE    HEIGHT    WEIGHT                                                                                       
                                                                                                                                      
 1     Joyce      F      11     51.3      50.5                                                                                        
 2     Louise     F      12     56.3      77.0                                                                                        
 3     Alice      F      13     56.5      84.0                                                                                        
                                                                                                                                      
 Variables in Creation Order                                                                                                          
                                                                                                                                      
#    Variable    Type    Len                                                                                                          
                                                                                                                                      
1    NAME        Char      8                                                                                                          
2    SEX         Char      1                                                                                                          
3    AGE         Num       8   * numeric here but character in have                                                                   
4    HEIGHT      Num       8                                                                                                          
5    WEIGHT      Num       8   * numeric here but character in have                                                                   
*/                                                                                                                                    
                                                                                                                                      
proc sql;                                                                                                                             
  create                                                                                                                              
     table have as                                                                                                                    
  select                                                                                                                              
     name                                                                                                                             
    ,sex                                                                                                                              
    ,put(age,best.)    as age                                                                                                         
    ,height                                                                                                                           
    ,put(weight,best.) as weight                                                                                                      
  from                                                                                                                                
     sashelp.class(firstobs=4 obs=6)                                                                                                  
run;quit;                                                                                                                             
                                                                                                                                      
/*                                                                                                                                    
                                                                                                                                      
Up to 40 obs from HAVE total obs=3                                                                                                    
                                                                                                                                      
Obs     NAME     SEX    AGE    HEIGHT    WEIGHT                                                                                       
                                                                                                                                      
 1     James      M     12      57.3        83                                                                                        
 2     Thomas     M     11      57.5        85                                                                                        
 3     John       M     12      59.0      99.5                                                                                        
                                                                                                                                      
 Variables in Creation Order                                                                                                          
                                                                                                                                      
#    Variable    Type    Len                                                                                                          
                                                                                                                                      
1    NAME        Char      8                                                                                                          
2    SEX         Char      1                                                                                                          
3    AGE         Char     12  * numeric in class and character here                                                                   
4    HEIGHT      Num       8                                                                                                          
5    WEIGHT      Char     12  * numeric in class and character here                                                                   
*/                                                                                                                                    
*            _               _                                                                                                        
  ___  _   _| |_ _ __  _   _| |_                                                                                                      
 / _ \| | | | __| '_ \| | | | __|                                                                                                     
| (_) | |_| | |_| |_) | |_| | |_                                                                                                      
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                                     
                |_|                                                                                                                   
;                                                                                                                                     
                                                                                                                                      
                                                                                                                                      
Up to 40 obs WORK.WANT total obs=6                                                                                                    
                                                                                                                                      
Obs     NAME     SEX    AGE    HEIGHT    WEIGHT                                                                                       
                                                                                                                                      
 1     Joyce      F     11      51.3      50.5                                                                                        
 2     Louise     F     12      56.3      77                                                                                          
 3     Alice      F     13      56.5      84                                                                                          
 4     James      M     12      57.3      83                                                                                          
 5     Thomas     M     11      57.5      85                                                                                          
 6     John       M     12      59        99.5                                                                                        
                                                                                                                                      
 Variables in Creation Order                                                                                                          
                                                                                                                                      
#    Variable    Type    Len                                                                                                          
                                                                                                                                      
1    NAME        Char      6   * all are character                                                                                    
2    SEX         Char      1                                                                                                          
3    AGE         Char      2                                                                                                          
4    HEIGHT      Char      4                                                                                                          
5    WEIGHT      Char      4                                                                                                          
                                                                                                                                      
*          _       _   _                                                                                                              
 ___  ___ | |_   _| |_(_) ___  _ __                                                                                                   
/ __|/ _ \| | | | | __| |/ _ \| '_ \                                                                                                  
\__ \ (_) | | |_| | |_| | (_) | | | |                                                                                                 
|___/\___/|_|\__,_|\__|_|\___/|_| |_|                                                                                                 
                                                                                                                                      
;                                                                                                                                     
                                                                                                                                      
%array(vrs,values=%utl_varlist(class));                                                                                               
                                                                                                                                      
proc sql;                                                                                                                             
  create                                                                                                                              
     table want as                                                                                                                    
  select                                                                                                                              
     %do_over(vrs,phrase=cats(?) as ?,between=comma)                                                                                  
  from                                                                                                                                
     class                                                                                                                            
  union                                                                                                                               
     all                                                                                                                              
  select                                                                                                                              
     %do_over(vrs,phrase=cats(?) as ?,between=comma)                                                                                  
  from                                                                                                                                
     have                                                                                                                             
;quit;                                                                                                                                
                                                                                                                                      
%utl_optlen(inp=want,out=want); * reduce size to smallest lossless lengths;                                                           
                                                                                                                                      
                                                                                                                                      
                                                                                                                                      
