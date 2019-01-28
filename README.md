# ole.kristensen.name

## A forked Stacey 3.0 with Bootstrap
This is my homepage [ole.kristensen.name](http://ole.kristensen.name), that integrates the Twitter Bootstrap with the excellent Staceyapp template system.

It's a databaseless portfolio for my works, feel free to get inspired and roll your own from here.

Read more about Stacey below:

# Stacey 3.0.0

## Overview
Stacey takes content from `.yml` files, image files and implied directory structure and generates a website.
It is a no-database, dynamic website generator.

If you look in the `/content` and `/templates` folders, you should get the general idea of how it all works.

## Installation

Copy to server, `chmod 777 app/_cache`.

If you want clean urls, `mv htaccess .htaccess`

## Templates

Stacey uses the [Twig templating language](http://twig.sensiolabs.org/).

There are an additional two sets of templates which can be found at:
<http://github.com/kolber/stacey-template2> &
<http://github.com/kolber/stacey-template3>

## Read More

See <http://staceyapp.com> for more detailed usage information.

## Docker

### Apache and PHP on Docker
Dan PupiusAug 5, 2014

https://writing.pupius.co.uk/apache-and-php-on-docker-44faef716150

There are a fair number of references for how to get Apache and PHP running on Docker. However, none of them worked out of the box for me, so here’s a consolidated set of instructions that worked for me.

I will update this post as I learn more and find limitations with this approach.

### Installing Docker

For instructions on how to set up docker on your system, head over to docker.com.

### Building the container

Once you have setup the project run:

`docker build -t mysite .`

### Getting it running

To run apache in a background process, simply start the container using the following command:

`docker run -p 8080:80 -d mysite`
`-p 8080:80` publishes port 80 in the container to 8080 on the host machine.
`-d` detaches from the process, use docker ps and docker stop to … stop.

Note: on OSX use `docker-machine ip default` to get the right IP to use (assuming default is your machine name).

Sometimes you’ll want to debug issues with the container; maybe there are PHP configuration issues or you want to view error logs. To do that you can start the container in interactive mode and then start apache manually:

`docker run -i -t -p 8080:80 mysite /bin/bash`
`apachectl start`

### Making changes

If you’re actively developing you want to be able to change files in your usual editor and have them reflected within the container without having to rebuild it. The -v flag allows us to mount a directory from the host into the container:

`docker run -p 8080:80 -d -v /Users/dan/site:/var/www/site mysite`

## Copyright/License

Copyright (c) 2009 Anthony Kolber. See `LICENSE` for details.
Except [PHP Markdown Extra](http://michelf.com/projects/php-markdown/extra/) which is (c) Michel Fortin (see `/app/parsers/markdown-parser.inc.php` for details) and
[jsmin.php](https://github.com/rgrove/jsmin-php/) which is (c) Ryan Grove (see `app/parsers/json-minifier.inc.php` for details).
