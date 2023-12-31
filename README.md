<p align="right"><img src="https://github.com/isc-at/CPIPE/blob/master/archived.jpg"/></p>  

Running a Background Job using JOB command is a well known feature.  
Using ECP to distribute databases to several servers is also well know.  
But using the combination of both to run a process on a different server  
seems to be a rare case.  
 
Sure there are enough other ways to start a remote job, but the special  
combination with ECP where the application server starts a process on a  
data server without additional networking is worth to be remembered.  
 
The example starts a remote process and receives back a result.  
The parameters sent and received are pure demo purpose and require  
adaption to the individual needs.  
 
All you need is a namespace with its data mapped on an ECP server.
 
As the technique used is an elementary design. It works the same way  
also from one namespace to the other. Eg. From SAMPLES to USER or reverse.  
ECP is just a data management feature and not an operational requirement.  
 
Just place the routine in the 2 namespaces you want to connect.  
Edit namespace parameters and run test^ECP.job to see it moving.   
~~~
  SAMPLES>d test^ECP.job  
  ^|"USER"|ECP.job(12268)=2  
  ^|"USER"|ECP.job(12268,0)="2019-05-30 17:27:18"  
  ^|"USER"|ECP.job(12268,1)=5  
  ^|"USER"|ECP.job(12268,1,1)="param 1"  
  ^|"USER"|ECP.job(12268,1,2)="param 2"  
  ^|"USER"|ECP.job(12268,1,3)="param 3"  
  ^|"USER"|ECP.job(12268,1,4)="param 4"  
  ^|"USER"|ECP.job(12268,1,5)="param 5"  
  ^|"USER"|ECP.job(12268,2)=3  
  ^|"USER"|ECP.job(12268,2,1)=$lb("param 1","param 2","param 3","param 4","param 5")  
  ^|"USER"|ECP.job(12268,2,2)="2019-05-30 17:27:19" 
  ^|"USER"|ECP.job(12268,2,3)="***** done *****"  
~~~  

For ease of use both the client and the server code are homed together.  
Not a requirement, just for comfort.

### HINT
Don't forget to add your ECP enable licence key in ECP_iris.key

[Article in DC](https://community.intersystems.com/post/background-jobs-over-ecp)   

