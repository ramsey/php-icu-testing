#!/bin/sh

php_versions=( "7.4" )
icu_versions=( 66 67 68 69 70 )

for php_version in "${php_versions[@]}"; do
    for icu_version in "${icu_versions[@]}"; do
        docker build \
            --tag "php-icu:${php_version}-${icu_version}" \
            --build-arg "PHP_VERSION=${php_version}" \
            --build-arg "ICU_VERSION=${icu_version}" \
            .
    done
done
