# Landing page for docker

This a simple landing page generator for docker. It uses [envplate](https://github.com/kreuzwerker/envplate) to replace in run time string in html templates with enviroment variables. The current template (one for the moment) is based on the [skeleton](http://getskeleton.com/) boilerplate.

## Example run

With `docker`

````bash
docker run --name landing -e TITLE=mysite -e DESCRIPTION=mysite -e AUTHOR=me -p 80:80 -d cgeosoft/landing
````

or with `docker-compose`

````yml
version: '3.4'
services:
  landing:
    image: cgeosoft/landing
    ports:
      - "80:80"
    environment:
      TITLE: example_title
      DESCRIPTION: example_description
      AUTHOR: example_author
````