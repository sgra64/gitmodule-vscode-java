# gitmodule-vscode-java
Gitmodule with useful *.vscode* settings for a Java project.

Check-out this *git module* into sub-directory `libs` with:

```sh
git submodule add -f -- https://github.com/sgra64/gitmodule-vscode-java.git .vscode

ls -la .vscode                 # show content of libs folder holding the git module
```
```
total 30
drwxr-xr-x 1    0 Oct  5 22:53 ./
drwxr-xr-x 1    0 Oct  5 22:53 ../
-rw-r--r-- 1   32 Oct  5 22:53 .git
-rw-r--r-- 1   23 Oct  5 22:53 .gitignore
-rw-r--r-- 1 1296 Oct  5 22:53 launch.json          <-- Java launch configurations
-rw-r--r-- 1  628 Oct  5 22:53 launch-terminal.sh   <-- terminal launch script
-rw-r--r-- 1 6288 Oct  5 22:53 README.md
-rw-r--r-- 1 3467 Oct  5 22:53 settings.json        <-- VSCode settings file
```

In addition, git has created a `.gitmodules` file in the project directory
and added the new gitmodule:

```sh
cat .gitmodules             # show .gitmodules file
```

Output shows the new git module registered with the project:

```
[submodule ".vscode"]
        path = .vscode
        url = https://github.com/sgra64/gitmodule-vscode-java.git
```

```sh
git submodule                       # list git submodules registered with the project
git submodule foreach git status    # show status of each registered submodule
```
```
 9b026748f9a7d3356bbaaf8184a4edddfc288bf9 .vscode (heads/main)

Entering '.vscode'
On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean
```


&nbsp;

## File: *settings.json*

File [*settings.json*](settings.json) in a project *.vscode* directory contains
project-specific setting for the *VSCode* IDE.

General settings for *VSCode* (such as *auto-save* or using *UTF-8* encoding and
*LF* line ending) should be stored in the system-wide (or global)
[*settings.json*](https://github.com/sgra64/dotfiles/blob/main/.vscode_global/settings.json)
file that is stored:

- on Windows in: `%APPDATA%\Code\User\settings.json`, e.g.
    `C:/Users/<user>/AppData/Roaming/Code/User/settings.json` and

- on Mac in: `$HOME/Library/Application\ Support/Code/User/settings.json`.

- on Linux in: `$HOME/.config/Code/User/settings.json`

```sh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# VSCode commands:
#  - build: Ctrl-Shift-B
#  - run:   Ctrl-Alt-N
#  - clean Java Language Server Workspace: Ctrl-Shift-P
# 
# VSCode global settings files:
#  - Windows: %APPDATA%/Code/User/settings.json, e.g.
#             C:/Users/<USER>/AppData/Roaming/Code/User/settings.json
#  - MacOS:   $HOME/Library/Application\ Support/Code/User/settings.json
#  - Linux:   $HOME/.config/Code/User/settings.json
# 
# VSCode project cache:
#  - Windows: %APPDATA%/Code/User/workspaceStorage', e.g.
#             C:/Users/<USER>/AppData/Roaming/Code/User/workspaceStorage
#  - MacOS:   $HOME/Library/Application\ Support/Code/User/workspaceStorage
# 
# VSCode installation paths:
#  - Windows: %APPDATA%/Local/Programs/Microsoft\ VS\ Code/bin
#  - MacOS:   /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
```

See the
[*VSCode Settings documentation*](https://code.visualstudio.com/docs/configure/settings).

Recommended global settings are:

```json
{
    "explorer.confirmDelete": false,        // ask to comfirm file delete
    "files.autoSave": "afterDelay",         // 'afterDelay' (1sec), 'onFocusChange', 'onWindowChange'
    "files.autoSaveDelay": 800,
    "files.eol": "\n",                      // use '\n' as default line ending
    "files.associations": {                 // enable syntax highlighting by file endings
        "*.rc": "shellscript",
        "*.path": "shellscript"
    },

    // Editor settings
    "editor.detectIndentation": false,
    "editor.tabSize": 4,
    "editor.insertSpaces": true,            // insert spaces for tabs
    "editor.renderWhitespace": "all",       // show white spaces in editor as small dot
    "editor.hover.enabled": true,           // show context when hovering
    "editor.hover.delay": 1500,             // delay hover-time for context pop-ups (in ms)
    "editor.minimap.enabled": false,        // show minimap for long files
    "editor.inlayHints.enabled": "off",     // don't show argument names in method calls

    // Terminal settings, see https://code.visualstudio.com/docs/terminal/profiles
    "terminal.integrated.defaultProfile.windows": "Bash",
    "terminal.integrated.profiles.windows": {
        "Bash": {
          "path": ["bash"],
          "args": ["--init-file", "'${workspaceFolder}'/.vscode/launch_terminal.sh"],
        //   "args": ["--init-file", "~/.profile"],
          "icon": "terminal-bash",
        },
        "Git Bash": null,                   // remove other terminals from the menu
        "PowerShell": null,
        "Command Prompt": null,
        "JavaScript Debug Terminal": null,
        "Ubuntu (WSL)": null,
    }
}
```


&nbsp;

## File: *launch.json*

File [*launch.json*](launch.json) stores the *VSCode* launch configurations for the
*"Run and Debug"* pane (Shift+Ctrl+D).
Each entry creates a new launch configuration.

The example shows three Java-launchers: "*Launch_1*", "*Launch_2*" and
*"Launch Chrome"*:

```json
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// VSCode launch configuration for "Run and Debug" pane (Shift+Ctrl+D)
//  - https://code.visualstudio.com/docs/java/java-debugging
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
{
    "version": "1.0.0",
    "configurations": [
        {
            // launch as non-modular project
            "type": "java",
            "name": "Launch_1",
            "request": "launch",
            "mainClass": "application.Application",
            "args": "",
            "console": "integratedTerminal",    // reuse terminal
            "vmArgs": "",
        }, {
            // launch as modular project with passing arg[]
            "type": "java",
            "name": "Launch_2",
            "request": "launch",
            "mainClass": "se1.fun/application.Application",
            "args": "A, BB, CCC",               // alt: ["A", "BB", "CCC"]
            "console": "integratedTerminal",    // reuse terminal
            "vmArgs": "",
        }, {
            // launch Chrome browser with Javadoc
            "name": "Launch Chrome",
            "request": "launch",
            "type": "chrome",
            "url": "${workspaceFolder}/target/docs/index.html",
        },
    ]
}
```


&nbsp;

## File: *launch-terminal.json*

File [*launch-terminal.json*](launch-terminal.json) stores the terminal launch
configuration.
The terminal launch configuration file is executed as `"--init-file"` when
a new terminal is opened in *VSCode* (see the `"Bash"`-terminal configuration
created in [*settings.json*](settings.json)).

The terminal launch configuration typically includes calling *.rc* - files to
create the proper environment for the new terminal *shell* process.

```sh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# initialize new terminal (bash, zsh/Mac), script is called in settings.json
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# 
# probe whether terminal is opened on Mac with zsh and
# source $HOME/.zshrc for zsh (Mac) or $HOME/.bashrc otherwise

type setopt 2>/dev/null | grep builtin >/dev/null
[ $? = 0 ] && \
    source ~/.zshrc ||
    source ~/.bashrc
# 
# source the project when a new terminal is opened in VSCode
for env in "env.sh" ".env/env.sh"; do
    [ -f "$env" ] && builtin source "$env" && break
done
```
