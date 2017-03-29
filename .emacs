;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'package)
; (setq-local imenu-create-inex-function #'ggtags-build-imenu-index)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(require 'linum)
(defun linum-update-window-scale-fix (win)
  "fix linum for scaled text"
  (set-window-margins win
          (ceiling (* (if (boundp 'text-scale-mode-step)
                  (expt text-scale-mode-step
                    text-scale-mode-amount) 1)
              (if (car (window-margins))
                  (car (window-margins)) 1)
              ))))
(advice-add #'linum-update-window :after #'linum-update-window-scale-fix)

;(sb-ext:set-sbcl-source-location "C:/Program Files/Steel Bank Common Lisp/1.3.3/src")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (slime))))

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq default-directory "~/")
(setq url-proxy-services '(("no_proxy" . "proxy.houston.hpecorp.net:8080")
                           ("http" . "proxy.houston.hpecorp.net:8080")
                           ("https" . "proxy.houston.hpecorp.net:8080")))

(load (expand-file-name "~//quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")

(add-hook 'slime-mode-hook
          (show-paren-mode t))
(add-hook 'slime-mode-hook
          '(lambda ()
             (set-variable lisp-indent-function 'common-lisp-indent-function)
             (define-key slime-mode-map [tab] 'slime-indent-and-complete-symbol)
             (define-key slime-mode-map (kbd "C-<tab>") 'slime-complete-symbol)))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'zenburn t)

(set-face-attribute 'default nil
                    :family "Consolas" :height 100)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(global-linum-mode t)

(global-set-key [C-wheel-up] 'text-scale-increase)
(global-set-key [C-wheel-down] 'text-scale-decrease)

(setq TeX-PDF-mode t)

;fix for a weird lua-mode error where i can't put in closing braces
(defadvice lua-electric-match (around last-command-char-fixup activate)
  (let ((last-command-char last-command-event))
    ad-do-it))

(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(global-hl-line-mode 1)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


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

(global-visual-line-mode t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
