

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *is-a-mac* (eq system-type 'darwin))

(require 'init-utils)
(require 'init-osx-keys)
(require 'init-site-lisp)

(require 'init-smex)
(require 'init-evil)
