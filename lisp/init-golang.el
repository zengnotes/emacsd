(require 'go-autocomplete)
(require 'auto-complete-config)
(require 'go-mode-load)

(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook (lambda ()
  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

(add-hook 'go-mode-hook (lambda ()
  (local-set-key (kbd "C-c i") 'go-goto-imports)))

(add-hook 'go-mode-hook (lambda ()
  (local-set-key (kbd "M-.") 'godef-jump)))


(require 'speedbar)
(speedbar-add-supported-extension ".go")
(speedbar-add-supported-extension ".conf")

(provide 'init-golang)
