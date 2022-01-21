# php-icu-testing

I put this repository together to illustrate issues I'm facing with various
versions of ICU, any of which PHP might be built with, depending on the default
distribution packages of the underlying system.

First, clone this repository and run `build_images.sh` to build a handful of
Docker images to use for testing:

```shell
git clone https://github.com/ramsey/php-icu-testing.git
cd php-icu-testing/
./build_images.sh
```

Then, run the following Docker commands to execute the example within the
containers.

```shell
docker run --rm -it -v $PWD:/src -w /src php-icu:7.4-70 php example.php
docker run --rm -it -v $PWD:/src -w /src php-icu:7.4-69 php example.php
docker run --rm -it -v $PWD:/src -w /src php-icu:7.4-68 php example.php
docker run --rm -it -v $PWD:/src -w /src php-icu:7.4-67 php example.php
docker run --rm -it -v $PWD:/src -w /src php-icu:7.4-66 php example.php
```

You'll note that the script begins failing in image `php-icu:7.4-68`. The
version of ICU used in this image is 68.1. As this illustrates, either ICU 68.1
doesn't support the message format syntax in the example, or PHP's integration
with ICU 68.1 doesn't support it. Either way, it's incredibly difficult to
communicate this dependency from `composer.json`, since `ext-intl` is not
versioned, much less can you specify the version of ICU to use.
