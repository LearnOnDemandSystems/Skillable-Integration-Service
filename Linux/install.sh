#!/bin/bash
curl -L https://github.com/LearnOnDemandSystems/Skillable-Integration-Service/blob/main/Linux/publish.tar.gz?raw=true | tar zxv -C /usr/local/bin
chmod +x /usr/local/bin/publish/Skillable.Labs.VmIntegrationService
echo "[Unit]
Description=Skillable Script Execution Service.
[Install]
WantedBy=multi-user.target
[Service]
Type=simple
ExecStart=/usr/local/bin/publish/Skillable.Labs.VmIntegrationService
WorkingDirectory=/usr/local/bin/publish
Restart=always
RestartSec=5
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=%n" | tee /etc/systemd/system/skillable.service

systemctl daemon-reload
systemctl enable skillable.service
systemctl start skillable.service
