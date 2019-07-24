;; tool bar, scroll bar
(if window-system
	(tool-bar-mode 0)
  (scroll-all-mode t))

;; add the symbol name to the features list
(provide 'general-config)
