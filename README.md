# SciBot

A tool and companion service used to:

* find RRIDs in articles 
* look them up in the SciCrunch resolver
* create Hypothesis annotations that anchor to the RRIDs and display lookup results

## Getting Started

* Create the Hypothesis account under which annotations will be created
* Generate an api token at https://hypothes.is/profile/developer
* Create a group to store the annotations at https://hypothes.is/groups/new
* See [Setup on amazon](#setup-on-amazon)

## Capturing the bookmarklet

Visit http://HOST:PORT/bookmarklet and follow the instructions.

## Using the bookmarklet

Visit an article that contains RRIDs, click the bookmarklet

## Checking results in the browser

The found RRIDs are logged to the JavaScript console

## Checking results on the server

The found RRIDs are logged to timestamped files, along with the text and html of the article that was scanned for RRIDs

## Setup on amazon

0. ssh in to the host that will serve the script
1. `sudo yum install gcc libxml2 libxml2-devel libxslt libxslt-devel python34 python34-devel python34-pip`
2. `sudo alternatives --set python /usr/bin/python3.4`
3. `sudo pip install requests pyramid lxml gevent gunicorn`
4. clone this repository
6. `export RRIDBOT_USERNAME=someusername`
7. `export RRIDBOT_GROUP=somegroupname`
8. `unset HISTFILE`
9. `export RRIDBOT_API_TOKEN=sometoken`
10. `export RRIDBOT_SYNC=somerandomnumber` (e.g. run `head -c 100 /dev/urandom | tr -dc 'a-zA-Z0-9'` every time)
11. create a screen session
12. in the screen session run `cd scibot; ./guni.sh` you should create a link to the log files folder in ~/scibot/
13. get letsencrypt certs using certbot, follow directions [here](https://certbot.eff.org/docs/using.html) (prefer standalone)
14. before or after starting gunicorn you need to run `sudo yum install nginx && sudo cp ~/scibot/nginx.conf /etc/nginx/nginx.conf && sudo service start nginx`
15. run `python sync.py` in another screen

## Retrieving data

Use export.py to dump a spreadsheet of RRIDs mined from the data.
In the folder for this git repository run the following commands.

0. `export RRIDBOT_USERNAME=someusername`
1. `export RRIDBOT_GROUP=somegroupname`
2. `unset HISTFILE`
3. `export RRIDBOT_API_TOKEN=sometoken`
4. `python export.py`

