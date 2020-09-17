;;; bindings.el -*- lexical-binding: t; -*-

(map! :map markdown-mode-map "M-p" nil)
;; (map! :mode typescript-mode "C-SPC" nil)

;; (map! :i :map typescript-mode-map
;;       "<C-right>" 'company-tide
;;       "M-RET" 'company-tide)
;; (map! :n :map typescript-mode-map
;;       "M-RET" 'tide-documentation-at-point)
;; (after! typescript-mode
;;   (map! :leader
;;         :prefix "T"
;;         :desc "ERRS: Show for project"   "e" #'tide-project-errors
;;         :desc "DOCS: Symbol at point" "d" #'tide-documentation-at-point
;;         :desc "DOCS: Symbol at point" "t" #'tide-doc-text)
;;   )

;; (map! :map lsp-mode-map
;;       "s-l" nil
;;       "M-SPC d" 'lsp-find-definition
;;       "M-SPC i" 'lsp-describe-thing-at-point
;;       "M-SPC R" 'lsp-rename
;;       "M-SPC F" 'lsp-format-buffer
;;       "M-SPC ?" 'lsp-describe-session
;;       "M-SPC")

(after! lsp-mode
  (map! :leader

        :prefix ("l" . "💊 take a hit of LSP")
        :desc "🧪 LSP"                   "l" #'lsp
        :desc "find def"                 "f" #'lsp-find-definition
        :desc "find implementation"      "i" #'lsp-find-implementation
        :desc "describe thing"           "d" #'lsp-describe-thing-at-point
        :desc "rename"                   "R" #'lsp-rename
        :desc "format buffer"            "B" #'lsp-format-buffer
        :desc "toggle symbol hilite"     "h" #'lsp-toggle-symbol-highlight

        :prefix ("lD" . "🧠 lsp-meta")
        :desc "🧠::doctor"                    "D" #'lsp-doctor
        :desc "🧠::describe-session"          "d" #'lsp-describe-session
        :desc "🧠::diagnose"                  "g" #'lsp-diagnose
        :desc "🧠::diagnostics-enable"        "G" #'lsp-diagnostics--enable
        :desc "🧠::calculate-root"            "r" #'lsp--calculate-root
        :desc "🧠::set-config"                "c" #'lsp--set-configuration
        :desc "🧠::current-line-diagnostics"  "l" #'lsp-cur-line-diagnostics

        :prefix("lz" . "🎒 save for later?")
        :desc "🎒::lens-mode"                    "L" #'lsp-lens-mode
        :desc "🎒::goto-implementation"          "i" #'lsp-goto-implementation
        :desc "🎒::goto-type-def"                "t" #'lsp-goto-type-definition
        :desc "🎒::render-on-hover"              "h" #'lsp--render-on-hover-content
        :desc "🎒::enable-which-key-integration" "w" #'lsp-enable-which-key-integration

        :prefix("le" . "🐛 eslint")
        :desc "🐛::fix-all"                "e" #'lsp-eslint-fix-all
        :desc "🐛::open-doc"               "d" #'lsp-eslint--open-doc
        :desc "🐛::apply-all-fixes"        "E" #'lsp-eslint-apply-all-fixes
        :desc "🐛::create-default-config"  "C" #'lsp-eslint-create-default-configuration
        :desc "🐛::configuration"          "c" #'lsp-eslint--configuration

        :prefix("lF" . "🔎 find-*")
        :desc "🔎::references"      "r" #'lsp-find-references
        :desc "🔎::definition"      "d" #'lsp-find-definition
        :desc "🔎::implementation"  "i" #'lsp-find-implementation
        :desc "🔎::locations"       "l" #'lsp-find-locations
        :desc "🔎::type-def"        "t" #'lsp-find-type-definition
        :desc "🔎::workspace"       "w" #'lsp-find-workspace
        :desc "🔎::declaration"     "D" #'lsp-find-declaration
        :desc "🔎::ws-roots"        "R" #'lsp-find-roots-for-workspace
        :desc "🔎::session-folder"  "F" #'lsp-find-session-folder

        :prefix("lY" . "🛫 flycheck")
        :desc "🛫::diagn-fcheck-enable"    "e" #'lsp-diagnostics-flycheck-enable
        :desc "️🛫::diagn-fcheck-start"     "s" #'lsp-diagnostics--flycheck-start
        :desc "🛫::diagn-fcheck-buffer"    "Y" #'lsp-diagnostics--flycheck-buffer

        :prefix("lS" . "⏱ sessions")
        :desc "⏱::load-default-sesh"     "d" #'lsp--load-default-session
        :desc "⏱::persist-sesh"          "p" #'lsp--persist-session

        :prefix("lw" . "🗒 workspaces")
        :desc "🗒::metadata"           "i" #'lsp--workspace-metadata
        :desc "🗒::suggest-proj-root"  "r" #'lsp--suggest-project-root

        :prefix("lC" . "💅 completion")
        :desc "💅::clear-cache"          "L" #'lsp-completion--clear-cache
        :desc "💅::at-point"             "C" #'lsp-completion-at-point
        :desc "💅::toggle-mode"          "T" #'lsp-completion-mode

        :prefix("l?" . "🔮 probably shit")
        :desc "🔮::clients-extract-signature-on-hover"  "a" #'lsp-clients-extract-signature-on-hover
        :desc "🔮::select-action"                       "b" #'lsp--select-action
        :desc "🔮::to-yasnippet-snippet"                "c" #'lsp--to-yasnippet-snippet
        :desc "🔮::canonical-file-name"                 "d" #'lsp-canonical-file-name
        :desc "🔮::code-actions-at-point"               "e" #'lsp-code-actions-at-point
        :desc "🔮::defun"                               "f" #'lsp-defun
        :desc "🔮::json-pretty-print"                   "g" #'lsp--json-pretty-print
        :desc "🔮::buffer-uri"                          "h" #'lsp--buffer-uri
        :desc "🔮::glob-to-regexp"                      "i" #'lsp--glob-to-regexp
        :desc "🔮::action-trigger-suggest"              "j" #'lsp--action-trigger-suggest
        :desc "🔮::execute-command"                     "k" #'lsp-execute-command
        :desc "🔮::read-from-file"                      "l" #'lsp--read-from-file
        :desc "🔮::copy"                                "m" #'lsp-copy


        :prefix("lt" . "🌳 lsp-treemacs")
        :desc "🌳::type-hierarchy"             "h" #'lsp-treemacs-type-hierarchy
        :desc "🌳::errors-list"                "e" #'lsp-treemacs-errors-list
        :desc "🌳::errors-list-mode"           "E" #'lsp-treemacs-errors-list-mode
        :desc "🌳::open-error"                 "o" #'lsp-treemacs-open-error
        :desc "🌳::goto-symbol"                "s" #'lsp-treemacs-goto-symbol
        :desc "🌳::initialize"                 "I" #'lsp-treemacs-initialize
        :desc "🌳::references"                 "r" #'lsp-treemacs-references
        :desc "🌳::sync-mode"                  "S" #'lsp-treemacs-sync-mode
        :desc "🌳::generic-mode"               "G" #'lsp-treemacs-generic-mode
        :desc "🌳::sort-by-kind"               "k" #'lsp-treemacs-sort-by-kind
        :desc "🌳::sort-by-name"               "n" #'lsp-treemacs-sort-by-name
        :desc "🌳::sort-by-position"           "p" #'lsp-treemacs-sort-by-position
        :desc "🌳::open-file"                  "f" #'lsp-treemacs-open-file
        :desc "🌳::quick-fix"                  "q" #'lsp-treemacs-quick-fix
        :desc "🌳::implementations"            "i" #'lsp-treemacs-implementations
        ))


(map!
      :g "s-l" nil
      :g "s-L" nil
      :g "s-," nil
      :g "M-p" nil
      :g "s-h" 'evil-window-left
      :g "s-l" 'evil-window-right
      :g "s-j" 'evil-window-down
      :g "s-k" 'evil-window-up
      :g "s-H" 'evil-window-move-far-left
      :g "s-L" 'evil-window-move-far-right
      :g "s-J" 'evil-window-move-very-bottom
      :g "s-K" 'evil-window-move-very-top
      :g "s-d" 'evil-window-split
      :g "s-D" 'evil-window-vsplit

      :g "s-." 'evil-window-increase-width
      :g "s-<" 'evil-window-decrease-height
      :g "s->" 'evil-window-increase-height

      ;; :g "s-r" 'evil-window-vsplit
      ;; :g "s-r" 'rjsx-mode
      :g "s-f" 'treemacs
      :g "s-p" 'evil-switch-to-windows-last-buffer
      :g "s-W" '+workspace/close-window-or-workspace
      :g "s-w" 'doom/kill-this-buffer-in-all-windows
      ;; TAB BINDINGS
      :g "M-o" 'centaur-tabs-backward
      :g "M-p" 'centaur-tabs-forward
      :g "s-{" 'centaur-tabs-backward
      :g "s-}" 'centaur-tabs-forward
      :g "<s-escape>" 'centaur-tabs-backward-group)


      ;;:g "s-r" 'org-roam-mode
      ;;:g "s-R" 'org-roam-find-file
      ;;;; :g "s-r g" 'org-roam-graph-show

      ;;(map! :nv :map org-mode-map
      ;;"C-s-r" 'org-roam-insert)

;;(add-hook 'after-init-hook 'org-roam-mode)

;; DONE: <SPC+*> (assuming <SPC> is your leader key)
;;       Stops doom from calling `+default/search-project-for-symbol-at-point`;
;;       use `'helm-projectile-ag instead`
;;(map! :n :map doom-leader-map :leader "*" 'helm-projectile-ag)

;; (map! :nv "/" 'swiper)
(map! :nv :map org-mode-map :leader "t v" 'variable-pitch-mode) ;; broken?

;; (map! :i :map typescript-mode-map
;;       "<C-right>" 'company-tide
;;       "M-RET" 'company-tide)
;; (map! :n :map typescript-mode-map
;;       "M-RET" 'tide-documentation-at-point)
;; (after! typescript-mode
;;   (map! :leader
;;         :prefix "T"
;;         :desc "ERRS: Show for project"   "e" #'tide-project-errors
;;         :desc "DOCS: Symbol at point" "d" #'tide-documentation-at-point
;;         :desc "DOCS: Symbol at point" "t" #'tide-doc-text)
;;   )



;;(after! org-roam
;;  (map! :leader
;;        :prefix "r"
;;        :desc "org-roam"                   "r"  #'org-roam
;;        :desc "org-roam-date"              "d"  #'org-roam-date
;;        :desc "org-roam-insert"            "i"  #'org-roam-insert
;;        :desc "org-roam-capture"           "c"  #'org-roam-capture
;;        :desc "org-roam-find-file"         "f"  #'org-roam-find-file
;;        :desc "org-roam-show-graph"        "g"  #'org-roam-show-graph
;;        :desc "org-roam-jump-to-index"     "j"  #'org-roam-jump-to-index
;;        :desc "org-roam-switch-to-buffer"  "b"  #'org-roam-switch-to-buffer))

;; WHAT SHOULD TAB DO?
;; borrowed from https://github.com/hlissner/doom-emacs-private/blob/master/config.el
(map! :n [tab] (general-predicate-dispatch nil
                 (and (featurep! :editor fold)
                      (save-excursion (end-of-line) (invisible-p (point))))
                 #'+fold/toggle
                 (fboundp 'evil-jump-item)
                 #'evil-jump-item)
      :v [tab] (general-predicate-dispatch nil
                 (and (bound-and-true-p yas-minor-mode)
                      (or (eq evil-visual-selection 'line)
                          (not (memq (char-after) (list ?\( ?\[ ?\{ ?\} ?\] ?\))))))
                 #'yas-insert-snippet
                 (fboundp 'evil-jump-item)
                 #'evil-jump-item))




;;; ORG-MODE MAP:

;; TODO: org-next-visible-heading
;; Current State:
;;evil-motion-state-map (
;;evil-backward-sentence-begin
;;
;;evil-motion-state-map )
;;evil-org-forward-sentence
;;
;; Desired State:
;;map (
;;org-previous-visible-heading
;;map )
;;org-next-visible-heading


;; (after! org
;;   (map! :localleader :map org-mode-map
        ;; :desc "Eval Block" "e" 'ober-eval-block-in-repl
        ;; (:prefix "SPC" :desc "Tags" "t" 'org-set-tags
         ;; :desc "Roam Bibtex" "b" 'orb-note-actions
         ;; (:prefix ("p" . "Properties")
         ;;  :desc "Set" "s" 'org-set-property
         ;;  :desc "Delete" "d" 'org-delete-property
         ;;  :desc "Actions" "a" 'org-property-action)
         ;; (:prefix ("i" . "Insert")
         ;; :desc "Link/Image" "l" 'org-insert-link
         ;; :desc "Item" "o" 'org-toggle-item
         ;; :desc "Citation" "c" 'org-ref-helm-insert-cite-link
         ;; :desc "Footnote" "f" 'org-footnote-action
         ;; ;; :desc "Screenshot" "s" 'org-download-screenshot
         ;; :desc "Table" "t" 'org-table-create-or-convert-from-region
         ;; (:prefix ("h" . "Headings")
         ;;  :desc "Normal" "h" 'org-insert-heading
         ;;  :desc "Todo" "t" 'org-insert-todo-heading
         ;;  (:prefix ("s" . "Subheadings")
         ;;   :desc "Normal" "s" 'org-insert-subheading
         ;;   :desc "Todo" "t" 'org-insert-todo-subheading))
         ;; (:prefix ("e" . "Exports")
         ;;  :desc "Dispatch" "d" 'org-export-dispatch))))
