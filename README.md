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

Create a maintainable, production ready web application
that provides an API endpoint for transforming email addresses
into gravatar uris

```
# GET /gravatr/{email}
+ Response 200 (text/plain)

    https://www.gravatar.com/avatar/sdgdsf3535sdfg.jpeg
```

Source code of the application has to be delivered in form of
a private git repository to which you should have or will receive
access shortly.

The code should be covered with tests.

Have a README file describing:
* what the application does
* what libraries, frameworks it used and why
* possible ways of improving the application eg. for performance, readability ...

Contain the following **executables**:
* `setup` - for installing the dependencies and other setup
  related tasks
* `start` - for starting the web application on a port given
  through the ENV variable PORT or defaulting to a default one
* `test` - for running the test suit

The completed version of the code should be marked with a git tag `v1.0.0`


### Frontend

### Mobile

### Ops / DevOps

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
source control | is using a source control system mercurial, cvs, git ... | 20
Continuous Integrating | using CI for automating tests, deploy, quality checks | 15
Documentation | has a README describing what it does, how to set it up, comments/docs in code where required | 15
Server automation | is familiar with server setup automation | 5
Issues/pull requests | giving constructive feedback and suggesting solutions | 10
Polyglot | capable of writing code in multiple languages | 20


### Code

* It works (is executable and behaves as specified)
* existence of tests (unit/integration/acceptance)
* method/function length
* class/module length
* "Cyclomatic" complexity
* Usage of global state

Topic | fulfilment criteria | points
--- | --- | ---
Works | is possible to execute and delivers described functionality | 20
Tests | tests exist, they pass, cover the public interface | 15
method length | methods don't exceed 5-10 lines | 5
class length | Not more than 100-150 lines | 5
complexity | No multi level nested else ifs case switches | 10
global state | used and referenced as little as possible | 5
framework/library usage | using frameworks spring/rails/laravel or non trivial libraries | 10
