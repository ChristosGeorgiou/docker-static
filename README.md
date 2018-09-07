# Landing page for docker

This a simple landing page generator for docker. It uses [envplate](https://github.com/kreuzwerker/envplate) to replace in run time string in html templates with enviroment variables. The current template (one for the moment) is based on the [skeleton](http://getskeleton.com/) boilerplate.

## Enviroment Variables

- HTML_TITLE - used in head
- HTML_DESCRIPTION - used in head
- HTML_AUTHOR - used in head
- HTML_HEADER - used in body
- HTML_SUMMARY - used in body

## Example run

With `docker`

````bash
docker run --name landing -p 80:80 -d cgeosoft/docker-landing
````

or with `docker-compose`

````yml
version: '3.4'
services:
  landing:
    image: cgeosoft/docker-landing
    ports:
      - "80:80"
    environment:
      HTML_TITLE: example_title
      HTML_DESCRIPTION: example_description
      HTML_AUTHOR: example_author
      HTML_HEADER: example_header
      HTML_SUMMARY: example_summary
````