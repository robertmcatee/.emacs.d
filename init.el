;; load emacs 24+ package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
    (package-initialize)
    (add-to-list 'package-archives 
                 '("melpa-stable" . "https://stable.melpa.org/packages/") t))

;; Bootstrap use-package, from example provided by Richard Thames
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)
(require 'bind-key)

;; Misc Packages
(use-package undo-tree 
  :bind
    ("C-x u" . undo-tree-visualize)
  :config
    (global-undo-tree-mode))
(use-package magit
  :bind
    ("C-x g" . magit-status))
(use-package ox-haunt)

;; Eliminate Tabs
(setq-default indent-tabs-mode nil)

;; Look and Feel
(windmove-default-keybindings 'meta)
(tool-bar-mode -1)
(tab-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode +1)
(show-paren-mode 1)
(setq show-paren-delay 0)
(global-set-key [f11] 'toggle-menu-bar-mode-from-frame)
(global-display-line-numbers-mode)
(setq inhibit-startup-message '(t))
(custom-set-faces
 '(default ((t (:family "Consolas"
      :foundry "outline"
      :slant normal
      :weight normal
      :height 110
      :width normal)))))
(use-package solarized-theme)
(setq solarized-use-variable-pitch nil)
(setq solarized-height-minus-1 1.0)
(setq solarized-height-plus-1 1.0)
(setq solarized-height-plus-2 1.0)
(setq solarized-height-plus-3 1.0)
(setq solarized-height-plus-4 1.0)
(load-theme 'solarized-dark t)

;; org-mode
(setq initial-major-mode 'org-mode)
(setq org-startup-indented '(t))
(setq default-directory "~/")
(setq initial-scratch-message "
#+title:  Example Org File
#+author: TEC
#+date:   2020-10-27

* Learn Org

Org makes easy things trivial and complex things practical.

You don't need to learn Org before using Org: read the quickstart
page and you should be good to go.  If you need more, Org will be
here for you as well: dive into the manual and join the community!

* Tasks
** Today [0/1]
*** TODO New Task
** Tomorrow [0/0]
** Soon [0/0]
** Later [0/0]

* Code
#+begin_src python
from pathlib import Path
cssRatios = []
return cssRatios
#+end_src

#+RESULTS:
| index.css    | 76% minified ( 1.4 KiB) |
| org-demo.css | 77% minified ( 2.8 KiB) |
| errors.css   | 74% minified ( 4.9 KiB) |
| org.css      | 75% minified (10.7 KiB) |

")

;; Backup Files
;; Move backup files to central location
(setq backup-directory-alist `(("." . "~/.emacs-saves")))
(setq backup-by-copying t)

;; Geiser
(use-package geiser)
(use-package geiser-guile)
(use-package ac-geiser)
(ac-config-default)
(require 'ac-geiser)
(add-hook 'geiser-mode-hook 'ac-geiser-setup)
(add-hook 'geiser-repl-mode-hook 'ac-geiser-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes' geiser-repl-mode))

;; Babel
(org-babel-do-load-languages 'org-babel-load-languages '((scheme .t)(python .t)))

;; go-mode for golang support
(use-package go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c i") 'go-goto-imports)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd \"M-.\") 'godef-jump)))

;; lsp-mode for language server protocol support
(use-package lsp-mode
:commands (lsp lsp-deferred)
:init
(setq lsp-keymap-prefix "C-c l")
:config
(lsp-enable-which-key-integration t)
:hook
((go-mode) . lsp))

;; lsp-ui
(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable t))
  
;; To set the garbage collection threshold to high (100 MB) since LSP client-server communication generates a lot of output/garbage
(setq gc-cons-threshold 100000000)
;; To increase the amount of data Emacs reads from a process
(setq read-process-output-max (* 1024 1024)) 

;; dap-mode for debugging support
(use-package dap-mode)

;; activate company mode for completion
(use-package company)
(add-hook 'after-init-hook 'global-company-mode)
; completion suggestion order depends on most often used completion
(add-hook 'after-init-hook 'company-statistics-mode)
(setq company-idle-delay 0)
