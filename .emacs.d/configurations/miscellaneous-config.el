;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Miscellaneous configurations ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; completion framework "complete anything" for emacs
(use-package company
  :ensure t
  :defer t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-tooltip-align-annotations t
		company-idle-delay 0.2
		company-minimum-prefix-length 2
		company-require-match nil
		company-dabbrev-ignore-case nil
		company-dabbrev-code-ignore-case nil
		company-dabbrev-downcase nil))

;; documentation popup for company
(use-package company-quickhelp
  :ensure t
  :after company
  :init
  (with-eval-after-load 'company
	(company-quickhelp-mode)))

;; superior lisp interaction mode for emacs
(use-package slime
  :ensure t
  :init
  (setq inferior-lisp-program "sbcl"
		slime-contribs '(slime-fancy)))

;; company-mode completion backend for slime
(use-package slime-company
  :ensure t
  :defer t
  :after
  (:all slime company)
  :init
  (slime-setup '(slime-fancy slime-company)))

;; make bindings
(use-package hydra
  :ensure t
  :defer t)

;; template system
(use-package yasnippet
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  :config
  (setq yas-snippet-dirs
		(cl-union yas-snippet-dirs
				  '("~/.emacs.d/snippets")))
  (yas-reload-all)
  (yas-global-mode t))

;; collection of yasnippet snippets for many languages
(use-package yasnippet-snippets
  :ensure t
  :defer t
  :after yasnippet)

;; classic yasnippet snippets
(use-package yasnippet-classic-snippets
  :ensure t
  :defer t
  :after yasnippet)

;; add the symbol name to the features list
(provide 'miscellaneous-config)
