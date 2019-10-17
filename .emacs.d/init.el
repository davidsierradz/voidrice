(require 'package)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  )

(customize-set-variable 'package-archives
                        (quote (("gnu" . "https://elpa.gnu.org/packages/")
                                ("melpa" . "https://melpa.org/packages/"))))

(customize-set-variable 'package-selected-packages
                        (quote (gruvbox-theme)))

(set-frame-font "Iosevka Term-15" nil t)

(package-initialize)

(load-theme (quote gruvbox) t)
