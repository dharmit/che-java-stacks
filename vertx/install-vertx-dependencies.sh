#!/bin/sh
RED='\033[0;31m'
NC='\033[0m' # No Color
YELLOW='\033[0;33m'
BLUE='\033[0;34m'

function install {
  #echo -e "${BLUE}Installing $1 ${NC}"
  mvn dependency:get -Dartifact=$1 > /tmp/maven-$1.log
  if [ $? -eq 0 ]; then
    echo -e "🍻  ${YELLOW}$1 installed successfully ${NC}"
  else
    echo -e "☠️  ${RED}Unable to install $1 ${NC}"
    cat /tmp/maven-$1.log
    exit 1
  fi
}

echo -e "${BLUE}Installing Vert.x ${VERTX_VERSION} dependencies..."
install $VERTX_GROUPID:vertx-core:$VERTX_VERSION
install $VERTX_GROUPID:vertx-web:$VERTX_VERSION
install $VERTX_GROUPID:vertx-web-templ-handlebars:$VERTX_VERSION
install $VERTX_GROUPID:vertx-web-templ-jade:$VERTX_VERSION
install $VERTX_GROUPID:vertx-web-templ-mvel:$VERTX_VERSION
install $VERTX_GROUPID:vertx-web-templ-thymeleaf:$VERTX_VERSION
install $VERTX_GROUPID:vertx-web-templ-pebble:$VERTX_VERSION
install $VERTX_GROUPID:vertx-web-templ-freemarker:$VERTX_VERSION
install $VERTX_GROUPID:vertx-jdbc-client:$VERTX_VERSION
install $VERTX_GROUPID:vertx-service-discovery:$VERTX_VERSION
install $VERTX_GROUPID:vertx-circuit-breaker:$VERTX_VERSION
install $VERTX_GROUPID:vertx-redis-client:$VERTX_VERSION
install $VERTX_GROUPID:vertx-mongo-client:$VERTX_VERSION
install $VERTX_GROUPID:vertx-rx-java:$VERTX_VERSION
install $VERTX_GROUPID:vertx-dropwizard-metrics:$VERTX_VERSION
install $VERTX_GROUPID:vertx-unit:$VERTX_VERSION
install junit:junit:4.12
install $VERTX_GROUPID:vertx-auth-common:$VERTX_VERSION
install $VERTX_GROUPID:vertx-auth-jwt:$VERTX_VERSION
echo -e "${BLUE}Vert.x ${VERTX_VERSION} dependencies installed ${NC}"
rm -Rf /tmp/maven-*
