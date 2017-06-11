# db-algorithms

how to run:
```
git clone https://github.com/0000marcell/db-algorithms
cd db-algorithms
bundle install
ruby merge.rb
```

MERGE OUTPUT:
```
michael moves to berlin
nadja moves to potsdam
michael moves to potsdam
hanna inserted
dif buf after inserts
**************
dif dic
FNAME   | CITY   
--------|--------
Michael | Berlin 
Nadja   | Potsdam
Hanna   | Dresden
*************
dif av
FNAME | CITY
------|-----
0     | 0   
1     | 1   
0     | 1   
2     | 2   
**************
dif vv
VALID
-----
0    
1    
1    
1    
**************
main after inserts
**************
main dic
FNAME   | CITY          
--------|---------------
Albert  | Berlin        
Michael | London        
Nadja   | Method Missing
*************
main av
FNAME | CITY
------|-----
2     | 0   
1     | 1   
0     | 0   
**************
main vv
VALID
-----
0    
0    
1    
**************
move to history
main before move to history
**************
main dic
FNAME   | CITY          
--------|---------------
Albert  | Berlin        
Michael | London        
Nadja   | Method Missing
*************
main av
FNAME | CITY
------|-----
2     | 0   
1     | 1   
0     | 0   
**************
main vv
VALID
-----
0    
0    
1    
**************
dif buf after move to history
**************
DIF dic
FNAME   | CITY   
--------|--------
Michael | Berlin 
Nadja   | Potsdam
Hanna   | Dresden
*************
DIF av
FNAME | CITY
------|-----
1     | 1   
0     | 1   
2     | 2   
**************
DIF vv
VALID
-----
1    
1    
1    
**************
main after move to history
**************
main dic
FNAME   | CITY          
--------|---------------
Albert  | Berlin        
Michael | London        
Nadja   | Method Missing
*************
main av
FNAME | CITY
------|-----
1     | 1   
**************
main vv
VALID
-----
1    
**************
```
