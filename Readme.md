# About
x11vnc on debian linux (fork of danielguerra/alpine-vnc)

# Usage

```
docker build . openbox-vnc
docker run -d -p 5900:5900 openbox-vnc
```

After this use vnc-client to connect to your x11vnc.
Right click shows the openbox menu

Everything runs as user debian. This user has sudo rights.

The password=debian you can change it with passwd in
the terminal.

Default it runs debian latest (changed). 
