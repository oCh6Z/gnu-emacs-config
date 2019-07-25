(setq package-enable-at-startup nil
	  gc-cons-threshold 64000000
	  gc-cons-percentage 0.6)

(add-hook 'after-init-hook
		  (lambda ()
			(setq gc-cons-threshold 800000
				  gc-cons-percentage 0.1)
			(garbage-collect)) t)

;; tool bar, scroll bar
(if window-system
	(tool-bar-mode 0)
  (scroll-all-mode t))

(setq-default indent-tabs-mode t
			  indicate-empty-lines t
			  tab-width 4
			  truncate-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

(setq tab-stop-list (number-sequence 4 200 4)
	  backup-by-copying t
	  version-control t
	  delete-old-versions t
	  kept-old-versions 1
	  kept-new-versions 5
	  backup-directory-alist '(("" . "~/.emacs.d/backup"))
	  vc-make-backup-files t
	  auto-save-default nil
	  ring-bell-function #'ignore
	  inhibit-startup-screen t
	  initial-scratch-message nil
	  blink-cursor-mode t
	  line-number-mode t
	  column-number-mode t
	  font-use-system-font nil
	  browse-url-browser-function 'browse-url-generic
	  browse-url-generic-program "chromium")

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

(use-package uniquify
			 :init
			 (setq uniquify-buffer-name-style 'post-forward)
			 (setq uniquify-after-kill-buffer-p t)
			 (setq uniquify-ignore-buffers-re "^\\*")
			 (setq uniquify-min-dir-content 3)
			 (setq uniquify-separator "|"))

(use-package recentf
			 :config
			 (recentf-mode t))

(use-package menu-bar
			 :custom-face
			 (menu ((t (:background "color-235" :foreground "color-246"))))
			 :config
			 (menu-bar-mode t))

(use-package ample-theme
			 :init (progn (load-theme 'ample t t)
						  (enable-theme 'ample))
			 :defer t
			 :ensure t)

;; add the symbol name to the features list
(provide 'general-config)
