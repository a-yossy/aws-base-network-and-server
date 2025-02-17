#!/bin/bash
sudo dnf upgrade -y
sudo dnf install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
