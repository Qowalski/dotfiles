(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode -1)
(set-window-scroll-bars (minibuffer-window) nil nil)

(require 'use-package-ensure)
(setq use-package-always-ensure t)
(use-package auto-compile
  :config (auto-compile-on-load-mode))

(use-package evil
  :config
  (evil-mode 1))

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

(use-package evil-org
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
  	  (lambda () (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package gruvbox-theme
  :config
  (load-theme 'gruvbox-dark-hard t))

(setq ring-bell-function 'ignore)
(setq scroll-conservatively 100)
(blink-cursor-mode 0)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq confirm-kill-emacs 'y-or-n-p)
(show-paren-mode t)
(setq show-paren-delay 0.0)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq require-final-newline t)
(global-display-line-numbers-mode)
(setq display-line-numbers 'relative)
(setq linum-format "%d")
(hl-line-mode t)
(set-face-attribute 'default nil :font "Iosevka-12")
(set-frame-font "Iosevka-12" nil t)
