gunicorn -b localhost:5000 -n scibot -w 4 -k gevent -t 600 --preload --log-level debug server:app
#gunicorn -b localhost:5000 -n scibot -w 4 -k gevent -t 600 --log-level debug server:app
