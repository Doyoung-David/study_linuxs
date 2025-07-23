
```shell

nano shell_read.sh

read -p "input value: " V_INPUT
echo "$1"
echo "$V_INPUT"


```

```
[doyoung@localhost Downloads]$ source shell_read.sh argument_first
input value: read_first    
argument_first
read_first
```