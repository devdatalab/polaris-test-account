;;-*-coding: utf-8;-*-
(define-abbrev-table 'Buffer-menu-mode-abbrev-table '())

(define-abbrev-table 'apropos-mode-abbrev-table '())

(define-abbrev-table 'asm-mode-abbrev-table '())

(define-abbrev-table 'awk-mode-abbrev-table
  '(
    ("else" "else" c-electric-continued-statement 0)
    ("while" "while" c-electric-continued-statement 0)
   ))

(define-abbrev-table 'c++-mode-abbrev-table
  '(
    ("catch" "catch" c-electric-continued-statement 0)
    ("else" "else" c-electric-continued-statement 0)
    ("while" "while" c-electric-continued-statement 0)
   ))

(define-abbrev-table 'c-mode-abbrev-table
  '(
    ("else" "else" c-electric-continued-statement 0)
    ("while" "while" c-electric-continued-statement 0)
   ))

(define-abbrev-table 'comint-mode-abbrev-table '())

(define-abbrev-table 'completion-list-mode-abbrev-table '())

(define-abbrev-table 'display-time-world-mode-abbrev-table '())

(define-abbrev-table 'emacs-lisp-byte-code-mode-abbrev-table '())

(define-abbrev-table 'emacs-lisp-mode-abbrev-table '())

(define-abbrev-table 'fundamental-mode-abbrev-table '())

(define-abbrev-table 'global-abbrev-table
  '(
    ("13bid" "ec13_block_id" nil 0)
    ("13bname" "ec13_block_name" nil 0)
    ("13did" "ec13_district_id" nil 1)
    ("13dname" "ec13_district_name" nil 0)
    ("13sdid" "ec13_subdistrict_id" nil 2)
    ("13sdname" "ec13_subdistrict_name" nil 0)
    ("13sid" "ec13_state_id" nil 1)
    ("13sname" "ec13_state_name" nil 0)
    ("13tid" "ec13_town_id" nil 0)
    ("13tname" "ec13_town_name" nil 0)
    ("13vid" "ec13_village_id" nil 0)
    ("13vname" "ec13_village_name" nil 0)

    ("05bid" "ec05_block_id" nil 0)
    ("05bname" "ec05_block_name" nil 0)
    ("05did" "ec05_district_id" nil 1)
    ("05dname" "ec05_district_name" nil 0)
    ("05sdid" "ec05_subdistrict_id" nil 2)
    ("05sdname" "ec05_subdistrict_name" nil 0)
    ("05sid" "ec05_state_id" nil 1)
    ("05sname" "ec05_state_name" nil 0)
    ("05tid" "ec05_town_id" nil 0)
    ("05tname" "ec05_town_name" nil 0)
    ("05vid" "ec05_village_id" nil 0)
    ("05vname" "ec05_village_name" nil 0)
    
    ("90bid" "ec90_block_id" nil 0)
    ("90bname" "ec90_block_name" nil 0)
    ("90did" "ec90_district_id" nil 1)
    ("90dname" "ec90_district_name" nil 0)
    ("90sdid" "ec90_subdistrict_id" nil 2)
    ("90sdname" "ec90_subdistrict_name" nil 0)
    ("90sid" "ec90_state_id" nil 1)
    ("90sname" "ec90_state_name" nil 0)
    ("90tid" "ec90_town_id" nil 0)
    ("90tname" "ec90_town_name" nil 0)
    ("90vid" "ec90_village_id" nil 0)
    ("90vname" "ec90_village_name" nil 0)
    ("98bid" "ec98_block_id" nil 0)
    ("98bname" "ec98_block_name" nil 0)
    ("98did" "ec98_district_id" nil 1)
    ("98dname" "ec98_district_name" nil 0)
    ("98sdid" "ec98_subdistrict_id" nil 2)
    ("98sdname" "ec98_subdistrict_name" nil 0)
    ("98sid" "ec98_state_id" nil 1)
    ("98sname" "ec98_state_name" nil 0)
    ("98tid" "ec98_town_id" nil 0)
    ("98tname" "ec98_town_name" nil 0)
    ("98vid" "ec98_village_id" nil 0)
    ("98vname" "ec98_village_name" nil 0)
    ("bid" "block_id" nil 0)
    ("bname" "block_name" nil 0)
    ("dname" "district_name" nil 0)
    ("electionslong" "~/iec/misc_data/elections/elections_long" nil 0)
    ("hid" "hl_pmgsy_state_id" nil 6)
    ("pbid" "pc01_block_id" nil 0)
    ("pbname" "pc01_block_name" nil 0)
    ("pdid" "pc01_district_id" nil 2)
    ("pdname" "pc01_district_name" nil 0)
    ("psdid" "pc01_subdistrict_id" nil 2)
    ("psdname" "pc01_subdistrict_name" nil 0)
    ("psid" "pc01_state_id" nil 11)
    ("psname" "pc01_state_name" nil 2)
    ("ptid" "pc01_town_id" nil 0)
    ("ptname" "pc01_town_name" nil 0)
    ("pvid" "pc01_village_id" nil 7)
    ("pvname" "pc01_village_name" nil 0)

    ("rbid" "pc11_block_id" nil 0)
    ("rbname" "pc11_block_name" nil 0)
    ("rpid" "pc11_part_id" nil 0)
    ("rpname" "pc11_part_name" nil 0)
    ("rdid" "pc11_district_id" nil 2)
    ("rdname" "pc11_district_name" nil 0)
    ("rsdid" "pc11_subdistrict_id" nil 2)
    ("rsdname" "pc11_subdistrict_name" nil 0)
    ("rsid" "pc11_state_id" nil 11)
    ("rsname" "pc11_state_name" nil 2)
    ("rtid" "pc11_town_id" nil 0)
    ("rtname" "pc11_town_name" nil 0)
    ("rvid" "pc11_village_id" nil 7)
    ("rvname" "pc11_village_name" nil 0)

    ("lbid" "lgd_block_id" nil 0)
    ("lbname" "lgd_block_name" nil 0)
    ("ldid" "lgd_district_id" nil 2)
    ("ldname" "lgd_district_name" nil 0)
    ("lsdid" "lgd_subdistrict_id" nil 2)
    ("lsdname" "lgd_subdistrict_name" nil 0)
    ("lsid" "lgd_state_id" nil 11)
    ("lsname" "lgd_state_name" nil 2)
    ("ltid" "lgd_town_id" nil 0)
    ("ltname" "lgd_town_name" nil 0)
    ("lvid" "lgd_village_id" nil 7)
    ("lvname" "lgd_village_name" nil 0)

    ("qbid" "pc91_block_id" nil 0)
    ("qbname" "pc91_block_name" nil 0)
    ("qdid" "pc91_district_id" nil 1)
    ("qdname" "pc91_district_name" nil 0)
    ("qsdid" "pc91_subdistrict_id" nil 2)
    ("qsdname" "pc91_subdistrict_name" nil 0)
    ("qsid" "pc91_state_id" nil 1)
    ("qsname" "pc91_state_name" nil 0)
    ("qtid" "pc91_town_id" nil 0)
    ("qtname" "pc91_town_name" nil 0)
    ("qvid" "pc91_village_id" nil 0)
    ("qvname" "pc91_village_name" nil 0)
    ("sdid" "subdistrict_id" nil 2)
    ("sdname" "subdistrict_name" nil 0)
    ("sid" "state_id" nil 16)
    ("sname" "state_name" nil 0)
    ("tid" "town_id" nil 0)
    ("tname" "town_name" nil 0)
    ("vid" "village_id" nil 0)
    ("vname" "village_name" nil 0)
   ))

(define-abbrev-table 'grep-mode-abbrev-table '())

(define-abbrev-table 'help-mode-abbrev-table '())

(define-abbrev-table 'idl-mode-abbrev-table '())

(define-abbrev-table 'java-mode-abbrev-table
  '(
    ("catch" "catch" c-electric-continued-statement 0)
    ("else" "else" c-electric-continued-statement 0)
    ("finally" "finally" c-electric-continued-statement 0)
    ("while" "while" c-electric-continued-statement 0)
   ))

(define-abbrev-table 'lisp-interaction-mode-abbrev-table '())

(define-abbrev-table 'lisp-mode-abbrev-table '())

(define-abbrev-table 'makefile-mode-abbrev-table '())

(define-abbrev-table 'objc-mode-abbrev-table
  '(
    ("else" "else" c-electric-continued-statement 0)
    ("while" "while" c-electric-continued-statement 0)
   ))

(define-abbrev-table 'occur-edit-mode-abbrev-table '())

(define-abbrev-table 'occur-mode-abbrev-table '())

(define-abbrev-table 'package-menu-mode-abbrev-table '())

(define-abbrev-table 'php-mode-abbrev-table
  '(
    ("else" "else" c-electric-continued-statement 0)
    ("while" "while" c-electric-continued-statement 0)
   ))

(define-abbrev-table 'pike-mode-abbrev-table
  '(
    ("else" "else" c-electric-continued-statement 0)
    ("while" "while" c-electric-continued-statement 0)
   ))

(define-abbrev-table 'process-menu-mode-abbrev-table '())

(define-abbrev-table 'prog-mode-abbrev-table '())

(define-abbrev-table 'shell-mode-abbrev-table '())

(define-abbrev-table 'special-mode-abbrev-table '())

(define-abbrev-table 'speedbar-mode-abbrev-table '())

(define-abbrev-table 'tabulated-list-mode-abbrev-table '())

(define-abbrev-table 'text-mode-abbrev-table '())

(define-abbrev-table 'vc-svn-log-view-mode-abbrev-table '())

(define-abbrev-table 'vhdl-mode-abbrev-table
  '(
    ("--" "" vhdl-template-display-comment-hook 0)
   ))

