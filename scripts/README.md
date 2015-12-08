Scripts
=======
Here you can find a collection of scripts that aim to make the management of
coding challenge easier for you.

Setup
-----
`$ bundle install`

Set inside your environment variables `GH_U` containing your GitHub's username and
`GH_P` containing your GitHub's password. If you want you can use OAUTH tokens as well.

Gitbot
------
Sample usage: `ruby gitbot.rb "Andrey Rapshtinskiy" "andrey-bh" be`

It creates a new private repository (i.e. `AndreyRapshtinskiy_be_001`) inside this organization
and invites the challenger (`andrey-bh`) there, setting him as collaborator with r/w permissions.
Then, it opens the repository inside your browser.

Gitlist
-------
Sample usage: `ruby gitlist.rb`

It prints a table on your `$STDOUT` with all the repositories contained in this organization
with a column that informs you if the challenge has been *probably* completed.
