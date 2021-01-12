;; Look and Feel
(load-theme 'tsdh-dark)
(set-frame-parameter (selected-frame) 'alpha '(95 75))
(add-to-list 'default-frame-alist '(alpha 95 75))

;; Fonts
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 140 :width normal)))))
 ;; Windows

;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
    (add-to-list
      'package-archives
      ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
      ;;'("melpa" . "http://melpa.milkbox.net/packages/") t
      '("melpa" . "https://melpa.org/packages/") t
    )
)

;; Markdown Mode
(unless (package-installed-p 'markdown-mode)
  (package-refresh-contents)
  (package-install 'markdown-mode))
(require 'markdown-mode)

;; Export to Markdown
(unless (package-installed-p 'ox-mdx-deck)
  (package-refresh-contents)
  (package-install 'ox-md))
(require 'ox-md)

;; Tabbar
(unless (package-installed-p 'tabbar)
  (package-refresh-contents)
  (package-install 'tabbar))
(require 'tabbar)

;; Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (python .t)
   )
 )

;; Variables Bucket
(setq
 ;; default-directory "/home/robert" ;; Linux
 default-directory "C:/Users/robertmcatee/source" ;; Windows
 inhibit-startup-message '(t)
 initial-scratch-message "Listo"
 initial-major-mode 'org-mode
 org-startup-indented '(t)
 package-selected-packages 'markdown-mode)
(global-set-key [f11] 'toggle-menu-bar-mode-from-frame)
(global-display-line-numbers-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(tabbar ox-mdx-deck ox-jekyll-md markdown-mode))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tabbar-mode 1)
 '(tabbar-buffer-groups-function (lambda () (list "All"))))

(set-background-color "#16161D")
