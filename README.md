Cloud9 IDE SDK
==============

!["Prompt"](https://raw.githubusercontent.com/gbraad/assets/gh-pages/icons/prompt-icon-64.png)


Docker container containing C9 SDK, based of [devenv](https://gitlab.com/gbraad/devenv)


## Registries

### GitLab

Available as an automated builds are available at the GitLab [container registry](https://gitlab.com/gbraad/c9ide/container_registry).

  * Fedora 24:  
    `docker pull registry.gitlab.com/gbraad/c9ide:f24`
  * CentOS 7:  
    `docker pull registry.gitlab.com/gbraad/c9ide:c7`
  * Ubuntu 16.04 (xenial):  
    `docker pull registry.gitlab.com/gbraad/c9ide:u1604`

The following images are based on my [devenv](htttp://github.com/gbraad/devenv) environment.

  * Fedora 24 (devenv):  
    `docker pull registry.gitlab.com/gbraad/c9ide:f24-devenv`
  * CentOS 7 (devenv):  
    `docker pull registry.gitlab.com/gbraad/c9ide:c7-devenv`


### Docker hub

An alternative automated build is available at the [Docker registry](https://hub.docker.com/r/gbraad/c9ide/).

  * Fedora 24:  
    `docker pull gbraad/c9ide:f24`
  * CentOS 7:  
    `docker pull gbraad/c9ide:c7`
  * Ubuntu 16.04 (xenial):  
    `docker pull gbraad/c9ide:c7`

The following images are based on my [devenv](htttp://github.com/gbraad/devenv) environment.

  * Fedora 24 (devenv):  
    `docker pull gbraad/c9ide:f24-devenv`
  * CentOS 7 (devenv):  
    `docker pull gbraad/c9ide:c7-devenv`


Usage
-----

### Setup an alias

```
$ alias c9ide='docker run -it --rm -v `pwd`:/workspace gbraad/c9ide:u1604'
```

or

```
$ alias c9ide='docker run -it --rm -v `pwd`:/workspace registry.gitlab.com/gbraad/c9ide:u1604'
```


### Invoke C9 IDE

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
