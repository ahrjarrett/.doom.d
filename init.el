;;; init.el -*- lexical-binding: t; -*-

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find a "Module Index" link where you'll find
;;      a comprehensive list of Doom's modules and what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c c k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c c d') on a module to browse its
;;      directory (for easy access to its source code).

(doom! :input

       :completion
       company
       ivy

       :ui
       ligatures
       doom                ; what makes DOOM look the way it does
       hl-todo             ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       modeline            ; snazzy, Atom-inspired modeline, plus API
       nav-flash           ; blink cursor line after big motions
       ophints             ; highlight the region an operation acts on
       (popup +defaults)   ; tame sudden yet inevitable temporary windows
       treemacs            ; a project drawer, like neotree but cooler
       vi-tilde-fringe     ; fringe tildes to mark beyond EOB
       workspaces          ; tab emulation, persistence & separate workspaces

       :editor
       (evil +everywhere)
       ;;(format +onsave)
       snippets
       ;;multiple-cursors
       file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       word-wrap         ; soft wrapping with language-aware indent

       :emacs
       dired             ; making dired pretty [functional]
       electric          ; smarter, keyword-based electric-indent
       undo              ; persistent, smarter undo for your inevitable mistakes
       vc                ; version-control and Emacs, sitting in a tree

       :term
       eshell            ; the elisp shell that works everywhere

       :tools
       (eval +overlay)     ; run code, run (also, repls)
       (lsp +peek)
       editorconfig
       lookup              ; navigate your code and its documentation
       magit

       :os
       (:if IS-MAC macos)  ; improve compatibility with macOS

       :lang
       (javascript +lsp)
       (org +pomodoro) ;;+roam +journal +present
       (scala +lsp)
       elm
       emacs-lisp
       json
       markdown
       rest
       sh
       web

       :app
       calendar
       irc

       :config
       (default +bindings +smartparens)
       literate)
