# Shortener

## Purpose

Shortener is a publicly available service (with no authentication and authorization) allowing to shorten any URL.

## Description

Shortening is a generation of unique (as short as possible) hash from the given URL. Shortened link will be accessed forever, while service exists. User might want to choose own hash (nicely readable) if it is not taken already.

System is tracking usage statistics to the shortened link by browser. Statistics is available to everybody, not only to the user, who shortened the URL. To view stats page, it is needed to add a '+' (configurable) to the end of shortened link.
Supported browsers (with help of ```useragent``` gem):

* Firefox
* Opera
* Chrome
* Safari
* Internet Explorer :boom:

All other browsers are registered as "Other".

### Validation

Validation is not needed. Reason for that is: users might want to use a service for the URLs, which aren't publicly available (intranet, local filesystem, third-party protocols). There is no reason to additionally restrict flexibility to adding string validation for the URL format.

## Development

### Dependencies

* [Redis](http://redis.io/) server

### Configuration

System supports such configuration options:

* **EXTRA_SUMBOL** ```+```

Symbol, that is used to indicate, that system should display permalink details page, instead of doing a redirect to the original URL.

* **ALPHABET** ```"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"```

List of allowed characters to use for short URLs.

* **REDIS_URL** ```"redis://localhost"```

URL to the [Redis](http://redis.io/) installation.

### Localization

System supports two languages:

* English
* Russian

### Testing

System contains rspec (unit) and cucumber (integration) tests.
[Travis-ci](https://travis-ci.org/maksar/shortener) is used for continuous integration.
[![Build Status](https://travis-ci.org/maksar/shortener.png?branch=master)](https://travis-ci.org/maksar/shortener)

### License

The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.