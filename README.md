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

### Frontend

### Mobile

### Ops / DevOps

### Data science

## Evaluation grid

The aim is to create a set of polyglot guidelines for basic code
quality and general work culture evaluation

### Work flow

* Usage of a source control system (eg. GIT, SVN)
* Continuous integration usage (for deploy, testing, quality assurance)
* Documentation (at least a basic README)
* Automated server setup (usage of Chef, Ansible, Saltstack, Docker, Vagrant, ...)
* for using VIM you get extra points (of course) :)

* Communication through issues / pull requests

Guideline | fulfilment criteria | points
--- | --- | ---
source control | is using a source control system mercurial, cvs, git ... | 20
Continuous Integrating | using CI for automating tests, deploy, quality checks | 15
Documentation | has a README describing what it does, how to set it up, comments/docs in code where required | 10
Server automation | is familiar with server setup automation | 5

### Code

* It works (is executable and behaves as specified)
* existence of tests (unit/integration/acceptance)
* method/function length
* class/module length
* "Cyclomatic" complexity
* Usage of global state

Guideline | fulfilment criteria | points
--- | --- | ---
Works | is possible to execute and delivers described functionality | 20
Tests | tests exist, they pass, cover the public interface | 15
method length | methods don't exceed 5-10 lines | 5
class length | Not more than 100-150 lines | 5
complexity | No multi level nested else ifs case switches | 5
global state | used and referenced as little as possible | 5
