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

You'll need to create a tested, maintainable and production ready
[Pokédex](http://www.pokemon.com/uk/pokedex/) using the APIs provided
by [pokéapi](http://pokeapi.co).

Feel free to use whatever preprocessor, framework, pattern you prefer
to create the Pokédex exactly as you see in the
[design](http://www.pokemon.com/uk/pokedex).
Please put attention on every detail and develop it thinking that it will be
one of the many components of a bigger application (so consider
side-effects between components, etc.).

#### Acceptance criteria
- A 4x4 grid is loaded with 16 Pokémon preview infos
- Every Pokémon there has its own ID, name and its types
- Clicking on the "Load more Pokémon" a new 4x4 grid is loaded
- The button disappears and the infinite scrolling is enabled
- When a Pokémon is clicked, the main Pokémon page is opened
- The Pokémon page displays its:
  - artwork (feel free to use the following links to fetch the images
    by replacing the corresponding Pokémon's ID: [large][1], [small][2]
  - name
  - types
  - weight and height
  - descriptions (every game has a different description)
  - abilities
  - statistics (based on a scale of 100)
  - moves (way to learn them and their names)

[1]: https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png
[2]: https://assets.pokemon.com/assets/cms2/img/pokedex/detail/001.png

Source code of the application has to be delivered in form of
a private git repository to which you should have or will receive
access shortly.

Have a README file describing:
* implementation details
* what preprocessors, frameworks it used and why (if they've been used)
* possible ways of improving the application

Contain the following **executables**:
* `setup` - for installing the dependencies and other setup
  related tasks
* `start` - for starting the web application on a port given
  through the ENV variable PORT or defaulting to a default one
* `test` - for running the test suite

The completed version of the code should be marked with a git tag `v1.0.0`


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
