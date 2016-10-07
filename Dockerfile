FROM ubuntu:16.04
MAINTAINER chella "2chellaa@gmail.com"
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y vsftpd ftp expect
RUN useradd -m -s /bin/false myftp
ADD password.xd /
RUN chmod +x /password.xd
RUN mkdir -p /ftp/SPS/IN /ftp/SPS/Signals /ftp/TNQ/IN /ftp/TNQ/Signals /ftp/PCDEVTEST/IN /ftp/PCDEVTEST/Signals /ftp/SPIN2/IN /ftp/SPIN2/Signals /ftp/MACM/IN /ftp/MACM/Signals /ftp/THOM/IN /ftp/THOM/Signals
RUN chown myftp:myftp /ftp/* -R
RUN usermod -d /ftp myftp
RUN mv /etc/vsftpd.conf /etc/vsftpd.conf.bak
ADD vsftpd.conf /etc/vsftpd.conf
EXPOSE 21
CMD ['/etc/init.d/vsftpd', 'start']
ENTRYPOINT "./password.xd" && tailf /var/log/vsftpd.log
