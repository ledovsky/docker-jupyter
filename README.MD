# Docker image for python data science stack

## Purpose

My main desire when creating this dockerfile was to run it on the server that is accessible by ssh (such as DigitalOcean, Hetzner, Rackspace or whatever). But of course you can run it on any system you want.

## Included components

* Anaconda for Python 2.7
* Voppal Wabbit
* Tensorflow
* Keras
* XGBoost


## Requirements

* Latest version of `docker` and `docker-compose` installed. [Install docker on Ubuntu](https://docs.docker.com/engine/installation/linux/ubuntulinux/), [install docker-compose](https://docs.docker.com/compose/install/)

## How to run

The following command will run Jupyter Notebook at localhost:8888

    docker-compose up --build -d


## Tips for running on server

Generally, I use ssh tunneling (inside tmux for persistance) to access remote jupyter

    tmux new -s jupyter

    ssh -L 8888:localhost:8888 username@hostname

Don't forget to add to your personal computer `~/.ssh/config` (create it if not existing)

    ServerAliveInterval 60

This should keep your connection alive while your personal computer is working
