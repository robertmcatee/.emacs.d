;; ==========================================
;; 1. PERSONAL IDENTITY
;; ==========================================
(setq user-full-name "Robert MᶜAtee") ;; Change this to your name

;; ==========================================
;; 2. UI & APPEARANCE
;; ==========================================

;; Hide the splash screen (start directly in scratch)
(setq inhibit-startup-screen t)

;; Load the "Deeper Blue" theme for the terminal
(load-theme 'deeper-blue t)

;; ==========================================
;; 3. ORG MODE CONFIGURATION
;; ==========================================

;; Set the scratch buffer to Org Mode
(setq initial-major-mode 'org-mode)

;; Ensure headings are expanded by default
(setq org-startup-folded 'showeverything)

;; ==========================================
;; 4. THE ULTIMATE SCRATCH TEMPLATE
;; ==========================================

(setq initial-scratch-message 
      (format "#+TITLE: Scratch Buffer
#+AUTHOR: %s
#+DATE: %s

* Welcome to Org Mode!
This is your temporary scratchpad. It will disappear when Emacs closes.
To save this as a permanent file, use =C-x C-w=.

** Quick Reference
- *Bold*, /Italics/, _Underline_, =Code=, ~Verbatim~
- Press =TAB= on a heading to fold/unfold it.
- Press =M-RET= (Alt+Enter) to create a new heading or list item.

** Task List
- [ ] Press =C-c C-c= on this box to check it off!
- [ ] Hold =Shift= and use the Left/Right arrows on a bullet to change its style.

** Tables
- Press =TAB= inside the table to auto-align and move to the next cell.
- Type =|-= and press =TAB= to instantly create a horizontal divider line.

| Item    | Qty | Price |
|---------+-----+-------|
| Apples  |   3 | $1.50 |
| Bread   |   1 | $3.00 |
| Coffee  |   2 | $8.00 |

** Notes & Code
#+begin_src emacs-lisp
(message \"Happy organizing!\")
#+end_src\n\n" 
      user-full-name 
      (format-time-string "<%Y-%m-%d %a>")))

;; ==========================================
;; END OF INIT.EL
;; ==========================================
