CMDSHELF(1)                     Cmdshelf Manual                    CMDSHELF(1)\
\
\
\
**NAME**\
       **cmdshelf** - Manage your scripts like a bookshelf.\
\
**SYNOPSIS**\
       **cmdshelf** \<**sub-command**\> **...**\
\
**OPTIONS**\
       -h, --help\
              Show  help  message.  Type **cmdshelf** **help** **sub-command** to see more\
              detailed manual page for each sub-command.\
\
**SUB-COMMANDS**\
   **cat**\
       Concatenate and print command(s).\
\
   **help**\
       Show help message.\
\
   **list,** **ls**\
       Show all registered commands.\
\
   **remote**\
       Manage remote commands.\
\
   **run**\
       Execute command.\
\
   **update**\
       Update cloned repositories.\
\
**WORKSPACE**\
   **\~/.cmdshelf.yml**\
       Your current configuration is stored here.  **cmdshelf**  reads  this  file\
       everytime it launches, writing on exit. Feel free to modify entries and\
       run cmdshelf update to keep in sync.\
\
   **\~/.cmdshelf/remote**\
       All repositories are cloned under this directory.\
\
\
\
cmdshelf 1.0.2                   January 2018                      CMDSHELF(1)\
