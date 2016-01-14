Scripts
=======
Here you can find a collection of scripts that aim to make the management of
coding challenge easier for you.

Setup
-----
`$ bundle install`

Creata a new personal authentication token [here](https://github.com/settings/tokens).
Aside the default scopes, enable also `write:org` and `delete_repo`.

Then, set inside your environment variables `GH_TOKEN` the token you get at the end.

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

Archiver
--------
Sample usage: `ruby archiver.rb "andrey-bh" be`

It creates a mirror of given repository from GitHub to BitBucket (but does *not* delete anything!).

In order to use this script, you need to export two environment variables called `BB_EMAIL` and `BB_PASS` containing respectively the email address and the password of your BitBucket account.
Also give your SSH public key to [GitHub](https://github.com/settings/ssh).
