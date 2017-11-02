/*STEP1*/
data data1;
input  x1-x8;
cards;
1.4	1.47	69.87	1.4	0.07	1.07	0.2	3
1	1.19	65.97	2.06	0.23	2	0.03	1.23
0.6	0.63	60.11	2.34	0.11	1.29	0.03	0.77
0.76	0.76	69.4	1.08	0.16	1.64	0.2	1.28
2.21	2.41	60	0.91	0.12	0.68	0.12	1.41
0.57	0.77	52.17	1.06	0.23	1.4	0.03	0.57
0.8	0.83	48.73	1.87	0.17	0.83	0.03	0.5
0.39	0.39	53.14	0.97	0.44	4.25	0.06	0.64
0.89	0.92	53.69	1.75	0.25	2.03	0.11	1.11
2.67	3.08	53.33	0.94	0	0.64	0.22	3.69
0.64	0.64	45.12	1.43	0.18	1.96	0.04	0.82
0.52	0.52	53.09	0.78	0.35	1.61	0	0.35
0.83	1	43.42	0.43	0.13	0.61	0.04	1.32
1	1.06	70.88	1.81	0.16	1.09	0.06	1.06
0.83	1.07	26.41	1.1	0.07	1.21	0.07	0.97
1	1.03	66.91	1.72	0.16	2	0.06	1.13
0.73	0.76	56.15	3.12	0.3	1.39	0.03	0.76
0.97	1.03	51.19	1.63	0.12	1.7	0.16	1
0.79	0.82	40.65	1.52	0.43	1.85	0.06	0.52
1.13	1.29	83.37	2.71	0.12	1.63	0.04	0.71
0.11	0.17	25.28	0.5	0.5	7.06	0.06	0.39
0.11	0.11	43	1.39	0.83	7.72	0	0.22
0.24	0.24	44	1	0.29	7.1	0.67	0.67
0	0	51.18	1	0.82	4	0.18	0.18
0.82	0.91	34.27	0.64	0.09	2.73	0.55	0.55
0.22	0.31	46.36	1.19	0.81	8.06	0.03	0.42
0.3	0.3	44.91	0.85	0.45	5.18	0.03	0.94
0.11	0.19	43.15	1.26	0.85	7.74	0.11	0.52
0.21	0.24	67.28	1.07	0.52	6.03	0.07	0.52
0.28	0.28	57.66	1.21	0.41	5.21	0.03	0.86
0.14	0.14	48.89	1.08	0.51	4.5	0.16	0.65
0.47	0.58	63.5	1.74	0.21	3.6	0.03	0.47
0.09	0.09	49.5	1.29	0.67	6.06	0.06	0.27
0.47	0.57	59.29	1.29	0.14	5.43	0	0.86
0.18	0.18	50.2	1	0.29	4.53	0.27	0.72
0.15	0.15	53.3	0.74	0.48	4.15	0	0.48
0.17	0.2	63.8	1.7	0.5	6.27	0.03	0.5
0.23	0.23	48.9	1.07	0.73	5.57	0.03	0.83
0.21	0.21	59.82	1	0.61	7.12	0	0.42
0.17	0.2	32.6	0.68	1.26	7.26	0.06	0.63
1.46	1.64	37.07	0.21	0.04	0.79	0.61	4.14
1.13	1.37	19.77	0.52	0	0.7	0.97	3.67
1	1.2	29.43	0.25	0.08	1.11	0.57	3.15
1.08	1.24	25.95	0.16	0.11	0.73	0.68	2.97
1.79	2.05	43.18	1.03	0.03	0.13	0.64	3.38
1.12	1.29	22.59	0.32	0.03	0.34	0.41	2.35
0.56	0.59	16.97	0.41	0	0.22	0.24	1.9
1.19	1.39	34.2	1.03	0.03	0.49	0.49	2.52
0.19	0.31	23.4	0.19	0.08	0.75	0.34	1.49
2.33	2.45	39.4	0.34	0	0.18	0.44	2.14
0.47	0.59	29.42	0.28	0.14	0.62	0.41	1.34
1.06	1.19	29.84	0.65	0.13	0.65	0.34	1.84
0.9	1	24.24	0.42	0.03	0.03	0.65	4.2
1.23	1.34	26.5	0.85	0.04	0.38	0.29	1.9
1.64	1.76	34.4	0.64	0	0.52	0.24	1.84
1.41	1.59	37.43	0.67	0	0.33	0.42	2.11
1.97	2.18	44.09	1.18	0.08	0.42	0.31	2.86
1.87	2.1	44.52	0.42	0	0.25	0.42	3.42
0.8	0.73	29.22	0.53	0.12	1.03	0.45	1.45
0.6	1	29.42	0.5	0	0.2	0.7	2.4
;
run;

PROC IML;
USE work.data1;
READ all;
X=x1||x2||x3||x4||x5||x6||x7||x8;
n=nrow(X) ;
u=J(n,1,1) ;
mean=u`*X/n ;           /* mean vector */
X_bar=repeat(mean,n,1) ;
x1=X-X_bar ;             /* centred data matrix */
vname={x1 x2 x3 x4 x5 x6 x7 x8};
create data2 from x1[colname=vname] ;
append from x1 ;
close data2;
quit;


data data3;	
	id=_n_;
input name$ position$;
cards;
pogba	midfielder
herrera	midfielder
kante	midfielder
toure	midfielder
silva	midfielder
matic	midfielder
dembele	midfielder
dier	midfielder
wanyama	midfielder
eriksen	midfielder
fellaini	midfielder
carrick	midfielder
ramsey	midfielder
xhaka	midfielder
Chamberlain	midfielder
Fernandinho?	midfielder
gueye	midfielder
can	midfielder
barry	midfielder
Henderson	midfielder
smalling	defender
jones	defender
rojo	defender
bailly	defender
shaw	defender
williams	defender
luiz	defender
jagielka	defender
lovren	defender
martip	defender
cahill	defender
Azpilicueta	defender
Koscielny	defender
Mustafi	defender
Kompany	defender
stones	defender
otamendi	defender
Alderweireld	defender
Vertonghen	defender
Trippier	defender
Ibrahimovic	forward
Kane	forward
Costa	forward
Lukaku	forward
Sanchez	forward
Son	forward
Rashford	forward
Alli	forward
Welbeck	forward
Hazard	forward
Giroud	forward
Martial	forward
Aguero	forward
sane	forward
Mata	forward
mane	forward
Firmino	forward
Coutinho	forward
Llorente	forward
Jesus	forward
;
run;

data data;
	merge data3 data2;
run;


/*STEP2 정규성검정 및 이상치 확인*/
PROC IML ;
reset nolog ;
USE work.data;
READ all;
X=x1||x2||x3||x4||x5||x6||x7||x8;

/* Mahalanobis distance */
 nobs=nrow(X) ;
 nvar=ncol(X) ;
 mean=X[+,]/nobs ;
 CX=X-J(nobs,1,1)*mean ;
 S=CX`*CX/(nobs-1) ;
 M=CX*inv(S)*CX` ;
 mm=vecdiag(M) ;
 vname={d} ;
create dist from mm[colname=vname] ;
append from mm ;
close dist ;
print mean S M mm;
QUIT ;

PROC SORT data=dist out=dists ;
by d ;
RUN ;

DATA maha ;
set dists ;
id=_n_ ;
RUN ;


/*: Chi-square plot for testing multivariate normality */
DATA quantile ;
set maha ;
nobs=60 ;
nvar=8 ;
p=(id-0.5)/nobs ;
df=nvar ;
q=cinv(p, df) ;
RUN ;

DATA quant ;
merge dists quantile(keep=q) ;
RUN ;

symbol1 v=star i=none color=black ;
symbol2 v=point i=join l=1 w=1 color=blue ;
title 'Chi-square plot ' ;
PROC GPLOT data=quant ;
plot d*q q*q / overlay  ;					
RUN ;

PROC CORR data=quant ;
var d q ;
RUN ;



/*STEP3 PCA와 FA*/
PROC PRINCOMP DATA=data cov out=score1;
	var x1-x8;
run;
title 'scatter plot ' ;
PROC GPLOT DATA=score1 ;
	plot prin1*prin2;
RUN;

PROC IML;
USE score1;
READ all;
X=prin1||prin2;
/* Mahalanobis distance */
 nobs=nrow(X) ;
 nvar=ncol(X) ;
 mean=X[+,]/nobs ;
 CX=X-J(nobs,1,1)*mean ;
 S=CX`*CX/(nobs-1) ;
 M=CX*inv(S)*CX` ;
 mm=vecdiag(M) ;
 vname={d} ;
create dist1 from mm[colname=vname] ;
append from mm ;
close dist1 ;
QUIT ;

PROC PRINT data=dist1 ; 
RUN ;

PROC SORT data=dist1 out=dists1 ;
by d ;
RUN ;

DATA maha1 ;
set dists1 ;
id=_n_ ;
RUN ;


/* Example 4.13 : Chi-square plot for testing multivariate normality */
DATA quantile1 ;
set maha1 ;
nobs=60 ;
nvar=2 ;
p=(id-0.5)/nobs ;
df=nvar ;
q=cinv(p, df) ;
RUN ;

DATA quant1 ;
merge dists1 quantile1(keep=q) ;
RUN ;

symbol1 v=star i=none color=black ;
symbol2 v=point i=join l=1 w=1 color=blue ;
title 'Chi-square plot ' ;
PROC GPLOT data=quant1 ;
plot d*q q*q / overlay; 
RUN ; 
PROC CORR data=quant1;
var d q ;
RUN ;






PROC FACTOR DATA=data method=prin  res hey
	rotate=varimax;
	VAR x1-x8;
RUN;

PROC FACTOR DATA=data method=prin nfact=3 out=score2  res hey
	rotate=varimax;
	VAR x1-x8;
RUN;

PROC FACTOR DATA=data method=ml nfact=3 out=score2  res hey
	rotate=varimax;
	VAR x1-x8;
RUN;

/*STEP4 : Grouping Observation*/

PROC CLUSTER DATA=data METHOD=ward  print=10 ccc pseudo;
	var x1-x8;
run;
PROC CLUSTER DATA=data METHOD=complete  print=10 ccc pseudo;
	var x1-x8;
run;
PROC CLUSTER DATA=data METHOD=average  print=10 ccc pseudo;
	var x1-x8;
run;

PROC CLUSTER DATA=score2 METHOD=ward  print=10 ccc pseudo;
	var factor1 factor2 factor3;
run;
PROC CLUSTER DATA=score2 METHOD=complete  print=10 ccc pseudo;
	var factor1 factor2 factor3;
run;
PROC CLUSTER DATA=score2 METHOD=average  print=10 ccc pseudo;
	var factor1 factor2 factor3;
run;

PROC FASTCLUS DATA=data MAXCLUSTERS=3 SUMMARY LIST OUT=cluster1;
	var x1-x8;
RUN;

PROC FASTCLUS DATA=score2 MAXCLUSTERS=3 SUMMARY LIST OUT=cluster2;
	var factor1 factor2 factor3;
RUN;

PROC FREQ DATA=cluster1;
	TABLES position*cluster/norow nocol nopercent;
RUN;
PROC FREQ DATA=cluster2;
	TABLES position*cluster/norow nocol nopercent;
RUN;


PROC FASTCLUS DATA=data MAXCLUSTERS=4 SUMMARY LIST OUT=cluster3;
	var x1-x8;
RUN;

PROC FASTCLUS DATA=score2 MAXCLUSTERS=4 SUMMARY LIST OUT=cluster4;
	var factor1 factor2 factor3;
RUN;

PROC FREQ DATA=cluster3;
	TABLES position*cluster/norow nocol nopercent;
RUN;
PROC FREQ DATA=cluster4;
	TABLES position*cluster/norow nocol nopercent;
RUN;


