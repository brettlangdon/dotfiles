;;; xit-mode.el --- A [x]it! major mode for Emacs. -*- lexical-binding: t; -*-

;; See: https://xit.jotaen.net/

;; Copyright (C) 2022 Ryan Olson

;; Authors: Ryan Olson <ryolson@me.com>
;; Keywords: xit todo

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(defvar xit-mode-hook nil)

;; (defvar xit-mode-map
;;   (let ((map (make-sparse-keymap)))
;;     (define-key map "\C-j" 'newline-and-indent)
;;     map)
;;   "Keymap for `xit-mode'.")

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.xit\\'" . xit-mode))

;; descriptions disabled until tags in descriptions are resolved.
;; right now tags don't display if a description has a face.
(defvar xit-mode-font-lock-keywords
  (list
   '("^[a-zA-Z]+.*$" 0 'xit-group-title)
   '("^\\(\\[ \\]\\) [\\!|\\.]*\\(.*\\)"
     (1 'xit-open-checkbox))
     ;(2 'xit-open-description))
   '("^\\(\\[x\\]\\) \\(.*\\)"
     (1 'xit-checked-checkbox))
     ;(2 'xit-checked-description))
   '("^\\(\\[@\\]\\) [\\!|\\.]*\\(.*\\)"
     (1 'xit-ongoing-checkbox))
     ;(2 'xit-ongoing-description))
   '("^\\(\\[~\\]\\) \\(.*\\)"
     (1 'xit-obsolete-checkbox)
     (2 'xit-obsolete-description))
   '("^\\[[x|@| |~]\\] \\([\\!|\\.]+\\)[^\\!|\\.]" 1 'xit-priority)
   '("\s#[a-zA-Z0-9\\-_]+\\(=[a-zA-Z0-9\\-+]+\\)?\\w" 0 'xit-tag)
   '("\s->\s\\([1-2][0-1][0-9][0-9]-[0-1][0-9]\\(-[0-3][0-9]\\)?\\)" 1 'xit-due-date))
  "Highlighting specification for `xit-mode'.")

(defface xit-group-title
  '((t :inherit (font-lock-string-face underline)))
  "Face used for checkboxes group title"
  :group 'xit-faces)
  
(defface xit-open-checkbox
  '((t :inherit font-lock-type-face))
  "Face used for open checkbox."
  :group 'xit-faces)

(defface xit-open-description
  '((t :inherit default))
  "Face used for open checkbox description."
  :group 'xit-faces)

(defface xit-checked-checkbox
  '((t :inherit success))
  "Face used for checked checkbox."
  :group 'xit-faces)

(defface xit-checked-description
  '((t :foreground "#838383"))
  "Face used for checked checkbox description."
  :group 'xit-faces)

(defface xit-ongoing-checkbox
  '((t :inherit font-lock-keyword-face))
  "Face used for ongoing checkbox."
  :group 'xit-faces)

(defface xit-ongoing-description
  '((t :inherit default))
  "Face used for ongoing checkbox description."
  :group 'xit-faces)

(defface xit-obsolete-checkbox
  '((t :foreground "#838383"))
  "Face used for obsolete checkbox."
  :group 'xit-faces)

(defface xit-obsolete-description
  '((t :foreground "#838383"))
  "Face used for obsolete checkbox description."
  :group 'xit-faces)

(defface xit-priority
  '((t :inherit error))
  "Face used for priority markers ! or ."
  :group 'xit-faces)

(defface xit-tag
  '((t :inherit font-lock-constant-face))
  "Face used for tags."
  :group 'xit-faces)

(defface xit-due-date
  '((t :inherit font-lock-variable-name-face))
  "Face used for due dates."
  :group 'xit-faces)

(defun xit-mode ()
  "Major mode for [x]it!"
  (interactive)
  (kill-all-local-variables)
  ;;(use-local-map xit-mode-map)
  (setq font-lock-defaults '(xit-mode-font-lock-keywords))
  (setq major-mode 'xit-mode)
  (setq mode-name "[x]it!")
  (run-hooks 'xit-mode-hook))

(provide 'xit-mode)
;;; xit-mode.el ends here
