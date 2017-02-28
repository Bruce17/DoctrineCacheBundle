#!/usr/bin/env sh

BASEDIR=$(dirname $0);

if [ "$TRAVIS_PHP_VERSION" = "hhvm" ]; then
    exit 0;
fi

pecl install riak

if [ "$TRAVIS_PHP_VERSION" ~= '7\.\d+' ]; then
    pecl install mongo

    phpenv config-add $BASEDIR/php7.ini
else
    phpenv config-add $BASEDIR/php.ini
fi
