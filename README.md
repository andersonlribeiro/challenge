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
* `bin/setup` - for installing the dependencies and other setup
  related tasks
* `bin/start` - for starting the web application on a port given
  through the ENV variable PORT or defaulting to a default one
* `bin/test` - for running the test suite

The completed version of the code should be marked with a git tag `v1.0.0`


### Frontend

You're asked to create a tested, maintainable and production ready
[Pokémon Encyclopedia](http://www.pokemon.com/uk/pokedex/) using
the APIs provided by [pokéapi](http://pokeapi.co).

Feel free to use whatever preprocessor, framework, pattern you prefer
to create the Pokédex exactly as you see in the designs we provided.
Please put attention on every detail and develop it considering that
it will be one of the many components of a bigger application.
This is why we ask you to consider potentials side-effects (between
components, etc.) during the development.

### Design
https://drive.google.com/open?id=0B3cKl_MrnKolRldOQ3JkdnROOEU


#### Acceptance criteria
- A 4x4 grid is loaded with 16 Pokémon
- Every Pokémon in that grid shows its own ID, name and types
- Clicking on the "Load more Pokémon" button a new 4x4 grid is loaded
- When clicked, the button disappears and the infinite scrolling is enabled
- When a Pokémon is clicked, the single Pokémon page is opened displaying:
  - artwork (feel free to use the following links to fetch the images
    by replacing the corresponding Pokémon's ID: [large][1], [small][2]
  - ID
  - name
  - types
  - weight and height
  - description (each game has a different description, so please pick the
    latest available one)
  - abilities
  - statistics (based on a scale of 100)
  - moves

[1]: https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png
[2]: https://assets.pokemon.com/assets/cms2/img/pokedex/detail/001.png

### Release infos

Source code of the application has to be delivered in form of
a private git repository to which you should have or will receive
access shortly.

Please provide also a README file describing:
* implementation details
* what preprocessors, frameworks it used and why (if they've been used)
* possible ways of improving the application

Contain the following **executables**:
* `bin/setup` - for installing the dependencies and other setup
  related tasks
* `bin/start` - for starting the web application on a port given
  through the ENV variable PORT or defaulting to a default one (if needed)
* `bin/test` - for running the test suite (if you made it)

The completed version of the code should be marked with a git tag `v1.0.0`

If you're not able to deliver the challenge completed in every part, feel free
to release at least the index.
Developing the whole challenge it's pretty time consuming after all :)

### Mobile

### DevOps

Automate the setup of two Percona instances where one is a master
and the other a replica.

Configuration Management scripts have to be tracked and delivered in form
of a private git repository to which you should have or will receive
access shortly.

The scripts should be covered with tests that verify the final working state
of both instances and preferably test the functionality in a more granular/unit level.

Add a README file describing:
* what the project does
* what libraries, frameworks, tools are used and why
* possible improvements eg. for performance, readability, maintainability ...

Contain the following **executables**:
* `bin/setup` - for fetching, installing the dependencies and other setup
  related tasks
* `bin/start` - for provisioning and starting the instances
* `bin/test` - for running the test suit

The completed version should be marked with a git tag `v1.0.0`


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
Tests | tests exist, they pass, cover the public interface | 15
Method length | methods don't exceed 5-10 lines | 5
Class length | Not more than 100-150 lines | 5
Complexity | No multi level nested else ifs case switches | 10
Framework/library usage | using frameworks spring/rails/laravel or non trivial libraries | 10
