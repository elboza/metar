metar
=====

simple command line metar and taf

###install

```
sudo make install
```
or run it in your local directory.
###help

```
$ metar -h
metar, metar and taf viewer, v 0.2, 2012 by Fernando Iazeolla
this software is licensed under GPLv2
usage: metar <options>
options:
  --apt <ICAO>   -i <ICAO>   set iaco airport code
  --decode       -d          decode
  --help         -h          show this help
  --verbose      -v          verbose
  --version      -vv         show prog version
  --taf          -f          show taf forecast

Example: metar -i lirf -f
```
###run

```
$ metar -i lirf -f
LIRF 052120Z 05003KT CAVOK 22/20 Q1014 NOSIG

TAF LIRF 051700Z 0518/0624 VRB05KT 9999 SCT040
      BECMG 0608/0610 25012KT
      BECMG 0618/0620 VRB04KT
```

#####web
[metar project page](http://github.com/elboza/metar)

####That's all falks!

```
 ______
< bye. >
 ------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```
