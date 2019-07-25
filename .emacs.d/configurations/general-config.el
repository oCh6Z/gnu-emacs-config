;; tool bar, scroll bar
(if window-system
	(tool-bar-mode 0)
  (scroll-all-mode t))

(setq-default indicate-empty-lines t
			  tab-width 4
			  truncate-lines t
			  indent-tabs-mode t)

;; add the symbol name to the features list
(provide 'general-config)
