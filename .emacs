(require 'package)
(setq package-archives
	  '(("gnu" . "http://elpa.gnu.org/packages/")
		("elpy" . "https://jorgenschaefer.github.io/packages/")
		("marmalade" . "http://marmalade-repo.org/elpa/")
		("melpa" . "http://melpa.milkbox.net/packages/")
		("melpa-stbl" . "https://stable.melpa.org/packages/")
		("org" . "http://orgmode.org/elpa/"))
	  package-archive-priorities
	  '(("gnu" . 10)
		("melpa-stbl" . 5)
		("melpa" . 3)))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
