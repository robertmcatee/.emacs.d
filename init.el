;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
    (package-initialize)
    (add-to-list
      'package-archives
      ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
      ;;'("melpa" . "http://melpa.milkbox.net/packages/") t
      '("melpa" . "https://melpa.org/packages/") t
    )
)

;; Solarized Dark Theme
(unless (package-installed-p 'color-theme-sanityinc-solarized)
  (package-refresh-contents)
  (package-install 'color-theme-sanityinc-solarized))
(require 'color-theme-sanityinc-solarized)

;; Markdown Mode
(unless (package-installed-p 'markdown-mode)
  (package-refresh-contents)
  (package-install 'markdown-mode))
(require 'markdown-mode)

;; Export to Markdown
(unless (package-installed-p 'ox-mdx-deck)
  (package-refresh-contents)
  (package-install 'ox-mdx-deck))
(require 'ox-mdx-deck)
(unless (package-installed-p 'ox-jekyll-md)
  (package-refresh-contents)
  (package-install 'ox-jekyll-md))
(require 'ox-jekyll-md)
(unless (package-installed-p 'ox-hugo)
  (package-refresh-contents)
  (package-install 'ox-hugo))
(require 'ox-hugo)

;; Tabbar
(unless (package-installed-p 'tabbar)
  (package-refresh-contents)
  (package-install 'tabbar))
(require 'tabbar)

;; Look and Feel
;; (load-theme 'tsdh-dark)
(load-theme 'sanityinc-solarized-dark t)
(set-frame-parameter (selected-frame) 'alpha '(95 95))
(add-to-list 'default-frame-alist '(alpha 95 95))

;; Fonts
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 140 :width normal)))))
 ;; Windows
 '(default ((t (:family "Liberation Mono" :foundry "outline" :slant normal :weight normal :height 100 :width normal)))))
 ;; Linux

;; Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (python .t)
   )
 )

;; Variables Bucket
(setq
 default-directory "/home/" ;; Linux
 ;; default-directory "C:/Users/robertmcatee/source" ;; Windows
 inhibit-startup-message '(t)
 initial-scratch-message "* TODO [#A] New Theme
** New Epic [0/1]
- [ ] New Task"
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
 '(custom-safe-themes
   '("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default))
 '(package-selected-packages '(tabbar ox-mdx-deck ox-jekyll-md markdown-mode))
 '(scroll-bar-mode nil)
 '(tabbar-buffer-groups-function (lambda nil (list "All")) t)
 '(tabbar-mode 1 nil (tabbar))
 '(tool-bar-mode nil))

;; (set-background-color "#16161D")
;; (global-set-key (kbd "<scroll>") nil)


;; Tab Bar Customizations
(require 'tabbar)
(customize-set-variable 'tabbar-background-color "gray20")
(customize-set-variable 'tabbar-separator '(0.5))
(customize-set-variable 'tabbar-use-images nil)
(tabbar-mode 1)

;; My preferred keys
(define-key global-map [(alt j)] 'tabbar-backward)
(define-key global-map [(alt k)] 'tabbar-forward)

;; Colors
(set-face-attribute 'tabbar-default nil
        :background "gray20" :foreground 
        "gray60" :distant-foreground "gray50"
        :family "Liberation Mono" :box nil)
(set-face-attribute 'tabbar-unselected nil
        :background "gray80" :foreground "black" :box nil)
(set-face-attribute 'tabbar-modified nil
        :foreground "red4" :box nil
        :inherit 'tabbar-unselected)
(set-face-attribute 'tabbar-selected nil
        :background "#4090c0" :foreground "white" :box nil)
(set-face-attribute 'tabbar-selected-modified nil
        :inherit 'tabbar-selected :foreground "GoldenRod2" :box nil)
(set-face-attribute 'tabbar-button nil
        :box nil)
