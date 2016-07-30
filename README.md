# docker-gunicorn

[![Travis CI](https://api.travis-ci.org/codexfons/docker-gunicorn.svg)](https://travis-ci.org/codexfons/docker-gunicorn)

Alpine-based minimal Python3 + Gunicorn setup.

## Usage

1.  Create your own `Dockerfile` using `codexfons/gunicorn` as base.
2.  `ADD your_project $APP_PATH` in your `Dockerfile`.
3.  Depending on what your WSGI entrypoint is, you may have to set some of the
    environment variables as documented below.

## Environment variables

*   `GUNICORN_PORT` (default: `8000`): The port served by Gunicorn.
*   `GUNICORN_MODULE` (default: `server`): The Python module serving as the
    Gunicorn entrypoint.
*   `GUNICORN_CALLABLE` (default: `app`): The object inside `$GUNICORN_MODULE`
    that is called by Gunicorn.
*   `GUNICORN_USER` (default: `gunicorn`): The Gunicorn process runs as this
    unprivileged user instead of root.
*   `APP_PATH` (default: `/opt/app`): Root path of the application, which serves
    as working directory and home for `$GUNICORN_USER`.

## Testing

`test.sh` contains a simple integration test to ensure that the example WSGI
module produces an expected response.
