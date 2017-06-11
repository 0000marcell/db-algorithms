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
main after merge
**************
main dic
FNAME   | CITY   
--------|--------
Albert  | Berlin 
Hanna   | Dresden
Michael | London 
Nadja   | Potsdam
*************
main av
FNAME | CITY
------|-----
3     | 0   
2     | 2   
0     | 0   
2     | 0   
3     | 3   
2     | 3   
1     | 1   
**************
main vv
VALID
-----
0    
0    
1    
**************
dif buf after merge
**************
dif dic
No data.
*************
dif av
No data.
**************
dif vv
No data.
**************
```

