#!/bin/bash
workdir="$(realpath $0|rev|cut -d '/' -f2-|rev)"
output="packages"

# Move to the directory of the script
cd ${workdir}

# Create output directory
mkdir -p output

# Start container
exec docker run --rm -ti -v ${workdir}/${output}:/var/cache/apt/archives/ -h steamos brewmaster /bin/bash
