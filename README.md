# challenge
Code challenge structure, tasks and result evaluation

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

* [API for getting Gravatar URLs from emails](/tasks/be_001.md)


### Frontend

* [Pokémon Encyclopedia by consuming APIs and implementing the provided designs](/tasks/fe_001.md)


### Mobile

* [A Twitter wall for your mobile device](/tasks/mo_001.md)


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

* Usage of a source control system (eg. Git, SVN)
* Continuous integration usage (for deploy, testing, quality assurance)
* Documentation (at least a basic README)
* Automated server setup (usage of Chef, Ansible, Saltstack, Docker, Vagrant...)
* Communication through issues / pull requests
* Writes and is familiar with multiple languages (Ruby, Clojure, Haskell, Java, Go...)

* for using VIM you get extra points (of course) :)

### Code

* It works (is executable and behaves as specified)
* Existence of tests (unit/integration/acceptance)
* Method/function length
* Class/module length
* Cyclomatic complexity
* Framework/library usage
* Mastery of used languages and programming principles

### Evaluation grids

The following grids are based on the above criteria.
Please note that some criteria are not always applicable (i.e. Issues/Pull requests for coding challenges).

Topic | Fulfilment criteria | Available points | Assigned points
--- | --- | --- | ---
Source control | is using a source control system (Git, SVN...) | 20 | ?
Continuous Integration | is using CI for automating tests, deploy, quality checks | 15 | ?
Documentation | has a README describing what it does, how to set it up, comments/docs in code where required | 15 | ?
Server automation | is provided with tools that are capable to automate the machine's setup | 15 | ?
Issues/Pull requests | gives constructive feedbacks and suggests solutions | 10 | ?
Polyglot | is capable of writing code in multiple languages | 20 | ?

?/95

Topic | Fulfilment criteria | Available points | Assigned points
--- | --- | --- | ---
Works | is possible to execute and delivers described functionality | 20 | ?
Tests | is provided with tests that pass and cover the public interface | 15 | ?
Method length | implements methods that don't exceed 5-10 lines | 5 | ?
Class length | implements classes that don't exceed 100-150 lines | 5 | ?
Complexity | shows a linear code that does not contain too much nested structures | 10 | ?
Framework/library usage | uses frameworks or libraries that are conform to the task and does not reinvent the wheel | 10 | ?
Mastery of used languages and programming principles | exploits patterns, best practices and the peculiarities of the used languages | 30 | ?

?/95

(?/160) = ? * 10 (**?**)


License
-------

Copyright © 2015 Honeypot GmbH. All rights reserved.


About Honeypot
--------------

![Honeypot](https://www.honeypot.io/logo.png)

Honeypot is a developer focused job platform.
The names and logos for Honeypot are trademarks of Honeypot GmbH.
