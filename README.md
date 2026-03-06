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

# Video and Audio

```
sudo apt install ffmpeg
```

Join audio (zsh needed)
```
audio-join() ffmpeg -i "concat:${(j:|:)@[2,-1]}" -acodec copy $1
audio-join output.mp3 *.mp3
```

Delete all *.mp4 in a folder
```
find . -type f -name '*.mp4' -delete
```

Convert all mp4 in a folder to h265+opus reduced quality - with NICE 15:
```
find . -type f -name '*.mp4' -print0 | while IFS= read -r -d '' i; do nice -n 15 ffmpeg -y -i "$i" -vf "scale='min(960,iw)':-2" -c:v libx265 -crf 30 -preset medium -c:a libopus -b:a 64k "${i%.*}.mkv" < /dev/null; done
```
