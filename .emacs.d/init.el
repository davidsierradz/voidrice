(require 'package)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages (quote (ido-vertical-mode projectile gruvbox-theme))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(menu-bar-mode -1)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(horizontal-scroll-bar-mode -1)

(unless (or (fboundp 'helm-mode) (fboundp 'ivy-mode))
  (ido-mode t)
  (setq ido-everywhere t)
  (setq ido-enable-flex-matching t))

(autoload 'zap-up-to-char "misc"
  "Kill up to, but not including ARGth occurrence of CHAR." t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'saveplace)
(setq-default save-place t)

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-z") 'zap-up-to-char)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(setq save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      require-final-newline t
      load-prefer-newer t
      ediff-window-setup-function 'ediff-setup-windows-plain
      save-place-file (concat user-emacs-directory "places")
      backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))

;; (customize-set-variable 'package-archives
;;                         (quote (("gnu" . "https://elpa.gnu.org/packages/")
;;                                 ("melpa" . "https://melpa.org/packages/"))))

;; (customize-set-variable 'package-selected-packages
;;                         (quote (gruvbox-theme)))

(set-frame-font "Iosevka Term-17:weight=extralight" nil t)

(package-initialize)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(load-theme (quote gruvbox-dark-medium) t t)
(load-theme (quote gruvbox-light-medium) t)

;; JavaScript
(setq js-indent-level 2)

;; Ido
(require 'ido-vertical-mode)
(ido-vertical-mode t)
