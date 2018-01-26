#Dockerfile for building the closest possible SteamOS iso automatically
#This is just the last step, the rest has already been done

FROM brewmaster-base
MAINTAINER Wouter Wijsman

#Run our script
RUN ./postinstall.sh
RUN rm postinstall.sh
