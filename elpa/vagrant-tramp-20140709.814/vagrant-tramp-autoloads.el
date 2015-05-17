;;; vagrant-tramp-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (vagrant-tramp-enable vagrant-tramp-term vagrant-tramp-ssh)
;;;;;;  "vagrant-tramp" "c:/Users/el/AppData/Roaming/.emacs.d/elpa/vagrant-tramp-20140709.814/vagrant-tramp.el"
;;;;;;  "a06d063b604145a95bc90d5442119a3a")
;;; Generated autoloads from c:/Users/el/AppData/Roaming/.emacs.d/elpa/vagrant-tramp-20140709.814/vagrant-tramp.el

(defconst vagrant-tramp-method "vagrant" "\
TRAMP method for vagrant boxes.")

(defvar vagrant-tramp-ssh (executable-find (concat (file-name-directory (or load-file-name buffer-file-name)) "bin/vagrant-tramp-ssh")) "\
The vagrant-tramp-ssh executable.")

(custom-autoload 'vagrant-tramp-ssh "vagrant-tramp" t)

(autoload 'vagrant-tramp-term "vagrant-tramp" "\
SSH to a Vagrant BOX in an `ansi-term'.

\(fn BOX)" t nil)

(autoload 'vagrant-tramp-enable "vagrant-tramp" "\
Add `vagrant-tramp-method' to `tramp-methods'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil nil ("c:/Users/el/AppData/Roaming/.emacs.d/elpa/vagrant-tramp-20140709.814/vagrant-tramp-pkg.el"
;;;;;;  "c:/Users/el/AppData/Roaming/.emacs.d/elpa/vagrant-tramp-20140709.814/vagrant-tramp.el")
;;;;;;  (21687 39107 398000 0))

;;;***

(provide 'vagrant-tramp-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; vagrant-tramp-autoloads.el ends here
