#! /bin/bash
# render the map with 2 cpu cores
echo Check if the script is running
lockfile-check /opt/mapcrafter/mapcrafter
if lockfile-check /opt/mapcrafter/mapcrafter; then
	echo Lockfile with PID of $(cat /opt/mapcrafter/mapcrafter.lock) found
	echo Exiting the script
	exit 
fi
echo Create the Lockfile
lockfile-create -p /opt/mapcrafter/mapcrafter
echo Starting Mapcrafter
mapcrafter -b -c /opt/mapcrafter/render.conf -j 2
echo Removeing the lockfile
lockfile-remove /opt/mapcrafter/mapcrafter
echo Script complete
