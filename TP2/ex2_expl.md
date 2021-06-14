## dois_div

```
Caso base:
  0 + (m/2) = (0 + 0 + m) / 2
  m/2 = m/2

Caso indutivo:
 1. Hipótese: k + (m/2) = (k + k + m) / 2
  
 2. Indução: 
    (k+1) + (m/2) = ((k+1) + (k+1) + m) / 2
     = (2 + k + k + m) / 2
     = 1 + (k + k + m) / 2
     = 1 + k + (m/2)
     = (k+1) + (m/2)
```



## somat_aux

```
n + (somat n) = (n + n + n + (n*n)) / 2


Caso base: 
  0 + (somat 0) = (0 + 0 + 0 + (0*0))/2
  0 = 0 (reflexivity)

Casp indutivo:
 1. Hipótese: k + (somat k) = (k + k + k + (k*k)) / 2

 2. Indução: 
   (k+1) + (somat (k+1))  = ((k+1) + (k+1) + (k+1) + ((k+1)*(k+1))) / 2   
(binonimo)                = (4 + k + k + k + (k*k) + 2k)) / 2
(substituir por Hipótese) = 2 + 2k + (somat k)
(desdobrar multiplicação) = 2(k+1) + (somat k)
(função somat)            = (k+1) + (k+1) + (somat k)
(reflexivity)             = (k+1) + (somat (k+1))



Ind v2: 
   (k+1) + (somat (k+1)) = ((k+1) + (k+1) + (k+1) + ((k+1)*(k+1))) / 2
   <=> (k+1) + (somat (k+1)) =  ...
   <=> (k+1) + (k+1) + (k + k + k + (k*k)) / 2 = ...
   <=> ... = 
   

```


## somat_correct

```
somat n = (n * (n + 1)) / 2


Caso base:
  somat 0 = (0 * (0 + 1)) / 2
  0 = 0 (reflexivity)

Caso indutivo:
  Hipótese: somat k = (k * (k + 1)) / 2

  Indução: 
    somat (k+1) = ((k+1) * ((k+1) + 1)) / 2
              <=> somat (k+1) = ((k+1) * (k+2)) / 2
              <=> 1 + k + (somat k) = (k*k + 2k + k + 2) / 2
(soma_aux)    <=> 1 + ((k + k + k + (k*k)) / 2) = 1 + ((3k + (k*k)) / 2)
(reflexivity) <=> 1 + ((3k + (k*k)) / 2) = 1 + ((3k + (k*k)) / 2)
```
