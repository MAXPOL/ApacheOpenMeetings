From ubuntu:18.04
RUN apt-get update
RUN apt-get install wget nano -y
RUN cd /
RUN wget https://github.com/MAXPOL/ApacheOpenMeetings/blob/master/scriptSetings.sh
RUN chmod +x scriptSetings.sh
#RUN ./scriptSetings.sh // Run this it script by hand after create docker machine in inside docker machine. 
