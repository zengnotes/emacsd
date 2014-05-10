(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

(defconst *is-a-mac* (eq system-type 'darwin))
(setq *xemacs* (featurep 'xemacs) )
(setq *emacs23* (and (not *xemacs*) (or (>= emacs-major-version 23))) )
(setq *emacs24* (and (not *xemacs*) (or (>= emacs-major-version 24))) )

(require 'init-utils)
(require 'init-site-lisp)
(require 'init-elpa)
(require 'init-exec-path) ;; Set up $PATH

(require 'init-frame-hooks)
(require 'init-xterm)
(require 'init-themes)
(require 'init-fonts)
(require 'init-linum-mode)
(require 'init-osx-keys)
(require 'init-gui-frames)
(require 'init-dired)
(require 'init-ibuffer)
(require 'init-auto-complete)
(require 'init-sessions)
(require 'init-ido)

(require-package 'diminish)
(require 'init-editing-utils)

(require 'init-smex)
(require 'init-evil)

(require 'init-golang)

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))


;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-local" containing personal settings
;;----------------------------------------------------------------------------
(when (file-exists-p (expand-file-name "init-local.el" user-emacs-directory))
  (error "Please move init-local.el to ~/.emacs.d/lisp"))
(require 'init-local nil t)


;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(require 'init-locales)

(add-hook 'after-init-hook
          (lambda ()
            (message "init completed in %.2fms"
                     (sanityinc/time-subtract-millis after-init-time before-init-time))))

(provide 'init)
