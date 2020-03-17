#!/bin/bash
source lib.sh

echo "Customized environment"

echo "Copying settings.json"
ln -sf ~/.vscode/settings.json /User/settings.json
ln -sf ~/.vscode/keybindings.json /User/keybindings.json

echo "installing git-town"
sudo dpkg -i app/git-town-amd64.deb

# bot "Installing Visual Studio code extensions and config."

# code -v > /dev/null
# if [[ $? -eq 0 ]];then
#     read -r -p "Do you want to install VSC extensions? [y|N] " configresponse
#     if [[ $configresponse =~ ^(y|yes|Y) ]];then
#         ok "Installing extensions please wait..."

#         code install-extension aaron-bond.better-comments
#         code install-extension adpyke.codesnap
#         code install-extension albert.TabOut
#         code install-extension AlbertoVelaz.time-for-humans
#         code install-extension Alexey-Strakh.stackoverflow-search
#         code install-extension alfredbirk.git-add-commit-push
#         code install-extension aws-scripting-guy.cform
#         code install-extension axosoft.gitkraken-glo
#         code install-extension berublan.vscode-log-viewer
#         code install-extension bibhasdn.unique-lines
#         code install-extension bmuskalla.vscode-tldr
#         code install-extension CoenraadS.bracket-pair-colorizer-2
#         code install-extension DavidAnson.vscode-markdownlint
#         code install-extension DougFinke.vscode-PSStackoverflow
#         code install-extension eamodio.gitlens
#         code install-extension earshinov.simple-alignment
#         code install-extension ericadamski.carbon-now-sh
#         code install-extension Everspace.rightclick-git
#         code install-extension evilz.vscode-reveal
#         code install-extension fabiospampinato.vscode-bump
#         code install-extension FerrierBenjamin.fold-unfold-all-icone
#         code install-extension FerrierBenjamin.search-in-git
#         code install-extension frhtylcn.pythonsnippets
#         code install-extension fudd.toggle-zen-mode
#         code install-extension Gaardsholt.vscode-whatthecommit
#         code install-extension geddski.macros
#         code install-extension hbenl.vscode-test-explorer
#         code install-extension HSSE-Development.gitversionview
#         code install-extension JanBn.time-tracker-and-reminder
#         code install-extension joaompinto.asciidoctor-vscode
#         code install-extension jobe451.lorem-whatever
#         code install-extension johnpapa.vscode-cloak
#         code install-extension johnpapa.vscode-peacock
#         code install-extension JordanKnight.gitignoretrackedfles
#         code install-extension jtladeiras.vscode-inline-sql
#         code install-extension kentos.move-selection-to-new-file
#         code install-extension kraml.vscode-everything-search-and-open
#         code install-extension L13RARY.l13-diff
#         code install-extension logerfo.json-trimmer
#         code install-extension mads-hartmann.bash-ide-vscode
#         code install-extension MarkLarah.pre-commit-vscode
#         code install-extension mauve.terraform
#         code install-extension mgesbert.python-path
#         code install-extension mhutchie.git-graph
#         code install-extension ms-azuretools.vscode-docker
#         code install-extension ms-python.python
#         code install-extension nemesv.copy-file-name
#         code install-extension nhoizey.gremlins
#         code install-extension NiclasvanEyk.am-i-behind
#         code install-extension njpwerner.autodocstring
#         # code install-extension npxms.hide-gitignored
#         code install-extension piotrpalarz.vscode-gitignore-generator
#         # code install-extension PKief.material-icon-theme
#         code install-extension premparihar.gotestexplorer
#         code install-extension ptweir.python-string-sql
#         code install-extension pustelto.bracketeer
#         code install-extension redhat.vscode-yaml
#         code install-extension richie5um2.vscode-sort-json
#         code install-extension run-at-scale.terraform-doc-snippets
#         code install-extension ryanolsonx.snippet-creator
#         # code install-extension ryu1kn.extension-update-reporter
#         # code install-extension s3ramsay.vscode-gtm
#         code install-extension SatakeRyota.asciidoc-icon-snippets
#         code install-extension Shan.code-settings-sync
#         code install-extension shyykoserhiy.git-autoconfig
#         code install-extension SlySherZ.comment-box
#         code install-extension spmeesseman.vscode-taskexplorer
#         code install-extension stevejpurves.cucumber
#         # code install-extension stkb.rewrap
#         code install-extension stubailo.ignore-gitignore
#         code install-extension teledemic.branch-warnings
#         code install-extension thamaraiselvam.remove-blank-lines
#         code install-extension tomsaunders.vscode-workspace-explorer
#         code install-extension trentrand.git-rebase-shortcuts
#         code install-extension TroelsDamgaard.reflow-paragraph
#         code install-extension usernamehw.errorlens
#         code install-extension vsls-contrib.gistfs
#         code install-extension Vtrois.gitmoji-vscode
#         # code install-extension WakaTime.vscode-wakatime
#         code install-extension wenfang.faster-new
#         code install-extension wmaurer.change-case
#         # code install-extension xyz.local-history
#         code install-extension yasinkuyu.vscode-units
#         code install-extension Yummygum.city-lights-icon-vsc
#         code install-extension yummygum.city-lights-theme
#         # code install-extension YuTengjing.open-in-external-app
#         code install-extension yzhang.markdown-all-in-one
#         code install-extension znck.grammarly


#         ok "Extensions for VSC have been installed. Please restart your VSC."
#     else
#         ok "Skipping extension install.";
#     fi

#     # read -r -p "Do you want to overwrite user config? [y|N] " configresponse
#     # if [[ $configresponse =~ ^(y|yes|Y) ]];then
#     #     read -r -p "Do you want to back up your current user config? [Y|n] " backupresponse
#     #     if [[ $backupresponse =~ ^(n|no|N) ]];then
#     #         ok "Skipping user config save."
#     #     else
#     #         cp $HOME/Library/Application\ Support/Code/User/settings.json $HOME/Library/Application\ Support/Code/User/settings.backup.json
#     #         ok "Your previous config has been saved to: $HOME/Library/Application Support/Code/User/settings.backup.json"
#     #     fi
#     #     cp ./settings.json $HOME/Library/Application\ Support/Code/User/settings.json

#     #     ok "New user config has been written. Please restart your VSC."
#     # else
#     #     ok "Skipping user config overwriting.";
#     # fi
# else
#     error "It looks like the command 'code' isn't accessible."
#     error "Please make sure you have Visual Studio Code installed"
#     error "And that you executed this procedure: https://code.visualstudio.com/docs/setup/mac"
# fi