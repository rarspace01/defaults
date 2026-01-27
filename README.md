cpu throttling thermald problems: https://askubuntu.com/questions/1520160/cpu-throttling-problems-on-my-thinkpad-x1-carbon-i7-10510u

```
sudo apt install thermald
systemctl status thermald
sudo nano /usr/lib/systemd/system/thermald.service
```
kernel newer than v5.3:
replaced --adaptive with --ignore-cpuid-check

Old:
replaced --adaptive with --ignore-cpuid-check --workaround-enabled


```
sudo systemctl daemon-reload
sudo systemctl restart thermald
#test with
sudo apt install -y stress && stress --cpu 8 -t 10
```


Copy SSH keys to remote
```
ssh-copy-id -i ~/.ssh/id_rsa.pub user@remotehost
```

Join audio (zsh needed)
```
audio-join() ffmpeg -i "concat:${(j:|:)@[2,-1]}" -acodec copy $1
audio-join output.mp3 *.mp3
```
