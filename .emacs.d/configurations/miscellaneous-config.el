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

(use-package org
  :defer t
  :mode
  ("\\.org$" . org-mode)
  ("\\.txt$" . org-mode)
  :config
  (setq org-directory "~/.emacs.d/org"
		org-default-notes-file (concat org-directory "/notes.org")
		org-log-done 'time
		org-todo-keywords
		'((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE"))
		org-todo-keyword-faces
		'(("IN-PROGRESS" . (:foreground "steel blue"))
		  ("WAITING" . (:foreground "dark orange")))
		org-tag-alist '(("thesis" . ?t)
						("theory")
						("code" . ?c)
						("python" . ?p)
						("vue" . ?v)
						("work" . ?w)
						("home" . ?h))
		org-confirm-babel-evaluate nil
		org-src-fontify-natively t
		org-src-tab-acts-natively t
		org-startup-truncated nil
		org-return-follows-link t
		org-fontify-done-headline t
		org-fontify-quote-and-verse-blocks t
		org-fontify-whole-heading-line t
		org-footnote-section nil
		org-latex-default-packages-alist '(
										   ("T1" "fontenc" t)
										   ("utf8" "inputenc" t)
										   ;("" "fixltx2e" nil)
										   ;("" "graphicx" t)
										   ;("" "longtable" nil)
										   ;("" "float" nil)
										   ;("" "wrapfig" nil)
										   ;("" "rotating" nil)
										   ;("normalem" "ulem" t)
										   ;("" "amsmath" t)
										   ;("" "textcomp" t)
										   ;("" "marvosym" t)
										   ;("" "wasysym" t)
										   ;("" "amssymb" t)
										   ;("" "hyperref" nil)
										   ;"\\tolerance=1000"
										   )
		org-latex-listings 'minted
		org-latex-minted-options '(("frame" "lines")
								   ("fontsize" "\\scriptsize")
								   ;("linenos" "true")
								   ;("xleftmargin" "0em")
								   )
		org-latex-pdf-process '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
								"pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
								"pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f")))

(use-package org-babel
  :defer t
  :after
  (:all org ob
		auctex latex reftex
		python)
  :config
  (org-babel-do-load-languages
   'org-babel-do-load-languages
   ((emacs-lisp . t)
	(latex . t)
	(org . t)
	(python . t)
	(sh . t))))

(use-package auctex
  :ensure t
  :defer t
  :mode ("\\.tex$" . TeX-latex-mode)
  :init
  (add-hook 'TeX-after-compilation-finished-functions
			#'TeX-revert-document-buffer)
  (add-hook 'LaTeX-mode 'visual-line-mode)
  (add-hook 'latex-mode 'visual-line-mode)
  :config
  (setq-default TeX-auto-save t
				TeX-PDF-mode t
				TeX-show-compilation nil
				TeX-parse-self t))

(use-package latex
  :defer t
  :after auctex
  :config
  (require 'preview))

(use-package reftex
  :defer t
  :init
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex))

(use-package company-auctex
  :ensure t
  :after
  (:all company latex)
  :config
  (company-auctex-init))

(use-package doc-view
  :defer t
  :config
  (setq doc-view-continuous t))

(use-package auto-revert
  :defer t
  :init
  (global-auto-revert-mode t)
  (setq revert-without-query t))

(use-package visual-line
  :defer t
  :init
  (global-visual-line-mode t))

;; add the symbol name to the features list
(provide 'miscellaneous-config)
