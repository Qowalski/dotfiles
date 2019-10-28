/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int instant = 1;
static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int fuzzy = 1;                      /* -F  option; if 0, dmenu doesn't use fuzzy matching     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"Iosevka:size=15"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	               /* fg         bg       */
	[SchemeNorm] = { "#949494", "#080808" },
	[SchemeSel]  = { "#080808", "#ffaf00" },
	[SchemeOut]  = { "#000000", "#00ffff" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;
static unsigned int maxhist    = 15;
static int histnodup           = 1;	/* if 0, record repeated histories */
static unsigned int lineheight = 20;         /* -h option; minimum height of a menu line     */

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char startpipe[] = "#";
static const char worddelimiters[] = " ";
