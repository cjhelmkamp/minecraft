#!/bin/bash
VOLATILE=/run/shm/minecraft/kepler/
PERMANENT=/opt/minecraft/worlds/kepler/
rsync -v -rt --delete $VOLATILE $PERMANENT
