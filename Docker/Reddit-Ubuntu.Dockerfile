FROM ubuntu:latest
RUN echo "nameserver 8.8.8.8" >> /etc/resolv.conf
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC+1 apt-get -y install tzdata
RUN apt install sudo
RUN apt-get upgrade -y
RUN apt install apache2 php libapache2-mod-php -y
RUN service apache2 start

# Installing the Project based dependencies (in readme.md)
RUN apt install python3 -y
RUN apt install sox -y
RUN apt install ffmpeg -y
RUN apt install espeak -y
RUN apt install libespeak1 -y
RUN apt install libsox-fmt-mp3 -y
RUN apt install python3-pip -y

#Giving right permissions
RUN mkdir /var/www/.local
RUN mkdir /var/www/.cache
RUN chown www-data.www-data /var/www/.local
RUN chown www-data.www-data /var/www/.cache


#RUN sudo -u www-data pip install pip
RUN sudo -H -u www-data pip install ffmpeg-python requests pillow pysndfx soundfile pydub pyttsx3 psaw pandas librosa
RUN sudo -H -u www-data pip install google-api-python-client google-auth-httplib2 google-auth-oauthlib
