FROM java

RUN wget -q -O /tmp/sbt.deb https://dl.bintray.com/sbt/debian/sbt-0.13.16.deb && dpkg -i /tmp/sbt.deb
WORKDIR /app

ADD . /app

RUN sbt compile

ENTRYPOINT ["sbt"]

