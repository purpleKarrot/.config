# base16

%sh{
  base00='rgb:fafafa' # "00" #fafafa - Default Background
  base01='rgb:f0f0f1' # "18" #f0f0f1 - Lighter Background (Used for status bars)
  base02='rgb:e5e5e6' # "19" #e5e5e6 - Selection Background
  base03='rgb:a0a1a7' # "08" #a0a1a7 - Comments, Invisibles, Line Highlighting
  base04='rgb:696c77' # "20" #696c77 - Dark Foreground (Used for status bars)
  base05='rgb:383a42' # "07" #383a42 - Default Foreground, Caret, Delimiters, Operators
  base06='rgb:202227' # "21" #202227 - Light Foreground (Not often used)
  base07='rgb:090a0b' # "15" #090a0b - Light Background (Not often used)
  base08='rgb:ca1243' # "01" #ca1243 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base09='rgb:d75f00' # "16" #d75f00 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
  base0A='rgb:c18401' # "03" #c18401 - Classes, Markup Bold, Search Text Background
  base0B='rgb:50a14f' # "02" #50a14f - Strings, Inherited Class, Markup Code, Diff Inserted
  base0C='rgb:0184bc' # "06" #0184bc - Support, Regular Expressions, Escape Characters, Markup Quotes
  base0D='rgb:4078f2' # "04" #4078f2 - Functions, Methods, Attribute IDs, Headings
  base0E='rgb:a626a4' # "05" #a626a4 - Keywords, Storage, Selector, Markup Italic, Diff Changed
  base0F='rgb:986801' # "17" #986801 - Deprecated, Opening/Closing Embedded Language Tags e.g. <?php ?>

  echo "
    # code
    face global value              ${base09}+b
    face global type               ${base0A}
    face global variable           ${base0D}
    face global module             ${base0C}
    face global function           ${base0D}
    face global string             ${base0B}
    face global keyword            ${base0E}+b
    face global operator           ${base0B}
    face global attribute          ${base0E}
    face global comment            ${base03}+i
    face global meta               ${base09}
    face global builtin            default+b

    # markup
    face global title              ${base0D}+b
    face global header             ${base0D}
    face global bold               ${base0A}+b
    face global italic             ${base0E}+i
    face global mono               ${base04}
    face global block              ${base0C}
    face global link               ${base09}+u
    face global bullet             ${base08}
    face global list               default

    # builtin
    face global Default            ${base05},${base00}
    face global PrimarySelection   default,${base02}
    face global SecondarySelection default,${base02}
    face global PrimaryCursor      default,${base03}
    face global SecondaryCursor    default,${base02}
    face global PrimaryCursorEol   default,${base04}
    face global SecondaryCursorEol default,${base02}
    face global LineNumbers        ${base03},${base00}
    face global LineNumberCursor   ${base03},${base00}
    face global LineNumbersWrapped ${base03},${base00}
    face global MenuForeground     ${base02},${base0A}
    face global MenuBackground     ${base04},${base02}
    face global MenuInfo           ${base04}
    face global Information        ${base04},${base01}
    face global Error              default,default+u
    face global StatusLine         ${base04},${base01}+b
    face global StatusLineMode     ${base09}
    face global StatusLineInfo     ${base0C}
    face global StatusLineValue    ${base0B}
    face global StatusCursor       ${base03},${base01}
    face global Prompt             ${base0A}+b
    face global MatchingChar       ${base08},${base01}+b
    face global BufferPadding      ${base04},${base02}
    face global Whitespace         ${base03}

    # cquery
    face global cqueryTypes                  ${base0A}
    face global cqueryEnums                  ${base0A}
    face global cqueryTypeAliases            ${base0A}
    face global cqueryTemplateParameters     ${base0F}+b
    face global cqueryFreeStandingFunctions  ${base0D}
    face global cqueryMemberFunctions        ${base0D}
    face global cqueryStaticMemberFunctions  ${base0D}
    face global cqueryFreeStandingVariables  ${base08}
    face global cqueryGlobalVariables        ${base08}
    face global cqueryStaticMemberVariables  ${base08}
    face global cqueryMemberVariables        ${base08}
    face global cqueryParameters             ${base08}
    face global cqueryEnumConstants          ${base08}
    face global cqueryNamespaces             ${base08}
    face global cqueryMacros                 ${base0F}

    # git
    face global GitBlame                     ${base03}
    face global GitDiffFlags                 default,${base01}
  "
}
