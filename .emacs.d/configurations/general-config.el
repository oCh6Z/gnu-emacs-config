(setq gc-cons-threshold 64000000
	  gc-cons-percentage 0.6)

(add-hook 'after-init-hook
		  (lambda ()
			(setq gc-cons-threshold 800000
				  gc-cons-percentage 0.1)
			(garbage-collect)) t)

(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

(setq blink-cursor-mode t
	  browse-url-browser-function 'browse-url-generic
	  browse-url-generic-program "chromium")

(defalias 'yes-or-no-p 'y-or-n-p)

(use-package indent
  :defer t
  :init
  (setq-default indent-tabs-mode t)
  (setq tab-stop-list (number-sequence 4 200 4)))

(use-package electricity
  :defer t
  :preface
  (defun electric-pair-start ()
	(electric-pair-mode t))
  :init
  (add-hook 'after-init-hook 'electric-pair-start)
  (add-hook 'electric-pair-mode-hook
			(lambda ()
			  (setq electric-pair-pairs
					'((?\{ . ?\})))))
  (add-hook 'electric-pair-local-mode-hook
			(lambda ()
			  (setq electric-pair-pairs
					'((?\{ . ?\}))))))

(use-package paren-showing
  :defer t
  :preface
  (defun show-paren-start ()
	(show-paren-mode t))
  :init
  (add-hook 'after-init-hook 'show-paren-start))

(use-package editing-basics
  :defer t
  :init
  (setq-default tab-width 4))

(use-package whitespace
  :init
  (setq whitespace-style '(face trailing tabs spaces newline empty space-mark tab-mark newline-mark))
  (global-whitespace-mode t)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  :custom-face
  (whitespace-trailing ((t (:background "light gray" :foreground "dark-violet"))))
  (whitespace-tab ((t (:background "light gray" :foreground "red"))))
  (whitespace-space-after-tab ((t (:background nil :foreground "yellow"))))
  (whitespace-space ((t (:background nil :foreground "red"))))
  (whitespace-newline ((t (:background nil :foreground "red"))))
  (whitespace-empty ((t (:background "light gray" :foreground nil)))))

(use-package time-stamp
  :init
  (setq time-stamp-pattern '("8/Last modified:[ \t]+\\\\?[\"<]+%:y-%02m-%02d %02H:%02M:%02S\\\\?[\">]"))
  (add-hook 'before-save-hook 'time-stamp))

(use-package backup
  :defer t
  :init
  (setq backup-by-copying t
		version-control t
		delete-old-versions t
		kept-old-versions 1
		kept-new-versions 5
		backup-directory-alist '(("" . "~/.emacs.d/backup"))
		vc-make-backup-files t))

(use-package uniquify
  :init
  (setq uniquify-buffer-name-style 'post-forward
		uniquify-after-kill-buffer-p t
		uniquify-ignore-buffers-re "^\\*"
		uniquify-min-dir-content 3
		uniquify-separator "|"))

(use-package auto-save
  :defer t
  :init
  (setq auto-save-default nil))

(use-package recentf
  :config
  (recentf-mode t))

(use-package initialization
  :defer t
  :init
  (setq inhibit-startup-screen t
		initial-scratch-message nil))

(use-package mode-line
  :defer t
  :init
  (setq column-number-mode t))

(use-package display
  :defer t
  :init
  (setq-default truncate-lines t)
  (setq ring-bell-function #'ignore))

(use-package menu-bar
  :custom-face
  (menu ((t (:background "color-235" :foreground "color-246"))))
  :config
  (menu-bar-mode t))

(use-package tool-bar
  :if
  window-system
  :config
  (tool-bar-mode 0))

(use-package faces
  :custom-face
  (tty-menu-disabled-face ((t (:background "color-242" :foreground "lightgray"))))
  (tty-menu-enabled-face ((t (:background "color-246" :foreground "color-235")))))

(use-package ample-theme
  :init
  (progn (load-theme 'ample t t)
		 (enable-theme 'ample))
  :defer t
  :ensure t)

;; add the symbol name to the features list
(provide 'general-config)
