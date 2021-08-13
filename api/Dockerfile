FROM ruby:2.5

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# Set timezone
RUN echo "America/Sao_Paulo" > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

WORKDIR /usr/src/app/

# install required gem files for Capybara
COPY ./Gemfile /usr/src/app/Gemfile
COPY ./Gemfile.lock /usr/src/app/Gemfile.lock

RUN gem install bundler -v 1.16.3
RUN bundle install

# install chrome web
# RUN apt-get update -y && \
#        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
#        dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

RUN apt-get update -y && \
       wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
       dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

# install chrome local
# ADD drivers/chrome64_68.deb /usr/src/app/drivers/chrome64_68.deb
RUN apt-get update -y && \
    apt-get install -y libnss3 fonts-liberation libappindicator3-1 libasound2 \
                        libatk-bridge2.0-0 libgtk-3-0 libnspr4 libx11-xcb1 libxss1 \
                        apt-utils libxtst6 lsb-release xdg-utils
# RUN dpkg -i /usr/src/app/drivers/chrome64_68.deb; apt-get -fy install

RUN apt-get update -y && \
 apt-get install -y unzip xvfb --no-install-recommends apt-utils qt5-default libqt5webkit5-dev \
 gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x freetds-dev  \
 libxi6 libgconf-2-4

# install chromedriver and place it ib paths
RUN CHROMEDRIVER_VERSION="81.0.4044.138" && \
   mkdir -p /opt/chromedriver-$CHROMEDRIVER_VERSION && \
   curl -sS -o /tmp/chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip && \
   unzip -qq /tmp/chromedriver_linux64.zip -d /opt/chromedriver-$CHROMEDRIVER_VERSION && \
   rm /tmp/chromedriver_linux64.zip && \
   chmod +x /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver && \
   ln -fs /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver /usr/local/bin/chromedriver

# RUN Xvfb -ac :99 -screen 0 1366x768x24 &
# RUN export DISPLAY=:99
