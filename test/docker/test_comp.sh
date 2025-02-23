#!/bin/bash

cp -r compuser "$RSFSRC/user"

comp -c compuser

sfcomptest > /dev/null