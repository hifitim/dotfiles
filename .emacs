;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'package)
(setq-local imenu-create-index-function #'ggtags-build-imenu-index)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(frame-background-mode (quote dark))
 '(gnus-read-all-available-headers t)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (slime zenburn-theme solarized-theme company sr-speedbar helm-gtags helm ggtags)))
 '(sr-speedbar-right-side nil)
 '(tab-stop-list
   (quote
    (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;(tool-bar-mode 0)
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq default-directory "~/")
;; Setup load-path, autoloads and your lisp system
;; Not needed if you install SLIME via MELPA
;(add-to-list 'load-path "~/slime")
;(require 'slime-autoloads)
;(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")
(add-hook 'slime-mode-hook
          (show-paren-mode t))
(add-hook 'slime-mode-hook
          '(lambda ()
             (set-variable lisp-indent-function 'common-lisp-indent-function)
             (define-key slime-mode-map [tab] 'slime-indent-and-complete-symbol)
             (define-key slime-mode-map (kbd "C-<tab>") 'slime-complete-symbol)))
(add-to-list 'load-path "~/.emacs.d/lisp")
;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized-master")
(load-theme 'zenburn t)
                                        ;(load-theme 'solarized-dark t)
(set-face-attribute 'default nil
                    :family "Consolas" :height 100)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(global-linum-mode t)

(setq gnus-thread-sort-functions
      '(gnus-thread-sort-by-number
        gnus-thread-sort-by-date))

;; Type:
;;     M-x package-install RET jedi RET
;;     M-x jedi:install-server RET
;; Then open Python file.
(global-set-key [C-mouse-5] 'text-scale-increase)
(global-set-key [C-mouse-4] 'text-scale-decrease)

(setq TeX-PDF-mode t)

(global-set-key (kbd "M-i") 'imenu)


(defun indent-buffer()
  "Indents an entire buffer using the default intenting scheme."
  (interactive)
  (point-to-register 'o)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max))
  (jump-to-register 'o))


                                        ;fix for a weird lua-mode error where i can't put in closing braces
(defadvice lua-electric-match (around last-command-char-fixup activate)
  (let ((last-command-char last-command-event))
    ad-do-it))

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

;(require 'helm-gtags)
;; Enable helm-gtags-mode
;(add-hook 'dired-mode-hook 'helm-gtags-mode)
;(add-hook 'eshell-mode-hook 'helm-gtags-mode)
;(add-hook 'c-mode-hook 'helm-gtags-mode)
;(add-hook 'c++-mode-hook 'helm-gtags-mode)
;(add-hook 'asm-mode-hook 'helm-gtags-mode)

;(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
;(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
;(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
;(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
;(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
;(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
;(define-key helm-gtags-mode-map (kbd "C-c g h") 'helm-gtags-find-files)

(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(global-hl-line-mode 1)

;(require 'company)
;(add-hook 'after-init-hook 'global-company-mode)
;(require 'cc-mode)
;(setq company-backends (delete 'company-semantic company-backends))
;(define-key c-mode-map  [C-c (tab)] 'company-complete)
;(define-key c++-mode-map  [C-c (tab)] 'company-complete)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;(require 'whitespace)
;(global-whitespace-mode)

(setq-default c-basic-offset 4)

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))

(global-set-key (kbd "C-x |") 'toggle-window-split)

;;(defun my-bell-function ()
;;  (unless (memq this-command
;;        '(isearch-abort abort-recursive-edit exit-minibuffer
;;              keyboard-quit mwheel-scroll down up next-line previous-line
;;              backward-char forward-char))
;;    (ding)))
;;(setq ring-bell-function 'my-bell-function)
(setq ring-bell-function 'ignore)

;; Set up emacs server. This allows you to run emacs in the background and
;; connect to it with emacs client. It reduces startup time significantly. If
;; the server is not running, it starts it.

(load "server")

(unless (server-running-p)
  (server-start))

;; Set the enter key to newline-and-indent which inserts a new line and then
;; indents according to the major mode. This is very convenient. 
(global-set-key (kbd "<RET>") 'newline-and-indent)
