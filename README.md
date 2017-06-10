# db-algorithms

how to run:
```
git clone https://github.com/0000marcell/db-algorithms
cd db-algorithms
bundle install
ruby merge.rb
```

MERGE OUTPUT:

MICHAEL MOVES TO BERLIN
NADJA MOVES TO POTSDAM
MICHAEL MOVES TO POTSDAM
HANNA INSERTED
DIF BUF AFTER INSERTS
========
DIF DIC
FNAME   | CITY   
--------|--------
Michael | Berlin 
Nadja   | Potsdam
Hanna   | Dresden
=======
DIF AV
FNAME | CITY
------|-----
0     | 0   
1     | 1   
0     | 1   
2     | 2   
=======
DIF VV
VALID
-----
0    
1    
1    
1    
======
MAIN AFTER INSERTS
========
MAIN DIC
FNAME   | CITY          
--------|---------------
Albert  | Berlin        
Michael | London        
Nadja   | Method Missing
=======
MAIN AV
FNAME | CITY
------|-----
2     | 0   
1     | 1   
0     | 0   
=======
MAIN VV
VALID
-----
0    
0    
1    
======
MOVE TO HISTORY
MAIN BEFORE MOVE TO HISTORY
========
MAIN DIC
FNAME   | CITY          
--------|---------------
Albert  | Berlin        
Michael | London        
Nadja   | Method Missing
=======
MAIN AV
FNAME | CITY
------|-----
2     | 0   
1     | 1   
0     | 0   
=======
MAIN VV
VALID
-----
0    
0    
1    
======
DIF BUF AFTER MOVE TO HISTORY
========
DIF DIC
FNAME   | CITY   
--------|--------
Michael | Berlin 
Nadja   | Potsdam
Hanna   | Dresden
=======
DIF AV
FNAME | CITY
------|-----
1     | 1   
0     | 1   
2     | 2   
=======
DIF VV
VALID
-----
1    
1    
1    
======
MAIN AFTER MOVE TO HISTORY
========
MAIN DIC
FNAME   | CITY          
--------|---------------
Albert  | Berlin        
Michael | London        
Nadja   | Method Missing
=======
MAIN AV
FNAME | CITY
------|-----
1     | 1   
=======
MAIN VV
VALID
-----
1    
======
