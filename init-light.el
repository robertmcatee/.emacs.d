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

;; Eliminate Tabs
(setq-default indent-tabs-mode nil)

;; Look and Feel
(tool-bar-mode -1)
(tab-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
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
(setq initial-scratch-message "* Tasks
** Today [0/1]
*** TODO New Task
** Tomorrow [0/0]
** Soon [0/0]
** Later [0/0]"
)

;; Backup Files
;; Move backup files to central location
(setq backup-directory-alist `(("." . "~/.emacs-saves")))
(setq backup-by-copying t)

;; windmove
(windmove-default-keybindings 'meta)
