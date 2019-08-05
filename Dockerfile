FROM vertx/vertx3-exec-alpine

ENV VERTICLE_NAME io.vertx.quickstart.MainVerticle
ENV VERTICLE_HOME /usr/verticles
ENV APP_NAME vertx-gradle-quickstart
ENV APP_VERSION 0.0.1

ENTRYPOINT [ "sh", "-c", "vertx run $VERTICLE_NAME -cp $VERTICLE_HOME/*" ]

EXPOSE 8080

ADD build/libs/$APP_NAME-$APP_VERSION.jar $VERTICLE_HOME/
