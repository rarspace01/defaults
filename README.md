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
```
