#!/usr/bin/python
# -*- coding: utf-8 -*-

import SocketServer, subprocess
import sys
import md5

class ClientHandler(SocketServer.BaseRequestHandler):

    def handle(self):
        password = 'My secret message'
        msg='testing connection'
        digest2 = md5.new((password+msg)).hexdigest()
        buf = self.request.recv(4096)
        digest, msg = buf.split(" ", 1)

        if (digest == md5.new((password+msg)).hexdigest()):
            self.request.send("FLAG{3z_h45h_l3ngth_3xt}")
        else:
            self.request.send("Wrong signature\n")


if __name__ == "__main__":
     #for fbctf: 10.10.10.5; for picoctf:0.0.0.0
     HOST, PORT = "0.0.0.0", 41300
     SocketServer.ThreadingTCPServer.allow_reuse_address = True
     server = SocketServer.ThreadingTCPServer((HOST, PORT), ClientHandler)
     server.serve_forever()


