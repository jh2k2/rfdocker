FROM ubuntu:latest as driverdownload
COPY setup_browser_driver.sh /tmp
RUN /tmp/setup_browser_driver.sh
CMD zsh

FROM python:3.8
ENV DISPLAY :99
COPY --from=driverdownload /usr/local/bin/*driver /usr/local/bin
RUN apt update && \
    #chrome dependencies TODO
        #apt -y --no-install-recommends install gconf2 libnss3-dev libgdk-pixbuf2.0-dev libgtk-3-dev libxss-dev fonts-liberation libasound2 xdg-utils&& \
        #wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
        #dpkg -i google-chrome-stable_current_amd64.deb && \
    #browser
    apt-get install -y xvfb firefox-esr && \
    #python dependencies
    pip3 install  robotframework-seleniumlibrary robotframework && \
    #clean up
    apt -y autoremove --purge && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
WORKDIR /robot
CMD zsh
