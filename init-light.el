;; org-mode
(setq initial-major-mode 'org-mode)
(setq org-startup-indented '(t))
(setq default-directory "/home/robertmcatee/OneDrive/Documents/org")
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
