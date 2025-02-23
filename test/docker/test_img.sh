#!/bin/bash

source shellunity

if [ -f "/tmp/test_img.vpl" ]
then
    rm /tmp/test_img.vpl
fi

if [ -f "/tmp/test_img.jpeg" ]
then
    rm /tmp/test_img.jpeg
fi

sfmath n1=1000 n2=1000 output="x1*x2" | sfgrey > /tmp/test_img.vpl

img -i /tmp

TEST_FILE_FIND /tmp/test_img.jpeg

sfmath n1=1000 n2=1000 output="x1*x2" | sfgrey > test_img.vpl

img -i

TEST_FILE_FIND test_img.jpeg
