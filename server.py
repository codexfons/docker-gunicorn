"""WSGI module for testing codexfons/gunicorn."""

def app(environment, start_response):
    start_response('200 OK', [('Content-Type', 'text/plain')])
    return ['Hello world!'.encode('utf-8')]
