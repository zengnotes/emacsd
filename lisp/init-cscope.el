(require 'xcscope)

(add-hook 'go-mode-hook (function cscope:hook))


(provide 'init-cscope)
