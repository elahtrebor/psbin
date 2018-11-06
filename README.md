# powershell2linux
subset of ports for common linux tools using powershell
awk 
cat 
cp   
curl
grep
head
ls
mv
ps
pwd
rm
sed
seq
sleep
sort
tail
wc

Tested using PS V5.1

This was created to help get a minimal subset of functionality as ran across a Windows system that did not have access for installing existing linux tools, but did have powershell...

The powershell code is wrapped in BAT files to allow to call each by familiar name. The tools process data via pipe.
Example:
> cat test.csv|head -20
1,a,b,c,d
2,a,b,c,d
3,a,b,c,d
4,a,b,c,d
5,a,b,c,d
6,a,b,c,d
7,a,b,c,d
8,a,b,c,d
9,a,b,c,d
10,a,b,c,d
11,a,b,c,d
12,a,b,c,d
13,a,b,c,d
14,a,b,c,d
15,a,b,c,d
16,a,b,c,d
17,a,b,c,d
18,a,b,c,d
19,a,b,c,d
20,a,b,c,d

> cat test.csv|grep 1[0-9]
10,a,b,c,d
11,a,b,c,d
12,a,b,c,d
13,a,b,c,d
14,a,b,c,d
15,a,b,c,d
16,a,b,c,d
17,a,b,c,d
18,a,b,c,d
19,a,b,c,d

> ps |grep cmd
    315      16     9160      16776      11.44   3312   2 cmd
    

