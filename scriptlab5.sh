#!/bin/bash

mkdir -p /usr/folder1
mkdir -p /usr/folder2

cat <<'SCRIPT' >/usr/local/bin/move-files.sh
#!/bin/bash
while true; do
  mv /usr/folder1/* /usr/folder2/ 2>/dev/null
  sleep 5
done
SCRIPT

chmod +x /usr/local/bin/move-files.sh

cat <<'SERVICE' >/etc/systemd/system/lab5.service

[Service]
Type=simple
ExecStart=/usr/local/bin/move-files.sh

[Install]
WantedBy=multi-user.target
SERVICE

systemctl enable lab5.service
systemctl start lab5.service
