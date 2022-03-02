#!/bin/bash

# Start bind
/etc/init.d/named start

python3 -m sftdyn $@

