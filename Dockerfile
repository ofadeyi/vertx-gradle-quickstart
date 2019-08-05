FROM vertx/vertx3-alpine

ENV VERTICLE_NAME io.vertx.quickstart.MainVerticle
ENV VERTICLE_FILE build/libs/vertx-gradle-quickstart.jar

# Set the location of the verticles
ENV VERTICLE_HOME /usr/verticles

EXPOSE 8080

ENV JAVA_OPTS "-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap"

# Launch the verticle
WORKDIR $VERTICLE_HOME
ENTRYPOINT ["sh", "-c"]
CMD ["exec vertx run $VERTICLE_NAME -cp $VERTICLE_HOME/*"]

# Copy your verticle to the container
COPY $VERTICLE_FILE $VERTICLE_HOME/
