#!/bin/bash

for i in `ls cookbooks` ; do knife cookbook upload $i ; done
