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

(use-package virtualenvwrapper
  :ensure t
  :after python
  :config
  (setq venv-location "~/.pyenv/versions/")
  (setq-default mode-line-format (cons '(:exec venv-current-name) mode-line-format)))

(use-package auto-virtualenvwrapper
  :ensure t
  :after
  (:all python virtualenvwrapper)
  :init
  (add-hook 'python-mode-hook #'auto-virtualenvwrapper-activate))

;; add the symbol name to the features list
(provide 'python-config)
