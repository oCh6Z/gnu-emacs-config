;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python configurations ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package python
  :ensure nill
  :mode
  ("\\.py$" . python-mode)
  :config
  (setq python-shell-interpreter "python"
		python-indent-offset 4
		python-indent-guess-indent-offset t
		python-indent-guess-indent-offset-verbose nil
		;; iPython interpreter
		; python-shell-interpreter "ipython"
		; python-shell-interpreter-args "--simple-prompt -i"
		))

(use-package elpy
  :ensure t
  :defer t
  :after python
  :init
  (add-hook 'python-mode-hook 'elpy-mode))

;; add the symbol name to the features list
(provide 'python-config)
