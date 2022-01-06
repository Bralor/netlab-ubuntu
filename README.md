### Netlab
Testovací nástroj pro routovacího démona Bird. 

<br>

#### Testované na Ubuntu

---

Jednoduchý kontejner, který nasazuje testovací nástroj **netlab** pro různé
verze distribuce.

<br>

#### Použití

---

Spouštění probíhá pomocí pomocného argumentu (číslo verze distribuce).

Pro buildovací stage:
```
$ docker build --build-arg FROM_IMAGE=ubuntu:21.10 -t <jmeno> .
```

Pro spuštění:
```
$ docker run --privileged <jmeno>
```

<br>

