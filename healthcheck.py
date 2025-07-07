# healthcheck.py

from http.server import HTTPServer, BaseHTTPRequestHandler

class SimpleHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"OK")

# Pokrećemo server na portu 8080
httpd = HTTPServer(('0.0.0.0', 8080), SimpleHandler)
httpd.serve_forever()