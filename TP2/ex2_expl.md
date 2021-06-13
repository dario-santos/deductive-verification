## dois_div

```
 n + (m/2) = (n + n + m) / 2

base:
 0 + (m/2) = (0 + 0 + m) / 2
 m/2 = m/2

indutivo:
  Hip.: k + (m/2) = (k + k + m) / 2
  
  Ind.: 
    (k+1) + (m/2) = ((k+1) + (k+1) + m) / 2
     = (2 + k + k + m) / 2
     = 1 + (k + k + m) / 2
     = (k+1) + (m/2)
```



## somat_aux

```
n + (somat n) = (n + n + n + (n*n)) / 2


base: 
  0 + (somat 0) = (0 + 0 + 0 + (0*0))/2
  0 = 0 (reflexivity)

indutivo:
 Hip.: k + (somat k) = (k + k + k + (k*k)) / 2

 Ind.: 
   (k+1) + (somat (k+1))  = ((k+1) + (k+1) + (k+1) + ((k+1)*(k+1))) / 2   
(binonimo)                = (4 + k + k + k + (k*k) + 2k)) / 2
(substituir por Hipótese) = 2 + 2k + (somat k)
(desdobrar multiplicação) = 2(k+1) + (somat k)
(função somat)            = (k+1) + (k+1) + (somat k)
(reflexivity)       (k+1) + (somat (k+1)) = (k+1) + (somat (k+1))



Ind v2: 
   (k+1) + (somat (k+1)) = ((k+1) + (k+1) + (k+1) + ((k+1)*(k+1))) / 2
   <=> (k+1) + (somat (k+1)) =  ...
   <=> (k+1) + (k+1) + (k + k + k + (k*k)) / 2 = ...
   <=> ... = 
   

```


## somat_correct

```
somat n = (n * (n + 1)) / 2


base:
  somat 0 = (0 * (0 + 1)) / 2
  (reflexivity) 0 = 0

indutivo:
  Hip.:
    somat k = (k * (k + 1)) / 2

  Ind.: 
    somat (k+1) = ((k+1) * ((k+1) + 1)) / 2
           <=> somat (k+1) = ((k+1) * (k+2)) / 2
           <=> 1 + k + (somat k) = ((k+1) * (k+2)) / 2
(soma_aux) <=> 1 + ((k + k + k + (k * k)) / 2) = ((k+1) * (k+2)) / 2
           <=> 1 + ((k + k + k + (k * k)) / 2) = ((k+1) * (k+2)) / 2






(dois_div) <=> ((2 + k + k + k + (k * k)) / 2) = ((k+1) * (k+2)) / 2
(dois_div) <=> 1 + ((k + 2k + (k * k)) / 2) = ((k+1) * (k+2)) / 2
           <=> 1 + ((k + k*(k + 2)) / 2) = ((k+1) * (k+2)) / 2
           <=> 1 + ((k + 2k + (k * k)) / 2) = ((k+1) * (k+2)) / 2

```
