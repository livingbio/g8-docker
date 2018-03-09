From debian

RUN apt update -y && apt install vim curl wget git build-essential libapparmor-dev libltdl-dev/stable libltdl7 libtool -y
RUN apt install python python-pip -y 
RUN pip install g8==v0.2.3.21 

