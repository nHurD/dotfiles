;;; init.el --- Where all the magic begins
;;
;; This file allows Emacs to initialize my customizations
;; in Emacs lisp embedded in *one* literate Org-mode file.

;; This sets up the load path so that we can override it

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

(defvar temp--file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)



(package-initialize)
(setq package-enable-at-startup nil ; don't auto-initialize!
      ;; don't add that `custom-set-variables' block to my initl!
      package--init-file-ensured t)


(require 'org)
(org-babel-load-file (expand-file-name "jrsteele.org" "~/.emacs.d"))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(put 'downcase-region 'disabled nil)

(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold 16777216
                           gc-cons-percentage 0.1)))

(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold 16777216
                gc-cons-percentage 0.1)))

;;; init.el ends here
