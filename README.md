Cloud9 IDE SDK
==============

!["Prompt"](https://raw.githubusercontent.com/gbraad/assets/gh-pages/icons/prompt-icon-64.png)


Note: please check GitLab or Docker Hub for the current tags

On my [blog](https://gbraad.nl/blog/) I wrote an article about [Setting up a powerful self-hosted IDE in the cloud](http://gbraad.nl/blog/setting-up-a-powerful-self-hosted-ide-in-the-cloud.html) which describe the use of these images.


## Registries

### GitLab

Available as an automated builds are available at the GitLab [container registry](https://gitlab.com/gbraad/c9ide/container_registry).

  * Fedora:  
    `docker pull registry.gitlab.com/gbraad/c9ide:f24`, `f25`, `f26`, `f27`
  * CentOS:  
    `docker pull registry.gitlab.com/gbraad/c9ide:c7`
  * Ubuntu 16.04 (xenial):  
    `docker pull registry.gitlab.com/gbraad/c9ide:u1604`

The following images are based on my [devenv](htttp://github.com/gbraad/devenv) environment.

  * Fedora (devenv):  
    `docker pull registry.gitlab.com/gbraad/c9ide:f24-devenv`
  * CentOS 7 (devenv):  
    `docker pull registry.gitlab.com/gbraad/c9ide:c7-devenv`


### Docker hub

An alternative automated build is available at the [Docker registry](https://hub.docker.com/r/gbraad/c9ide/).

  * Fedora:  
    `docker pull gbraad/c9ide:f24`, `f25`, `f26`, `f27`
  * CentOS 7:  
    `docker pull gbraad/c9ide:c7`
  * Ubuntu 16.04 (xenial):  
    `docker pull gbraad/c9ide:c7`

The following images are based on my [devenv](htttp://github.com/gbraad/devenv) environment.

  * Fedora (devenv):  
    `docker pull gbraad/c9ide:f24-devenv`
  * CentOS 7 (devenv):  
    `docker pull gbraad/c9ide:c7-devenv`


Usage
-----

###  Running on Docker

#### Setup an alias

```
$ alias c9ide='docker run -it --rm -v `pwd`:/workspace gbraad/c9ide:u1604'
```

or

```
$ alias c9ide='docker run -it --rm -v `pwd`:/workspace registry.gitlab.com/gbraad/c9ide:u1604'
```

#### Invoke C9 IDE

```
$ cd ~/Projects/[something]
$ c9ide
```

and open your browser to [localhost:8181](http://localhost:8181/)


### Running on OpenShift
Note: restrictions apply, as the container doesn't run as `root` (UID: 0) without changing settings. Due to this you can not install new packages. However, you can write in `/opt/`.

```
$ oc new-app gbraad/c9ide:f25 --name=c9ide
```

Now you can create a route and open the application from the browser.


Authors
-------

| [!["Gerard Braad"](http://gravatar.com/avatar/e466994eea3c2a1672564e45aca844d0.png?s=60)](http://gbraad.nl "Gerard Braad <me@gbraad.nl>") |
|---|
| [@gbraad](https://twitter.com/gbraad)  |

