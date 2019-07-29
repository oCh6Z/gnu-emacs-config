;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Miscellaneous configurations ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

(use-package company-quickhelp
  :ensure t
  :after company
  :init
  (with-eval-after-load 'company
	(company-quickhelp-mode)))

(use-package slime
  :ensure t
  :init
  (setq inferior-lisp-program "sbcl"
		slime-contribs '(slime-fancy)))

(use-package slime-company
  :ensure t
  :defer t
  :after
  (:all slime company)
  :init
  (slime-setup '(slime-fancy slime-company)))

(use-package hydra
  :ensure t
  :defer t)

;; add the symbol name to the features list
(provide 'miscellaneous-config)
