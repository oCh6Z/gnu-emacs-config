;; tool bar, scroll bar
(if window-system
	(tool-bar-mode 0)
  (scroll-all-mode t))

;;;;;;;;;;;;;
;; Editing ;;
;;;;;;;;;;;;;

(use-package indent
			 :config
			 ;; control tabs or space are used for indentation
			 (setq-default indent-tabs-mode t)
			 ;; list of tab stop positions
			 (setq tab-stop-list (number-sequence 4 200 4)))

;; add the symbol name to the features list
(provide 'general-config)
