;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     php
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them. 
     ;; ----------------------------------------------------------------
     helm
     html
     graphviz
     c-c++
     emacs-lisp
     markdown
     deft
     syntax-checking
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-private-snippets-directory nil)
     semantic
     better-defaults
     emoji
     erlang
     elixir
     ruby
     python
     git
     evil-commentary
     github
     games
     dash
     osx
     html
     javascript
     org
     ansible
     html
     yaml
     colors
     shell
     shell-scripts
     themes-megapack
     gnus
     (erc :variables
          erc-autojoin-channels-alist
          '((".*\\.freenode.net" "#emacs" "#elixir-lang" "#linux")
            (".*\\.gitter.im" "#syl20bnr/spacemacs"))
          erc-track-exclude-types
          '(("JOIN" "NICK" "PART" "QUIT" "MODE"
             "324" "329" "332" "333" "353" "477"))
          erc-hide-list
          '(("JOIN" "PART" "QUIT" "NICK"))
          erc-scrolltobotton-mode t
          erc-spelling-mode t
          erc-server-list
          '(("irc.freenode.net"
             :port "6697"
             :ssl t
             :nick "dmin7b5")
            ("irc.gitter.im"
             :port "6697"
             :ssl t
             :nick "dmin7b5")))
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(
                                      org-gcal
                                      org-journal
                                      company-emoji
                                      sos
                                      impatient-mode
                                      helm-org-rifle
                                      hackernews
                                      yatemplate
                                      (magithub :location (recipe :fetcher github :repo "vermiculus/magithub" :branch "develop"))
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         jazz
                         solarized-dark
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy. Original font 'Source Code Pro' size 13
   dotspacemacs-default-font '("Source Code Pro"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key "SPC"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
)

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
   (global-company-mode t)
   (global-set-key [f8] 'neotree-toggle)
   (setq markdown-open-command "/usr/local/bin/mark")
   (set-face-attribute 'default nil :height 180)
   (setq emoji-cheat-sheet-plus-display-mode t)
   (setq epa-file-cache-passphrase-for-symmetric-encryption t)

   ;; Set the shell type
   ;;(setq explicit-shell-file-name "/bin/zsh")

   ;; Set Org Mode Super/Subscript to off
   (setq org-use-sub-superscripts nil)

   ;; Magithub
   (require 'magithub)
   (magithub-feature-autoinject t)

   ;; YASnippet Dir
   (setq yas-snippet-dirs
         '("~/.spacemacs.d/snippets"))

   (setq auto-completion-private-snippets-directory
         '("~/.spacemacs.d/snippets"))

   ;; Org mode
   (setq org-directory "~/CloudStation/Files/Jeff/Org")
   (setq org-export-coding-system 'utf-8)
   (setq org-pretty-entities t)
   (setq org-log-into-drawer t)

   ;; Org calendar
   (require 'org-gcal)
   (setq org-gcal-client-id "446726852703-00edme23in17epr5gp8dpofkpetuq284.apps.googleusercontent.com"
         org-gcal-client-secret "e2ck3B8tG3mh7owfmZFkZote"
         org-gcal-file-alist '(("dmin7b5@gmail.com" .  "~/CloudStation/Files/Jeff/Org/gcal.org")))
   ;; org-gcal hooks
   (add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))

   ;; Org agenda
   (setq org-agenda-files (list "~/CloudStation/Files/Jeff/Org/work.org"
                                "~/CloudStation/Files/Jeff/Org/index.org"
                                "~/CloudStation/Files/Jeff/Org/gcal.org"
                                "~/CloudStation/Files/Jeff/Org/mylife.org"
                                "~/CloudStation/Files/Jeff/Org/home.org"))

   ;; mobileorg settings
   (setq org-mobile-inbox-for-pull "~/CloudStation/Files/Jeff/Org/index.org")
   (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
   (setq org-mobile-files '("~/CloudStation/Files/Jeff/Org"))
   (setq org-mobile-use-encryption t)
   (setq org-mobile-encryption-password "W2z970140")

   (defvar my-org-mobile-sync-timer nil)

   (defvar my-org-mobile-sync-secs (* 60 20))

   (defun my-org-mobile-sync-pull-and-push ()
     (org-mobile-pull)
     (org-mobile-push)
     (when (fboundp 'sauron-add-event)
       (sauron-add-event 'my 3 "Called org-mobile-pull and org-mobile-push")))

   (defun my-org-mobile-sync-start ()
     "Start automated `org-mobile-push'"
     (interactive)
     (setq my-org-mobile-sync-timer
           (run-with-idle-timer my-org-mobile-sync-secs t
                                'my-org-mobile-sync-pull-and-push)))

   (defun my-org-mobile-sync-stop ()
     "Stop automated `org-mobile-push'"
     (interactive)
     (cancel-timer my-org-mobile-sync-timer))

   (my-org-mobile-sync-start)

   ;; org-journal
   (setq org-journal-dir "~/CloudStation/Files/Jeff/Org/Journal"
         org-journal-file-format "%Y%m%d.gpg")
   (evil-leader/set-key
     "jj" 'org-journal-new-entry)

)

(defun dotspacemacs/config ()
  (add-hook 'alchemist-mode-hook 'company-mode)
  (add-to-hooks 'linum-mode '(c-mode-hook c++-mode-hook))
)
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(evil-want-Y-yank-to-eol t)
 '(org-agenda-files
   (quote
    ("/Users/wmac/CloudStation/Files/Jeff/Org/agenda.org" "/Users/wmac/CloudStation/Files/Jeff/Org/chess.org" "/Users/wmac/CloudStation/Files/Jeff/Org/home.org" "/Users/wmac/CloudStation/Files/Jeff/Org/inbox.org" "/Users/wmac/CloudStation/Files/Jeff/Org/index.org" "/Users/wmac/CloudStation/Files/Jeff/Org/mylife.org" "/Users/wmac/CloudStation/Files/Jeff/Org/testnote.org" "/Users/wmac/CloudStation/Files/Jeff/Org/todo.org" "/Users/wmac/CloudStation/Files/Jeff/Org/work.org")))
 '(org-capture-templates
   (quote
    (("p" "Private Templates")
     ("pt" "TODO Entry" entry
      (file+headline "~/CloudStation/Files/Jeff/Org/Notes/mylife.org" "Capture")
      (file "~/CloudStation/Files/Jeff/Org/Templates/tpl-todo.txt")
      :empty-lines-before 1))))
 '(package-selected-packages
   (quote
    (solarized-theme phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode powerline org-category-capture undo-tree skewer-mode magithub ghub+ apiwrap ghub mmt org diminish packed with-editor gh markdown-mode log4e hydra f s anaconda-mode company smartparens highlight evil multiple-cursors avy alert projectile magit-popup git-commit async inf-ruby haml-mode dash org-gcal request-deferred deferred flycheck helm helm-core magit js2-mode yasnippet yatemplate zonokai-theme zenburn-theme zen-and-art-theme yapfify yaml-mode xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme typit twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stickyfunc-enhance srefactor spacemacs-theme spaceline spacegray-theme sos soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reverse-theme reveal-in-osx-finder restart-emacs rbenv rake rainbow-mode rainbow-identifiers rainbow-delimiters railscasts-theme quelpa pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pbcopy pastels-on-dark-theme paradox pacmacs osx-trash osx-dictionary orgit organic-green-theme org-projectile org-present org-pomodoro org-plus-contrib org-journal org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme ob-elixir noctilux-theme niflheim-theme neotree naquadah-theme mwim mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minitest minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow magit-gh-pulls macrostep lush-theme lorem-ipsum livid-mode live-py-mode linum-relative link-hint light-soap-theme less-css-mode launchctl json-mode js2-refactor js-doc jinja2-mode jbeans-theme jazz-theme ir-black-theme insert-shebang inkpot-theme info+ indent-guide impatient-mode ido-vertical-mode hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-org-rifle helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme hackernews gruvbox-theme gruber-darker-theme graphviz-dot-mode grandshell-theme gotham-theme google-translate golden-ratio gnuplot github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh-md gandalf-theme flycheck-pos-tip flycheck-mix flx-ido flatui-theme flatland-theme fish-mode firebelly-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-commentary evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help erlang erc-yt erc-view-log erc-terminal-notifier erc-social-graph erc-image erc-hl-nicks emoji-cheat-sheet-plus emmet-mode elisp-slime-nav dumb-jump dracula-theme django-theme disaster deft dash-at-point darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-web company-tern company-statistics company-shell company-emoji company-c-headers company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-identifiers-mode coffee-mode cmake-mode clues-theme clean-aindent-mode clang-format chruby cherry-blossom-theme busybee-theme bundler bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ansible-doc ansible ample-zen-theme ample-theme alect-themes alchemist aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell 2048-game)))
 '(reb-re-syntax (quote read))
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
