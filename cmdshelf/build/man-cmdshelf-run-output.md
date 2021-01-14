CMDSHELF-RUN(1)                 Cmdshelf Manual                CMDSHELF-RUN(1)\
\
\
\
**NAME**\
       cmdshelf-run - Execute command\
\
**SYNOPSIS**\
       **cmdshelf** **run** \[\<remoteName\>:\]\<command\> \[\<args\>\]\
\
**DESCRIPTION**\
       The run subcommand receives command-alias and whitespace separated list\
       of parameters.\
\
**AVOIDING** **NAMESPACE** **CONFLICT**\
       The **run** subcommand picks up first command matches the \<command\>. If you\
       have same command names from different remotes, add \<**remoteName**\>:  pre-\
       fix to to be explicit.\
                  e.g. cmdshelf run myRemote:echo-sd hello\
\
\
\
cmdshelf 1.0.2                   February 2018                 CMDSHELF-RUN(1)\
