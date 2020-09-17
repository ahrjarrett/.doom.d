(setq doom-font (font-spec :family "Cascadia Code" :size 18 :weight 'regular))
(setq doom-variable-pitch-font (font-spec :family "GT America" :weight 'bold :size 19))

(setq doom-localleader-key "M-SPC"
      doom-leader-alt-key "C-M-SPC"
      doom-localleader-alt-key "S-M-SPC")

(setq user-full-name "Andrew Jarrett"
      user-mail-address "ahrjarrett@gmail.com")
(setq display-line-numbers-type t)

(setq org-directory "~/dev/org/"
      org-bullets-bullet-list '("⁖"))
(require 'org-tempo)

(setenv "NODE_PATH"
  (concat
    (getenv "HOME") "/org/node_modules"  ":"
    (getenv "NODE_PATH")))

(require 'ob-js)

(add-to-list 'org-babel-load-languages '(js . t))
(org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages)
(add-to-list 'org-babel-tangle-lang-exts '("js" . "js"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((js . t)))

;;(use-package org-roam
;;  :init
;;  (setq org-roam-graph-viewer "/usr/bin/open")
;;  (setq org-roam-graph-executable "dot")
;;  (setq org-roam-link-title-format "℞:%s")
;;  (setq org-roam-index-file "~/roam/index.org")
;;  (setq org-roam-completion-system 'helm)
;;  :hook
;;  (after-init . org-roam-mode)
;;  :custom
;;  (org-roam-directory "~/roam")
;;  :config
;;  (require 'org-roam-protocol))

;;(setq org-roam-capture-templates '(("d" "default" plain #'org-roam-capture--get-point "%?" :file-name "%<%Y%m%d%H%M%S>-${slug}" :head "#+title: ${title}" :unnarrowed t)))

;;(use-package flycheck
;;  :init (global-flycheck-mode)
;;  :config
;;  ;;Fixes issue where Flycheck temp files are picked up by webpack HMR, then crashing when removed, see: [[https://github.com/flycheck/flycheck/issues/1446#issuecomment-381131567][this github issue]]
;;  ;;(setcar (memq 'source-inplace (flycheck-checker-get 'typescript-tslint 'command))
;;  ;;      'source-original)
;;  )

(use-package treemacs
  :config (setq treemacs-is-never-other-window t))

(use-package kaolin-themes)
(use-package doom-themes
  :preface (defvar region-fg nil) ;; prevents weird bug w/ doom themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (doom-themes-org-config) ;; corrects/improves fontification in org-mode
  (doom-themes-visual-bell-config)
  (doom-themes-treemacs-config))


(use-package spacemacs-theme
  :defer t
  :init
  (load-theme 'spacemacs-light t))

(use-package editorconfig
:config
    (editorconfig-mode 1))

(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  (centaur-tabs-headline-match)
  (centaur-tabs-group-by-projectile-project)
  (setq centaur-tabs-set-icons t
        centaur-tabs-style "bar"
        centaur-tabs-set-bar 'right
        x-underline-at-descent-line t
        centaur-tabs-height 32
        centaur-tabs-gray-out-icons 'buffer
        centaur-tabs-set-close-button nil
        centaur-tabs-set-modified-marker t
        centaur-tabs-cycle-scope 'tabs
        ;; centaur-tabs-background-color (face-background 'default)
        centaur-tabs-adjust-buffer-order nil))

(use-package yasnippet
  :config
  (yas-global-mode t)
  :diminish yas-minor-mode)

(use-package company
  :config
  (setq company-idle-delay 0
        company-minimum-prefix-length 2))

(global-company-mode t)

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook ((scala-mode . lsp)
         (typescript-mode . lsp))
  :custom
  (lsp-prefer-flymake nil) ;; use flycheck, not flymake
  (lsp-auto-guess-root t)
  (lsp-eldoc-render-all t))


;; Enable nice rendering of documentation on hover
(use-package lsp-ui
  :after lsp-mode
  :diminish
  :commands lsp-ui-mode
  :custom-face
  ;;(lsp-ui-doc-background ((t (:background nil))))
  ;;(lsp-ui-doc-header ((t (:inherit (font-lock-string-face italic)))))
  :bind (:map lsp-ui-mode-map
         ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
         ([remap xref-find-references] . lsp-ui-peek-find-references)
         ("C-c u" . lsp-ui-imenu))
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-header t)
    (lsp-ui-doc-include-signature t)
  (lsp-ui-doc-position 'top)
  (lsp-ui-doc-border (face-foreground 'default))
  (lsp-ui-sideline-enable nil)
  (lsp-ui-sideline-ignore-duplicate t)
  (lsp-ui-sideline-show-code-actions nil)
  :config
  ;; Use lsp-ui-doc-webkit only in GUI
  (setq lsp-ui-doc-use-webkit t)
    ;; WORKAROUND Hide mode-line of the lsp-ui-imenu buffer
  ;; https://github.com/emacs-lsp/lsp-ui/issues/243
  (defadvice lsp-ui-imenu (after hide-lsp-ui-imenu-mode-line activate)
    (setq mode-line-format nil)))

;; (use-package company-capf
;;   :config (push 'company-capf company-backends))

(use-package scala-mode
  :interpreter ("scala" . scala-mode))
(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map)
   ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
   (setq sbt:program-options '("-Dsbt.supershell=false")))

;; Add metals backend for lsp-mode
(use-package lsp-metals
  :config (
           setq lsp-metals-treeview-show-when-views-received t
                lsp-log-io t))


;; Use the Debug Adapter Protocol for running tests and debugging
(use-package posframe
  ;; Posframe is a pop-up tool that must be manually installed for dap-mode
  )
(use-package dap-mode
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode))

(setq lsp-clients-typescript-log-verbosity "debug"
      ;;lsp-clients-typescript-plugins
      ;;(vector
      ;;(list :name "name"))
      )

(defun org-babel-execute:typescript (body params)
  (org-babel-execute:js
   (with-temp-buffer
     (let* ((ts-file (concat (temporary-file-directory) (make-temp-name "script") ".ts"))
            (js-file (replace-regexp-in-string ".ts$" ".js" ts-file)))
       (insert body)
       (write-region nil nil ts-file)
       (call-process-shell-command (concat "npx tsc " (shell-quote-argument ts-file)))
       (delete-region (point-min) (point-max))
       (insert-file js-file)
       (let ((js-source (buffer-substring (point-min) (point-max))))
         (delete-file ts-file)
         (delete-file js-file)
         js-source)))
   params))

(defalias 'org-babel-execute:ts 'org-babel-execute:typescript)

;;(use-package rjsx-mode
;;  :mode
;;  (("\\.tsx'" . rjsx_mode))
;;  :init
;;  (add-hook 'rjsx-mode-hook 'prettier-js-mode))

(use-package prettier-js
  :init
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'rjsx-mode-hook 'prettier-js-mode)
  :config
  (setq prettier-js-args
        '("--trailing-comma" "none"
          "--bracket-spacing"
          "--tab-width" "2"
          "--semi"
          "--double-quote"
          ;; "--jsx-bracket-same-line" "false"
          ;; "--jsx-single-quote" "true"
          "--arrow-parens" "avoid")))

;;(defun setup-tide-mode ()
;;  (interactive)
;;  (tide-setup)
;;  (flycheck-mode +1)
;;  (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;  (setq-default typescript-indent-level 2)
;;  (eldoc-mode +1)
;;  ;;(tide-hl-identifier-mode +1)
;;  (tide-hl-identifier-mode nil)
;;  (company-mode +1)
;;  ;; (setq prettify-symbols-alist
;;  ;;       (("import" . "⟻")
;;  ;;        ("return" . "⟼")
;;  ;;        ("for" . "∀")
;;  ;;        ("||" . "∨")
;;  ;;        ("&&" . "∧")
;;  ;;        ("!" . "￢")
;;  ;;        ("boolean" . "𝔹")
;;  ;;        ("string" . "𝕊")
;;  ;;        ("number" . "ℤ")
;;  ;;        ("false" . "𝔽")
;;  ;;        ("true" . "𝕋")
;;  ;;        ("null" . "∅")
;;  ;;        ("compose" . "∘")
;;  ;;        ("() =>" . "λ")
;;  ;;        ("function" . "ƒ")
;;  ;;        ("is" . "∈")))
;;
;;  ;; aligns annotation to the right hand side
;;  (setq company-tooltip-align-annotations t))
;;
;;(use-package tide
;;  :after (typescript-mode company flycheck)
;;  :hook ((typescript-mode . setup-tide-mode)
;;         (typescript-mode . tide-hl-identifier-mode)
;;         (typescript-mode . prettier-js-mode)
;;         (before-save . tide-format-before-save)
;;         (before-save . prettier-js-mode-hook)
;;))
;;
;;(after! js2-mode
;;  (defun ~+company-typescript-init-h ()
;;    (set-company-backend! 'tide-mode '(company-files company-tide :with company-yasnippet company-capf)))
;;  (add-hook 'tide-mode-hook '~+company-typescript-init-h))
;;
;;(tide-setup)
;;
;;(use-package web-mode
;;  :hook '((lambda()
;;          (when (string-equal "tsx" (file-name-extension buffer-file-name))
;;                    (setup-tide-mode)))))
;;
;;(add-to-list  'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

;;(add-to-list 'exec-path "/usr/local/bin/lein")
;;(add-to-list 'exec-path "/usr/bin/sqlite3")
(add-to-list 'exec-path "/usr/local/bin/rg")

;;'(helm-completion-style 'emacs)
;;
;;;; make BACKSPACE behave like Ivy in Helm (go up a dir)
;;(after! helm
;;  (add-hook! 'helm-find-files-after-init-hook
;;    (map! :map helm-find-files-map
;;          "<DEL>" #'helm-find-files-up-one-level)))

(setq jiralib-url "https://kazoohr.atlassian.net")

(defconst jiralib-token
   '("Cookie" . "cloud.session.token="))

(defconst org-jira-progress-issue-flow
  '(("To Do" . "In Progress")
    ("In Review" . "Blocked")
    ("Ready for QA" . "In Testing")
    ("Ready for Acceptance" . "Done")))

(load! "bindings" doom-private-dir)
