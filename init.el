;; Removing toolbar
(server-start)
;; Remember last session
(desktop-save-mode 1)
;; Always set word wrap
(global-visual-line-mode t)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(show-paren-mode 1)

;; list the packages you want
(progn
  (setq package-list '(flx-ido tern js2-mode sr-speedbar tabbar fiplr magit multiple-cursors helm tern multiple-cursors
			       yasnippet auto-complete helm-gtags markdown-mode web-mode move-text web-beautify jedi python-mode
			       ac-js2 tern-auto-complete yaml-mode))
  ;; Now putting some autoInstall stuff
  (setq package-archives '(
			   ("gnu" . "http://elpa.gnu.org/packages/")
			   ("marmalade" . "http://marmalade-repo.org/packages/")
			   ("melpa-stable" . "http://stable.melpa.org/packages/")
			   ("melpa" . "http://melpa.milkbox.net/packages/")
			   ))


  ;;activate all the packages (in particular autoloads)
  (package-initialize)

  ;; fetch the list of packages available 
  (unless package-archive-contents
    (package-refresh-contents))


  ;; install the missing packages
  (dolist (package package-list)
    (unless (package-installed-p package)
      (package-install package)))) 

;; **** Custom Vars- Theme and stuff ***********
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-use-fuzzy t)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (misterioso)))
 '(ecb-options-version "2.40"))
;; ;********************** Flx IDO stuff ********************8
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
;(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(setq gc-cons-threshold 20000000)
;; ;************************* Speedbar Related customization ******************
(require 'sr-speedbar)
(global-set-key (kbd "C-0") 'sr-speedbar-toggle)
(global-set-key (kbd "C-9") 'sr-speedbar-select-window)
;;****************************** Move lines up and down **********************

;;********************* Shortcuts *******************************************
(require 'fiplr)
(setq fiplr-ignored-globs '((directories (".git" ".svn" "node_modules"))
                            (files ("*.jpg" "*.png" "*.zip" "*~"))))
(global-set-key (kbd "C-.") 'rgrep)
(global-set-key (kbd "C-j") 'helm-imenu)
(global-set-key (kbd "M-j") 'helm-imenu)
(global-set-key (kbd "C-;") 'ido-kill-buffer)
(global-set-key (kbd "C-p") 'fiplr-find-file)
(global-set-key (kbd "C-,") 'compile)	
(global-set-key (kbd "C-Q") 'goto-line)	
(global-set-key (kbd "C-x m") 'man)
(global-set-key (kbd "C-x r") 'rename-buffer)
(global-set-key (kbd "M-s") 'magit-status)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-f") 'ido-find-file)  
(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)

(global-set-key (kbd "M-b") 'ido-switch-buffer)
(global-set-key (kbd "M-b") 'ido-switch-buffer)
(require 'org)
(global-set-key (kbd "C-t") 'org-todo-list)
;;********************* End shortcuts *******************************************
;;********************* Org Mode  ********************************************

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;;********************* Tabbar config  *******************************************
(dolist (func '(tabbar-mode tabbar-forward-tab tabbar-forward-group tabbar-backward-tab tabbar-backward-group))
  (autoload func "tabbar" "Tabs at the top of buffers and easy control-tab navigation"))
(defmacro defun-prefix-alt (name on-no-prefix on-prefix &optional do-always)
  `(defun ,name (arg)
     (interactive "P")
     ,do-always
     (if (equal nil arg)
	 ,on-no-prefix
       ,on-prefix)))
(defun-prefix-alt shk-tabbar-next (tabbar-forward-tab) (tabbar-forward-group) (tabbar-mode 1))
(defun-prefix-alt shk-tabbar-prev (tabbar-backward-tab) (tabbar-backward-group) (tabbar-mode 1))
(global-set-key [(control tab)] 'shk-tabbar-next)
(global-set-key [(control shift tab)] 'shk-tabbar-prev)
;;********************* End Tabbar config  *******************************************
;;********************* Multiple Cursors *****************************************
(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;******************** End Multiple Cursors ************************************

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ;****************************** AC and YASnippet ***************
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
;; start yasnippet with emacs

(progn
  (require 'yasnippet)
  (yas-global-mode 1))  

;; ;************************* Web Mode ***********************************
(require 'web-mode)
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'ac-sources 'ac-source-html-tag)
(add-to-list 'ac-sources 'ac-source-html-attribute)
(add-to-list 'web-mode-ac-sources-alist
             '("html" . (ac-source-html-tag
                         ac-source-html-attribute)))
(add-to-list 'auto-mode-alist '("\\.html*\\'" . web-mode))
;; ;;*********** JS2 and tern *****************************
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-hook 'js2-mode-hook 'tern-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(if (eq system-type 'windows-nt)
    (setq tern-command '("node" "C:\\Users\\El\\AppData\\Roaming\\npm\\node_modules\\tern\\bin\\tern")))
(setq js-indent-level 2)
(setq js2-basic-offset 2)


;; ;******************** Config ggtags for C++  ***********************************
(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )
(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
;; ;******************** End ggtags ************************************
;; ******************* Python suff ***********************************
;; Python mode settings
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(setq py-electric-colon-active t)
(progn
  (require 'jedi)
  (add-hook 'python-mode-hook
	  (lambda ()
	    (jedi:setup)
	    (jedi:ac-setup)
            (local-set-key "\C-cd" 'jedi:show-doc)
            (local-set-key (kbd "M-SPC") 'jedi:complete)
            (local-set-key (kbd "M-.") 'jedi:goto-definition))))
;; (add-hook 'python-mode-hook 'autopair-mode)(add-hook 'python-mode-hook 'auto-complete-mode)
;; ******************* End Python suff ***********************************
