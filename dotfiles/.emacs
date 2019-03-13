;; Load addons, remove top bar, load theme
(package-initialize)
(menu-bar-mode -1)
(set-frame-parameter nil 'undecorated t)
(load-theme 'monokai t)


;; Add a package repo
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)


;; Show whitespaces and changed tabs look)
(setq whitespace-style '(face empty tabs lines-tail trailing tab-mark))
(global-whitespace-mode t)


;; Add a "lines" column
(global-linum-mode t)
(setq column-number-mode t)
(setq linum-format "%3d \u2502")
;;(setq linum-format "%d ")


;; Highlights matching parenthesis and brackets
(show-paren-mode 1)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'js-mode-hook #'smartparens-mode)


;; Enable autopair
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers
(custom-set-variables
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (tabbar neotree company-irony company-irony-c-headers company autopair monokai-theme))))

;; Epitech Conf
(add-to-list 'load-path "~/.emacs.d/lisp")
(load "site-start.d/epitech-init.el")
(custom-set-faces)

;; Enable folder tree
(add-to-list 'load-path "/some/path/neotree")
(require 'neotree)
(global-set-key [f2] 'neotree-toggle)
