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

(use-package slime
  :ensure t
  :init
  (setq inferior-lisp-program "sbcl"
		slime-contribs '(slime-fancy)))

;; add the symbol name to the features list
(provide 'miscellaneous-config)
