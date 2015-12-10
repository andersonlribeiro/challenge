# challenge
Code challenge Structure, Tasks and result evaluation

## Introduction

Honeypot provides pre-screening of talent which involves:

  * General validation of human language skills, education,
professional experience, availability and desired carrier path

  * Technical screening - code quality, technology and best practice
knowledge

This Repository should serve as a centralised resource for coding
challenges and common consensus on how to evaluate and rate the
results of a challenge.

Everything in this document is based on the assumption
that following holds true:

  * Code is being written once and read many times

## List of challenges

### Backend

* [API for generating gravatar url's from emails](/tasks/be_001.md)


### Frontend

* [Pokemon Encyclopedia by consuming API's and implementing provided designs](/tasks/fe_001.md)


### Mobile

* [twitterwall for your mobile devise](/tasks/mobile.md)


### DevOps

* [Automating the setup of Percona master slave setup](/tasks/do_001.md)


### Ops

### Data science

## Evaluation grid

The aim is to create a set of polyglot guidelines for basic code
quality and general work culture evaluation

Every topic has a short description on what is being considered as
the fulfilment criteria and how many "points" it is being valued.
"points" is a whole, positive number that represent a relative importance
to other topics.

### Work flow

* Usage of a source control system (eg. GIT, SVN)
* Continuous integration usage (for deploy, testing, quality assurance)
* Documentation (at least a basic README)
* Automated server setup (usage of Chef, Ansible, Saltstack, Docker, Vagrant, ...)
* Communication through issues / pull requests
* Writes and is familiar with multiple languages (Ruby, Clojure, Haskell, Java, Go ..)

* for using VIM you get extra points (of course) :)

Topic | fulfilment criteria | points
--- | --- | ---
Source control | is using a source control system mercurial, cvs, git ... | 20
Continuous Integrating | using CI for automating tests, deploy, quality checks | 15
Documentation | has a README describing what it does, how to set it up, comments/docs in code where required | 15
Server automation | is familiar with server setup automation | 15
Issues/pull requests | giving constructive feedback and suggesting solutions | 10
Polyglot | capable of writing code in multiple languages | 20


Please note that server automation is not always applicable (i.e. frontend challenges).

### Code

* It works (is executable and behaves as specified)
* Existence of tests (unit/integration/acceptance)
* Method/function length
* Class/module length
* Cyclomatic complexity
* Framework/library usage

Topic | fulfilment criteria | points
--- | --- | ---
Works | is possible to execute and delivers described functionality | 20
Tests | tests exist, they pass, cover the public interface | 15
Method length | methods don't exceed 5-10 lines | 5
Class length | Not more than 100-150 lines | 5
Complexity | No multi level nested else ifs case switches | 10
Framework/library usage | using frameworks spring/rails/laravel or non trivial libraries | 10


License
-------

Copyright © 2015 Honeypot GmbH. All rights reserved.


About Honeypot
--------------

![Honeypot](https://www.honeypot.io/logo.png)

Honeypot is a developer focused job platform.
The names and logos for Honeypot are trademarks of Honeypot GmbH.
