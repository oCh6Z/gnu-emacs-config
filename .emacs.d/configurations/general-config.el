;; tool bar, scroll bar
(if window-system
	(tool-bar-mode 0)
  (scroll-all-mode t))

(setq-default indicate-empty-lines t
			  tab-width 4
			  truncate-lines t
			  indent-tabs-mode t)

(setq tab-stop-list (number-sequence 4 200 4)
	  time-stamp-pattern '("8/Last modified:[ \t]+\\\\?[\"<]+%:y-%02m-%02d %02H:%02M:%02S\\\\?[\">]")
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

;; add the symbol name to the features list
(provide 'general-config)
