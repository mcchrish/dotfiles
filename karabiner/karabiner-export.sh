#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set option.emacsmode_ex_controlW 1
/bin/echo -n .
$cli set repeat.initial_wait 500
/bin/echo -n .
$cli set option.emacsmode_controlV 1
/bin/echo -n .
$cli set remap.vimnormal_ctrlbracketleft_toggle 1
/bin/echo -n .
$cli set option.emacsmode_optionV 1
/bin/echo -n .
$cli set option.emacsmode_optionD 1
/bin/echo -n .
$cli set remap.hjkl_arrow 1
/bin/echo -n .
$cli set option.emacsmode_optionBF 1
/bin/echo -n .
$cli set repeat.wait 33
/bin/echo -n .
$cli set option.emacsmode_controlAE 1
/bin/echo -n .
$cli set remap.vimnormal_autodeactivate_ctrl_command 1
/bin/echo -n .
$cli set option.ubiq_vimnormal_insert 1
/bin/echo -n .
/bin/echo
