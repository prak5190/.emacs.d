;; Removing toolbar
(server-start)
;; Remember last session
(desktop-save-mode 1)
(tool-bar-mode 0)
;;; Code
(setq package-archives '(
                         ;;("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ))
(show-paren-mode 1)
(let ((default-directory "~/.emacs.d/elpa"))
  (normal-top-level-add-subdirs-to-load-path))

;****************************** AC and YASnippet ***************
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
;; start yasnippet with emacs

(require 'yasnippet)
(yas-global-mode 1)

;;*******  Windows rgrep mode ************
(if (eq system-type 'windows-nt)
    (setenv "PATH"
            (concat
             ;; Change this with your path to MSYS bin directory
             "D:\\mingw\\msys\\1.0\\bin;"
             (getenv "PATH"))))
;;*********** JS2 and tern *****************************
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)


(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(if (eq system-type 'windows-nt)
    (setq tern-command '("node" "C:\\Users\\El\\AppData\\Roaming\\npm\\node_modules\\tern\\bin\\tern")))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))
(add-hook 'js2-mode-hook 'tern-mode)
(add-hook 'js-mode-hook 'tern-mode)

;;****************************** End AC and YASnippet ***************
(require 'quack)
;; Chez scheme stuff
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (tango-dark)))
 '(ecb-options-version "2.40")
 '(ggtags-executable-directory "/usr/bin")
 '(indent-tabs-mode nil)
 '(isar-one-command-per-line t)
 '(quack-programs (quote ("petite" "mit-scheme" "racket" "racket -il typed/racket" "rs" "scheme" "scheme48")))
 '(scheme-program-name "petite")
 '(speedbar-show-unknown-files t)
 '(tabbar-mode t nil (tabbar)))
;(setq scheme-program-name "petite")

;; ;; par edit
;; (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
;; (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
;; (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
;; (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
;; (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
;; (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
;; (add-hook 'scheme-mode-hook           #'enable-paredit-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;********************** Flx IDO stuff ********************8
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
;(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(setq gc-cons-threshold 20000000)
;
(setq js-indent-level 2)
(setq js2-basic-offset 2)

;************************* Web Mode ***********************************
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html*\\'" . web-mode))
;************************* Speedbar Related customization ******************
(global-set-key (kbd "C-0") 'sr-speedbar-toggle)
(global-set-key (kbd "C-9") 'sr-speedbar-select-window)

;****************************** Move lines up and down **********************
(defun move-text-internal (arg)
   (cond
    ((and mark-active transient-mark-mode)
     (if (> (point) (mark))
            (exchange-point-and-mark))
     (let ((column (current-column))
              (text (delete-and-extract-region (point) (mark))))
       (forward-line arg)
       (move-to-column column t)
       (set-mark (point))
       (insert text)
       (exchange-point-and-mark)
       (setq deactivate-mark nil)))
    (t
     (beginning-of-line)
     (when (or (> arg 0) (not (bobp)))
       (forward-line)
       (when (or (< arg 0) (not (eobp)))
            (transpose-lines arg))
       (forward-line -1)))))

(defun move-text-down (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines down."
   (interactive "*p")
   (move-text-internal arg))

(defun move-text-up (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines up."
   (interactive "*p")
   (move-text-internal (- arg)))

(global-set-key [\M-up] 'move-text-up)
(global-set-key [\M-down] 'move-text-down)
;****************************** End Move lines up and down ******************
;********************* Git *******************************************
;(setq 'magit-version 'magit-20141025.429)
(require 'magit)
(require 'helm)
;(global-set-key (kbd "C-x g") 'magit-status)
;********************* End Git *******************************************
;**************************************** ctags/ggtags ****************************************
;; (setq tags-revert-without-query t)
;; (setq path-to-ctags "/usr/bin/ctags")
;; (global-set-key (kbd "<f7>") 'ctags-create-or-update-tags-table)
;; (defadvice find-tag (around refresh-etags activate)
;;   "Rerun etags and reload tags if tag not found and redo find-tag.              
;;    If buffer is modified, ask about save before running etags."
;;   (let ((extension (file-name-extension (buffer-file-name))))
;;     (condition-case err
;;         ad-do-it
;;       (error (and (buffer-modified-p)
;;                   (not (ding))
;;                   (y-or-n-p "Buffer is modified, save it? ")
;;                   (save-buffer))
;;              (er-refresh-etags extension)
;;              ad-do-it))))
;; (defun er-refresh-etags (&optional extension)
;;   "Run etags on all peer files in current dir and reload them silently."
;;   (interactive)
;;   (shell-command (format "etags *.%s" (or extension "el")))
;;   (let ((tags-revert-without-query t))  ; don't query, revert silently          
;;     (visit-tags-table default-directory nil)))
;********************* Shortcuts *******************************************
(global-set-key (kbd "C-.") 'rgrep)
(global-set-key (kbd "C-,") 'compile)	
(global-set-key (kbd "C-Q") 'goto-line)	
(global-set-key (kbd "C-x m") 'man)
(global-set-key (kbd "C-x r") 'rename-buffer)
(global-set-key (kbd "M-s") 'magit-status)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-f") 'ido-find-file)
(global-set-key (kbd "M-b") 'ido-switch-buffer)
;********************* End shortcuts *******************************************
;********************* Tabbar config  *******************************************
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
;********************* End Tabbar config  *******************************************
;********************* Multiple Cursors *****************************************
(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;******************** End Multiple Cursors ************************************
;******************** Config ggtags for C++  ***********************************
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
;******************** End ggtags ************************************
; turn on Semantic
(semantic-mode 1)
; let's define a function which adds semantic as a suggestion backend to auto complete
; and hook this function to c-mode-common-hook
(defun my:add-semantic-to-autocomplete() 
  (add-to-list 'ac-sources 'ac-source-semantic)
)
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
; turn on ede mode 
(global-ede-mode 1)
(global-semantic-idle-scheduler-mode 1)
;******************** Irony Config  ************************************
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;******************** End Irony Config  ************************************
;; (require 'auto-complete)
;; (require 'autopair)
;; (require 'yasnippet)
;; (require 'flycheck)
;; (global-flycheck-mode t)
;; (global-set-key [f7] 'find-file-in-repository)

;; ; auto-complete mode extra settings
;; (setq
;;  ac-auto-start 2
;;  ac-override-local-map nil
;;  ac-use-menu-map t
;;  ac-candidate-limit 20)

;; ;; Python mode settings
;; (require 'python-mode)
;; (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
;; (setq py-electric-colon-active t)
;; (add-hook 'python-mode-hook 'autopair-mode)
;; (add-hook 'python-mode-hook 'yas-minor-mode)

;; ;; ;; Jedi settings
;; (require 'jedi)
;; ;; It's also required to run "pip install --user jedi" and "pip
;; ;; install --user epc" to get the Python side of the library work
;; ;; correctly.
;; ;; With the same interpreter you're using.

;; ;; if you need to change your python intepreter, if you want to change it
;; ;; (setq jedi:server-command
;; ;;       '("python2" "/home/andrea/.emacs.d/elpa/jedi-0.1.2/jediepcserver.py"))

;; (add-hook 'python-mode-hook
;; 	  (lambda ()
;; 	    (jedi:setup)
;; 	    (jedi:ac-setup)
;;             (local-set-key "\C-cd" 'jedi:show-doc)
;;             (local-set-key (kbd "M-SPC") 'jedi:complete)
;;             (local-set-key (kbd "M-.") 'jedi:goto-definition)))


;; (add-hook 'python-mode-hook 'auto-complete-mode)
;asd
(ido-mode t) 
;******************************************** End Python Plugon Code ***********************************************
(provide '.emacs)


(put 'scroll-left 'disabled nil)

;; Haskell Indentation mode
(setq haskell-mode-hook 'haskell-indentation-mode)
