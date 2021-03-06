
%{
/*
 * $Id: pam_conv_l.l,v 1.1 2006/07/24 16:14:40 kukuk Exp $
 *
 * Copyright (c) Andrew G. Morgan 1997 <morgan@parc.power.net>
 *
 * This file is covered by the Linux-PAM License (which should be
 * distributed with this file.)
 */

    static const char lexid[]=
	"$Id: pam_conv_l.l,v 1.1 2006/07/24 16:14:40 kukuk Exp $\n"
	"Copyright (c) Andrew G. Morgan 1997 <morgan@parc.power.net>\n";

#ifdef HAVE_CONFIG_H
#  include <config.h>
#endif

#include <stdio.h>

#include "pam_conv_y.h"

    extern int current_line;
%}

%%

"#"[^\n]*         ; /* skip comments (sorry) */

"\\\n" {
    ++current_line;
}

([^\n\t ]|[\\][^\n])+ {
    return TOK;
}

[ \t]+      ; /* Ignore */

<<EOF>> {
    return EOFILE;
}

[\n] {
    ++current_line;
    return NL;
}

%%
