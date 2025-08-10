#!/bin/bash
yum update -y
yum install -y stress
echo "To test autoscaling, run: stress --cpu 2 --timeout 300"
