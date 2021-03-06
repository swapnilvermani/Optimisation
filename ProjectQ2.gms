
Set i years /0,1,2,3/ ;

Parameter Required_Skilled(i)   requirement of skilled labors at i year
/ 0     1000
  1      1000
  2      1500
  3      2000/ ;

Parameter Required_Semiskilled(i)   requirement of semiskilled labors at i year
/
  0      1500
  1      1400
  2      2000
  3      2500/ ;

Parameter Required_Unskilled(i)   requirement of semiskilled labors at i year
/ 0      2000
  1      1000
  2      500
  3      0/ ;

Positive variables
               Skilled_workers(i),Semiskilled_workers(i),Unskilled_workers(i),Recruited_Skilled_workers(i),Recruited_Semiskilled_workers(i),Recruited_Unskilled_workers(i),Retrained_Semiskilled_workers(i),Retrained_Untrained_workers(i),Dg_Semiskilled_from_Skilled(i),Dg_Unskilled_from_Skilled(i),Dg_Unskilled_from_Semiskilled(i),Redundant_Skilled(i),Redundant_Semiskilled(i),Redundant_Unskilled(i),Overmanned_Skilled(i),Overmanned_Semiskilled(i),Overmanned_Unskilled(i),Short_term_Skilled(i),Short_term_Semiskilled(i),Short_term_Unskilled(i) number;

Variable
         z       Cost taken by the comapny;

Equations
         obj             objective function
         recruitementskilled(i),
         recruitementsemiskilled(i),
         recruitementunskilled(i),
         retrainedfromunskilled(i),
         retrainedfromsemiskilled(i),
         overmanned(i),
         shortermunskilled(i),
         shortermsemiskilled(i),
         shortermskilled(i)
         skilled(i),
         requiredskilled(i),
         semiskllied(i),
         requiredsemiskilled(i),
         unskilled(i),
         requiredunskilled(i);
 
obj..    z =E= sum(i,400*Retrained_Semiskilled_workers(i) + 500* Retrained_Untrained_workers(i) + 200* Redundant_Unskilled(i) + 500* (Redundant_Skilled(i) + Redundant_Semiskilled(i)) + 500* Overmanned_Skilled(i) + 800* Overmanned_Semiskilled(i) + 500* Overmanned_Unskilled(i) + 500* Short_term_Unskilled(i) + 400*Short_term_Semiskilled(i) + 400* Short_term_Skilled(i)) ;
skilled(i)..    Skilled_workers(i) =E= 0.95*Skilled_workers(i-1) + 0.9*Recruited_Skilled_workers(i)+ 0.95*Retrained_Semiskilled_workers(i)-Dg_Semiskilled_from_Skilled(i)-Dg_Unskilled_from_Skilled(i)-Redundant_Skilled(i);
requiredskilled(i)..  Skilled_workers(i) - Overmanned_Skilled(i) +0.5*Short_term_Skilled(i) =E=Required_Skilled(i);
semiskllied(i)..   Semiskilled_workers(i) =E= 0.95*Semiskilled_workers(i-1) + 0.80*Recruited_Semiskilled_workers(i)+ 0.95*Retrained_Untrained_workers(i) -Dg_Unskilled_from_Semiskilled(i) + 0.5*Dg_Semiskilled_from_Skilled(i) -Redundant_Semiskilled(i);
requiredsemiskilled(i).. Semiskilled_workers(i) - Overmanned_Semiskilled(i) +0.5*Short_term_Semiskilled(i) =E=Required_Semiskilled(i);
unskilled(i)..   Unskilled_workers(i) =E= 0.9*Unskilled_workers(i-1) + 0.75*Recruited_Unskilled_workers(i) + 0.5*Dg_Unskilled_from_Skilled(i) + 0.5*Dg_Unskilled_from_Semiskilled(i) - Redundant_Unskilled(i);
requiredunskilled(i)..Unskilled_workers(i) - Overmanned_Unskilled(i) +0.5*Short_term_Unskilled(i) =E=Required_Unskilled(i) ;
recruitementskilled(i)..   Recruited_Skilled_workers(i) =L= 500;
recruitementsemiskilled(i)..  Recruited_Semiskilled_workers(i) =L= 800;
recruitementunskilled(i)..  Recruited_Unskilled_workers(i) =L= 500;
retrainedfromunskilled(i)..  Retrained_Untrained_workers(i) =L= 200;
retrainedfromsemiskilled(i)..  Retrained_Semiskilled_workers(i) =L= 0.25*Skilled_workers(i);
overmanned(i).. Overmanned_Skilled(i) + Overmanned_Semiskilled(i) + Overmanned_Unskilled(i) =L= 150;
shortermunskilled(i)..  Short_term_Unskilled(i) =L=50;
shortermsemiskilled(i)..  Short_term_Semiskilled(i) =L= 50;
shortermskilled(i)..  Short_term_Skilled(i) =L=50;

Model Assignment2 /all/ ;

Solve Assignment2 using LP minimizing z ;

Display z.L,Skilled_workers.L,Semiskilled_workers.L,Unskilled_workers.L,Recruited_Skilled_workers.L,Recruited_Semiskilled_workers.L,Recruited_Unskilled_workers.L,Retrained_Semiskilled_workers.L,Retrained_Untrained_workers.L,Dg_Semiskilled_from_Skilled.L,Dg_Unskilled_from_Skilled.L,Dg_Unskilled_from_Semiskilled.L,Redundant_Skilled.L,Redundant_Semiskilled.L,Redundant_Unskilled.L,Overmanned_Skilled.L,Overmanned_Semiskilled.L,Overmanned_Unskilled.L,Short_term_Skilled.L,Short_term_Semiskilled.L,Short_term_Unskilled.L;

















