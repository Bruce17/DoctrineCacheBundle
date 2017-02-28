#!/usr/bin/env sh

BASEDIR=$(dirname $0);

echo "travis version: $TRAVIS_PHP_VERSION";
PHP_ENV_VERSION=$(phpenv version-name);
echo "php env version: $PHP_ENV_VERSION";

if [ "$TRAVIS_PHP_VERSION" = "hhvm" ]; then
    exit 0;
fi

if echo "$PHP_ENV_VERSION" | grep -q -E '7.+' ; then
    pecl install mongo

    phpenv config-add $BASEDIR/php7.ini
else
    pecl install riak

    phpenv config-add $BASEDIR/php.ini
fi
