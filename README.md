# Landing page for docker

This a simple landing page. A simple index.html file is served with nodejs. The following env variarables are used

    TITLE=
    SUBTITLE=
    DESCRIPTION=
    AUTHOR=

## Example

With `docker`

```bash
docker run --name landing -e TITLE=mysite -e SUBTITLE=mysite -e DESCRIPTION=mysite -e AUTHOR=me -p 80:3000 -d cgeosoft/landing
```

or with `docker-compose`

```yml
version: "3.4"
services:
  landing:
    image: cgeosoft/landing
    ports:
      - "80:3000"
    environment:
      TITLE: example_title
      SUBTITLE: example_subtitle
      DESCRIPTION: example_description
      AUTHOR: example_author
```
