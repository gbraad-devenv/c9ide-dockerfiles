Cloud9 IDE SDK
==============

!["Prompt"](https://raw.githubusercontent.com/gbraad/assets/gh-pages/icons/prompt-icon-64.png)


Docker container containing C9 SDK, based of [devenv](https://gitlab.com/gbraad/devenv)


## Registries

### Docker hub

Available as an automated build from the [Docker registry](https://hub.docker.com/r/gbraad/c9ide/).

  * Fedora 24 (devenv): `docker pull gbraad/c9ide:f24`
  * CentOS 7 (devenv): `docker pull gbraad/c9ide:c7`


### GitLab

Alternative automated builds are available at a GitLab [container registry](https://gitlab.com/gbraad/c9ide/container_registry).

  * Fedora 24 (devenv): `docker pull registry.gitlab.com/gbraad/devenv:f24`
  * CentOS 7 (devenv): `docker pull registry.gitlab.com/gbraad/c9ide:c7`


Usage
-----

### Setup an alias

```
$ alias c9ide='docker run -it --rm -v `pwd`:/workspace gbraad/c9ide:f24'
```

or

```
$ alias c9ide='docker run -it --rm -v `pwd`:/workspace registry.gitlab.com/gbraad/c9ide:f24'
```


### Invoke devenv

```
$ cd ~/Projects/[something]
$ c9ide
```

and open your browser to [localhost:8181](http://localhost:8181/)



Authors
-------

| [!["Gerard Braad"](http://gravatar.com/avatar/e466994eea3c2a1672564e45aca844d0.png?s=60)](http://gbraad.nl "Gerard Braad <me@gbraad.nl>") |
|---|
| [@gbraad](https://twitter.com/gbraad)  |
