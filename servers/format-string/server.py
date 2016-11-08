#!/usr/bin/python
# -*- coding: utf-8 -*-

import SocketServer, subprocess, os

class ClientHandler(SocketServer.BaseRequestHandler):
    def handle(self):
        fd = self.request.fileno()
        while True:
            data = self.request.recv(4096)
            tmpc = os.path.dirname(__file__)
            tmpc+='/fs'
            cmd = [tmpc] + [data]
            subprocess.Popen(cmd, stdin=fd, stdout=fd, stderr=fd).communicate()

if __name__ == "__main__":
    HOST, PORT = '0.0.0.0', 12016
    SocketServer.ThreadingTCPServer.allow_reuse_address = True
    server = SocketServer.ThreadingTCPServer((HOST, PORT), ClientHandler)
    server.serve_forever()


