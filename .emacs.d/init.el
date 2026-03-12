;;; #+TITLE: Emacs Configuration
;;; #+AUTHOR: Development Data Lab
;;; #+EMAIL: info@developmendatalab.org


;;; FORK OF DDL-CORE.EL - THIS IS NOT UPDATED
;;; FORKED FOR TEST USER ACCOUNT EMACS UTILITIES
;;; ALL REFS TO DDL SHARED RESOURCES HAVE BEEN COMMENTED OUT OR MOVED TO ~/UTILS/LISP/

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set custom keybindings first -- so if this file crashes, we can still navigate
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key "\C-x\C-t" 'insert-comment)
(global-set-key "\M-h" 'backward-kill-word)
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\C-j" 'backward-word)
(global-set-key "\C-l" 'backward-word)
(global-set-key "\C-t" 'forward-word)
(global-set-key "\C-o" 'kill-word)
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-\M-l" 'font-lock-fontify-buffer)
(global-set-key "\C-x\C-r" 'query-replace-regexp)

(global-set-key "\C-c\C-u" 'comment-or-uncomment-region)
(global-set-key "\C-ci" 'compare-windows)
(global-set-key "\C-cu" 'uncomment-region)
(global-set-key "\C-cc" 'comment-region)
(global-set-key "\C-cb" 'comment-box)
(global-set-key "\M-o" 'open-line)
(global-set-key "\M-gl" 'recenter)
(global-set-key "\M-gm" 'pop-to-mark-command)
(global-set-key "\C-ct" 'auto-fill-mode)

(global-set-key "\C-xO" 'other-window-back)

(global-set-key "\C-x\C-d" 'shell-run-file)
(global-set-key "\C-x\C-l" 'shell-run-line)
(global-set-key "\C-x\C-e" 'shell-run-region)
(global-set-key "\C-x\C-q" 'shell-run-to-here)

(global-set-key "\C-c\C-h" 'pn-tex-compile)

(global-set-key "\C-x\C-o" 'stata-open-from-save)
(global-set-key "\C-xc" 'stata-eststo-clear)
(global-set-key "\C-xt" 'stata-toc)
(global-set-key "\C-co" 'stata-trace-on)
(global-set-key "\C-cx" 'stata-trace-off)
(global-set-key "\C-xnu" 'narrow-to-prev-stata-prog)
(global-set-key "\C-xnd" 'narrow-to-next-stata-prog)
(global-set-key "\C-xnp" 'narrow-to-stata-prog)
(global-set-key "\C-cs" 'stata-new-buffer)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key "\C-xg" 'magit-status)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General emacs preferences
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(transient-mark-mode 1)             ; show highlighted region (disable in personal init.el)
(show-paren-mode t)                 ; Highlight matching parenthesis
(blink-cursor-mode 0)               ; no blinking cursor
(set-default 'truncate-lines t)     ; truncate lines at screen width
(global-font-lock-mode 1)           ; turn on color syntax highlighting
(menu-bar-mode 0)                   ; no menu bar
(display-time-mode 1)               ; show time in mode line
(defalias 'yes-or-no-p 'y-or-n-p)   ; shorten yes/no to y/n at prompt, line nums
(setq inhibit-startup-message t)    ; no splash screen
(setq ring-bell-function 'ignore)   ; turn off all bells
(setq-default indent-tabs-mode nil) ; always indent with spaces
(setq backup-inhibited t)           ; no automatic backups
(setq resize-mini-windows 1)        ; Resize minibuffer when appropriate
(setq compare-ignore-whitespace 1)  ; Ignore whitespace in compare windows
(setq bookmark-save-flag 1)         ; Save bookmark file automatically
(setq-default tab-width 2)          ; Set indent size to 2

;; show the current line number in the modeline
(line-number-mode t)

;; follow version-controlled symbolic links to the actual file
(setq vc-follow-symlinks t)

;; ;; set subwords to tab through CamelCase
;; (if (version< emacs-version "24.4") nil 
;;   (global-subword-mode 1))

;; always scroll compilation window to end
(setq compilation-scroll-output t)

;; Turn on abbrevs
(abbrev-mode t)
(read-abbrev-file "~/utils/lisp/.abbrev_defs")
(setq-default abbrev-mode t)

;; make abbreviations global across all modes
(setq only-global-abbrevs t)

;; Modify the CURRENT buffer's syntax table to not break a word with
;; underscore, then globally make underscore in the whitespace character
;; class
(modify-syntax-entry ?_ "w" font-lock-syntax-table)
(modify-syntax-entry ?_ " ")

;; wrap paragraphs in text modes
(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'gfm-mode-hook 'auto-fill-mode)
(add-hook 'org-mode-hook 'auto-fill-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'latex-mode-hook 'turn-on-auto-fill)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

;; enable region case modification
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set theme path and load default material theme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'custom-theme-load-path "~/utils/lisp")
(load-theme 'material t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure our load paths
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; set a top-level load path -- all custom packages are beneath this
(let ((default-directory "~/utils/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Auto compile when lisp source files are newer than compiled files
(setq load-prefer-newer t)
(if (version< emacs-version "24.4") nil 
(require 'auto-compile))
(if (version< emacs-version "24.4") nil 
  (auto-compile-on-load-mode)) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load our custom packages
(require 'ado-mode)
(if (version< emacs-version "24.4") nil 
  (require 'csv-mode))
;;(if (version< emacs-version "24.4") nil (require 'python-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; project management w projectile
(if (version< emacs-version "24.4") nil (require 'projectile))
(if (version< emacs-version "24.4") nil (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))
(if (version< emacs-version "24.4") nil (projectile-mode +1))

;; remove huge .ipynb files from projectile grep
(if (version< emacs-version "24.4")  (setq projectile-globally-ignored-file-suffixes '("ipynb")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure shared emacs libraries and resources
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Matlab

;; use octave-mode for matlab files
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; R

;; use ess R-mode for R files
(setq ess-indent-with-fancy-comments nil)
(autoload 'R-mode "ess-site.el" "" t)
(add-to-list 'auto-mode-alist '("\\.R\\'" . R-mode))
(add-to-list 'auto-mode-alist '("\\.r\\'" . R-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; sh
(add-hook 'sh-mode-hook
          (lambda ()
            (setq sh-basic-offset 2
                  sh-indentation 2)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-mode
(setq org-ellipsis "⤵")                     ;; arrows instead of ellipsis
(setq org-src-fontify-natively t)           ;; syntax highlight source blocks
(setq org-src-tab-acts-natively t)          ;; tab acts natively in code sections
(setq org-src-window-setup 'current-window) ;; edit code in same window

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Latex

;; Use latex-mode instead of tex-mode
(add-to-list 'auto-mode-alist '("\\.tex\\'" . LaTeX-mode))

;; use reftex
(add-hook 'latex-mode-hook 'turn-on-reftex)

;; Add hooks for latex files to handle the citeasnoun protocol.
(add-hook 'latex-mode-hook
          (lambda ()
            (font-lock-add-keywords nil
                                    '(("\\\\citeasnoun{\\([^}\n]+\\)" (1 'font-lock-constant-face))))))
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (font-lock-add-keywords nil
                                    '(("\\\\citeasnoun{\\([^}\n]+\\)" (1 'font-lock-constant-face))))))

;; PROGRAM set/unset-current-latex-file: Set/unset working LaTeX file
;;                                       to be targeted for compilation.
(defun set-current-latex-file ()
  (interactive)
  (setq current-latex-file (read-from-minibuffer "Current .tex file: " (buffer-file-name))))
(defun unset-current-latex-file ()
  (interactive)
  (makunbound 'current-latex-file))

;; PROGRAM set/unset-latex-target-page: Set a target page for caligari latex links
(defun set-latex-target-page ()
  (interactive)
  (setq latex-target-page (read-from-minibuffer "Target page: " ))
  (setenv "TEXTARGETPAGE" latex-target-page)
  )
(defun unset-latex-target-page ()
  (interactive)
  (setenv TEXTARGETPAGE "")
  )

;; PROGRAM pn-tex-compile: Compile a the current .tex file
(defun pn-tex-compile ()
  (interactive)
  
  ;; get the tex file name -- unless current-tex-file is set
  (if (boundp 'current-latex-file) 
      (progn (setq fn current-latex-file) (cd (substring fn 0 (string-match "[^/]+\.tex$" fn))))
    (setq fn (buffer-file-name ())))
  
  ;; get filename stub
  (setq stub (substring fn 0 (- (length fn) 4)))
  
  ;; get filename minus directory
  (setq short_stub (substring stub (string-match "[^/]+\.tex$" fn)))
  
  ;; run make
  (shell-command (concat "~/ddl/tools/tex/make-tex " short_stub))

  ;; store name of current window
  (setq curwin (selected-window))

  ;; jump to end of document in latex window
  (setq swin (find-latex-window))
  (select-window swin)
  (goto-char (point-max))

  ;; switch back to the original window
  (select-window curwin)
  )

;; PROGRAM find-latex-window: finds latex output window [used by pn-tex-compile]
(defun find-latex-window ()

  
  (let (found buf buffer-list)    ; define two local variables, found and buf
    (setq buffer-names '("*Shell Command Output*"))
    (while (and (null found)   ; loop over buffer-names list until we find something
                (setq buf (pop buffer-names)))   
      (setq found
            (and (get-buffer buf)  ; return the buffer name. and makes it exist before going to next step
                 (car (get-buffer-window-list buf))))) ; return buffer name if it's visible, else nil
    found))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Markdown

;; Associate .md files with GitHub-flavored Markdown.
;; Use pandoc to render the results.
;; Leave the code block font unchanged.
(if (version< emacs-version "24.4") nil 
  (require 'markdown-mode))
(setq markdown-command "pandoc --standalone --mathjax --from=markdown")

;; parameters from earlier package file
;;	     :commands gfm-mode
;;	     :mode (("\\.md$" . gfm-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ido mode

(ido-mode 1)   ;; Turn on ido-mode

;; Hide annoying buffers
(setq ido-ignore-buffers
      (list (rx (or (and bos " ")
                    (and bos
                         (or "*Completions*" "*scratch*" "*Messages*" "*RefTex Select*"
                             "*Help*" "*vc-diff*" "^ ")
                         eos)))))

;; If a buffer name that doesn't exist is chosen, just make a new one
;; without prompting 
(setq ido-everywhere t
      ido-enable-flex-matching t
      ido-create-new-buffer 'always)

;; Make ctrl-h work in ido-mode
(define-key ido-file-completion-map (kbd "C-h") 'ido-delete-backward-updir)

;; Disable opening files in folders where you don't want it.
(setq ido-auto-merge-work-directories-length -1)

;; Disable ido-mode for write file and find-file
(define-key (cdr ido-minor-mode-map-entry) [remap write-file] nil)
(define-key (cdr ido-minor-mode-map-entry) [remap find-file] nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Our custom emacs functions for working in Stata, Latex, etc.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Stata

;; PROGRAM stata-toc: Generate a table of contents for do files, with the help of the shared
;;                    toc.sh script.
(defun stata-toc ()
  (interactive)

  ;; get stata buffer filename
  (setq fn (buffer-file-name ()))
  
  ;; generate table of contents string
;  (setq output (shell-command-to-string (concat "~/ddl/tools/sh/toc.sh " fn)))

  ;; output table of contents
  (insert "/***** TABLE OF CONTENTS *****/
")
  (insert output)
  )

;; PROGRAM stata-eststo-clear: runs eststo clear in next window.
(defun stata-eststo-clear ()
  (interactive)

  ;; save window name
  (setq curwin (selected-window))

  ;; find stata window
  (setq swin (find-shell-window))
  (select-window swin)

  (end-of-buffer)
  (insert "eststo clear")
  (comint-send-input)

  ;; switch back
  (select-window curwin)

  (deactivate-mark)
  )

;; PROGRAM stata-trace-on: Turn on stata tracing, with tracedepth of 1.
(defun stata-trace-on ()
  (interactive)
  ;; save current window name
  (setq curwin (selected-window))
  
  ;; find stata window
  (setq swin (find-shell-window))
  (select-window swin)
  
  ;; execute command
  (end-of-buffer)
  (insert "set trace on")
  (comint-send-input)
  (insert "set tracedepth 1")
  (comint-send-input)
  
  ;; switch back
  (select-window curwin)
  (deactivate-mark)
  )  

;; PROGRAM stata-trace-off: Turn off Stata tracing in shell window.
(defun stata-trace-off ()
  (interactive)
  (setq curwin (selected-window))
  (setq swin (find-shell-window))
  (select-window swin)
  (end-of-buffer)
  (insert "set trace off")
  (comint-send-input)
  (select-window curwin)
  (deactivate-mark))  

;; PROGRAM stata-open-from-save: Open a Stata file from a save using line.
(defun stata-open-from-save ()
  (interactive)

  ;; declare variables
  (let (p1 p2 cur-line)
    
    ;; copy current line into an emacs variable
    (setq p1 (line-beginning-position))
    (setq p2 (line-end-position))
    (setq cur-line (buffer-substring-no-properties p1 p2))
    
    ;; do a regular expression match to remove the save and replace, or to grab the file after 'using'
    ;; \(save\|using\) +\([^, ]*\) -> use \2, clear
    (when (string-match "\\\(save\\\|using\\\) +\\\([^, ]*\\\)" cur-line)
      
      (setq save-command (match-string 2 cur-line))
      
      ;; save current window name
      (setq curwin (selected-window))

      ;; find stata window
      (setq swin (find-shell-window))
      (select-window swin)
      
      ;; copy and execute command
      (end-of-buffer)
      (insert (concat "use " save-command ", clear"))
      (comint-send-input)

      ;; switch back
      (select-window curwin)
      (deactivate-mark)
      )))

;; PROGRAM narrow-to-stata-prog: Program to narrow buffer to current stata program.
(fset 'narrow-to-stata-prog
      "\C-n\C-n\C-rprog def\C-a\C-p\C-@\C-s^end\C-a\C-n\C-n\C-xnn\M-<")

;; PROGRAM stata-stub-prog: Stub a stata program header
(defun stata-stub-prog ()
  (interactive)
  (setq foo (read-from-minibuffer "Program name: "))
  (insert "/**********************************************************************************/
/* program " foo " : Insert description here */
/***********************************************************************************/
cap prog drop " foo "
prog def " foo "

end
/* *********** END program " foo " ***************************************** */"))

;; PROGRAM stata-new-buffer: Rename current buffer to "stata", create a new shell buffer
(defun stata-new-buffer ()
  (interactive)
  (rename-buffer "stata")
  (shell)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Python

;; PROGRAM py-stub-option-parser: Stub a python option parser
(defun py-stub-option-parser ()
  (interactive)
  (insert "
from optparse import OptionParser

def parse_options():
    
    parser = OptionParser()
    
    
    parser.add_option('-i', '--input-path', dest='input_path',
                      help='path to input file', metavar='~/tmp/src')
    
    
    (options, args) = parser.parse_args()
    
    
    if not options.input_path:
        parser.print_help()
        sys.exit(1)

    return options

options = parse_options()
"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Code execution

;; These are the functions that enable us to run code from various kinds
;; of code buffers in an adjacent shell buffer.

;; PROGRAM build-command: builds a source command from a buffer's file
;;                        extension, e.g. "do foo.do" or "source('foo.r')"
(defun build-command(ext temp-file)

  ;; if this is a stata file:
  (if (string= ext "do") (setq cmd (concat "do \"" temp-file "\"")))
  
  ;; if this is an R file:
  (if (or (string= ext "r") (string= ext "R")) (setq cmd (concat "source('" temp-file "', echo=TRUE)")))
  
  ;; if this is a Matlab file:
  ;; (if (string= ext "m") (setq cmd temp-file))
  (if (string= ext "m") (setq cmd (concat "run('" temp-file "') ")))
  ;; if this is a Python file:
  (if (string= ext "py") (setq cmd (concat "exec(open('" temp-file "').read())")))

  ;; send back the command
  cmd
)


;; PROGRAM shell-run-file: runs current file in shell window
(defun shell-run-file ()
    (interactive)

  ;; get extension of current file 
  (setq ext (file-name-extension (buffer-file-name)))

  ;; get the shell buffer filename
  (setq fn (buffer-file-name ()))

  ;; save window name
  (setq curwin (selected-window))

  ;; find shell window
  (setq swin (find-shell-window))
  (select-window swin)

  ;; build the command (e.g. "do foo.do" or "source('foo.r')"
  (setq cmd (build-command ext fn))

  ;; send command to the shell window
  (end-of-buffer)
  (insert cmd)
  (comint-send-input)

  ;; switch back
  (select-window curwin)

  (deactivate-mark)
)

;; PROGRAM shell-run-line: run current line in shell window.
(defun shell-run-line ()
    (interactive)

    ;; save the current point
    (setq p (point))
    (beginning-of-line)
    (push-mark)
    (end-of-line)
    (exchange-point-and-mark)
    (kill-ring-save (region-beginning) (region-end))

    ;; save window name
    (setq curwin (selected-window))

    ;; find shell window
    (setq swin (find-shell-window))
    (select-window swin)

    ;; yank command and hit enter
    (end-of-buffer)
    (yank)
    (comint-send-input)

    ;; clean up: move cursor and deactivate mark
    (select-window curwin)
    (deactivate-mark)
)


;; PROGRAM shell-run-region: run current region as source file in shell window.
(defun shell-run-region ()
    (interactive)

    ;; get extension of current file 
    (setq ext (file-name-extension (buffer-file-name)))

    ;; create a temp file with the same extension    
    (setq temp-file (concat (make-temp-file "foo" nil (concat "." ext))))

    ;; write the region to the temp file
    (write-region (region-beginning) (region-end) temp-file)

    ;; save window name
    (setq curwin (selected-window))

    ;; find shell window
    (setq swin (find-shell-window))
    (select-window swin)

    ;; build the command (e.g. "do foo.do" or "source("foo.r")"
    (setq cmd (build-command ext temp-file))

    ;; send command to shell to run the file
    (end-of-buffer)
    (insert cmd)
    (comint-send-input)

    (select-window curwin)
    (deactivate-mark)
)


;; PROGRAM shell-run-to-here: run current file to current location in shell window.
(defun shell-run-to-here ()
  (interactive)

  ;; get extension of current file 
  (setq ext (file-name-extension (buffer-file-name)))

  ;; copy content
  (push-mark (point))
  (beginning-of-buffer)
  (exchange-point-and-mark)

  ;; write it to a temp file with the correct extension
  (setq temp-file (concat (make-temp-file "foo" nil (concat "." ext))))
  (write-region (region-beginning) (region-end) temp-file)

  ;; save window name
  (setq curwin (selected-window))

  ;; find shell window
  (setq swin (find-shell-window))
  (select-window swin)

  ;; build the command (e.g. "do foo.do" or "source("foo.r")"
  (setq cmd (build-command ext temp-file))

  ;; insert command
  (end-of-buffer)
  (insert cmd)
  (comint-send-input)

  ;; switch back to original window
  (select-window curwin)
  (deactivate-mark)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Utility functions

;; insert c-style comment
(fset 'insert-comment
      "\C-a\C-m\C-p/*  */\C-b\C-b\C-b")

;; prior version to 12/1/2019:
;; (fset 'insert-comment  
;;    "\C-a\C-m\C-p/*  */\C-b\C-b\C-b\C-b\C-b\C-b\C-@\C-a\C-w\C-f\C-f\C-f\C-i")

;; cut word forward from cursor
(fset 'forward-kill-word
      "\C-SPC\C-t\C-w")

;; PROGRAM other-window-back: switch back to previous window.
(defun other-window-back ()
  (interactive)
  (other-window -1)
  )

;; PROGRAM find-shell-window: returns window object with an open shell
;;                            window, return nil if not found. (used by
;;                            code execution functions)
(defun find-shell-window ()

  (let (found buf buffer-list)    ; define two local variables, found and buf
    (setq buffer-names '("*R*" "*shell*" "*shell*<2>" "*shell*<3>" "stata" "*stata*" "python" "*python*"))
    (while (and (null found)   ; loop over buffer-names list until we find something
                (setq buf (pop buffer-names)))   
      (setq found
            (and (get-buffer buf)  ; return the buffer name. and makes it exist before going to next step
                 (car (get-buffer-window-list buf))))) ; return buffer name if it's visible, else nil
    found))

;; PROGRAM masala-merge-open-last-csv: Quickly open the CSV file generated by masala-merge
(fset 'masala-merge-open-last-csv
      "\C-r^Unmatched\C-a\C-t\C-t\C-t\C-t\C-t\C-f\C-f\C-@\C-e\C-[w\C-[>\C-x\C-f\C-y\C-m\C-c\C-a")

;; Remap when working in terminal Emacs.
(define-key input-decode-map "\e[1;2A" [S-up])

;; a function to swap this window with the next one
(defun transpose-windows (arg)
   "Transpose the buffers shown in two windows."
   (interactive "p")
   (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
     (while (/= arg 0)
       (let ((this-win (window-buffer))
             (next-win (window-buffer (funcall selector))))
         (set-window-buffer (selected-window) next-win)
         (set-window-buffer (funcall selector) this-win)
         (select-window (funcall selector)))
       (setq arg (if (plusp arg) (1- arg) (1+ arg))))))
(global-set-key (kbd "C-x 9") 'transpose-windows)

;; unfill-region
(defun unfill-region (beg end)
  "Unfill the region, joining text paragraphs into a single
    logical line.  This is useful, e.g., for use with
    `visual-line-mode'."
  (interactive "*r")
  (let ((fill-column (point-max)))
    (fill-region beg end)))

;; toggle-margin-right between fill column and window margin
(defun toggle-margin-right ()
  "Toggle the right margin between `fill-column' or window width.
   Useful for visual-line-mode on wide screens."
  (interactive)
  (if (null (cdr (window-margins)))
      (set-window-margins nil 0 (- (window-body-width) fill-column))
    (set-window-margins nil 0 0)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Magit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; we use =magit= to handle version control.
(if (version< emacs-version "24.4") nil (require 'magit))
(if (version< emacs-version "24.4") nil (require 'with-editor))

;; highlight commit text in the summary line that goes beyond 50 characters.
(setq git-commit-summary-max-length 50)

;; turn on hunk-highlighting, as magit hunks don't exactly match the point and mark
'(magit-diff-highlight-hunk-region-functions
  (quote
   (magit-diff-highlight-hunk-region-using-underline)
   ))

;; Use magit-forge - this lets us run Github operations from within magit (e.g. pull requests)
;; (with-eval-after-load 'magit
;;   (require 'forge))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  STARTUP

;; define startup layout -- revised for emacs 26, which runs shell in other
;;                          window and automatically switches there.
(defun my-startup-layout ()
  (interactive)

  ;; start by running shell, which does some unpredictable realignment
  (shell)

  ;; now delete the other windows, so there is only a shell window
  (delete-other-windows)
  
  ;; split the window
  (split-window-horizontally)
  
  ;; switch to right window
  (other-window 1)
  
  ;; switch to scratch buffer on right
  (switch-to-buffer "*scratch*"))

;; execute the startup layout
(my-startup-layout)


;; ;; split window vertically 
;; (if (eq (length(window-list)) 1)
;;     (shell))
;; (if (eq (length(window-list)) 1)
;;     (split-window-horizontally))
;; 
;; ;; load shell in left window, scratch in right
;; (other-window 1)
;; (switch-to-buffer "*scratch*")
;; (other-window 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; function to fix length of box comments ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(fset 'fix-comment-box
   "\C-a\C-@\C-e\C-[xuncom\C-i\C-m\C-a\C-n\C-k\C-k\C-p\C-p\C-k\C-k\C-@\C-n\C-cb")
(global-set-key "\C-cf" 'fix-comment-box)
(put 'narrow-to-region 'disabled nil)
